///////////////////////////////////////////////////////////////
// ElectricBall.h
// ElectricBall - �������� ������������� ���
///////////////////////////////////////////////////////////////

#pragma once
#include "artifact.h"

class CElectricBall : public CArtefact 
{
private:
	typedef CArtefact inherited;
public:
	CElectricBall(void);
	virtual ~CElectricBall(void);

	virtual void LoadCfg				(LPCSTR section);

protected:
	virtual void	UpdateCLChild	();

};