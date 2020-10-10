package dao;

import util.Info;
import util.StringUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;


public class CommDAO {
    public static String dbname = "";
    public static String dbtype = "";

    public static Connection conn = null;

    public CommDAO() {
        conn = this.getConn();
    }


    //给字段做加减法
    public void jiajian(String tablename, String colname, String id, String num) {
        HashMap map = this.getmap(id, tablename);
        String value = map.get(colname).toString();
        if (value.equals("")) value = "0";
        int i = Integer.parseInt(value);
        int j = Integer.parseInt(num);
        commOper("update " + tablename + " set " + colname + " = " + (i + j) + " where id=" + id);
    }

    public HashMap getmap(String id, String table) {
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            //System.out.println("select * from "+table+" where id="+id);
            ResultSet rs = st.executeQuery("select * from " + table + " where id=" + id);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else
                        map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list.get(0);
    }

    public HashMap find(String sql) {
        HashMap map = new HashMap();

        //List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                //HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else
                        map.put("id", rs.getString(j));
                }
                //list.add(map);
                break;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
        }
        return map;
    }

    public HashMap getmaps(String nzd, String zdz, String table) {
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            //System.out.println("select * from "+table+" where "+nzd+"='"+zdz+"'");
            ResultSet rs = st.executeQuery("select * from " + table + " where " + nzd + "='" + zdz + "'");
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else
                        map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list.get(0);
    }


    //返回值类型为Map<String, String>
    public static HashMap getParameterStringMap(HttpServletRequest request) {
        Map<String, String[]> properties = request.getParameterMap();//把请求参数封装到Map<String, String[]>中
        HashMap returnMap = new HashMap<String, String>();
        String name = "";
        String value = "";
        for (Map.Entry<String, String[]> entry : properties.entrySet()) {
            name = entry.getKey();
            String[] values = entry.getValue();
            if (null == values) {
                value = "";
            } else {
                  value = StringUtil.join(",",values);//用于请求参数中请求参数名唯一
            }
            returnMap.put(name, value);
        }
        return returnMap;
    }

    public String insert(HttpServletRequest request, HttpServletResponse response, String tablename, HashMap extmap, boolean alert, boolean reflush, String tzurl) {

        extmap.put("addtime", Info.getDateStr());
        if(request.getParameter("f")!= null){
            Query query = new Query(tablename);
            HashMap post = getParameterStringMap(request);
            post.putAll(extmap);
            return query.add(post);
        }
        return "";
    }

    public void delete(HttpServletRequest request, String tablename) {

        int i = 0;
        try {
            String did = request.getParameter("did");
            if (did == null) did = request.getParameter("scid");
            if (did != null) {
                if (did.length() > 0) {
                    Statement st = conn.createStatement();
                    System.out.println("delete from " + tablename + " where id=" + did);
                    st.execute("delete from " + tablename + " where id=" + did);
                    st.close();
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
        }
    }


    public String getCols(String table) {
        String str = "";
        Connection conn = this.getConn();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from " + table);
            ResultSetMetaData rsmd = rs.getMetaData();

            int i = rsmd.getColumnCount();
            for (int j = 2; j <= i; j++) {
                str += rsmd.getColumnName(j) + ",";
            }

        } catch (SQLException e) {
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
            //e.printStackTrace();
        }
        str = str.substring(0, str.length() - 1);

        return str;
    }


    public String update(HttpServletRequest request, HttpServletResponse response, String tablename, HashMap extmap,
                         boolean alert, boolean reflush, String tzurl) {
        extmap.put("addtime", Info.getDateStr());
        if(request.getParameter("f")!= null){
            Query query = new Query(tablename);
            HashMap post = getParameterStringMap(request);
            post.putAll(extmap);
            if(query.save(post)){
                return "1";
            }
        }
        return "";
    }


    public Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {

                
                         Class.forName("com.mysql.jdbc.Driver");
			        	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital1?useUnicode=true&characterEncoding=UTF-8","root","123456");
			        	 // mysql 8.0 以上使用
			        	 //Class.forName("com.mysql.cj.jdbc.Driver"); 
			        	 //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspm00471yyyyghxt?useUnicode=true&characterEncoding=UTF-8&useSSL=FALSE&serverTimezone=UTC","root","root");
			        	 

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }


    public int getInt(String sql) {
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                i = rs.getInt(1);
            }
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
        }
        return i;
    }


    public double getDouble(String sql) {
        double i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                i = rs.getDouble(1);

            }
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
        }
        return i;
    }

    public long commOper(String sql) {
        System.out.println(sql);
        long autoInsertId = -1;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql , Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = st.getGeneratedKeys();

            while(rs.next()){
                autoInsertId = rs.getLong(1);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
        }
        return autoInsertId;
    }

    public void commOperSqls(ArrayList<String> sql) {

        try {
            conn.setAutoCommit(false);
            for (int i = 0; i < sql.size(); i++) {
                Statement st = conn.createStatement();
                System.out.println(sql.get(i));
                st.execute(sql.get(i));
                st.close();
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                //e1.printStackTrace();
                int code = e1.getErrorCode();
                String message = e1.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:"+code);
                System.err.println("Message:"+message);
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                int code = e.getErrorCode();
                String message = e.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:"+code);
                System.err.println("Message:"+message);
                //e.printStackTrace();
            }
        }
    }


    public List<HashMap> select(String sql) {
        System.out.println(sql);
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else
                        map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block

            if (sql.equals("show tables"))
                list = select("select table_name from   INFORMATION_SCHEMA.tables");
            else{
                int code = e.getErrorCode();
                String message = e.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:"+code);
                System.err.println("Message:"+message);
            }
                //e.printStackTrace();
        }
        return list;
    }


    public List<List> selectforlist(String sql) {
        List<List> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                List<String> list2 = new ArrayList();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        list2.add(str);
                    } else
                        list2.add(rs.getString(j));
                }
                list.add(list2);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }


    public void close() {

    }

    /**
     * 执行一条查询sql,以 List<hashmap> 的形式返回查询的记录，记录条数，和从第几条开始，由参数决定，主要用于翻页
     * pageno 页码  rowsize 每页的条数
     */
    public List<HashMap> select(String sql, int pageno, int rowsize) {
        List<HashMap> list = new ArrayList<HashMap>();
        List<HashMap> mlist = new ArrayList<HashMap>();
        try {
            list = this.select(sql);
            int min = (pageno - 1) * rowsize;
            int max = pageno * rowsize;

            for (int i = 0; i < list.size(); i++) {

                if (!(i < min || i > (max - 1))) {
                    mlist.add(list.get(i));
                }
            }
        } catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }


        return mlist;
    }


    public static void main(String[] args) {
    }
}


