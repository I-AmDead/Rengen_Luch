#include "stdafx.h"

void CRenderTarget::phase_smap_spot_clear()
{
	HW.pContext->ClearDepthStencilView( rt_smap_depth->pZRT, D3D_CLEAR_DEPTH, 1.0f, 0L);
}

void CRenderTarget::phase_smap_spot(CLightSource* L)
{
	// Targets + viewport
	//	TODO: DX10: CHeck if we don't need old-style SMAP
	if (RImplementation.o.HW_smap)
		u_setrt	(rt_smap_surf, NULL, NULL, rt_smap_depth->pZRT);
	else
		VERIFY(!"Use HW SMap only for DX10!");

	D3D_VIEWPORT VP = {(float)L->X.S.posX, (float)L->X.S.posY, (float)L->X.S.size, (float)L->X.S.size, 0, 1};

	HW.pContext->RSSetViewports(1, &VP);

	// Misc - draw only front-faces //back-faces
	RCache.set_CullMode (CULL_CCW);
	RCache.set_Stencil (FALSE);

	// no transparency
#pragma todo("can optimize for multi-lights covering more than say 50%...")
	if (RImplementation.o.HW_smap)
		RCache.set_ColorWriteEnable	(FALSE);

	//CHK_DX(HW.pDevice->Clear( 0L, NULL, D3DCLEAR_ZBUFFER,	0xffffffff,	1.0f, 0L));
	//Do it once per smap generation pass in phase_smap_spot_clear
	//HW.pContext->ClearDepthStencilView( rt_smap_depth->pZRT, D3D_CLEAR_DEPTH, 1.0f, 0L);
}

void CRenderTarget::phase_smap_spot_tsh(CLightSource* L)
{
	VERIFY(!"Implement clear of the buffer for tsh!");
	VERIFY(RImplementation.o.Tshadows);

	RCache.set_ColorWriteEnable();

	if (IRender_Light::OMNIPART == L->flags.type)
	{
		// omni-part
		//CHK_DX(HW.pDevice->Clear( 0L, NULL, D3DCLEAR_TARGET,	0xffffffff,	1.0f, 0L));

		FLOAT ColorRGBA[4] = {1.0f, 1.0f, 1.0f, 1.0f};
		HW.pContext->ClearRenderTargetView(RCache.get_RT(), ColorRGBA);
	}
	else
	{
		// real-spot
		// Select color-mask
		ref_shader shader = L->s_spot;

		if (!shader)
			shader = s_accum_spot;

		RCache.set_Element(shader->E[SE_L_FILL]);

		// Fill vertex buffer
		Fvector2 p0, p1;
		u32 Offset;

		u32 C = color_rgba(255, 255, 255, 255);

		float _w = float(L->X.S.size);
		float _h = float(L->X.S.size);
		float d_Z = EPS_S;
		float d_W = 1.f;

		p0.set(.5f / _w, .5f / _h);
		p1.set((_w + .5f) / _w, (_h + .5f) / _h);

		FVF::TL* pv = (FVF::TL*) RCache.Vertex.Lock(4, g_combine->vb_stride, Offset);

		pv->set(EPS, float(_h + EPS), d_Z, d_W, C, p0.x, p1.y);	pv++;
		pv->set(EPS, EPS, d_Z, d_W, C, p0.x, p0.y);	pv++;
		pv->set(float(_w + EPS), float(_h + EPS), d_Z, d_W, C, p1.x, p1.y);	pv++;
		pv->set(float(_w + EPS), EPS, d_Z, d_W, C, p1.x, p0.y);	pv++;

		RCache.Vertex.Unlock(4, g_combine->vb_stride);
		RCache.set_Geometry(g_combine);

		// draw
		RCache.BackendRender(D3DPT_TRIANGLELIST, Offset, 0, 4, 0, 2);
	}
}
