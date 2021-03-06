package com.agenda.admin;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class adDao extends adSqlMapConfig {
	
	private String namespace = "com.agenda.admin.adMapper.";
	
	public List<adDto> selectList() {
		
		SqlSession session = null;
		List<adDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public adDto selectOne(String member_id) {
		SqlSession session = null;
		adDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int update(adDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update", dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int updateinfo(adDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateinfo", dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int delete(String member_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", member_id);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

}
