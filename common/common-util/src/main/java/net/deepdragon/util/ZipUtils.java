package net.deepdragon.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

import com.jcraft.jzlib.JZlib;
import com.jcraft.jzlib.ZInputStream;
import com.jcraft.jzlib.ZOutputStream;

@SuppressWarnings("deprecation")
public class ZipUtils {

	// 输入数据的最大长度
	private static final int MAXLENGTH = 102400;
	private static final int BUFFERSIZE = 1024;

	/**
	 * 压缩数据
	 * 
	 * @param object
	 * @return
	 * @throws IOException
	 */
	public static byte[] compress(byte[] object){

		byte[] data = null;
		try {
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			ZOutputStream zOut = new ZOutputStream(out,
					JZlib.Z_BEST_COMPRESSION);
			DataOutputStream objOut = new DataOutputStream(zOut);
			objOut.write(object);
			objOut.flush();
			zOut.close();
			data = out.toByteArray();
			objOut.close();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 解压被压缩的数据
	 * 
	 * @param object
	 * @return
	 * @throws IOException
	 */
	public static byte[] unCompress(byte[] object) throws IOException {

		byte[] data = new byte[MAXLENGTH];
		try {
			ByteArrayInputStream in = new ByteArrayInputStream(object);
			ZInputStream zIn = new ZInputStream(in);
			DataInputStream objIn = new DataInputStream(zIn);

			int len = 0;
			int count = 0;
			while ((count = objIn.read(data, len, len + BUFFERSIZE)) != -1) {
				len = len + count;
			}

			byte[] trueData = new byte[len];
			System.arraycopy(data, 0, trueData, 0, len);

			objIn.close();
			zIn.close();
			in.close();

			return trueData;

		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
	}
}
