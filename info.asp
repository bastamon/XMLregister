<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/loadXMLDoc.js"></script>
<title>浏览学生个人信息</title>
<meta charset="utf-8">
<%@Language="VBScript"%>
<%
'设置Web页面的信息
Response.Buffer = true
Response.Expires = -1


'显示留言函数init()
Function init()
'定义局部变量
Dim objXML
Dim arrNames
Dim arrIds
Dim arrSexs
Dim arrOrigs
Dim arrAcades
Dim arrMajors
Dim arrClass

'创建XMLDOM文档对象，用来存放留言
Set objXML = server.createObject("Msxml2.DOMDocument")
objXML.async = false
objXML.load(server.MapPath("studentschema.xml"))

'取得留言本各元素的集合
Set arrNames = objXML.getElementsByTagName("name")
Set arrIds = objXML.getElementsByTagName("id")
Set arrSexs = objXML.getElementsByTagName("sex")
Set arrOrigs = objXML.getElementsByTagName("orig")
set arrAcades =objXML.getElementsByTagName("acade")
set arrMajors =objXML.getElementsByTagName("major")
set arrClass =objXML.getElementsByTagName("class")


Response.Write "<table width='600'border='0' width='100%' align='center'>"
Response.Write "<tbody align=center><tr><td>"
Response.Write "<tr><th scope='col'>学号</th><th scope='col'>姓名</th><th scope='col'>性别</th><th scope='col'>学院</th><th scope='col'>专业</th></tr>"


'输出留言本各元素的内容，最新的留言先显示
For x=arrNames.length-1 To 0 Step -1
	Response.Write "<tr>"
	Response.Write "<td>" & arrIds.item(x).text & "</td>"
    Response.Write"<td>" & arrNames.item(x).text & "</td>"
	Response.Write"<td>" & arrSexs.item(x).text & "</td>"
	Response.Write"<td>" & arrAcades.item(x).text & "</td>"
	Response.Write "<td>" & arrMajors.item(x).text & "</td>"
	Response.Write"</tr>"
	
	Next
	Response.Write "</tbody></table>"
	Set objXML = nothing
End Function
%>
</head>

<body>
		<p align="center"><font size="+3" color="#0072C6"><strong>学生基本信息</strong></font></p>
		<p align="center"><a href="index.html">返回</a></p>
		<hr color="#f46240" SIZE="1">
		<%
		init
		%>
		<hr color="#f46240" SIZE="1">
		<p align="center"><a href="index.html">返回</a></p>
	</body>
</html>