package net.deepdragon;

import java.io.IOException;

import net.deepdragon.http.WS;
import net.deepdragon.util.ZipUtils;

import org.apache.http.HttpResponse;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

public class HttpTest {

	@Test
	@Ignore
	public void testGet() {
		final HttpResponse response = WS.url("http://172.16.200.99:81/ggk/check.aspx").queryParam("card", "9900487465").queryParam("callback", "abc").get();
		Assert.assertEquals(WS.getStatus(response), 200);
		Assert.assertTrue(WS.isStatusOK(response));
		final String body = WS.getResponseAsString(response);
		Assert.assertNotNull(body);
		Assert.assertFalse(body.isEmpty());
		
		System.out.println(body); 
	}
	
	@Test
	@Ignore
	public void testPost() {
				
		final HttpResponse response = WS.url("http://192.168.0.164:9000/upload/getzlib.do").post();

		Assert.assertEquals(WS.getStatus(response), 200);
		Assert.assertTrue(WS.isStatusOK(response));
		final byte[] body = WS.getResponseAsBytes(response);
		
		System.out.println(body.length); 
		try {
			final byte[] out = ZipUtils.unCompress(body);
			System.out.println(out.length); 
			System.out.println(new String(out,"UTF-8"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}
