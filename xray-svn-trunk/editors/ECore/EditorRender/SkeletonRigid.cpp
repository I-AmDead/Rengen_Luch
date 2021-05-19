//---------------------------------------------------------------------------
#include "stdafx.h"
#pragma hdrstop

#include "SkeletonCustom.h"

extern int	psSkeletonUpdate;

#ifdef DEBUG
void check_kinematics(CKinematics* _k, LPCSTR s);
#endif

void CKinematics::CalculateBones(BOOL bForceExact)
{
	// early out.
	// check if the info is still relevant
	// skip all the computations - assume nothing changes in a small period of time :)

	if (CurrentFrame() == calculatedBonesFrame_)
		return;	// early out for "fast" update

	protectKinematics_.Enter();

	OnCalculateBones();

	if (!bForceExact && (CurrentFrame() < (calculatedBonesFrame_ + CALC_INTERVAL))) // early out for "slow" update
	{
		protectKinematics_.Leave();

		return;
	}

	if (Update_Visibility)
		Visibility_Update();

	// here we have either:
	//	1:	timeout elapsed
	//	2:	exact computation required
	calculatedBonesFrame_ = CurrentFrame();

	// exact computation
	// Calculate bones
#ifdef DEBUG
	RDEVICE.Statistic->Animation.Begin();
#endif

	Bone_Calculate(bones->at(iRoot), &Fidentity);

#ifdef DEBUG
	check_kinematics(this, dbg_name.c_str() );
	RDEVICE.Statistic->Animation.End();
#endif

	VERIFY(LL_GetBonesVisible() != 0);

	// Calculate BOXes/Spheres if needed
	UCalc_Visibox++;

	if (UCalc_Visibox >= psSkeletonUpdate) 
	{
		// mark
		UCalc_Visibox = -(::Random.randI(psSkeletonUpdate - 1));

		// the update itself
		Fbox Box; Box.invalidate();

		for (u32 b = 0; b < bones->size(); b++)
		{
			if (!LL_GetBoneVisible(u16(b)))
				continue;

			Fobb& obb = (*bones)[b]->obb;
			Fmatrix& Mbone = bone_instances[b].mTransform;

			Fmatrix Mbox;
			obb.xform_get(Mbox);

			Fmatrix	X;
			X.mul_43(Mbone, Mbox);

			Fvector& S = obb.m_halfsize;

			Fvector P,A;
			A.set( -S.x,	-S.y,	-S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set( -S.x,	-S.y,	 S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set(  S.x,	-S.y,	 S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set(  S.x,	-S.y,	-S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set( -S.x,	 S.y,	-S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set( -S.x,	 S.y,	 S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set(  S.x, 	 S.y,	 S.z ); X.transform_tiny(P, A); Box.modify(P);
			A.set(  S.x, 	 S.y,	-S.z ); X.transform_tiny(P, A); Box.modify(P);
		}

	if(bones->size())
	{
		// previous frame we have updated box - update sphere
		vis.box.min	= (Box.min);
		vis.box.max	= (Box.max);

		vis.box.getsphere(vis.sphere.P, vis.sphere.R);
	}

#ifdef DEBUG
		// Validate
		VERIFY3	(_valid(vis.box.min)&&_valid(vis.box.max), "Invalid bones-xform in model", dbg_name.c_str());

		if(vis.sphere.R > 1000.f)
		{
			for(u16 ii = 0; ii < LL_BoneCount(); ++ii)
			{
				Fmatrix tr;
				tr = LL_GetTransform(ii);
				Log("bone ",LL_BoneName_dbg(ii));
				Log("bone_matrix",tr);
			}
			Log("end-------");
		}

		VERIFY3	(vis.sphere.R<1000.f, "Invalid bones-xform in model", dbg_name.c_str());
#endif
	}

	protectKinematics_.Leave();

	if (Update_Callback)
		Update_Callback(this);
}

void CKinematics::BuildBoneMatrix(const CBoneData* bd, CBoneInstance &bi, const Fmatrix *parent, u8 channel_mask)
{
	bi.mTransform.mul_43(*parent, bd->bind_transform);
}

void CKinematics::CLBone(const CBoneData* bd, CBoneInstance &bi, const Fmatrix *parent, u8 channel_mask)
{
	u16	SelfID = bd->GetSelfID();

	if (!LL_IsNotBoneHidden(SelfID))
	{
		if (bi.callback_overwrite())
		{
			if (bi.callback())
				bi.callback()(&bi);
		} 
		else
		{
			bi.mTransform.c = (*parent).c;

			if (bi.callback())
			{
				bi.callback()(&bi);
			}
		}

		bi.mRenderTransform.mul_43(bi.mTransform, bd->m2b_transform);

	}
	else if (LL_GetBoneVisible(SelfID))
	{
		if (bi.callback_overwrite())
		{
			if (bi.callback())
				bi.callback()(&bi);
		}
		else
		{
			Fmatrix XFORM = bi.mTransform;

			BuildBoneMatrix(bd, bi, parent, channel_mask);

			if (!_valid(bi.mTransform))
			{
				bi.mTransform = XFORM;
				bi.mTransform.mul_43(*parent, bd->bind_transform);
			}
			if (bi.callback())
			{
				bi.callback()(&bi);

				if (!_valid(bi.mTransform))
					return;
			}
		}

		bi.mRenderTransform.mul_43(bi.mTransform, bd->m2b_transform);
	}
}

void CKinematics::Bone_GetAnimPos(Fmatrix& pos, u16 id, u8 mask_channel, bool ignore_callbacks)
{
	R_ASSERT(id < LL_BoneCount());

	CBoneInstance bi = LL_GetBoneInstance(id);

	BoneChain_Calculate(&LL_GetData(id),bi,mask_channel,ignore_callbacks);

	R_ASSERT(_valid( bi.mTransform));

	pos.set(bi.mTransform);
}

void CKinematics::Bone_Calculate(CBoneData* bd, Fmatrix *parent)
{
	u16 SelfID = bd->GetSelfID();

	CBoneInstance& BONE_INST = LL_GetBoneInstance(SelfID);

	CLBone(bd, BONE_INST, parent, u8(-1));

	// Calculate children
	for (xr_vector<CBoneData*>::iterator C = bd->children.begin(); C != bd->children.end(); C++)
		Bone_Calculate(*C, &BONE_INST.mTransform);
}

void CKinematics::BoneChain_Calculate(const CBoneData* bd, CBoneInstance& bi, u8 mask_channel, bool ignore_callbacks)
{
	u16 SelfID = bd->GetSelfID();

	BoneCallback bc = bi.callback();
	BOOL ow = bi.callback_overwrite();

	if(ignore_callbacks)
	{
		bi.set_callback( bi.callback_type(), 0, bi.callback_param(), 0 );

	}

	if(SelfID == LL_GetBoneRoot())
	{
		CLBone(bd, bi, &Fidentity, mask_channel);
		//restore callback	
		bi.set_callback(bi.callback_type(), bc, bi.callback_param(), ow);

		return;
	}

	u16 ParentID = bd->GetParentID();

	R_ASSERT(ParentID != BI_NONE);

	CBoneData* ParrentDT = &LL_GetData(ParentID);

	CBoneInstance parrent_bi = LL_GetBoneInstance(ParentID);

	BoneChain_Calculate(ParrentDT, parrent_bi, mask_channel, ignore_callbacks);

	CLBone(bd, bi, &parrent_bi.mTransform, mask_channel);

	//restore callback
	bi.set_callback(bi.callback_type(), bc, bi.callback_param(), ow);
}

#ifdef DEBUG
void check_kinematics(CKinematics* _k, LPCSTR s)
{
	CKinematics* K = _k;
	Fmatrix& MrootBone = K->LL_GetBoneInstance(K->LL_GetBoneRoot()).mTransform;

	if (MrootBone.c.y >10000)
	{
		Msg("all bones transform:--------[%s]", s);

		for (u16 ii = 0; ii < K->LL_BoneCount(); ++ii)
		{
			Fmatrix tr;

			tr = K->LL_GetTransform(ii);
			Log("bone ", K->LL_BoneName_dbg(ii));
			Log("bone_matrix", tr);
		}

		Log("end-------");
		VERIFY3(0, "check_kinematics failed for ", s);
	}
}
#endif
