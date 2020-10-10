<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>

<%@ include file="head.jsp" %>

<div class="header">
    <div class="rowContent clearfix">
        <div class="logo">
            <a href="/">医院预约挂号系统</a>
        </div>
        <div class="header_menu">
            <div class="header_posion">
                <div class="header-tou">
                    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
                    <form action="jspm00471yyyyghxt?ac=login&a=a" method="post">
                        <div class="form-inline">
                            <div class="form-group">
                                用户名：<input type="text" style="width: 100px" class="form-control" name="username"
                                           value=""/>
                            </div>
                            <div class="form-group">
                                密码：<input type="password" style="width: 100px" class="form-control" name="pwd"
                                          value=""/>
                            </div>
                            <div class="form-group">
                                权限
                                <select name="cx" class="form-control" id="cx" style="width:120px;">
                                    <option value="注册用户">注册用户</option>
                                    <option value="医生">医生</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" class="form-control" name="pagerandom" value="" style="width: 80px"/>
                                <span class="input-group-addon">
									<img src="image.jsp" onclick="this.src='image.jsp?rand='+new Date().getTime()"/>
								</span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">登录</button>
                            </div>
                        </div>
                    </form>
                    <% } else { %>
                    用户名:<%= request.getSession().getAttribute("username") != null ? request.getSession().getAttribute("username") : "" %>
                    ；
                    您的权限: <%= request.getSession().getAttribute("cx") != null ? request.getSession().getAttribute("cx") : "" %>
                    <a href="logout.jsp" class="btn btn-danger btn-sm">退出</a>
                    <a href="main.jsp" class="btn btn-success btn-sm">个人后台</a>
                    <% } %>
                    <a href="javascript:;" style="margin-right: 10px">&nbsp;</a>
                </div>
                <div class="row_menu">
                    <div class="clearfix">
                        <ul class="menu" id="js_menu">
                            <li class="xinsuo_menu">
                                <a href="./">首页</a>
                            </li>
                            <li class="xinsuo_menu">
                                <a href="javascript:;">关于我们</a>
                                <div class="childmenu">
                                    <a href="dx_detail.jsp?lb=联系我们">· 联系我们</a>
                                </div>
                            </li>
                            <li class="xinsuo_menu">
                                <a href="xinwenxinxilist.jsp">新闻中心</a>
                                <% ArrayList<HashMap> xinwenfenleiList = Query.make("xinwenfenlei").order("id desc").select(); %>
                                <div class="childmenu">
                                    <% for (HashMap xinwenFenlei : xinwenfenleiList) { %>
                                    <a href="xinwenxinxilist.jsp?fenlei=<%= xinwenFenlei.get("id") %>"><%= xinwenFenlei.get("fenleimingcheng") %>
                                    </a>
                                    <% } %>
                                </div>
                            </li>
                            <li class="xinsuo_menu">
                                <a href="keshixinxilist.jsp">科室信息</a>
                            </li>
                            <li class="xinsuo_menu">
                                <a href="yishenglist.jsp">在诊医生</a>
                            </li>
                            <li class="xinsuo_menu">
                                <a class="javascript:;">用户注册</a>
                                <div class="childmenu">
                                    <a href="zhuceyonghuadd.jsp">用户注册</a>
                                </div>
                            </li>
                            <li class="xinsuo_menu">
                                <a href="login.jsp">后台管理</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script>
    $(function () {
        $('#js_menu .xinsuo_menu').hover(function () {
            $(this).find('.childmenu').show();
            $(this).data('nones', null);
        }, function () {
            var that = this;
            $(this).data('nones', true);
            setTimeout(function () {
                if ($(that).data('nones')) {
                    $(that).find('.childmenu').hide();
                }
            }, 100);
        });
    });
</script>


<%@ include file="bht.jsp" %>
