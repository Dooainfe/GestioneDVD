<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%@page import="utility.*"%>
<!DOCTYPE html>
<html>
<head>
<% 
//Connessione
Connection con = Main.connect();
Statement stmt = con.createStatement();


//Mi semplifico la query sql per leggibilità dando dei campi.
String titolo = request.getParameter("titolo");
String anno = request.getParameter("anno");
String durata = request.getParameter("durata");
String genere = request.getParameter("genere");
//genere = genere.substring(5);
String attore = request.getParameter("attore");
//attore = attore.substring(17);
String regista = request.getParameter("regista");
//regista = regista.substring(18);
String mood = request.getParameter("mood");
//mood = mood.substring(9);
String stato = request.getParameter("stato");
//stato = stato.substring(9);

String id = request.getParameter("ID");


String sql = "UPDATE film SET film.IDfilm ='"+id+"', film.Titolo = '"+ titolo +"', film.Anno = '"+ Integer.parseInt(anno) +"', film.Durata = '"+ Integer.parseInt(durata) +"', film.IDmood = '"+mood+"', film.IDstato = '"+stato+"', film.IDregista = '"+regista+"'  WHERE film.IDfilm = "+id;
stmt.executeUpdate(sql);

String sql2 = "UPDATE tfilm_attori SET tfilm_attori.IDattore ='"+attore+"' WHERE tfilm_attori.IDfilm = '"+id+"' LIMIT 1";
stmt.executeUpdate(sql2);
// tfilm_attori.IDfilm ='"+id+"', 	 tfilm_generi.IDfilm ='"+id+"', 
String sql3 = "UPDATE tfilm_generi SET tfilm_generi.IDgenere ='"+genere+"' WHERE tfilm_generi.IDfilm = '"+id+"' LIMIT 1";
stmt.executeUpdate(sql3);
%>

<style type="text/css">
body {background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1) no-repeat center top;
		 font-family: Inter, sans-serif; text-align:center;position:relative;}
		 .main {font-family: 'Walter Turncoat', corsive;width:40%; font-size:45px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:1px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:1px solid #337af1; border-radius:300px;font-weight: bold;}
.esito{width:100%;text-align:center;font-size:40px;color:white; }
.header{color:white;text-align:center;font-size:24px;
width:100%; height:300px; 
background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));
background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1) no-repeat center top;}
.corpoCentrale {width:100%;background-color:white; 
		background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1); 
		background-size:cover;opacity:1;
		 right: 0; bottom: 0; min-height: 100%;
		 height: auto; z-index: -100;background-repeat: repeat-y,repeat-x;}
.divMenu { width: 10%; float: left;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5); color: #f1f1f1; opacity:0.6}
.scrittaMenu {font-size:30px; color:white;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5); color: #f1f1f1; margin-bottom:30px;margin-top:30px;}
 span:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
ul{margin: 0; padding:0; list-style-type: none;}
li{float:left;background-color:#151515;border:none; 
      	width:200px;height:105px;}
a{display:block;margin-top:10px;text-align:center;
		margin-inline: auto;color:white; width:80%;text-decoration:none;font-size:16px;}
li a:hover {background-color: #e8e8e4;color: #151515;text-decoration: 
none;cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;
}
li ul {display: none;}
li:hover ul{display: block;position: absolute;z-index:1;width:150px;
            background: #151515;color:white; background-color: #212329;
            background: rgba(0, 0, 0, -0.5);color: #f1f1f1;cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
 

.containerBarra {margin-top:-63px;margin-right:20px;float: right;
        width: 25%;}

.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
        background-image: url("https://icon-library.com/images/black-search-icon-png/black-search-icon-png-2.jpg");
       	width: 85%; height: 35px; color: black;font: normal normal normal 20pt 'Play'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;}	



    .footer {position:relative;background-color: #212329;
    padding-bottom: 2rem 0 4 rem 0;
  background: rgba(0, 0, 0, 0.5);color: #f1f1f1;
    width:100%;height:50px; display:flex;margin-top: 470px;padding:1.5%;margin-bottom:-10px;}
.aboutUs {margin-top:10px;border-radius: 20px;
		margin: auto;color:white; float:left;width:10%;}
#btnIndietro {width:7%; margin:auto; float:left;height: 30px;border-radius: 20px;background-color: #212329;
			outline: none;border:none;color: #fff;font-size: 1.2rem;}
#btnIndietro:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
.contactUs {color:white;  float:left;  width:10%;border-radius: 20px;
			margin:auto;margin-top:7px;margin-bottom:0.5%;}
.contactUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}



.aboutUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
		
</style>
<meta charset="ISO-8859-1">
<title>Film Modificato -<%=titolo %></title>
</head>
<body>

<div class=corpoCentrale>
<div class=header>
  <div class="divMenu">
        <ul> 
        <li><div class="scrittaMenu"> Menu </div> 
        <ul> 
        <li><a href="Catalogo.jsp">Accesso al catalogo</a></li>
        <li><a href="Aggiungi.jsp">Aggiungi nuovo titolo </a></li>
        <li><a href="RicercaAvanzata.jsp">Ricerca Avanzata </a></li>

</ul> 
</li> 
</ul>
    </div>

  <div class="main">     <span onclick="window.location.href='Index.jsp';" class="letter1">Y</span>     
    <span onclick="window.location.href='Index.jsp';">o</span>     <span onclick="window.location.href='Index.jsp';">u</span>     <span onclick="window.location.href='Index.jsp';">r</span>     
    <span onclick="window.location.href='Index.jsp';" class="letter">M</span>     <span onclick="window.location.href='Index.jsp';">o</span>    
     <span onclick="window.location.href='Index.jsp';">v</span>   <span onclick="window.location.href='Index.jsp';">i</span>   <span onclick="window.location.href='Index.jsp';">e</span>   <span onclick="window.location.href='Index.jsp';">s</span> </div> 


<div class="containerBarra">
 		<form id="formRicerca" action="Ricerca.jsp" method="post" style="white-space: nowrap">
 
 		<input type="text" type="submit" class="cercaContainer" name='ricerca' placeholder="Cerca un film">
 		 

		</form> 
	</div>
	</div>
<div class=esito>Film Modificato correttamente, fanne buon uso!</div>


<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>
	<% 


con.close();
%>
</body>
</body>
</html>