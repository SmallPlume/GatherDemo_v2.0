package test;

import com.util.Base64;

public class Test2 {
	
	@org.junit.Test
	public void test1(){
		Base64 base = new Base64();
		System.out.println("10086".getBytes());
		System.out.println(base.encode("10086".getBytes()));
		
		String str = "MTAwODY=";

		System.out.println(base.decode(str.toCharArray()));
		
	}

}
