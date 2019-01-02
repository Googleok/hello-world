package org.zerock.test;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.support.DaoSupport;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.BoardDAO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/root-context.xml"})
public class testListPage {
	@Inject
	private BoardDAO dao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	
	@Test
	 public void testListPage() throws Exception{
		int page = 3;

		List<BoardVO> list = dao.listPage(page);
		
		for(BoardVO boardVO : list) {
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
		
	
	}
}
