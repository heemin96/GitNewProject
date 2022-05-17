package spring.test.bit;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class HappyController {
	
	@RequestMapping("/list")
	public ModelAndView list1()
	{
		ModelAndView mview=new ModelAndView();
		
		List<TestDto> list=new Vector<TestDto>();
		list.add(new TestDto("홍길동","011-1111-1111","서울"));
		list.add(new TestDto("박남정","011-1112-1111","미국"));
		list.add(new TestDto("안신혜","011-1113-1111","대구"));
		list.add(new TestDto("강호동","011-1114-1111","부산"));
		list.add(new TestDto("이영자","011-1115-1111","울산"));
		//model에 데이타 저장
		mview.addObject("list",list);
		mview.addObject("today",new Date());
		
		//포워드되는 jsp 파일명 지정
		mview.setViewName("list2");
		return mview;
	}

}
