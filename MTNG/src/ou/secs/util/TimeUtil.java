package ou.secs.util;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoField;

import ou.secs.domain.TimeOption;

public class TimeUtil {

	public static String getSqlDateFromInstant(Instant i) {
		return String.format("%d-%d-%d", i.get(ChronoField.DAY_OF_MONTH), i.get(ChronoField.MONTH_OF_YEAR), i.get(ChronoField.YEAR));
	}

	public static TimeOption timeOptionFromSql(Timestamp start, Timestamp end) {
		Instant startInstant = start.toInstant();
		Instant endInstant = end.toInstant();
		TimeOption to = new TimeOption();
		to.setStartdate(getSqlDateFromInstant(startInstant));
		to.setEnddate(getSqlDateFromInstant(endInstant));
		to.setStarthours(String.valueOf(startInstant.get(ChronoField.HOUR_OF_DAY)));
		to.setEndhours(String.valueOf(endInstant.get(ChronoField.HOUR_OF_DAY)));
		to.setStartminutes(String.valueOf(startInstant.get(ChronoField.MINUTE_OF_HOUR)));
		to.setEndminutes(String.valueOf(endInstant.get(ChronoField.MINUTE_OF_HOUR)));
		return to;
	}

	public static String sqlStartTimeFromTimeOption(TimeOption to) {
		return String.format("%s %s:%s:00", to.getStartdate(), to.getStarthours(), to.getStartminutes());
	}

	public static String sqlEndTimeFromTimeOption(TimeOption to) {
		return String.format("%s %s:%s:00", to.getEnddate(), to.getEndhours(), to.getEndminutes());
	}

}
