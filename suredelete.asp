<!--使用VBScript语言编写脚本-->
<%@ language=VBScript %>
<%
  '首先中request对象中获得用于确定留言的日期值
   str=Request.QueryString("datatag")
   'stop
   '创建用于访问XML文档的DOM对象
   set xmldoc=Server.createObject("Microsoft.XMLDOM")
   '使用load方法将XML文档装入DOM对象

   xmldoc.load(Server.MapPath("studentschema.xml"))
   '设置查询留言使用的字符串，字符串的形式如：//留言[日期="01-11-10//2:48:22"]
   '其作用是获得有“日期”子元素，
   '并且“日期”子元素内容为01-11-10//2:48:22的“留言”元素
   str2="//student[id='"+str+"']"
   '使用selectSingleNode方法获得满足条件的“留言”元素节点
   set node=xmldoc.selectSingleNode(str2)
   '使用removeChild方法删除元素
   xmldoc.documentElement.removeChild(node)
   '使用save方法保存修改后的XML文档
   '必须保存，否则删除操作不会生效
   xmldoc.save(Server.MapPath("studentschema.xml"))
   '返回确认信息和相关链接
   Response.write("<center>")
   Response.write("已经成功删除留言")
   Response.write("<br><br>")
   Response.write("<a href='modi.asp'>返回</a>")
   Response.write("</center>")
   response.end
%>

 
