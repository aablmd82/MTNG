package ou.secs;

import java.util.Random;

import org.junit.jupiter.api.Test;

class MTNGHelloWorldTest {

	@Test
	void test() {
		Random random = new Random();
		String id = String.format("%04d", random .nextInt(10000));
		System.out.println("String id : " + id);
	}

}
