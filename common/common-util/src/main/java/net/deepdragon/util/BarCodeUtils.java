/*
 * Copyright (c) 2011.
 * All Rights Reversed by WanXiang Corp.
 */

package net.deepdragon.util;

import org.apache.commons.lang3.StringUtils;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * All rights reversed by WanXiang Corporation.
 * User: jiawenlong
 * Date: 11-9-21
 * Time: 上午11:37
 */
public class BarCodeUtils {
    /// <summary>
    /// 默认文件后缀
    /// </summary>
    public static String DEFAULTSUFFIX = ".tmp";
    /// <summary>
    /// 36進の配列要素数
    /// </summary>
    private static int SHINMAX = 36;

    /// <summary>
    /// 36進文字列
    /// </summary>
    private static String SHINNUM = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";


    /// <summary>
    /// 生成临时文件名(10字符)
    /// </summary>
    /// <returns>临时文件名</returns>
    public static String generateBarCode() {
        String fileName = "";
        int code = 0;
        try {
            Thread.sleep(15);
            Calendar now = new GregorianCalendar();
            Calendar before = new GregorianCalendar(1970, Calendar.JANUARY, 1);
            long milliSec = now.getTimeInMillis() - before.getTimeInMillis();

            String pattern = "00000000000000";
            DecimalFormat df = new DecimalFormat(pattern);
            String strTimeBuf = df.format(milliSec);

            int code1 = Integer.valueOf(strTimeBuf.substring(0, 7));
            code = Integer.valueOf(strTimeBuf.substring(7, 14));
            fileName = convert2HexCode(StringUtils.EMPTY, code1);

        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return convert2HexCode(fileName, code);
    }


    /// <summary>
    /// 36進変換処理
    /// TimeSpanGetより渡された、ConvNameを36進へ変換する
    /// </summary>
    /// <param name="fileName">ファイルポインタ</param>
    /// <param name="code">36進変換するコード値</param>
    /// <returns>処理後のファイル名前</returns>
    private static String convert2HexCode(String fileName, int code) {
        if (fileName == null) fileName = StringUtils.EMPTY;
        // 36進への変換対象チェック
        if (code > 9999999 || code < 0) {
            return "TMP";
        }

        // 36進文字列の一時格納
        StringBuilder tmp = new StringBuilder();
        // ループカウンタ
        for (int i = code; i > 0; i = i / SHINMAX) {
            int j = i % SHINMAX;
            tmp.append(SHINNUM.toCharArray()[j]);
        }
        // 桁数揃え用処理(10桁）に揃えるため
        char[] buf = {'0', '0', '0', '0', '0'};
        //// 文字列数取得用
        String work = tmp.toString();
        int len = work.length() - 1;
        // 入力開始位置用
        int cpw = 4;

        //// ループカウンタ
        for (int i = len; i >= 0; i--, cpw--) {
            buf[cpw] = work.toCharArray()[i];
        }

        // ループカウンタ
        for (int i = 0; i < buf.length; i++) {
            char c = buf[i];
            fileName += c;
        }
        return fileName;
    }
}
