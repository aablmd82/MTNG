package ou.secs.domain;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

public class Poll implements Serializable {

	private String name;
	private String location;
	private String personName;
	private int Poll_ID;
	private int Time_ID;
	// private Integer pollID;
	// private Integer personID;
	private List<TimeOption> pollTimeList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public int getPoll_ID() {
		return Poll_ID;
	}

	public void setPoll_ID(int Time_ID) {
		this.Time_ID = Time_ID;
	}

	public int getTime_ID() {
		return Time_ID;
	}

	public void setTime_ID(int Time_ID) {
		this.Time_ID = Time_ID;
	}

	/*
	 * public Integer getPollID() { return pollID; } public void setPollID(Integer
	 * pollID) { this.pollID = pollID; } public Integer getPersonID() { return
	 * personID; } public void setPersonID(Integer personID) { this.personID =
	 * personID; }
	 */

	public List<TimeOption> getPollTimeList() {
		return pollTimeList;
	}

	public void setPollTimeList(List<TimeOption> pollTimeList) {
		this.pollTimeList = pollTimeList;
	}

	/*
	 * @return a JSON-formatted string of the Poll object {"name": value, "email":
	 * value, "location": value, "times": [{"startdate": value, "starthours": value,
	 * "startminutes": value, "enddate": value, "endhours": value, "endminutes":
	 * value, "Time_ID": value}] }
	 */
	public String toString() {
		String output = "{\"pollID\": \"" + Poll_ID + "\",\"name\": \"" + name + "\",\"location\":\"" + location + "\",\"personName\":\"" + personName + "\",\"pollTimeList\":[";
		for (Iterator<TimeOption> iterator = pollTimeList.iterator(); iterator.hasNext();) {
			TimeOption option = iterator.next();
			output += "{\"startdate\":\"" + option.getStartdate() + "\",\"starthours\":\"" + option.getStarthours()
					+ "\",\"startminutes\":\"" + option.getStartminutes() + "\",\"enddate\":\"" + option.getEnddate()
					+ "\",\"endhours\":\"" + option.getEndhours() + "\",\"endminutes\":\"" + option.getEndminutes()
					+ "\", \"Time_ID\": " + option.getTime_ID() + "}";
			if (iterator.hasNext())
				output += ",";
		}
		output += "]}";
		return output;
	}
}
