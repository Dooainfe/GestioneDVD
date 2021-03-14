
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<style>
body {font-family:'Nunito', sans-serif; width:100%; height:100%;}

.main {font-family: 'Walter Turncoat', corsive;width:45%; font-size:55px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;margin-top:15px;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:4px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:4px solid #337af1; border-radius:300px;font-weight: bold;}

span:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515; border-radius:300px; }

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
            
            #formRicerca{text-align:right;margin-bottom:10%; }

.containerBarra {margin-top:-63px;margin-right:20px;float: right;
        width: 25%;}

.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
        background-image: url("https://icon-library.com/images/black-search-icon-png/black-search-icon-png-2.jpg");
       	width: 85%; height: 35px; color: black;font: normal normal normal 20pt 'Play'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;}	

.div{float:left;}
.dati{color:white;}
.Sicuro{color:white;font-size:30px;}
.contImg{width:100%;text-align:center;}
.immagine{width:160px;height:270px;margin-top:20px;}



input{text-align:center;color:black; width:18%;border-radius:10px;
			margin-bottom:0.5%;padding:5px; ;margin-top:10px;}
			input:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
			
			
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
<head>
<% 
	//Effettuo la connessione al db
	Connection con = Main.connect();
	
	//Prende tutti i campi dal film che corrisponde all'id passatomi da Film.jsp
	String sql = "SELECT film.Titolo, film.Durata, film.IDfilm, film.Anno, tregisti.Regista, tattori.Attore, tmood.Mood, tstato.stato, tgeneri.Genere, tfilm_attori.IDattore, tfilm_generi.IDgenere, film.IDregista, film.Immagine FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.idMood) JOIN tstato ON(tstato.IDstato = film.IDstato) WHERE film.IDfilm = "+ request.getParameter("ID");

	Statement stmt = con.createStatement();
	ResultSet res = stmt.executeQuery(sql);
	
	if(res.next()){}
	String titolo = res.getString("Titolo");

%>

<meta charset="ISO-8859-1">
<title>Cancella - <%=titolo%> </title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
<style type="text/css">
body {background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1);
		 font-family:'Nunito', sans-serif;text-align:center;}
</style>
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
<div class=Sicuro>Sei sicuro di voler eliminare il record?</div>

<div class=contImg><img class=immagine src=<%=res.getString("Immagine") %>/></div>

<div class="divCancella">
<form action="CancelResult.jsp" method="post">
<input class=tastoCancella type=submit value="Si, Voglio eliminare il record">
<input type=hidden name="ID" value=<%=res.getString("IDfilm")%>>
</form>
</div>
<div class="divBack">
<form action="Film.jsp" method="post">
<input class=tastoBack type=submit value="No, Voglio tornare alla scheda film">
<input type=hidden name="ID" value=<%=res.getString("IDfilm")%>>



<%
//Scusa la grafica ma non so sistemarlo


con.close();
%>

</form>
</div>
<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>
</div>
</body>
</html>
