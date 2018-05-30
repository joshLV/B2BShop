package com.allinpay.ets.client;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StringUtil
{
  public static boolean isEmpty(String src)
  {
    return (null == src) || ("".equals(src));
  }

  public static void appendSignPara(StringBuffer buf, String key, String value)
  {
    if (!isEmpty(value))
      buf.append(key).append('=').append(value).append('&');
  }

  public static void appendLastSignPara(StringBuffer buf, String key, String value)
  {
    if (!isEmpty(value))
      buf.append(key).append('=').append(value);
  }

  public static void appendUrlPara(StringBuffer buf, String key, String value)
  {
    if (!isEmpty(value))
      try {
        buf.append(key).append('=').append(URLEncoder.encode(value, "utf-8")).append('&');
      }
      catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
  }

  public static void appendLastUrlPara(StringBuffer buf, String key, String value)
  {
    if (!isEmpty(value))
      try {
        buf.append(key).append('=').append(URLEncoder.encode(value, "utf-8"));
      }
      catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
  }
}