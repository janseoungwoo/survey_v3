package org.survey.persistence;

import org.survey.domain.OXAnswerVO;

public interface AnswerDAO {

	public void create(OXAnswerVO vo) throws Exception;
	
	public void delete(Integer sdno, String userid)throws Exception;
	
	public int oxStatistics(Integer smno,Integer sdno,String answer)throws Exception;
}