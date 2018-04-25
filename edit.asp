<!--使用VBScript语言编写脚本-->
<%@LANGUAGE="VBSCRIPT"  codepage="65001"%>
<% Session.CodePage=65001 %>
<% Response.Charset="UTF-8" %> 
<%
	
	
	
	'url
  '首先中request对象中获得用于确定留言的日期值
   str0=Request.QueryString("num")
    
   str1=Request.QueryString("name")
   str2=Request.QueryString("sex")
   
   str3=Request.QueryString("home")
   str4=Request.QueryString("acade")
   str5=Request.QueryString("major")
   str6=Request.QueryString("class")
   
   
   
   
   '创建用于访问XML文档的DOM对象
   
   set xmldoc=Server.createObject("Microsoft.XMLDOM")
   '使用load方法将XML文档装入DOM对象
   xmldoc.load(Server.MapPath("studentschema.xml"))
   '设置查询留言使用的字符串，字符串的形式如：//留言[日期="01-11-10//2:48:22"]
   '其作用是获得有“日期”子元素，
   '并且“日期”子元素内容为01-11-10//2:48:22的“留言”元素
   str="//student[id='"+str0+"']"
   '使用selectSingleNode方法获得满足条件的“留言”元素节点
   set node=xmldoc.selectSingleNode(str)
   '使用removeChild方法删除元素
   'xmldoc.documentElement.removeChild(node)

   node.childNodes(1).firstChild.nodeValue=str1   
   node.childNodes(2).firstChild.nodeValue=str2
   'if str2="man" then
	'   node.childNodes(2).firstChild.nodeValue="男"
	'   else
	'   node.childNodes(2).firstChild.nodeValue="女"
	'end if
   node.childNodes(3).firstChild.nodeValue=str3
   node.childNodes(4).firstChild.nodeValue=str4
   node.childNodes(5).firstChild.nodeValue=str5
   node.childNodes(6).firstChild.nodeValue=str6
   
   
   
   '使用save方法保存修改后的XML文档
   '必须保存，否则删除操作不会生效
   xmldoc.save(Server.MapPath("studentschema.xml"))
   '返回确认信息和相关链接
   Response.write("<center>")
   Response.write("已经成功删除留言")
   Response.write("<br><br>")
   Response.write("<a href='index.asp'>返回</a>")
   Response.write("</center>")
   response.end
   
   
   
 
public Function URLDecode(strURL)
    Dim I
    If InStr(strURL, "%") = 0 Then
        URLDecode = strURL
        Exit Function
    End If
    
    For I = 1 To Len(strURL)
        If Mid(strURL, I, 1) = "%" Then
            If Eval("&H" & Mid(strURL, I + 1, 2)) > 127 Then
                URLDecode = URLDecode & Chr(Eval("&H" & Mid(strURL, I + 1, 2) & Mid(strURL, I + 4, 2)))
                I = I + 5
            Else
                URLDecode = URLDecode & Chr(Eval("&H" & Mid(strURL, I + 1, 2)))
                I = I + 2
            End If
        Else
            URLDecode = URLDecode & Mid(strURL, I, 1)
        End If
    Next
End Function

%>




