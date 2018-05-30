package com.chinaums.pay.comm;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class HttpComm {
	private String urlString;
	static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	};

	public HttpComm(String url) {
		this.urlString = url;

		trustAllHosts();
	}

	private static void trustAllHosts() {
		TrustManager[] trustAllCerts = { new X509TrustManager() {
			public X509Certificate[] getAcceptedIssuers() {
				return new X509Certificate[0];
			}

			public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
			}

			public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
			}
		} };
		try {
			SSLContext sc = SSLContext.getInstance("TLS");
			sc.init(null, trustAllCerts, new SecureRandom());

			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private HttpURLConnection getConnection(String urlString) throws Exception {
		URL url = new URL(urlString);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		if ((connection instanceof HttpsURLConnection)) {
			((HttpsURLConnection) connection).setHostnameVerifier(DO_NOT_VERIFY);
		}

		connection.setRequestProperty("Charset", "UTF-8");
		connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		connection.setRequestProperty("Accept", "application/json");
		connection.setConnectTimeout(10000);
		connection.setReadTimeout(30000);
		connection.setUseCaches(false);
		connection.setRequestMethod("POST");

		return connection;
	}

	public String request(String content) throws Exception {
		HttpURLConnection conn = getConnection(this.urlString);
		try {
			byte[] bytes = content.getBytes("UTF-8");
			conn.setFixedLengthStreamingMode(bytes.length);
			conn.setDoOutput(true);
			conn.setDoInput(true);

			conn.connect();

			OutputStream os = conn.getOutputStream();
			os.write(bytes);
			os.flush();
			os.close();

			int status = conn.getResponseCode();
			if (status != 200) {
				throw new Exception(conn.getResponseMessage());
			}

			InputStream is = conn.getInputStream();
			String response = readStringFromInputStream(is);
			is.close();

			String str1 = response;
			return str1;
		} finally {
			conn.disconnect();
		}
	}

	private String readStringFromInputStream(InputStream is) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		byte[] buf = new byte[4096];
		int len = 0;
		while (true) {
			len = is.read(buf);
			if (len < 0)
				break;
			baos.write(buf, 0, len);
		}

		return new String(baos.toByteArray(), "UTF-8");
	}
}