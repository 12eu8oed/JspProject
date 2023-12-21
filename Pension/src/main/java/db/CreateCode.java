package db;

import java.util.Random;

public class CreateCode { // 예약 코드 생성클래스

	public String generateCode() {
		Random random = new Random();
		int min = 10000000; // 최소값 (8자리 숫자의 최소값)
		int max = 99999999; // 최대값 (8자리 숫자의 최대값)

		int code = random.nextInt(max - min + 1) + min;

		String str = String.valueOf(code);
		return str;
	}
}
