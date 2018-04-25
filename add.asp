<!doctype html>
<html>
<head>
<title>添加学生个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<%@Language="VBScript"%>
<%
'设置Web页面的信息
Response.Buffer = true
Response.Expires = -1


'显示留言函数init()
Function init()
entryForm()
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


'Response.Write "<table border='0' width='100%'>"
'Response.Write "<tr><td bgcolor='#00CCFF' align='center' height='26'>"
'Response.Write "<b>学生信息如下：</b>"
'Response.Write "</td></tr>"

'输出留言本各元素的内容，最新的留言先显示
'For x=arrNames.length-1 To 0 Step -1
'	Response.Write "<tr>"
'	Response.Write"<td>姓名:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" & arrNames.item(x).text & "</td>"
'	Response.Write "<td>学号:" & arrIds.item(x).text & "<td>"

'	Response.Write"<td>性别:</td><td>" & arrSexs.item(x).text & "</td>"
'	Response.Write "<td>籍贯:" & arrOrigs.item(x).text & "<td>"

'	Response.Write"<td>学院:</td><td>" & arrAcades.item(x).text & "</td>"
'	Response.Write "<td>专业:" & arrMajors.item(x).text & "<td>"

'	Response.Write "<td>班级:</td><td>" & arrClass.item(x).text & "</td>"
'	Response.Write "<td></td>"
'	Response.Write"</tr>"
	
'	Next
	Response.Write "</table>"
	Set objXML = nothing
End Function

'向XML文件添加留言记录的函数addEntry()
Function addEntry()
	'定义局部变量
	Dim strName
	Dim strId
	Dim strSex
	Dim strOrig
	Dim strAcade
	Dim strMajor
	Dim strClass
	'取得留言表单的输入内容
	
	strName = Request.Form("iName")	
	strId = Request.Form("iNum")
	strSex = Request.Form("iSex")
	strOrig = Request.Form("iOrig")
	strAcade=Request.Form("iAcade")
	strMajor=Request.Form("iMajor")
	strClass=Request.Form("iClass")
	 
	if strName=""  then			 
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>姓名不能为空</a>2s返回</font></p></body></html>"
		elseif strId ="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>学号不能为空</a>2s返回</font></p></body></html>"
		elseif strOrig="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>籍贯不能为空</a>2s返回</font></p></body></html>"
		elseif strAcade="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>学院不能为空</a>2s返回</font></p></body></html>"
		elseif strMajor="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>专业不能为空</a>2s返回</font></p></body></html>"	
		elseif strClass="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>班级不能为空</a>2s返回</font></p></body></html>"
		else 
	
	Dim objXML
	Dim objEntry
	Dim objName
	Dim objNum
	Dim objSex
	Dim objOrig
	Dim objAcade
	Dim objMajor
	Dim objClass
	
	'向XML文件添加留言内容
	Set objXML = server.createObject("Msxml2.DOMDocument")
	objXML.async = false
	objXML.load(server.MapPath("studentschema.xml"))
	Set objEntry = objXML.createNode("element", "student", "")
	objEntry.setAttribute "id", strId
	objXML.documentElement.appendChild(objEntry)
	'stop
	
	Set objNum = objXML.createNode("element", "id", "")
	objEntry.appendChild(objNum)
	objNum.text = strId
	
	Set objName = objXML.createNode("element", "name", "")
	objEntry.appendChild(objName)
	objName.text = strName
	
	Set objSex = objXML.createNode("element", "sex", "")
	objEntry.appendChild(objSex)
	objSex.text = strSex
	
	Set objOrig = objXML.createNode("element", "orig", "")
	objEntry.appendChild(objOrig)
	objOrig.text = strOrig
	
	Set objAcade = objXML.createNode("element", "acade", "")
	objEntry.appendChild(objAcade)
	objAcade.text = strAcade
	
	Set objMajor = objXML.createNode("element", "major", "")
	objEntry.appendChild(objMajor)
	objMajor.text = strMajor
	
	Set objClass = objXML.createNode("element", "class", "")
	objEntry.appendChild(objClass)
	objClass.text = strClass
	
	objXML.save(server.MapPath("studentschema.xml"))
	response.Write "<script>alert('已成功保存学生信息D:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml')</script>"
	Response.Redirect("add.asp")
	end if
End function



'填写和发送留言表单的函数entryForm()
Function entryForm()
	Response.Write "<p align='center'><b>请输入学生信息</b></p>"
	Response.Write "<hr color=#f46240 SIZE=1>"
	Response.Write "<form action=add.asp?action=addEntry method=post>"
	Response.Write "<table border=0 align=center>"
	Response.Write "<tr><td>姓名<input type=text name=iName /><td>学号<input type=text name=iNum /></td></tr>"
	Response.Write "<tr><td>性别<select name='iSex'style=width:80px;><option selected>男</option><option>女</option></select>"
	Response.Write "</td><td>籍贯<input type=text name=iOrig /></td></tr>"
	Response.Write "<tr><td>学院<input type=text name=iAcade /></td><td>专业<input type=text name=iMajor /></td></tr>"
	Response.Write "<tr><td>班级<input type=text name=iClass /></td><td><input type=submit value=保存 /></td></tr>"
	Response.Write "</table>"
	Response.Write "</form>"
	Response.Write "<p align=center><a href=index.html>返回</a><hr color=#f46240 SIZE=1>"
End Function
%>
</head>

<body>
<%
'判断是否发送了留言，并更新留言信息
Dim a
a = Request.Querystring("action")
If a<>"" Then
addEntry
Response.Write "<script language=""javascript"">alert('已成功保存学生信息D:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml');window.close();</script>"
else
init
End If
%>
<script language="JavaScript">   
	//alert("已成功保存学生信息D:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml");
</script>
</body>
</html>