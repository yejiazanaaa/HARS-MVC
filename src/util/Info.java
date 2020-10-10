package util;


import dao.CommDAO;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import net.sf.json.JSONObject;
import org.json.simple.parser.JSONParser;
import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Info {

    public static String dx(String name, int length) {
        CommDAO dao = new CommDAO();
        HashMap row = dao.find("select * from dx where leibie='" + name + "'");
        if (row == null || row.get("content") == null || row.isEmpty()) {
            return "";
        } else {
            return subStr((String) row.get("content"), length);
        }
    }

    public static int getBetweenDayNumber(String dateA, String dateB) {
        long dayNumber = 0;
        //1小时=60分钟=3600秒=3600000
        long mins = 60L * 1000L;
        //long day= 24L * 60L * 60L * 1000L;计算天数之差
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            java.util.Date d1 = df.parse(dateA);
            java.util.Date d2 = df.parse(dateB);
            dayNumber = (d2.getTime() - d1.getTime()) / mins;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (int) dayNumber;
    }

    public synchronized static String getID() {

        Random random = new Random();
        StringBuffer ret = new StringBuffer(20);
        java.util.Date date = new java.util.Date();
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MMddHHmmss", java.util.Locale.CHINA);
        ret.append(format.format(date));
        String rand = String.valueOf(Math.abs(random.nextInt()));
        //ret.append(getDateStr());
        ret.append(rand.substring(0, 4));

        return ret.toString();
    }


    public synchronized static String subStr(String source, int length) {
        if (source.length() > length) {
            source = delHTMLTag( source.substring(0, length)) + "...";
        }
        return source;
    }


    public synchronized static String ensubStr(Object source, int length) {
        String msource = Info.filterStrIgnoreCase(source.toString(), "<", ">");
        if (msource.length() > length) {
            msource = msource.substring(0, length) + "...";
        }
        return msource;
    }

    public static String address(Object nAddress)
    {
        String add = nAddress == null ? "" : nAddress.toString();
        if(add == null || add.length() == 0){
            return "";
        }
        org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
        try{
            org.json.simple.JSONObject obj = (org.json.simple.JSONObject)parser.parse(add);
            if(obj != null && !obj.isEmpty()){
                return obj.get("address").toString();
            }
        }catch (Exception e){

        }
        /*JSONObject json =  JSONObject.fromObject(add);
        if(json != null && !json.isEmpty()){
            return json.getString("address");
        }*/
        return "";
    }

    public static String images(Object nImages)
    {
        String str = nImages == null ? "" : nImages.toString();
        if(str.indexOf(",")>=0){
            String[] li = str.split(",");
            return li[0];
        }
        return str;
    }

    public static String getDateStr() {
        String dateString = "";
        try {//yyyyMMddHHmmss
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date currentTime_1 = new java.util.Date();
            dateString = formatter.format(currentTime_1);
        } catch (Exception e) {
        }
        return dateString;
    }

    /**
     * url 编码，中文要进行编码输出
     * @param str
     * @return
     */
    public static String urlencode(Object str)
    {
        try{
            return java.net.URLEncoder.encode(String.valueOf(str), "UTF-8");
        }catch (Exception e){
            e.printStackTrace();
        }
        return str.toString();
    }

    /**
     * url 解码
     * @param str
     * @return
     */
    public static String urldecode(Object str)
    {
        try{
            return java.net.URLDecoder.decode(String.valueOf(str), "UTF-8");
        }catch (Exception e){
            e.printStackTrace();
        }
        return str.toString();
    }

    public static String getUTFStr(String str) {
        if (str == null) {
            return "";
        }

        try {
            str = new String(str.getBytes("ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return str;
    }


    public static String delHTMLTag(String htmlStr) {
        String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式
        String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式
        String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式

        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(htmlStr);
        htmlStr = m_script.replaceAll(""); //过滤script标签

        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(htmlStr);
        htmlStr = m_style.replaceAll(""); //过滤style标签

        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(htmlStr);
        htmlStr = m_html.replaceAll(""); //过滤html标签

        return htmlStr.trim(); //返回文本字符串
    }


    public static String getDay(String date, int day) {
        String b = date.substring(0, 10);
        String c = b.substring(0, 4);
        String d = b.substring(5, 7);
        String f = b.substring(8, 10);
        String aa = c + "/" + d + "/" + f;
        String a = "";
        DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM);
        GregorianCalendar grc = new GregorianCalendar();
        grc.setTime(new Date(aa));
        grc.add(GregorianCalendar.DAY_OF_MONTH, day);
        String resu = dateFormat.format(grc.getTime());
        String t[] = resu.split("-");
        String sesuu = "";
        for (int i = 0; i < t.length; i++) {
            if (t[i].length() == 1) {
                t[i] = "0" + t[i];
            }
            sesuu += t[i] + "-";
        }
        return sesuu.substring(0, 10);
    }


    /**
     * 计算两个时期之间的天数
     */
    public static int dayToday(String DATE1, String DATE2) {
        int i = 0;
        if (DATE1.indexOf(" ") > -1)
            DATE1 = DATE1.substring(0, DATE1.indexOf(" "));
        if (DATE2.indexOf(" ") > -1)
            DATE2 = DATE2.substring(0, DATE2.indexOf(" "));

        String[] d1 = DATE1.split("-");
        if (d1[1].length() == 1) {
            DATE1 = d1[0] + "-0" + d1[1];
        } else {
            DATE1 = d1[0] + "-" + d1[1];
        }

        if (d1[2].length() == 1) {
            DATE1 = DATE1 + "-0" + d1[2];
        } else {
            DATE1 = DATE1 + "-" + d1[2];
        }

        String[] d2 = DATE2.split("-");
        if (d2[1].length() == 1) {
            DATE2 = d2[0] + "-0" + d2[1];
        } else {
            DATE2 = d2[0] + "-" + d2[1];
        }

        if (d2[2].length() == 1) {
            DATE2 = DATE2 + "-0" + d2[2];
        } else {
            DATE2 = DATE2 + "-" + d2[2];
        }

        for (int j = 0; j < 10000; j++) {
            i = j;
            String gday = Info.getDay(DATE1, j);
            if (gday.equals(DATE2)) {
                break;
            }
        }
        return i;
    }

    /**
     * 比较时间大小
     */
    public static long compare_datetime(String DATE1, String DATE2) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            return dt1.getTime()-dt2.getTime();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return -1;
    }

    /**
     * 比较时间大小
     */
    public static String compare_datezq(String DATE1, String DATE2) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() > dt2.getTime()) {

                return "big";
            } else if (dt1.getTime() < dt2.getTime()) {

                return "small";
            } else {
                return "den";
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return "den";
    }

    /**
     * 过滤html代码
     */
    public static String filterStrIgnoreCase(String source, String from, String to) {
        String sourceLowcase = source.toLowerCase();
        String sub1, sub2, subLowcase1, subLowcase2;
        sub1 = sub2 = subLowcase1 = subLowcase2 = "";
        int start = 0, end;
        boolean done = true;
        if (source == null) return null;
        if (from == null || from.equals("") || to == null || to.equals(""))
            return source;
        while (done) {
            start = sourceLowcase.indexOf(from, start);
            if (start == -1) {
                break;
            }
            subLowcase1 = sourceLowcase.substring(0, start);
            sub1 = source.substring(0, start);
            end = sourceLowcase.indexOf(to, start);
            if (end == -1) {
                end = sourceLowcase.indexOf("/>", start);
                if (end == -1) {
                    done = false;
                }
            } else {
                end = end + to.length();
                subLowcase2 = sourceLowcase.substring(end, source.length());
                sub2 = source.substring(end, source.length());
                sourceLowcase = subLowcase1 + subLowcase2;
                source = sub1 + sub2;
            }
            //System.out.println(start+" "+end);
        }
        return source;
    }



    public static String html(Object source) {
        return html((String) source);
    }

    public static String html(String source) {
        if (source == null) {
            return "";
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < source.length(); i++) {
            char c = source.charAt(i);
            switch (c) {
                case '<':
                    buffer.append("&lt;");
                    break;
                case '>':
                    buffer.append("&gt;");
                    break;
                case '&':
                    buffer.append("&amp;");
                    break;
                case '"':
                    buffer.append("&quot;");
                    break;
                default:
                    buffer.append(c);
            }
        }
        html = buffer.toString();
        return html;
    }

    public static String get(String name) {
        String value = LocalRequestContextHolder.getLocalRequestContext().getRequest().getParameter(name);
        return value == null ? "" : value;
    }

    public static String date(String format) {
        return date(format, null);
    }

    public static String date(String format, long time) {
        return date(format, new Date(time * 1000));
    }

    public static long time() {
        return Long.valueOf(new Date().getTime() / 1000);
    }

    public static String date(String format, Date time) {
        if (time == null) {
            time = new Date();
        }
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format);
        return formatter.format(time);
    }

}



