<!doctype html>
<html>
<head>
<title>���ѧ��������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<%@Language="VBScript"%>
<%
'����Webҳ�����Ϣ
Response.Buffer = true
Response.Expires = -1


'��ʾ���Ժ���init()
Function init()
entryForm()
'����ֲ�����
Dim objXML
Dim arrNames
Dim arrIds
Dim arrSexs
Dim arrOrigs
Dim arrAcades
Dim arrMajors
Dim arrClass

'����XMLDOM�ĵ����������������
Set objXML = server.createObject("Msxml2.DOMDocument")
objXML.async = false
objXML.load(server.MapPath("studentschema.xml"))

'ȡ�����Ա���Ԫ�صļ���
Set arrNames = objXML.getElementsByTagName("name")
Set arrIds = objXML.getElementsByTagName("id")
Set arrSexs = objXML.getElementsByTagName("sex")
Set arrOrigs = objXML.getElementsByTagName("orig")
set arrAcades =objXML.getElementsByTagName("acade")
set arrMajors =objXML.getElementsByTagName("major")
set arrClass =objXML.getElementsByTagName("class")


'Response.Write "<table border='0' width='100%'>"
'Response.Write "<tr><td bgcolor='#00CCFF' align='center' height='26'>"
'Response.Write "<b>ѧ����Ϣ���£�</b>"
'Response.Write "</td></tr>"

'������Ա���Ԫ�ص����ݣ����µ���������ʾ
'For x=arrNames.length-1 To 0 Step -1
'	Response.Write "<tr>"
'	Response.Write"<td>����:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" & arrNames.item(x).text & "</td>"
'	Response.Write "<td>ѧ��:" & arrIds.item(x).text & "<td>"

'	Response.Write"<td>�Ա�:</td><td>" & arrSexs.item(x).text & "</td>"
'	Response.Write "<td>����:" & arrOrigs.item(x).text & "<td>"

'	Response.Write"<td>ѧԺ:</td><td>" & arrAcades.item(x).text & "</td>"
'	Response.Write "<td>רҵ:" & arrMajors.item(x).text & "<td>"

'	Response.Write "<td>�༶:</td><td>" & arrClass.item(x).text & "</td>"
'	Response.Write "<td></td>"
'	Response.Write"</tr>"
	
'	Next
	Response.Write "</table>"
	Set objXML = nothing
End Function

'��XML�ļ�������Լ�¼�ĺ���addEntry()
Function addEntry()
	'����ֲ�����
	Dim strName
	Dim strId
	Dim strSex
	Dim strOrig
	Dim strAcade
	Dim strMajor
	Dim strClass
	'ȡ�����Ա�����������
	
	strName = Request.Form("iName")	
	strId = Request.Form("iNum")
	strSex = Request.Form("iSex")
	strOrig = Request.Form("iOrig")
	strAcade=Request.Form("iAcade")
	strMajor=Request.Form("iMajor")
	strClass=Request.Form("iClass")
	 
	if strName=""  then			 
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>��������Ϊ��</a>2s����</font></p></body></html>"
		elseif strId ="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>ѧ�Ų���Ϊ��</a>2s����</font></p></body></html>"
		elseif strOrig="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>���᲻��Ϊ��</a>2s����</font></p></body></html>"
		elseif strAcade="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>ѧԺ����Ϊ��</a>2s����</font></p></body></html>"
		elseif strMajor="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>רҵ����Ϊ��</a>2s����</font></p></body></html>"	
		elseif strClass="" then
			Response.Write "<!doctype html><html><head><meta charset=utf-8 http-equiv=refresh content=2;url=add.asp><title>null</title></head><body><p align=center><font size=+3><a href=add.asp>�༶����Ϊ��</a>2s����</font></p></body></html>"
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
	
	'��XML�ļ������������
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
	response.Write "<script>alert('�ѳɹ�����ѧ����ϢD:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml')</script>"
	Response.Redirect("add.asp")
	end if
End function



'��д�ͷ������Ա��ĺ���entryForm()
Function entryForm()
	Response.Write "<p align='center'><b>������ѧ����Ϣ</b></p>"
	Response.Write "<hr color=#f46240 SIZE=1>"
	Response.Write "<form action=add.asp?action=addEntry method=post>"
	Response.Write "<table border=0 align=center>"
	Response.Write "<tr><td>����<input type=text name=iName /><td>ѧ��<input type=text name=iNum /></td></tr>"
	Response.Write "<tr><td>�Ա�<select name='iSex'style=width:80px;><option selected>��</option><option>Ů</option></select>"
	Response.Write "</td><td>����<input type=text name=iOrig /></td></tr>"
	Response.Write "<tr><td>ѧԺ<input type=text name=iAcade /></td><td>רҵ<input type=text name=iMajor /></td></tr>"
	Response.Write "<tr><td>�༶<input type=text name=iClass /></td><td><input type=submit value=���� /></td></tr>"
	Response.Write "</table>"
	Response.Write "</form>"
	Response.Write "<p align=center><a href=index.html>����</a><hr color=#f46240 SIZE=1>"
End Function
%>
</head>

<body>
<%
'�ж��Ƿ��������ԣ�������������Ϣ
Dim a
a = Request.Querystring("action")
If a<>"" Then
addEntry
Response.Write "<script language=""javascript"">alert('�ѳɹ�����ѧ����ϢD:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml');window.close();</script>"
else
init
End If
%>
<script language="JavaScript">   
	//alert("�ѳɹ�����ѧ����ϢD:\\Administrator\\Documents\\workspace\\unknow1\\studentschema.xml");
</script>
</body>
</html>