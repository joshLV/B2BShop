package net.deepdragon.http.callbacks;

import net.deepdragon.http.WS;

import org.apache.http.HttpResponse;

public abstract class HTTPByteCallback extends HTTPStatusCheckCallback {
	
	@Override
	protected void checkedResponse(HttpResponse response) {
		this.byteResponse(WS.getResponseAsBytes(response), response);
	}
	
	protected abstract void byteResponse(byte[] body, HttpResponse response);
	
}
