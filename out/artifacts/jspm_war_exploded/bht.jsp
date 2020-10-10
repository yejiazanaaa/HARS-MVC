<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(10).select(); %>

<link rel="stylesheet" href="qtstyle/swipe.css">
<script src="qtstyle/swipe.js"></script>

<div class="menu_banner">
    <div class="banner">
        <ul>
            <%  for(HashMap t:bhtList){  %>
            <li style="background: url(<%= t.get("image") %>) no-repeat top center; width: 100%; height: 690px;">
                <a href="<%= t.get("url") %>" style="width: 100%; height: 690px; display: block;"></a>
            </li>
            <% } %>
        </ul>
    </div>
</div>
<script>
    $(function(){
        var unslider = $('.banner').unslider({
            autoplay:true,
            arrows: {
                prev: '<a href="javascript:;" class="unslider-arrow prev"></a>',
                next: '<a href="javascript:;" class="unslider-arrow next"></a>'
            },
            speed: 500,               //  The speed to animate each slide (in milliseconds)
            delay: 3000,              //  The delay between slide animations (in milliseconds)
            complete: function() {},  //  A function that gets called after every slide animation
            keys: true,               //  Enable keyboard (left, right) arrow shortcuts
            dots: true,               //  Display dot navigation
            fluid: false              //  Support responsive design. May break non-responsive designs
        });
    });
</script>
