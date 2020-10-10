package dao;


import dao.db.Builder;
import util.Info;
import util.StringUtil;

import java.sql.*;
import java.util.*;


public class Query {
    protected String mName = "";
    protected HashMap mOption = null;
    protected String pk = "id";
    protected HashMap mData = null;
    protected Builder builder = null;


    public static HashMap tableFields = new HashMap();
    public Query()
    {
        reset();
    }



    public Query(String name)
    {
        reset();
        setName(name);
    }

    protected Query reset()
    {
        mName = "";
        mOption = null;
        mOption = new HashMap();
        mData = new HashMap();
        builder = Builder.make(new CommDAO().getConn());

        if(tableFields == null)
        {
            tableFields = new HashMap();
        }
        return this;
    }

    public Query inc(String field , int step)
    {
        if(step<1)step = 1;
        ArrayList list = new ArrayList();
        list.add("inc");
        list.add(step);
        mData.put(field , list);
        return this;
    }

    public Query dec(String field , int step)
    {
        if(step<1)step = 1;
        ArrayList list = new ArrayList();
        list.add("dec");
        list.add(step);
        mData.put(field , list);
        return this;
    }

    public boolean setInc(String field)
    {
        return setInc(field ,1);
    }
    public boolean setInc(String field , String step)
    {
        return inc(field , Integer.valueOf(step).intValue()).update();
    }
    public boolean setInc(String field , int step)
    {
        return inc(field , step).update();
    }
    public boolean setDec(String field )
    {
        return setDec(field , 1);
    }
    public boolean setDec(String field , String step)
    {
        return dec(field , Integer.valueOf(step).intValue()).update();
    }
    public boolean setDec(String field , int step)
    {
        return dec(field , step).update();
    }

    public boolean setField(String field , Object step)
    {
        mData.put(field , step);
        return update();
    }
    public HashMap getData()
    {
        return mData;
    }

    public boolean update()
    {
        return update(null);
    }
    public boolean update( HashMap updateData )
    {
        if(updateData != null){
            mData.putAll(updateData);
        }
        String sql = builder.buildUpdate(this);
        executeInsert(sql);
        return true;
    }

    public Query data(Map data)
    {
        mData.putAll(data);
        return this;
    }

    public Query data(String name , String value)
    {
        mData.put(name , value);
        return this;
    }

    public Query data(String name , int value)
    {
        mData.put(name , value);
        return this;
    }
    public Query data(String name , long value)
    {
        mData.put(name , value);
        return this;
    }
    public Query data(String name , float value)
    {
        mData.put(name , value);
        return this;
    }

    public Query data(String name , double value)
    {
        mData.put(name , value);
        return this;
    }

    public Query data(String name , boolean value)
    {
        mData.put(name , value ? 1 : 0);
        return this;
    }


    public int insert(HashMap insertData ){ return insert(insertData , false); }
    public int insert(HashMap insertData , boolean replace)
    {
        if(insertData != null){
            mData.putAll(insertData);
        }
        String sql = builder.buildInsert(this , replace);
        return executeInsert(sql);
    }

    public String getPk() {
        return pk;
    }
    public void setPk(String pk) {
        this.pk = pk;
    }

    protected void finalize()
    {

        //Statement st = conn.createStatement();
        //System.out.print(sql);
        //ResultSet rs
        //super.finalize();

        free();
    }

    /**
     * 释放资源
     */
    public void free()
    {
        // 释放rs
        for(int i=0;i<resultSetList.size();i++){
            Object os = resultSetList.get(i);
            try{
                if(os instanceof Statement){
                    Statement st = ((Statement) os);
                    st.close();
                }else if(os instanceof ResultSet){
                    ((ResultSet) os).close();
                }
            }catch (SQLException e){
            }
        }
        resultSetList.clear();
    }

    public Query setName(String name)
    {
        mName = name;
        return this;
    }


    public String getName()
    {
        return mName;
    }


    public Query setAttribute(String name , Object value)
    {
        getOptionHashMap("data").put(name , value);
        return this;
    }

    public Object getAttribute(String name)
    {
        return getOptionHashMap("data").get(name);
    }

    public Query field()
    {
        return field("*");
    }

    public Query field(String field)
    {
        getOptionArrayList("field").add(field);
        return this;
    }

    public Query table(String nTable)
    {
        getOptionArrayList("table").add(nTable);
        return this;
    }

    public Query table(String nTable , String alias)
    {
        getOptionArrayList("table").add(nTable+" "+alias);
        return this;
    }

    public Query limit(int nLimit)
    {
        //getOptionHashMap("limit").put("limit" , String.valueOf(nLimit));
        return limit(String.valueOf(nLimit));
    }

    public Query limit(int offset , int nLimit)
    {
        return limit(String.valueOf(offset) , String.valueOf(nLimit));
    }
    public Query lock( boolean lock )
    {
        return this.lock(lock ? " FOR UPDATE " : "");
    }
    public Query lock(String lock)
    {
        getOption().put("lock" , lock);
        return this;
    }

    public Query limit(String nLimit)
    {
        if(nLimit.indexOf(",") != -1){
            String[] list = nLimit.split(",");
            return limit(list[0] , list[1]);
        }
        getOptionHashMap("limit").put("limit" , nLimit);
        return this;
    }

    public Query limit(String offset , String nLimit)
    {
        HashMap map = getOptionHashMap("limit");
        map.put("limit" , nLimit);
        map.put("offset" , offset);
        return this;
    }

    public HashMap find(int id)
    {
        where(pk , String.valueOf(id));
        return find();
    }

    public HashMap find(String id)
    {
        where(pk , id);
        return find();
    }

    public HashMap find()
    {
        //limit(1);
        String sql = builder.buildSelect(this);
        ResultSet rs = query(sql);
        QueryData data = fetch(rs);
        return data;
    }

    protected double total(String f , String func)
    {
        String ifnull = builder.parseIfNull(func+"("+f+")" , "0");
        String field = ifnull+" count";
        if(mOption.containsKey("field")){
            getOptionArrayList("field").clear();
        }
        getOptionArrayList("field").add(field);
        HashMap data = find();
        if(data.containsKey("count")){
            String count = data.get("count").toString();
            return Double.valueOf(count).doubleValue();
        }
        return 0;
    }

    public double sum(String field)
    {
        return total(field , "SUM");
    }
    public double avg(String field)
    {
        return total(field , "AVG");
    }
    public double max(String field){
        return total(field , "MAX");
    }
    public double min(String field)
    {
        return total(field , "MIN");
    }
    public long count()
    {
        return count(null);
    }

    public long count( String field )
    {
        if(field == null){
            if(mOption.containsKey("alias")){
                field = "count("+mOption.get("alias")+".id) count";
            }else{
                field = "count(*) count";
            }
        }else{
            field = "count("+field+") count";
        }
        if(mOption.containsKey("field")){
            mOption.put("field" , new ArrayList());
            //getOptionArrayList("field").clear();
        }
        if(mOption.containsKey("order")){
            mOption.remove("order");
        }
        getOptionArrayList("field").add(field);
        HashMap data = find();
        if(data.containsKey("count")){
            return Long.valueOf((String)data.get("count")).longValue();
        }
        return 0;
    }

    public long delete(List ids)
    {
        where(getPk() , "in" , ids);
        return delete();
    }

    public long delete(int id)
    {
        where(getPk() , id);
        return delete();
    }

    public long delete(String id)
    {
        if(id.indexOf(",")!=-1){
            where(getPk() , "in" , id);
        }else{
            where(getPk() , id);
        }
        return delete();
    }

    public long delete()
    {
        if(!mOption.containsKey("where")){
            return -1;
        }
        String sql = this.builder.buildDelete(this);
        return executeUpdate(sql);
    }


    public ArrayList select()
    {
        ArrayList result = new ArrayList();
        String sql = builder.buildSelect(this);

        ResultSet rs = query(sql);
        if (rs == null) {
            return result;
        }
        QueryData data = null;
        while( !((data = fetch(rs)).isEmpty()) ){
            result.add(data);
        }
        return result;
    }

    public QueryData fetch(ResultSet rs)
    {
        QueryData data = new QueryData();
        if(rs == null)return data;
        try {
            if(rs.next()){
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                for(int i=1;i<=columnCount;i++){
                    String name = rsmd.getColumnName(i);
                    String value = rs.getString(i);
                    if(value == null || value.toLowerCase().equals("null")){
                        value = "";
                    }
                    data.put(name , value);
                }
            }
        }catch (SQLException sql){
            sql.printStackTrace();
        }
        return data;
    }

    protected ArrayList resultSetList = new ArrayList();

    public ResultSet query(String sql)
    {
        try {
            Connection conn = this.getConn();
            Statement st = conn.createStatement();
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);

            resultSetList.add(rs);
            resultSetList.add(st);
            return rs;
        }catch (SQLException e){
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
            //e.printStackTrace();
        }
        return null;
    }

    public String value(String name)
    {
        if(!mOption.containsKey("field")){
            field(name);
        }
        HashMap data = find();
        if(data.isEmpty()){
            return "";
        }
        return String.valueOf(data.get(name));
    }


    public Query group(String nGroup)
    {
        getOptionArrayList("group").add(nGroup);
        return this;
    }

    public Query order(String nOrder)
    {
        getOptionArrayList("order").add(nOrder);
        return this;
    }
    public Query joinInner(String table , String cond)
    {
        return join(table , cond , "INNER");
    }
    public Query joinRight(String table , String cond)
    {
        return join(table , cond , "RIGHT");
    }
    public Query joinLeft(String table , String cond)
    {
        return join(table , cond , "LEFT");
    }
    public Query join(String table , String cond , String type)
    {
        StringBuffer buffer = new StringBuffer();
        buffer.append(" ").append(type).append(" JOIN ").append(table).append(" ON ").append(cond);

        getOptionArrayList("join").add(buffer.toString());
        return this;
    }

    public Query alias(String name)
    {
        mOption.put("alias" , name);
        return this;
    }


    private HashMap getOptionHashMap(String type)
    {
        if(mOption.containsKey(type)){
            return (HashMap) mOption.get(type);
        }
        HashMap map = new HashMap();
        mOption.put(type , map);
        return map;
    }

    private ArrayList getOptionArrayList(String type)
    {
        if(mOption.containsKey(type)){
            return (ArrayList) mOption.get(type);
        }
        ArrayList map = new ArrayList();
        mOption.put(type , map);
        return map;
    }

    public Query where(String name)
    {
        HashMap list = new HashMap();
        list.put("where" , name);
        getOptionArrayList("where").add(list);
        return this;
    }

    public Query where(String name , Object value)
    {
        return where(name , null , value ,null);
    }

    public Query where(String name ,String eq, Object value)
    {
        return where(name , eq , value ,null);
    }

    public Query where(String name , String eq , Object Value , String connect)
    {
        HashMap list = new HashMap();
        list.put("name",name);
        list.put("exp" , eq == null ? "=" : eq);
        list.put("value",Value == null ? "" : Value);
        list.put("connect",connect == null ? "and" : connect);

        getOptionArrayList("where").add(list);

        return this;
    }

    public Query whereIn(String field , String inArray)
    {
        String[] arr = inArray.split(",");
        return where(field , "in" , arr);
    }

    public Query whereIn(String field , String[] inArray)
    {
        return where(field , "in" , inArray);
    }

    public Query whereIn(String field , int[] inArray)
    {
        return where(field , "in" , inArray);
    }

    public Query whereInNot(String field , String inArray)
    {
        String[] arr = inArray.split(",");
        return where(field , "not in" , arr);
    }

    public Query whereBetween(String field , String inArray)
    {
        String[] arr = inArray.split(",");
        return where(field , "between" , arr);
    }

    public Query whereBetween(String field , String start , String end)
    {
        return where(field , "between" , "'"+start+"' AND '"+end+"'");
    }

    public Query whereBetweenNot(String field , String inArray)
    {
        String[] arr = inArray.split(",");
        return where(field , "not between" , arr);
    }

    public Query whereBetweenNot(String field , String start , String end)
    {
        return where(field , "not between" , "'"+start+"' AND '"+end+"'");
    }


    protected Connection getConn()
    {
        return new CommDAO().getConn();
    }

    protected String getFieldDefault(String type)
    {
        String t = type.toUpperCase();
        if(t.equals("DATE")){
            return "0000-00-00";
        }else if(t.equals("DATETIME")){
            return "0000-00-00 00:00:00";
        }else if(t.equals("TIME")){
            return "00:00:00";
        }else if(t.equals("TIMESTAMP")){
            return Info.getDateStr();
        }else if(t.equals("FLOAT") || t.equals("DOUBLE") || t.equals("DECIMAL") || t.indexOf("INT")!=-1){
            return "0";
        }
        return "''";
    }

    protected String getFieldValue(String type , String value)
    {
        String t = type.toUpperCase();

        if(value == null || value.equals("")){
            // 等于空值，就写入默认值
            return getFieldDefault(type);
        }
        if(t.equals("FLOAT") || t.equals("DOUBLE") || t.equals("DECIMAL") || t.indexOf("INT")!=-1){
            return value;
        }
        return "'"+value.replace("'" , "\\'")+"'";
    }

    protected HashMap getTableField(String table )
    {
        if(table == null){
            table = mName;
        }

        if(tableFields.containsKey(table)){
            return (HashMap) tableFields.get(table);
        }

        HashMap result = new HashMap();
        try{
            Connection conn = this.getConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from " + table);
            ResultSetMetaData rsmd = rs.getMetaData();
            int i = rsmd.getColumnCount();
            for (int j = 1; j <= i; j++) {
                result.put(rsmd.getColumnName(j) , rsmd.getColumnTypeName(j));
            }
            rs.close();
            st.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }


    protected void getFieldValueList(HashMap map , ArrayList fields , ArrayList values , boolean isInsert)
    {
        try{
            Connection conn = this.getConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from " + mName);

            ResultSetMetaData rsmd = rs.getMetaData();
            int i = rsmd.getColumnCount();
            for (int j = 1; j <= i; j++) {
                String col =rsmd.getColumnName(j);
                if (col.toLowerCase().equals("id")) continue;
                String type = rsmd.getColumnTypeName(j);
                if(map.containsKey(col)){
                    // 存在,就不理他了
                    fields.add(col);
                    values.add(getFieldValue(type ,String.valueOf(map.get(col))) );
                }else{
                    // 插入的时候才将所有字段弄过去
                    if(isInsert){
                        fields.add(col);
                        values.add(getFieldDefault(type));
                    }

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public String add( HashMap map )
    {
        ArrayList fields = new ArrayList();
        ArrayList values = new ArrayList();
        getFieldValueList(map , fields , values , true);

        String field = StringUtil.join(",",fields);
        String value = StringUtil.join("," , values);

        String sql = "INSERT INTO "+mName+"("+field+") VALUES("+value+")";
        int insertID = executeInsert(sql);

        return insertID == -1 ? "" : String.valueOf(insertID);
    }

    public boolean save(HashMap map)
    {
        ArrayList fields = new ArrayList();
        ArrayList values = new ArrayList();
        getFieldValueList(map , fields , values , false);
        ArrayList key2val = new ArrayList();
        for(int i=0;i<fields.size();i++){
            String field = (String)fields.get(i);
            String value = (String)values.get(i);
            key2val.add(field+"="+value);
        }
        ArrayList where = getOptionArrayList("where");
        if(where.size() == 0 && map.containsKey(pk)){
            this.where(pk , (String) map.get(pk));
        }
        if(where.size() == 0){
            return false;
        }

        String sql = "UPDATE "+mName+" SET "+StringUtil.join("," , key2val)+" " + parseWhere(where);

        executeInsert(sql);
        return true;
    }

    public int executeInsert(String sql)
    {
        try {
            Connection conn = this.getConn();
            Statement rs = conn.createStatement();
            System.out.println(sql);
            rs.executeUpdate(sql , Statement.RETURN_GENERATED_KEYS);
            ResultSet rsKey = rs.getGeneratedKeys();
            rsKey.next();
            int id = rsKey.getInt(1);
            return id;
        }catch (SQLException e)
        {
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
            //e.printStackTrace();
        }
        return -1;
    }

    public int executeUpdate(String sql)
    {
        try {
            Connection conn = this.getConn();
            Statement rs = conn.createStatement();
            System.out.println(sql);
            int id = rs.executeUpdate(sql , Statement.RETURN_GENERATED_KEYS);
            return id;
        }catch (SQLException e)
        {
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:"+code);
            System.err.println("Message:"+message);
            //e.printStackTrace();
        }
        return -1;
    }

    public static Query make(String name)
    {
        Query query = new Query();
        query.setName(name);
        return query;
    }

    public Collect page( int pagesize )
    {
        Query c = new Query(getName());

        c.mOption.putAll(mOption);
        // 总长度
        long count = c.count();
        Collect result = new Collect( count , pagesize);
        this.limit(result.firstRow , result.listRows);
        builder.setPage(true);
        ArrayList list = select();
        builder.setPage(false);
        result.addAll(list);

        return result;
    }

    protected String parseWhere()
    {
        if(!mOption.containsKey("where")){
            return "";
        }
        return parseWhere(getOptionArrayList("where"));
    }

    public HashMap getOption() {
        return mOption;
    }


    private String parseWhere(ArrayList whereList)
    {
        StringBuffer buffer = new StringBuffer();
        for(int i=0;i<whereList.size();i++)
        {
            HashMap map = (HashMap) whereList.get(0);
            if(i!=0){
                // 每一个的连接符
                buffer.append(" ");
                buffer.append(map.get("connect"));
                buffer.append(" ");
            }
            String key = (String) map.get("name");
            String exp = (String) map.get("exp");
            Object val = map.get("value");

            if(-1 != key.indexOf("|")){
                String[] keys = key.split("|");
                buffer.append("(");
                for(int j=0;j<keys.length;j++){
                    if(j!=0){
                        buffer.append(" OR ");
                    }
                    parseWhereItem(buffer , keys[j] , exp , val);
                }
                buffer.append(")");
            }else{
                parseWhereItem(buffer , key , exp , val);
            }
        }
        if(buffer.length() > 0){
            buffer.insert(0 , " where ");
        }
        return buffer.toString();
    }


    public List<String> getCol(String field)
    {
        List<String> result = new ArrayList();
        // 取某一列
        List<HashMap> list= select();
        for (HashMap map:list){
            result.add(map.get(field).toString());
        }
        return result;
    }

    public Map<String ,String> getColkey(String field , String key)
    {
        Map result = new LinkedHashMap();
        List<HashMap> list= select();
        for (HashMap map:list){
            result.put(map.get(key).toString(),map.get(field).toString());
        }
        return result;
    }

    private String formatString( String val)
    {
        return "'"+val.replace("'" , "\\'")+"'";
    }

    private void parseWhereItem(StringBuffer buffer , String key , String exp , Object val)
    {
        List<String> exps = Arrays.asList("eq,neq,lt,elt,gt,egt".split(","));
        int index = exps.indexOf(key);
        String[] exps2 = "=,!=,<,<=,>,=>".split(",");
        if(index != -1){
            exp = exps2[index];
        }
        exp = exp.toLowerCase().trim();
        if(exp.equals("in") || exp.equals("not in")){
            ArrayList inArrayList = new ArrayList();
            if(val instanceof String || val instanceof String[]){
                String[] inList = val instanceof String ? ((String)val).split(",") : (String[]) val;
                for (int i=0;i<inList.length;i++){
                    inArrayList.add(formatString(inList[i]));
                }
            }else if(val instanceof List){
                for (int i=0;i<((List) val).size();i++)
                {
                    inArrayList.add(formatString((String)((List) val).get(i)));
                }
            }else if(val instanceof int[]){
                for (int i=0;i<((int[]) val).length;i++)
                {
                    inArrayList.add(((int[]) val)[i]);
                }
            }else if(val instanceof float[]){
                for (int i=0;i<((float[]) val).length;i++)
                {
                    inArrayList.add(((float[]) val)[i]);
                }
            }else if(val instanceof double[]){
                for (int i=0;i<((double[]) val).length;i++)
                {
                    inArrayList.add(((double[]) val)[i]);
                }
            }else if(val instanceof long[]){
                for (int i=0;i<((long[]) val).length;i++)
                {
                    inArrayList.add(((long[]) val)[i]);
                }
            }
            buffer.append(" ");
            buffer.append(key);
            buffer.append(" "+exp+"("+StringUtil.join("," , inArrayList)+") ");

        }else{
            buffer.append(" "+key);
            buffer.append(" "+exp+" ");
            buffer.append(formatString((String) val));
            buffer.append(" ");
        }
    }

}
