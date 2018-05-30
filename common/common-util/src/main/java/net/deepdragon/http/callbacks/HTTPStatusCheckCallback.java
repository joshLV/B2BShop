package net.deepdragon.http.callbacks;

import net.deepdragon.http.HTTPResponseCallback;

import org.apache.http.HttpResponse;

public abstract class HTTPStatusCheckCallback implements HTTPResponseCallback {
	
	@Override
	public final void response(HttpResponse response) {
		int statusCode = response.getStatusLine().getStatusCode();
		if (statusCode != this.expectedStatus()) {
			this.invalidStatus(statusCode, response);
		}
		this.checkedResponse(response);
	}
	
	protected abstract void checkedResponse(HttpResponse response);
	
	protected abstract void invalidStatus(int status, HttpResponse response);
	
	/**
	 * @return the expected status code of the {@link HttpResponse}
	 */
	protected int expectedStatus() {
		return 200;
	}
	
}
