<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预约挂号</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/datepicker/WdatePicker.js"></script>


</head>
<body>

    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>

    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <% out.close(); %>
    <% } %>


<%
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "yuyueguahao");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                                String charuid = new CommDAO().update(request,response,"yuyueguahao",ext,true,false,"");


%>
<script>
    alert('保存成功');
    location.href = '<%= request.getParameter("referer") !=null ? request.getParameter("referer") : "" %>';
</script>
<%
out.close();
}
%>

<form  action="?f=f"  method="post" name="form1" id="form1">
    编辑预约挂号:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">所属科室：</td>
            <td>
                                                    <% 
 HashMap mapkeshixinxi = new CommDAO().find("SELECT mingcheng FROM keshixinxi where id="+mmm.get("suoshukeshi")+""); 
 %><%= mapkeshixinxi.get("mingcheng") %><input type="hidden" id="suoshukeshi" name="suoshukeshi" value="<%= Info.html(mmm.get("suoshukeshi")) %>" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">工号：</td>
            <td>
                                                    <%= mmm.get("gonghao") %><input type="hidden" id="gonghao" name="gonghao" value="<%= Info.html(mmm.get("gonghao")) %>" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">姓名：</td>
            <td>
                                                    <%= mmm.get("xingming") %><input type="hidden" id="xingming" name="xingming" value="<%= Info.html(mmm.get("xingming")) %>" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">挂号费：</td>
            <td>
                                                    <%= mmm.get("guahaofei") %><input type="hidden" id="guahaofei" name="guahaofei" value="<%= Info.html(mmm.get("guahaofei")) %>" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">预约时间：</td>
            <td>
                                                    <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:px;" data-rule-required="true" data-msg-required="请填写预约时间" id="yuyueshijian" name="yuyueshijian" value="<%= Info.html(mmm.get("yuyueshijian")) %>" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">预约人：</td>
            <td>
                                                    <input style="width:150px;" readonly="readonly" id="yuyueren" name="yuyueren" value="<%= mmm.get("yuyueren") %>" type="text" />                                            </td>
        </tr>
                        <tr>
            <td>
                        <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden" />
                                    &nbsp;</td>
            <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
                <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
        </tr>
    </table>
</form>



<script>
    $(function () {
        $('#form1').validate();
    })

</script>


</body>
</html>
