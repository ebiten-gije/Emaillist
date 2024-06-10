package himedia.dao;

import java.util.List;

public interface EmaillistDao {

	public List<EmailVo> getList();	//	emaillist table select
	
	public boolean insert(EmailVo vo);	//	emailList table insert
	
	public boolean delete(Long no);	//	emaillist table delete
	
	public EmailVo searchNo(Long no);
	
}
