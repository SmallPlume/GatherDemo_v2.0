package test;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.modules.web.orm.Context;
import com.modules.web.svc.ContextSVC;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml","classpath:/spring-mvc.xml" })*/
public class Test {

	/*@Autowired
	private ContextSVC contextSVC;

	@org.junit.Test
	public void queryBlog() {
		List<Context> list = contextSVC.queryList();
		for (Context context : list) {
			System.out.println("title=" + context.getTitle());
		}
	}*/
}
