package ou.secs.domain;

import java.util.List;

public class Vote {
	private String personName;
	private int Person_ID;
	private int Time_ID;
	// Should be start datetime and end datetime as Strings like in DB
	private List<String> timeOptions;

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public int getPerson_ID() {
		return Person_ID;
	}

	public void setPerson_ID(int person_ID) {
		Person_ID = person_ID;
	}

	public int getTime_ID() {
		return Time_ID;
	}

	public void setTime_ID(int time_ID) {
		Time_ID = time_ID;
	}

	public List<String> getTimeOptions() {
		return timeOptions;
	}

	public void setTimeOptions(List<String> timeOptions) {
		this.timeOptions = timeOptions;
	}

}
