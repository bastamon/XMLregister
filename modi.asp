<!DOCTYPE html>  
<html>  
<head>  
<meta charset="gb2312"> 
<title>�޸�ѧ��������Ϣ</title>  
<style type="text/css">  
    #cityIntro 
	.{  
        width:300px;  
        height:100px;  
        border:1px solid #3F9
		
	}  

</style>  


<script language="javascript" src="js\dele.js"></script>

<script language="javascript">

	//����xml�ļ�  
    function loadXMLDoc(dname)
    {  
        try //Internet Explorer  
        {  
             xmlDoc=new ActiveXObject("Microsoft.XMLDOM");  
        }  
		catch(e)  
		{  
			try //Firefox, Mozilla, Opera, etc.  
			{  
				xmlDoc=document.implementation.createDocument("","",null);  
			}  
			catch(e) 
				{alert(e.message)}  
		}  
		try   
		{  
			xmlDoc.async=false;  
			xmlDoc.load(dname);  
			return(xmlDoc);  
		}  
		catch(e) 
			{alert(e.message)}  
		return(null);  
    } 

    //������  
    function loadXMLFile()
	{  
        xmlDoc = loadXMLDoc("studentschema.xml");  
        var student = xmlDoc.getElementsByTagName("student");  
        var myselect = document.getElementById("myselect");  
        for(var i = 0;i<student.length;i++)
		{  
            var opt = document.createElement("option");  
            opt.text = student[i].getAttribute("id");  
              
            myselect.appendChild(opt);  
        }  
        //catchEvent(myselect,'change',checkSelected());  
    }  
	//erro����
    function catchEvent(eventobj,event,eventHandler){    
		if(eventobj.addEventListener){    
            eventobj.addEventListener(event,eventHandler,false);    
        }
		else if(eventobj.attachEvent){    
            event = 'on'+event;    
            eventobj.attachEvent(event,eventHandler);    
            }    
    }  
	
	
	
	//����value����
	function inputval()
	{
		//xmlDoc=loadXMLDoc("studentschema.xml");
		var student1=xmlDoc.getElementsByTagName("student");
		
		for(var i=0;i<student1.length;i++)
		{
			if(document.getElementById("name").value==student1[i].childNodes[1].childNodes[0].nodeValue)
			{
				document.getElementById("num").value = student1[i].childNodes[0].firstChild.nodeValue;
				document.getElementById("sex").value = student1[i].childNodes[2].firstChild.nodeValue;
				document.getElementById("orign").value = student1[i].childNodes[3].firstChild.nodeValue;
				document.getElementById("acade").value = student1[i].childNodes[4].firstChild.nodeValue;
				document.getElementById("major").value = student1[i].childNodes[5].firstChild.nodeValue;
				document.getElementById("class").value = student1[i].childNodes[6].firstChild.nodeValue;
				//xmlDoc.Close();alert("��д�ر�");�����
				
				break;
			}
		}		
	}
	
	
	
        //onchange�¼�����������ѡ��ѧ�ź����ʾ ѧ���������Ϣ  
        function checkSelected(myselect)
		{  
                var opt = document.getElementsByTagName("option");  
                var student = xmlDoc.getElementsByTagName("student"); 
                var name = xmlDoc.getElementsByTagName("name");				
                for(var i = 0;i<opt.length;i++)
				{  
                    if(opt[i].selected == true)
					{
                        for(var j = 0;j<student.length;j++)
						{  
                            if(opt[i].text == student[j].getAttribute("id"))
							{  
                                var cityIntro =  document.getElementById("cityIntro");  
                                if(document.getElementsByTagName("p").length>0)
								{  
                                    var reP = document.getElementsByTagName("p");  
                                    for(var k = 0; k<reP.length;k++)
									{  
                                        cityIntro.removeChild(reP[0]);  
                                    }
                                }
                                var text = document.createTextNode(name[j].childNodes[0].nodeValue);  
                                var p = document.createElement("p");  
                                          
                                p.appendChild(text);  
                                cityIntro.appendChild(p); 								
									
								document.getElementById("name").value = student[j].childNodes[1].firstChild.nodeValue;								
									
                                break;  
                                }  
                        }
						inputval();	
                    } 
                }	
        }
	
	
	
	function dele()
	{
		//xmlDoc=loadXMLDoc("studentschema.xml"); 
		var delestu=xmlDoc.getElementsByTagName("student");
		var knum=document.getElementById("num").value;
		var x=xmlDoc.documentElement;
		for(var i=0;i<delestu.length;i++)
		{
			if(knum==delestu[i].childNodes[0].childNodes[0].nodeValue)
			{
				deled_node=x.removeChild(delestu[i]);
				alert(deled_node.childNodes[1].childNodes[0].nodeValue+"ɾ���˽ڵ�");
				//save�Ͽ�,vbs��̨ͨ��
				var url="suredelete.asp?datatag="+document.getElementById("num").value;
				alert(url);
				window.location.href=url;
				//xmlDoc.save("studentschema.xml");���ػ�������
				alert("saved");
				break;
			}
		}
	}
	
	function delecon()
	{
		var mymessage=confirm("���ɾ�������ɻָ�!ȷ��ɾ����?");
		if(mymessage==true)
		{
			dele();
		}
		else
		{
			//alert("ȡ���˲���");
		}
	}  
	
	
	function edit()
	{
		//xmlDoc=loadXMLDoc("studentschema.xml");
		var editstu=xmlDoc.getElementsByTagName("student");
		var knum=document.getElementById("num").value;
		for(var i=0;i<editstu.length;i++)
		{
			if(knum==editstu[i].childNodes[0].childNodes[0].nodeValue)
			{
				editstu[i].childNodes[1].firstChild.nodeValue=document.getElementById("name").value;
				editstu[i].childNodes[2].firstChild.nodeValue=document.getElementById("sex").value;
				
				editstu[i].childNodes[3].firstChild.nodeValue=document.getElementById("orign").value;
				editstu[i].childNodes[4].firstChild.nodeValue=document.getElementById("acade").value;
				editstu[i].childNodes[5].firstChild.nodeValue=document.getElementById("major").value;
				editstu[i].childNodes[6].firstChild.nodeValue=document.getElementById("class").value;
				
				
				
				
				alert("ͬѧ:"+editstu[i].childNodes[1].firstChild.nodeValue+"��������Ϣ");
				
				var key="num="+editstu[i].childNodes[0].firstChild.nodeValue+"&";
			
				key+="name="+encodeURI(editstu[i].childNodes[1].firstChild.nodeValue)+"&";
				key+="sex="+encodeURI(editstu[i].childNodes[2].firstChild.nodeValue)+"&";
				key+="home="+encodeURI(editstu[i].childNodes[3].firstChild.nodeValue)+"&";
				key+="acade="+encodeURI(editstu[i].childNodes[4].firstChild.nodeValue)+"&";
				key+="major="+encodeURI(editstu[i].childNodes[5].firstChild.nodeValue)+"&";
				key+="class="+encodeURI(editstu[i].childNodes[6].firstChild.nodeValue);
				url="edit.asp?"+key;
				//alert(url);
				window.location.href=url;
				//document.write(url);		
				
				//xmlDoc.save("studentschema.xml");���ػ�������
				//alert("saved ok");
				break;
			}
		}
	}
	
	
	
</script> 



 
</head>  
<body onLoad="loadXMLFile()"> 
	<div align="center"><font size="+3"><strong>�޸�ѧ��������Ϣ</strong></font></div>
	<div align="center"><a href="index.html">����</a></div>
	<hr color="#f46240" SIZE="1">
	<div align="center"><strong>������ѧ�Ż�����:</strong></div>
    <div id="divcontent" align="center">  
        <select id="myselect" onChange="checkSelected(this)">  
        <option value="--"></option>  
        </select>  
    </div> 
	<div id="cityIntro"></div> 
	<div align="center"><input name="btn" type="button" id="btn" value="go" onClick="inputval()"> </div>
	<form method="get" id="form1">
		<table width="600" border="0" align="center">
			<tbody>
				<tr>
					<td>����:<input id="name" type="text" style="width:100px"></td>	
					<td>ѧ��:<input id="num" type="text" style="width:100px" disabled="true"></td>
				</tr>
				<tr>						
					<td>�Ա�:<input id="sex" type="text" style="width:100px"></td>
					<td>����:<input id="orign" type="text" style="width:100px"></td>
				</tr>
				<tr>
					<td>ѧԺ:<input id="acade" type="text" style="width:100px"></td>								
					<td>רҵ:<input id="major" type="text" style="width:100px"></td>
				</tr>
				<tr>	
					<td>�༶:<input id="class" type="text" style="width:100px"></td>
					<td>
					<input type="submit" form="form1" value="�޸�" onClick="edit();">&nbsp;
					<input type="submit" form="form1" value="ɾ��" onClick="delecon();"></td>
					
				</tr>
			</tbody>	
		</table>
		
	</form>
	<hr color="#f46240" SIZE="1">
	<div align="center"><a href="index.html">����</a></div>
	<%
		if  request.form("num")<>"" then	
		set url="suredelete.asp?datatag="+request.form("num")
		
	    Response.write("<a href="+url+" target='_self'>ɾ��</a>")
		end if
	%>
	
	
	
</body>
</html>