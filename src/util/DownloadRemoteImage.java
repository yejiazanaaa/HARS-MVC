package util;

import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.net.*;
import java.util.*;
import java.io.*;
import java.util.regex.*;

public class DownloadRemoteImage {
    private static final String ECODING = "UTF-8";
    private static final String IMGURL_REG = "<img.*src=(.*?)[^>]*?>";
    private static final String IMGSRC_REG = "(http|https):\"?(.*?)(\"|>|\\s+)";

    public static String run(String content)
    {
        HttpServletRequest request = LocalRequestContextHolder.getLocalRequestContext().getRequest();

        String path = "./upload";

        DownloadRemoteImage image = new DownloadRemoteImage();

        List<String> imgUrl = image.getImageUrl(content);

        String text = image.getImageSrc(content , imgUrl , path);
        //List<String> imgSrc = image.getImageSrc(imgUrl);
        //image.Download(imgSrc,path);
        return text;
    }


    /***
     * 获取ImageUrl地址
     *
     * @param HTML
     * @return
     */
    private List<String> getImageUrl(String HTML) {
        Matcher matcher = Pattern.compile(IMGURL_REG).matcher(HTML);
        List<String> listImgUrl = new ArrayList<String>();
        while (matcher.find()) {
            listImgUrl.add(matcher.group());
        }
        return listImgUrl;
    }

    /***
     * 获取ImageSrc地址
     *
     * @param listImageUrl
     * @return
     */
    private String getImageSrc(String content , List<String> listImageUrl , String path) {
        //List<String> listImgSrc = new ArrayList<String>();

        for (String image : listImageUrl) {
            Matcher matcher = Pattern.compile(IMGSRC_REG).matcher(image);
            while (matcher.find()) {
                String src = matcher.group().substring(0, matcher.group().length() - 1);
                String newsFile = download(src , path);
                if(newsFile!= null){
                    content = content.replace(src , newsFile);
                }
            }
        }
        return content;
    }

    private static long downloadIndex = 1;

    private String getFileName( String url )
    {
        //URL u = new URL(url);
        String ext = url.substring(url.lastIndexOf(".") + 1);
        if(ext == null || ext.trim().equals("") ){
            ext = "jpg";
        }

        if(ext.indexOf("?")!=-1){
            ext = ext.substring(0,ext.indexOf("?"));
        }
        String filename = new Date().getTime()+downloadIndex + "."+ext;
        downloadIndex++;
        return filename;
    }


    private String download(String url, String path) {
        String result = "";
        String imageName = "";
        try {
            if(url.indexOf("http")>=0){
                imageName = getFileName( url ); //url.substring(url.lastIndexOf("/") + 1, url.length());
                URL uri = new URL(url);

                InputStream in = uri.openStream();
                HttpServletRequest request = LocalRequestContextHolder.getLocalRequestContext().getRequest();
                String paths = request.getSession().getServletContext().getRealPath(path);

                FileOutputStream fo = new FileOutputStream(new File(paths,imageName));
                byte[] buf = new byte[1024];
                int length = 0;
                System.out.println("开始下载:" + url);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                System.out.println(path+"/"+imageName + "下载完成");
            }
        } catch (Exception e) {
            System.out.println("下载失败");
            return null;
        }
        return path+"/"+imageName;
    }


}
