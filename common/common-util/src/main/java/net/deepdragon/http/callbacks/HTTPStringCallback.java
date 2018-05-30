package net.deepdragon.http.callbacks;

import net.deepdragon.http.WS;

import org.apache.http.HttpResponse;

public abstract class HTTPStringCallback extends HTTPStatusCheckCallback {
	
	@Override
	protected void checkedResponse(HttpResponse response) {
		this.stringResponse(WS.getResponseAsString(response), response);
	}
	
	protected abstract void stringResponse(String body, HttpResponse response);
	
}
