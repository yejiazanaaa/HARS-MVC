package control;

import dao.CommDAO;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import util.Info;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Iterator;

/**
 * 前台登录
 */
public class MainCtrl extends HttpServlet {

    public MainCtrl() {
        super();
    }

    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    public void go(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            System.out.println(request.getAttribute("error"));
            if(request.getAttribute("error")!=null){
                out.println("<script>alert('"+request.getAttribute("error")+"');location.href='"+url+"'</script>");
                out.close();
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect(url);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String ac = request.getParameter("ac");
        if (ac == null) ac = "";
        CommDAO dao = new CommDAO();
        String date = Info.getDateStr();
        String today = date.substring(0, 10);
        String tomonth = date.substring(0, 7);


        if (ac.equals("login")) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("pwd");
                    String utype = request.getParameter("cx");
                    String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
                    String random = (String) request.getSession().getAttribute("random");
                    if (!pagerandom.equals(random) && request.getParameter("captch") != null) {
                        request.setAttribute("error", "验证码错误");
                        go("index.jsp", request, response);
                    } else {
                        String sql1 = "";
                                                                        if (utype.equals("注册用户")) {
                            sql1 = "select * from zhuceyonghu where yonghuming='" + username + "' and mima='" + password + "' and issh='是'";
                        }
                                                                                                                                                                                                if (utype.equals("医生")) {
                            sql1 = "select * from yisheng where gonghao='" + username + "' and mima='" + password + "' ";
                        }
                                                                        
                        HashMap map = dao.find(sql1);
                        if (!map.isEmpty()) {
                            Iterator iter = map.keySet().iterator();
                            while (iter.hasNext()) {
                                String key = (String)iter.next();
                                String val = (String)map.get(key);
                                request.getSession().setAttribute(key, val);
                            }
                            request.getSession().setAttribute("username", username);
                            request.getSession().setAttribute("cx", utype);
                            gor("index.jsp", request, response);
                        } else {
                            request.setAttribute("error", "账号或密码错误");
                            go("index.jsp", request, response);
                        }


                    }
                }

                if (ac.equals("adminlogin")) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("pwd");
                    String utype = request.getParameter("cx");
                    String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
                    String random = (String) request.getSession().getAttribute("random");
                    if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                        request.setAttribute("error", "验证码错误");
                        go("login.jsp", request, response);
                    } else {
                        String sql1 = "";
                        if(utype.equals("管理员")){
                            sql1 = "select * from allusers where username='" + username + "' and pwd='" + password + "'  ";
                        }else{
                                                                                    if (utype.equals("注册用户")) {
                                sql1 = "select * from zhuceyonghu where yonghuming='" + username + "' and mima='" + password + "' and issh='是'";
                            }
                                                                                                                                                                                                                                if (utype.equals("医生")) {
                                sql1 = "select * from yisheng where gonghao='" + username + "' and mima='" + password + "' ";
                            }
                                                                                                            }
                        HashMap map = dao.find(sql1);
                        if (!map.isEmpty()) {
                            if(utype.equals("管理员")){
                                request.getSession().setAttribute("username", map.get("username"));
                                request.getSession().setAttribute("cx", map.get("cx"));
                            }else{
                                Iterator iter = map.keySet().iterator();
                                while (iter.hasNext()) {
                                    String key = (String)iter.next();
                                    String val = (String)map.get(key);
                                    request.getSession().setAttribute(key, val);
                                }
                                request.getSession().setAttribute("username", username);
                                request.getSession().setAttribute("cx", utype);
                            }

                            gor("main.jsp", request, response);
                        } else {
                            request.setAttribute("error", "账号或密码错误");
                            go("login.jsp", request, response);
                        }
                    }
                }

                //修改密码
                if (ac.equals("adminuppass")) {
                    String olduserpass = request.getParameter("ymm");
                    String userpass = request.getParameter("xmm1");
                    String copyuserpass = request.getParameter("xmm2");
                    //println(Info.getUser(request).get("id").toString());
                    String cx = (String)request.getSession().getAttribute("cx");
                    String oldPassword = "";
                    if(cx.equals("超级管理员") || cx.equals("普通管理员")){
                        HashMap m = dao.getmaps("username", (String) request.getSession().getAttribute("username"), "allusers");
                        oldPassword = (String)m.get("pwd");
                    }else{
                                                if(cx.equals("注册用户")){
                            HashMap m = dao.getmaps("yonghuming", (String) request.getSession().getAttribute("username"), "zhuceyonghu");
                            oldPassword = (String)m.get("mima");
                        }
                                                if(cx.equals("医生")){
                            HashMap m = dao.getmaps("gonghao", (String) request.getSession().getAttribute("username"), "yisheng");
                            oldPassword = (String)m.get("mima");
                        }
                                            }
                    if (!(oldPassword.equals(olduserpass))) {
                        request.setAttribute("error", "原密码错误");
                        go("mod.jsp", request, response);
                    } else {
                        //String id = (String)user.get("id");
                        String sql = "update allusers set pwd='" + userpass + "' where username='" + (String) request.getSession().getAttribute("username") + "'";
                                                if(cx.equals("注册用户")){
                            sql = "UPDATE zhuceyonghu SET mima='"+userpass+"' WHERE yonghuming='"+request.getSession().getAttribute("username")+"'";
                        }
                                                if(cx.equals("医生")){
                            sql = "UPDATE yisheng SET mima='"+userpass+"' WHERE gonghao='"+request.getSession().getAttribute("username")+"'";
                        }
                        
                        dao.commOper(sql);
                        request.setAttribute("error", "密码修改成功");
                        go("mod.jsp", request, response);
                    }
                }

        dao.close();
        out.flush();
        out.close();
    }


    public void init() throws ServletException {
        // Put your code here
    }


}
