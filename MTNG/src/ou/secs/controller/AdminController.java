package ou.secs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
			request.getSession(false).setAttribute("SAVED_POLL", poll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Successfully saved poll";
	}

	@RequestMapping(value = "/editPoll", method = RequestMethod.POST)
	public @ResponseBody String editPoll(@RequestBody Poll poll, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			MySQLAccess.updateDB(poll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Successfully edited poll";
	}

	@RequestMapping(value = "/goToPoll")
	public ModelAndView goToPoll(HttpServletRequest request, ModelMap model) {

		HttpSession session = request.getSession(false);

		Poll pollFromSession = (Poll) session.getAttribute("SAVED_POLL");

		/*
		 * Poll testPoll = new Poll(); testPoll.setName("test name");
		 * testPoll.setLocation("test location");
		 * 
		 * List<TimeOption> pollTimeList = new ArrayList<TimeOption>();
		 * 
		 * TimeOption testTimeOption1 = new TimeOption();
		 * testTimeOption1.setEnddate("02-03-2018"); testTimeOption1.setEndhours("18");
		 * testTimeOption1.setEndminutes("30");
		 * testTimeOption1.setStartdate("02-03-2018");
		 * testTimeOption1.setStarthours("2"); testTimeOption1.setStartminutes("0");
		 * 
		 * pollTimeList.add(testTimeOption1); testPoll.setPollTimeList(pollTimeList);
		 * model.addAttribute("data", poll.toString());
		 */
		return new ModelAndView("vote", "data", pollFromSession.toString());

	}

	// TODO: Currently hard coded Poll object which needs to be retrieved from the
	// database
	// Will also be used to retrieve poll so the admin can edit
	@RequestMapping(value = "/getPoll", method = RequestMethod.GET)
	public @ResponseBody ModelAndView getPoll(HttpServletRequest request, HttpServletResponse response) {

		Poll testPoll = new Poll();
		testPoll.setName("test name");
		testPoll.setLocation("test location");

		List<TimeOption> pollTimeList = new ArrayList<TimeOption>();

		TimeOption testTimeOption1 = new TimeOption();
		testTimeOption1.setEnddate("2018-02-03");
		testTimeOption1.setEndhours("18");
		testTimeOption1.setEndminutes("30");
		testTimeOption1.setStartdate("2018-02-03");
		testTimeOption1.setStarthours("2");
		testTimeOption1.setStartminutes("0");
		pollTimeList.add(testTimeOption1);

		TimeOption testTimeOption2 = new TimeOption();
		testTimeOption2.setEnddate("2018-02-03");
		testTimeOption2.setEndhours("5");
		testTimeOption2.setEndminutes("30");
		testTimeOption2.setStartdate("2018-02-03");
		testTimeOption2.setStarthours("2");
		testTimeOption2.setStartminutes("0");
		pollTimeList.add(testTimeOption2);

		testPoll.setPollTimeList(pollTimeList);

		MySQLAccess dbAccessDao = new MySQLAccess();
		try {
			// TODO for showing time option list for voters AND for admin to edit the poll
			// dbAccessDao.readDB(poll);
		} catch (Exception e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("welcome", "data", testPoll.toString());
	}

	@RequestMapping(value = "/editPoll")
	public ModelAndView editPoll(ModelMap model) {
		Poll testPoll = new Poll();
		testPoll.setName("test name");
		testPoll.setLocation("test location");

		List<TimeOption> pollTimeList = new ArrayList<TimeOption>();

		TimeOption testTimeOption1 = new TimeOption();
		testTimeOption1.setEnddate("2018-02-03");
		testTimeOption1.setEndhours("18");
		testTimeOption1.setEndminutes("30");
		testTimeOption1.setStartdate("2018-02-03");
		testTimeOption1.setStarthours("2");
		testTimeOption1.setStartminutes("0");
		pollTimeList.add(testTimeOption1);

		TimeOption testTimeOption2 = new TimeOption();
		testTimeOption2.setEnddate("2018-02-03");
		testTimeOption2.setEndhours("5");
		testTimeOption2.setEndminutes("30");
		testTimeOption2.setStartdate("2018-02-03");
		testTimeOption2.setStarthours("2");
		testTimeOption2.setStartminutes("0");
		pollTimeList.add(testTimeOption2);

		testPoll.setPollTimeList(pollTimeList);

		testPoll.setPollTimeList(pollTimeList);
		return new ModelAndView("edit", "data", testPoll.toString());
	}

}