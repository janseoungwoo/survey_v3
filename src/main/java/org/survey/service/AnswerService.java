package org.survey.service;

import org.survey.domain.OXAnswerVO;

public interface AnswerService {

	public void create(OXAnswerVO vo) throws Exception;
	public void delete(Integer sdno, String userid)throws Exception;
	public int oxStatistics(Integer smno,Integer sdno,String answer)throws Exception;
}