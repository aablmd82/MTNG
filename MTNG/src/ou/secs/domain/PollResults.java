package ou.secs.domain;

import java.util.Map;

public class PollResults {
	
	private Map<TimeOption, Integer> tally;
	
	public Map<TimeOption, Integer> getTally() {
		return tally;
	}
	
	public void setTally(Map<TimeOption, Integer> tally) {
		this.tally = tally;
	}

}
