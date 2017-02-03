package org.survey.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.survey.domain.AnswerStat;
import org.survey.domain.OXAnswerVO;
import org.survey.domain.SurveyDetailVO;
import org.survey.persistence.AnswerDAO;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Inject
	private AnswerDAO dao;
	
	@Override
	public void create(OXAnswerVO vo) throws Exception {
		
		dao.create(vo);

	}

	@Override
	public void delete(Integer sdno, String userid) throws Exception {
		dao.delete(sdno, userid);
		
	}

	@Override
	public List<AnswerStat> oxStatistics(Integer smno, Integer sdno, String answer) throws Exception {
		// TODO Auto-generated method stub
		return dao.oxStatistics(smno, sdno, answer);
	}

	@Override
	public List<SurveyDetailVO> listAll(Integer smno) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(smno);
	}

}
