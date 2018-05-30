package com.allinpay.ets.client.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

public class Base64 {
	private static final int LOWER_CASE_A_VALUE = 26;
	private static final int ZERO_VALUE = 52;
	private static final int PLUS_VALUE = 62;
	private static final int SLASH_VALUE = 63;
	private static final int SIX_BIT_MASK = 63;
	private static final int EIGHT_BIT_MASK = 255;
	private String mString;
	private int mIndex = 0;

	public static String encode(byte[] data) {
		return new Base64().internalEncode(data);
	}

	public String internalEncode(byte[] data) {
		int charCount = data.length * 4 / 3 + 4;

		StringBuffer result = new StringBuffer(charCount * 77 / 76);

		int byteArrayLength = data.length;
		int byteArrayIndex = 0;
		int byteTriplet = 0;
		while (byteArrayIndex < byteArrayLength - 2) {
			byteTriplet = convertUnsignedByteToInt(data[(byteArrayIndex++)]);

			byteTriplet <<= 8;
			byteTriplet |= convertUnsignedByteToInt(data[(byteArrayIndex++)]);
			byteTriplet <<= 8;
			byteTriplet |= convertUnsignedByteToInt(data[(byteArrayIndex++)]);

			byte b4 = (byte) (0x3F & byteTriplet);

			byteTriplet >>= 6;
			byte b3 = (byte) (0x3F & byteTriplet);
			byteTriplet >>= 6;
			byte b2 = (byte) (0x3F & byteTriplet);
			byteTriplet >>= 6;
			byte b1 = (byte) (0x3F & byteTriplet);

			result.append(mapByteToChar(b1));
			result.append(mapByteToChar(b2));
			result.append(mapByteToChar(b3));
			result.append(mapByteToChar(b4));
		}

		if (byteArrayIndex == byteArrayLength - 1) {
			byteTriplet = convertUnsignedByteToInt(data[(byteArrayIndex++)]);

			byteTriplet <<= 4;

			byte b2 = (byte) (0x3F & byteTriplet);
			byteTriplet >>= 6;
			byte b1 = (byte) (0x3F & byteTriplet);

			result.append(mapByteToChar(b1));
			result.append(mapByteToChar(b2));

			result.append("==");
		}

		if (byteArrayIndex == byteArrayLength - 2) {
			byteTriplet = convertUnsignedByteToInt(data[(byteArrayIndex++)]);
			byteTriplet <<= 8;
			byteTriplet |= convertUnsignedByteToInt(data[(byteArrayIndex++)]);

			byteTriplet <<= 2;

			byte b3 = (byte) (0x3F & byteTriplet);
			byteTriplet >>= 6;
			byte b2 = (byte) (0x3F & byteTriplet);
			byteTriplet >>= 6;
			byte b1 = (byte) (0x3F & byteTriplet);

			result.append(mapByteToChar(b1));
			result.append(mapByteToChar(b2));
			result.append(mapByteToChar(b3));

			result.append("=");
		}

		return result.toString();
	}

	public static byte[] decode(String data) {
		return new Base64().internalDecode(data);
	}

	public byte[] internalDecode(String data) {
		this.mString = data;
		this.mIndex = 0;

		int mUsefulLength = 0;
		int length = this.mString.length();
		for (int i = 0; i < length; i++) {
			if (isUsefulChar(this.mString.charAt(i))) {
				mUsefulLength++;
			}

		}

		int byteArrayLength = mUsefulLength * 3 / 4;

		byte[] result = new byte[byteArrayLength];

		int byteTriplet = 0;
		int byteIndex = 0;

		while (byteIndex + 2 < byteArrayLength) {
			byteTriplet = mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());

			result[(byteIndex + 2)] = (byte) (byteTriplet & 0xFF);
			byteTriplet >>= 8;
			result[(byteIndex + 1)] = (byte) (byteTriplet & 0xFF);
			byteTriplet >>= 8;
			result[byteIndex] = (byte) (byteTriplet & 0xFF);
			byteIndex += 3;
		}

		if (byteIndex == byteArrayLength - 1) {
			byteTriplet = mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());

			byteTriplet >>= 4;
			result[byteIndex] = (byte) (byteTriplet & 0xFF);
		}

		if (byteIndex == byteArrayLength - 2) {
			byteTriplet = mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());
			byteTriplet <<= 6;
			byteTriplet |= mapCharToInt(getNextUsefulChar());

			byteTriplet >>= 2;
			result[(byteIndex + 1)] = (byte) (byteTriplet & 0xFF);
			byteTriplet >>= 8;
			result[byteIndex] = (byte) (byteTriplet & 0xFF);
		}

		return result;
	}

	private int mapCharToInt(char c) {
		if ((c >= 'A') && (c <= 'Z')) {
			return c - 'A';
		}

		if ((c >= 'a') && (c <= 'z')) {
			return c - 'a' + 26;
		}

		if ((c >= '0') && (c <= '9')) {
			return c - '0' + 52;
		}

		if (c == '+') {
			return 62;
		}

		if (c == '/') {
			return 63;
		}

		throw new IllegalArgumentException(c + " is not a valid Base64 character.");
	}

	private char mapByteToChar(byte b) {
		if (b < 26) {
			return (char) (65 + b);
		}

		if (b < 52) {
			return (char) (97 + (b - 26));
		}

		if (b < 62) {
			return (char) (48 + (b - 52));
		}

		if (b == 62) {
			return '+';
		}

		if (b == 63) {
			return '/';
		}

		throw new IllegalArgumentException("Byte " + new Integer(b) + " is not a valid Base64 value");
	}

	private boolean isUsefulChar(char c) {
		return ((c >= 'A') && (c <= 'Z')) || ((c >= 'a') && (c <= 'z')) || ((c >= '0') && (c <= '9')) || (c == '+') || (c == '/');
	}

	private char getNextUsefulChar() {
		char result = '_';
		while (!isUsefulChar(result)) {
			result = this.mString.charAt(this.mIndex++);
		}

		return result;
	}

	private int convertUnsignedByteToInt(byte b) {
		if (b >= 0) {
			return b;
		}

		return 256 + b;
	}

	public static void main(String[] args) throws Exception {
		String tString = "I am 刘永裕!1";

		System.out.println("Text = [" + tString + "]");
		String tEncoded = encode(tString.getBytes());
		System.out.println("Encoded = [" + tEncoded + "]");
		byte[] tDecoded = decode(tEncoded);
		System.out.println("Decoded = [" + new String(tDecoded) + "]");
		for (int i = 0; i < 1; i++) {
			String tTestCompressedString = "eJyFU9uOozAM/ZWK923CrdDKzYhtd6U+FFUD/YAoWFNmIbAJ3aHz9Wugt4eRJjzUPrbOObJdeOnravYPjS0bvXbcOXdmqFVTlPpt7Rzz3z9i50XA5njIUJ0NCtijtfINZ2WxdhKP84i+Jefc9XweOAJ2+SvasZp9Ub0qCRKac2C3FPru0qLgLrApgl5V0lohCZgiaKUWC8/zFtz13ZEy8mMeABsKZMuok9SdAKn+/tylghp4GAckcgWgRrPbijheDPDSX9KLPGATDLItj6YSp65r7YqxRlelxrk6lVqeNXls5WWumpolh12Ghoyz3EhtWfa6kaY4ULVoSGtiAfbwk11sh7WAzkiF6bkWfBFGQQjsDkAhOxS3ac1cf+WGq4CsjTiwG8PhPHDaYTplIfbvyUf6mfj77Z9+//nLTXP1kb4f/XR7XNPUqOMb3nagS+rmTC5jGihN8gkBWrehU7gIN1wAu2eAfdtopA4iusfAHuYsdl2Fo8agC+wJgKQoEkXkNBuNVT5uPSL6pxxQleMpDL9Qqk2jN01BfcAeCbArU2nttO7xkacrAApNR4vl3zz";
			String tResultString = getDecodeMsg(tTestCompressedString);
			System.out.println("tResultString = [" + tResultString + "]");
		}
	}

	public static String getEncodeMsg(String tMessage) {
		String returnStr = "";
		try {
			ByteArrayOutputStream byteStream = getCompressedStr(tMessage);

			if (byteStream != null)
				returnStr = encode(byteStream.toByteArray());
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return returnStr;
	}

	private static ByteArrayOutputStream getCompressedStr(String tMessage) {
		ByteArrayOutputStream compressedStream = null;
		try {
			if ((tMessage != null) && (!"".equals(tMessage))) {
				byte[] input = tMessage.getBytes("UTF-8");

				Deflater compresser = new Deflater();
				compresser.setInput(input);
				compresser.finish();

				compressedStream = new ByteArrayOutputStream();
				byte[] buf = new byte[2048];

				while (!compresser.finished()) {
					int got = compresser.deflate(buf);
					if (got < 1)
						break;
					compressedStream.write(buf, 0, got);
				}
				compresser.end();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (compressedStream != null) {
				try {
					compressedStream.close();
				} catch (IOException ioex) {
					ioex.printStackTrace();
				}
			}

		}

		return compressedStream;
	}

	public static String getDecodeMsg(String tMessage) {
		String outputString = "";
		byte[] inputStr = null;
		try {
			String newStr = tMessage;
			newStr = newStr.replaceAll(" ", "+");
			inputStr = decode(newStr);
			outputString = getDeCompressedStr(inputStr);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return outputString;
	}

	private static String getDeCompressedStr(byte[] tMessage) {
		String returnStr = "";
		ByteArrayOutputStream aDeCompressedStream = null;
		try {
			Inflater decompresser = new Inflater();
			decompresser.setInput(tMessage);
			aDeCompressedStream = new ByteArrayOutputStream();

			byte[] buf = new byte[2048];
			while (!decompresser.finished()) {
				int got = decompresser.inflate(buf);
				if (got < 1)
					break;
				aDeCompressedStream.write(buf, 0, got);
			}
			decompresser.end();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (aDeCompressedStream != null)
					aDeCompressedStream.close();
			} catch (IOException ioex) {
				ioex.printStackTrace();
			}
		}
		try {
			returnStr = aDeCompressedStream.toString("UTF-8");
		} catch (UnsupportedEncodingException encodeEx) {
			encodeEx.printStackTrace();
		}

		return returnStr;
	}
}