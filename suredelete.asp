<!--ʹ��VBScript���Ա�д�ű�-->
<%@ language=VBScript %>
<%
  '������request�����л������ȷ�����Ե�����ֵ
   str=Request.QueryString("datatag")
   'stop
   '�������ڷ���XML�ĵ���DOM����
   set xmldoc=Server.createObject("Microsoft.XMLDOM")
   'ʹ��load������XML�ĵ�װ��DOM����

   xmldoc.load(Server.MapPath("studentschema.xml"))
   '���ò�ѯ����ʹ�õ��ַ������ַ�������ʽ�磺//����[����="01-11-10//2:48:22"]
   '�������ǻ���С����ڡ���Ԫ�أ�
   '���ҡ����ڡ���Ԫ������Ϊ01-11-10//2:48:22�ġ����ԡ�Ԫ��
   str2="//student[id='"+str+"']"
   'ʹ��selectSingleNode����������������ġ����ԡ�Ԫ�ؽڵ�
   set node=xmldoc.selectSingleNode(str2)
   'ʹ��removeChild����ɾ��Ԫ��
   xmldoc.documentElement.removeChild(node)
   'ʹ��save���������޸ĺ��XML�ĵ�
   '���뱣�棬����ɾ������������Ч
   xmldoc.save(Server.MapPath("studentschema.xml"))
   '����ȷ����Ϣ���������
   Response.write("<center>")
   Response.write("�Ѿ��ɹ�ɾ������")
   Response.write("<br><br>")
   Response.write("<a href='modi.asp'>����</a>")
   Response.write("</center>")
   response.end
%>

 
