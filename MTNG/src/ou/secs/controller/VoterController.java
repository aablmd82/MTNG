package ou.secs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ou.secs.dao.MySQLAccess;
import ou.secs.domain.Vote;

@Controller
public class VoterController {

	@RequestMapping(value = "/saveVote", method = RequestMethod.POST)
	public @ResponseBody String saveVote(@RequestBody Vote vote, HttpServletRequest request,
			HttpServletResponse response) {
		MySQLAccess dbAccessDao = new MySQLAccess();
		try {
			dbAccessDao.saveVoteToDB(vote);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Successfully saved vote";
	}

	@RequestMapping(value = "/editVote")
	public void editVote(ModelMap model) {
		System.out.println("Test");

	}

}
