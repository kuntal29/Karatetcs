package utilities;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CommonUtility {

	public static final String mtr = "MTR";
	public static int testNum = 1;
	public static final String randomString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz0123456789";

	public static void waitFor10Second() {
		try {
			Thread.sleep(10000);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getDate() {

		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd"));

	}

	public static String getDate(String format) {

		return LocalDateTime.now().format(DateTimeFormatter.ofPattern(format));

	}

	public static String getTime() {

		String randomMtr = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));
		return randomMtr;
	}

	public static String getMsgDateTime() {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd")) + " "
				+ LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));

	}

	public static String getCurrentDate(String format) {
		String str = null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = new Date();
		str = sdf.format(date);
		return str;
	}

	public static String getDateFrom() {
		System.out.println("Date format   " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/mm/yyyy")));
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

	}

	public static Instant getSystemDateTime() {

		return java.time.Clock.systemUTC().instant();
	}

}
