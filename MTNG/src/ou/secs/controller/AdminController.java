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
		Poll savedPoll = null;
		try {
			savedPoll = dbAccessDao.saveToDB(poll);
			request.getSession(false).setAttribute("SAVED_POLL", savedPoll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Successfully saved poll with pollID" + savedPoll.getPoll_ID();
	}

	// Update changes made to the poll in the DB
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

	// Goes to voter page once poll is created and saved
	@RequestMapping(value = "/goToPoll")
	public ModelAndView goToPoll(HttpServletRequest request, ModelMap model) {

		HttpSession session = request.getSession(false);

		Poll pollFromSession = (Poll) session.getAttribute("SAVED_POLL");

		return new ModelAndView("vote", "data", pollFromSession.toString());

	}

	// Show existing poll from DB/session to make edits
	@RequestMapping(value = "/getPollToEdit")
	public ModelAndView getPollToEdit(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(false);

		Poll pollFromSession = (Poll) session.getAttribute("SAVED_POLL");

		return new ModelAndView("edit", "data", pollFromSession.toString());
	}

}