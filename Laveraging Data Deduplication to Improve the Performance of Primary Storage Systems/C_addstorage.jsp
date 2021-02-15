<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style21 {font-size: 14px}
.style4 {color: #666666; font-weight: bold; font-size: 14px; }
.style24 {color: #666666}
.style25 {font-size: 24px}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="C_Main.jsp">CLOUD</a></li>
          <li><a href="C_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Add  Memory   </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p align="justify" class="style21">
              <%
				String cloud=request.getParameter("cloud");
				String memory=request.getParameter("memory");
				String slafrom=request.getParameter("slafrom");
				String slato=request.getParameter("slato");
				
				
			String query="Select *from cloudstorage where cloud='"+cloud+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			if ( rs.next() )
			{	
				if((memory.equals(""))&&(slafrom.equals(""))&&(slato.equals("")))
				{
					%>
            </p>
</p>
            <p></p>
            <h3 class="style29 style21">Give Values !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				else if((!(memory.equals("")))&&(!(slafrom.equals("")))&&(!(slato.equals(""))))
				{
				
					int oldmem=Integer.parseInt(rs.getString(3));
					int assignedmemory=Integer.parseInt(memory);
					int newmem=oldmem+assignedmemory;
					
					String strQuery2 = "update cloudstorage set memory='"+newmem+"',slafrom='"+slafrom+"',slato='"+slato+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				else if((!(memory.equals("")))&&(!(slafrom.equals(""))))
				{
				
					int oldmem=Integer.parseInt(rs.getString(3));
					int assignedmemory=Integer.parseInt(memory);
					int newmem=oldmem+assignedmemory;
					
					String strQuery2 = "update cloudstorage set memory='"+newmem+"',slafrom='"+slafrom+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">Memory And SLA_from Date Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				
				else if((!(memory.equals("")))&&(!(slato.equals(""))))
				{
				
					int oldmem=Integer.parseInt(rs.getString(3));
					int assignedmemory=Integer.parseInt(memory);
					int newmem=oldmem+assignedmemory;
					
					String strQuery2 = "update cloudstorage set memory='"+newmem+"',slato='"+slato+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">Memory And SLA_to Date Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				else if((!(slafrom.equals("")))&&(!(slato.equals(""))))
				{
				
					
					
					String strQuery2 = "update cloudstorage set slafrom='"+slafrom+"',slato='"+slato+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">SLA_from And SLA_to Date Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				else if(!(memory.equals("")))
				{
					int oldmem=Integer.parseInt(rs.getString(3));
					int assignedmemory=Integer.parseInt(memory);
					int newmem=oldmem+assignedmemory;
					
					
					String strQuery2 = "update cloudstorage set memory='"+newmem+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">Memory Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
				}
				else if(!(slafrom.equals("")))
				{
					
					String strQuery2 = "update cloudstorage set slafrom='"+slafrom+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">SLA_from Date Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%

					
				}
				else if(!(slato.equals("")))
				{
				
					String strQuery2 = "update cloudstorage set slato='"+slato+"' where cloud='"+cloud+"'";
					Statement st1=connection.createStatement();
					st1.executeUpdate(strQuery2);
					
					%>
            </p>
            <p></p>
            <h3 class="style29 style21">SLA_to Date Updated Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
					
				}
				else{}	
			}
			else
			{
				String strQuery2 = "insert into cloudstorage(cloud,memory,slafrom,slato) values('"+cloud+"','"+memory+"','"+slafrom+"','"+slato+"')";
				Statement st1=connection.createStatement();
				st1.executeUpdate(strQuery2);
				
				%>
            </p>
            <p></p>
            <h3 class="style29 style21">Values Added Successfully !!!</h3>
            </p>
            <a href="C_Main.jsp">Back</a><a href="PC_MemSLA.jsp"></a><br />
            <%
			}
			%>
            <p align="justify" class="style21">&nbsp;</p>
          </div>
          <div class="style2"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
