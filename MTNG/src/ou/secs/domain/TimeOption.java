package ou.secs.domain;

public class TimeOption {

	private String startdate;
	private String starthours;
	private String startminutes;
	private String enddate;
	private String endhours;
	private String endminutes;

	public String getStartdate() {
		return startdate;
	}

	public String getStarthours() {
		return starthours;
	}

	public String getStartminutes() {
		return startminutes;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setStarthours(String starthours) {
		this.starthours = starthours;
	}

	public void setStartminutes(String startminutes) {
		this.startminutes = startminutes;
	}

	public String getEnddate() {
		return enddate;
	}

	public String getEndhours() {
		return endhours;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setEndhours(String endhours) {
		this.endhours = endhours;
	}

	public void setEndminutes(String endminutes) {
		this.endminutes = endminutes;
	}

	public String getEndminutes() {
		return endminutes;
	}

}