# XMLregister
Student register web based on XML
USST研究生《XML技术应用》last homework

![cover](http://www.usst.edu.cn/_upload/tpl/00/20/32/template32/images/logo.png)

施XX副教授

 

# 一、课程梗概

xml（(ExtensibleMarkup Language）可扩展标记语言，标准通用标记语言的子集，是一种用于标记电子文件使其具有结构性的标记语言。它可以用来标记数据、定义数据类型，是一种允许用户对自己的标记语言进行定义的源语言。它非常适合万维网传输，提供统一的方法来描述和交换独立于应用程序或供应商的结构化数据。是Internet环境中跨平台的、依赖于内容的技术，也是当今处理分布式结构信息的有效工具。

本课程设计本着通过*.ASP动态网页的方法来实现对*.XML文件进行操作的目的，搭建了一个基于IIS框架web组建的站点。通过使用B/S网络结构，实现了客户端只需在浏览器Browse上就能对服务端Server上发出请求进而对服务端上的*.xml文件进行各种操作。

 

# 二、实验环境

IIS（InternetInformation Services）环境搭建

Microsoft Visual Studio 2010用于对vbscript脚本文件进行调试

Internal Explorer 11 测试浏览界面信息

Notepad++和DreamweaverCC

 

# 三、主要技术与原理

XML(可扩展标记语言)主要具有以下几个特点： ① 简洁有效 XML是一个精简的SGML，它将SGML的丰富功能与HTML的易用性结合到Web应用种，它保留了SGML的可扩展功能，这使得XML从根本上有区别于HTML。并且XML种还包括可扩展格式语言XSL（ExtensibleStyle Language）和可扩展链接语言XLL（Extensible Linking Language）使得XML的显示和解析更加方便快捷。② 易学易用 XML对SGML进行了精简，它抛弃了SGML中不常用的部分，方便用户编写Web页面同时也给设计人员实现XML浏览器降低了困难。 ③ 开放的国际化标准 XML是W3C正式批准的，它完全可用于Web和工具的开发。XML具有标准的名域说明方法，支持文档对象模型标准、可扩展类型语言标准、可扩展链接语言标准和XML指针语言标准。使用XML可以在不同的计算机系统间交换信息，而且还可以跨越国界和超越不同文化疆界交换信息。 ④ 高效可扩充 XML支持复用文档片断，使用者可以发明和使用自己的标签，也可以与他人共享，可延伸性大。在XML中，可定义一组无限量的标准，可以有效地进行XML文件的扩充。

IIS（InternetInformation Server，互联网信息服务）是一个World Wide Web server。Gopher server和FTP server全部包容在里面。 IIS意味着你能发布网页，并且有ASP（Active Server Pages）、JAVA、VBscript产生页面，有着一些扩展功能。IIS支持一些有趣的东西，像有编辑环境的界面（FRONTPAGE）、有全文检索功能的（INDEX SERVER）、有多媒体功能的（NET SHOW） 其次,IIS是随Windows NT Server 4.0一起提供的文件和应用程序服务器，是在Windows NT Server上建立Internet服务器的基本组件。它与Windows NT Server完全集成，允许使用Windows NT Server内置的安全性以及NTFS文件系统建立强大灵活的Internet/Intranet站点。

搭建IIS的过程省略，本地服务器目录中文件如下图

图片

 

# 四、设计框架

根据提供的设计样式和需要实现设计功能，列写出整个框架需要的页面，并写出每个页面并具体到其所实现的功能

本地图片，请重新上传
	

主页文档:包含三个关联到超链接,分别连接到info.asp、add.asp和modi.asp

本地图片，请重新上传
	

info.asp用于查看当前学生的部分信息有：学号、姓名、性别、学院和专业。无需太多复杂功能通过纯DOM技术打开并获取studentschema.xml下的对应节点，使用javascript实现

本地图片，请重新上传
	

add.asp通过服务端刷新的方式实现给studentschema.xml添加新的学生<student>元素以及其相关的子元素,

本地图片，请重新上传
	

modi.asp通过局部刷新的方法获取生成下拉选框<select>中的选项<option>。编辑节点的功能通过链接并传值给edit.asp页并通过de server.mapath()方法寻址服务端再执行保存到服务器中

本地图片，请重新上传
	

edit.asp负责接收url请求并通过request.querystring()方法获取由浏览器端发来的查询字段和值,根据查询字段给元素节点赋予相对应的值，并保存。

本地图片，请重新上传
	

suredelete.asp负责接收url请求并通过request.querystring()方法获取由浏览器端发来的查询字段, 根据查询字段的值删除对应的元素节点，并保存。

本地图片，请重新上传
	

用以充当存储学生个人信息的xml文件数据检索

各网页链接的层次结构

[图片](https://a2.qpic.cn/psb?/V12bBZlI1u3Rk3/1TWsizfFUFTl6GjPK4kV5LRnf.0H3PpuL8HMzhpnFW8!/b/dD0BAAAAAAAA&ek=1&kp=1&pt=0&bo=UgLzAAAAAAABEJQ!&tl=1&su=0222803585&tm=1544500800&sce=0-12-12&rf=2-9)

 

studentschema.xml文档元素层次结构如图：

[图片]()

根据上图可知一个student元素由子节点id（学号），name（姓名），sex（姓名），orig（家乡），acade（学院），major（专业）和class（班级）组成，较为符合xml数据检索设计的需要。文档实例如下图所示：

图片

 

# 五、实现与展示

根据设计要求将上述设计框架应用于实现学生信息管理系统的网页。

部分页面函数功能：

Info.asp

Function init()
	

用于输出留言本各元素的内容，以最新的留言先显示

 

add.asp

Function addEntry()
	

用于在向XML文件后继节点向后添加留言记录的函数

Function entryForm()
	

用来生成动态界面信息

 

modi.aso

function loadXMLFile()
	

搭载studentschenma.xml在页面生成后即生成下拉选框的option

function inputval()
	

为页面的文本框填写当前所选学生的个人信息

function checkSelected(myselect)
	

onchange事件触发函数，根据当前所选option值调用inputval()为页面的文本框填写当前所选学生的个人信息

function dele()
	

根据当前的学生的姓名,生成并向suredelete.asp发出url字符串查询请求

function edit()
	

根据当前的学生的姓名, 生成并向edit.asp发出url字符串查询请求

 

suredelete.asp

自身作为主函数根据url字符串查询请求,删除含有datatag字段的对应节点，并保存

 

edit.asp

自身作为主函数根据url字符串查询请求,添加含有num、name、sex、home、acade、major和class字段的对应节点，并保存

Function URLDecode(strURL)
	

用于解码收到的num、name、sex、home、acade、major和class字段，并保存。encodeurl(浏览器)→decodeurl(服务端)

 

展示截图
图片

需要注意的是浏览器端发出的url请求需要实现经过encodeurl()方法对实现对查询字段进行编码，否则当服务端接收到中文字符值时会读取中文字的utf-8码，即只能读到乱码，这时对节点nodevalue赋值也只能赋乱码。为了避免服务端错误地读到乱码，使服务端有能力认知中文查询字段，则必要在浏览器端和服务端都执行码义转化功能。目前较为广泛使用的encodeurl(str)转码函数已封装在javascript的函数集中,浏览器端可直接调用，但服务端则需要手动编写urldecode(str)函数。

 

# 六、心得与展望

经过三个多月的简单学习和上课听讲，初步掌握了维护*.xml的一些简单的知识和基本常识，也能从老师讲的基本知识中简单的应用一下上课所学到的知识，感觉xml文本有如下优缺点：

1.  XML简洁有效，数据可读性高

2.  xml是文本文件，当为大数据检索时与数据库相比读取效率太低了(缺点)

3.  XML文档的内容和结构完全分离

4.  Web集成，使得Web开发商可以在个人电子助理和浏览器之间用XML来传递数据。

经过不少与一周的实践在编写网络脚本有一些成功的提高，但是更多的是困惑，有太多的东西都不懂，以前学c++、数据库等一些相关知识的时候没有将所学内容串联成知识体系，现在想真正做好这个网站就显得不那么容易了。一个优秀的网络程序员不但要了解自己领域的一些专业技术，而且很多时候还要充当半个网络工程师，半个美术设计师和半个数据库管理员。照这么说来，单单学习xml和asp.net是远远不够的，还要学习计算机网络、美术设计、数据库，我很喜欢有关计算机方面的东西，认为我们当代的生活越来越离不开计算机，并且我也很痴迷计算机所带来的强大功能。

在这短短的一周的网页设计中，我知道在程序设计的时候，不要太在意程序是否最简洁灵活，对于一般开发者而言，程序规范化和可读性可能比追求程序的灵活性更加重要。在互联网资源越来越丰富的情况下，我们可以参考一些规范的程序源代码来学习。同时我也知道，想要学好这门课程，所要具备很多条件，首先打代码要规范，要做注释，这样回头来看程序时可以很快的看懂，一方面可以锻炼自己的逻辑表达能力，对以后遇到难以实现的功能也可以很好的表达出来向别人请教，而且出去从事编程工作的话，代码的规范是相当重要的。还有一点要学会总结，把自己做的程序用到的知识点列出来就可以很好的总结自己的知识点。