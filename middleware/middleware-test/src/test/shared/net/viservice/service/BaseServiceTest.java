package net.viservice.service;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:META-INF/spring/spring-test*.xml" })
public abstract class BaseServiceTest {

	protected static Logger logger = LoggerFactory
			.getLogger(BaseServiceTest.class);
	
	protected String TENANTID = "37100";
}
