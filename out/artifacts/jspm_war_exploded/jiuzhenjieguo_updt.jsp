<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>就诊结果</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


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
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "jiuzhenjieguo");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                ext.put("chufang" , util.DownloadRemoteImage.run(request.getParameter("chufang")));                String charuid = new CommDAO().update(request,response,"jiuzhenjieguo",ext,true,false,"");


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
    编辑就诊结果:
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
            <td width="200">预约人：</td>
            <td>
                                                    <%= mmm.get("yuyueren") %><input type="hidden" id="yuyueren" name="yuyueren" value="<%= Info.html(mmm.get("yuyueren")) %>" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">诊断结果：</td>
            <td>
                                                    <textarea style="width:450px;height:150px" id="zhenduanjieguo" name="zhenduanjieguo"><%= Info.html(mmm.get("zhenduanjieguo")) %></textarea>                                            </td>
        </tr>
                                        <tr>
            <td width="200">处方：</td>
            <td>
                                                    <textarea id="chufang" name="chufang" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(mmm.get("chufang")) %></textarea><script>
            (function(){
                var um = UM.getEditor('chufang');
            })();
            </script>                                            </td>
        </tr>
                                        <tr>
            <td width="200">医疗费用：</td>
            <td>
                                                    <input style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写医疗费用" number="true" data-msg-number="输入一个有效数字" id="yiliaofeiyong" name="yiliaofeiyong" value="<%= Info.html(mmm.get("yiliaofeiyong")) %>" type="number" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">看诊人：</td>
            <td>
                                                    <input style="width:150px;" readonly="readonly" id="kanzhenren" name="kanzhenren" value="<%= mmm.get("kanzhenren") %>" type="text" />                                            </td>
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
