package ou.secs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ou.secs.dao.MySQLAccess;
import ou.secs.domain.Poll;
import ou.secs.domain.TimeOption;

@Controller
public class AdminController {

	@RequestMapping(value = "/createPoll", method = RequestMethod.POST)
	public @ResponseBody String createPoll(@RequestBody Poll poll, HttpServletRequest request,
			HttpServletResponse response) {
		MySQLAccess dbAccessDao = new MySQLAccess();
		try {
			dbAccessDao.saveToDB(poll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Successfully saved poll";
	}

	@RequestMapping(value = "/goToPoll")
	public String goToPoll(ModelMap model) {
		return "welcome";
	}

	// TODO: Currently hard coded Poll object which needs to be retrieved from the
	// database
	// Will also be used to retrieve poll so the admin can edit
	@RequestMapping(value = "/getPoll", method = RequestMethod.GET)
	public @ResponseBody Poll getPoll(HttpServletRequest request, HttpServletResponse response) {

		Poll testPoll = new Poll();
		testPoll.setName("test name");
		testPoll.setLocation("test location");

		List<TimeOption> pollTimeList = new ArrayList<TimeOption>();

		TimeOption testTimeOption1 = new TimeOption();
		testTimeOption1.setEnddate("02/03/2018");
		testTimeOption1.setEndhours("5");
		testTimeOption1.setEndminutes("33");
		testTimeOption1.setStartdate("02/03/20 18");
		testTimeOption1.setStarthours("2");
		testTimeOption1.setStartminutes("00");

		pollTimeList.add(testTimeOption1);

		testPoll.setPollTimeList(pollTimeList);

		MySQLAccess dbAccessDao = new MySQLAccess();
		try {
			// TODO for showing time option list for voters AND for admin to edit the poll
			// dbAccessDao.readDB(poll);
		} catch (Exception e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return testPoll;
	}

}
