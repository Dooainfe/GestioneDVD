<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<head>


<% 
	//Effettuo la connessione al db
	Connection con = Main.connect();

	//Prende tutti i campi dal film che corrisponde all'id passatomi da Film.jsp
	String sql_regista = "SELECT * from tregisti";
	String sql2_attore = "SELECT * from tattori";
	String sql3_generi = "SELECT * from tgeneri";
	String sql4_mood = "SELECT * from tmood";
	String sql5_stato = "SELECT * from tstato";
	
	//Creo statement ed i resultSet che mi servono a completare il Form.

		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		Statement stmt3 = con.createStatement();
		Statement stmt4 = con.createStatement();
		Statement stmt5 = con.createStatement();
		
		ResultSet res = stmt.executeQuery(sql_regista);
		ResultSet res2 = stmt2.executeQuery(sql2_attore);
		ResultSet res3 = stmt3.executeQuery(sql3_generi);
		ResultSet res4 = stmt4.executeQuery(sql4_mood);
		ResultSet res5 = stmt5.executeQuery(sql5_stato);

%>
<meta charset="ISO-8859-1">
<title>Aggiungi Film</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
<style>
body {font-family:'Nunito', sans-serif; width:100%; height:100%;}


.BottoneConfermaDiv{width:100%;margin-top:5%;}

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

		.titoloAggiungi{width:100%;font-size:50px;text-align:center;color:white;box-shadow: inset 2px 2px 2px grey;margin-bottom:20px;}
       
.BottoneConferma{text-align:center;color:black; width:10%;border-radius:10px;
			margin-bottom:0.5%;padding:5px; margin-left:14%;}
			.BottoneConferma:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}

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



.ContenitoreLabelDati{width:55%;height:405px;float:center;margin-bottom:5%;}
            .sinistra {width:25%;float:left;height:400px;color:white;}
            .text{padding:3%;margin-bottom:2.9%;width}
        .destra{width:58%;float:left;height:360px;margin-left:2px;margin-top:1.5%;}
        .dati{width:90%;padding:2.1%;float:left;margin-bottom:3%;}
        .datiSel{width:95.4%;padding:2.5%;margin-bottom:2%;}
      
     select{width:90%;padding:1.8%; margin-bottom:1.7%;}
      .datiAttore{width:43%;padding:1.8%;float:left; margin-bottom:1.7%;}


  
		
		
		
		






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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kreon&family=Walter+Turncoat&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="" rel="stylesheet">

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

   <div class=titoloAggiungi>Aggiungi un film</div>
   
   <form action="AddResult.jsp" method=post>

<div class=ContenitoreLabelDati>

<div class=sinistra>

<p  class=text> Titolo:  </p>
<p  class=text> Regista </p> 
<p  class=text> Attori Principali: </p> 
<p   class=text> Immagine: </p>
<p   class=text> Anno: </p>
<p   class=text> Durata: </p>
<p   class=text> Mood: </p>
<p  class=text> Genere:  </p>
<p class=text>  Stato</p>
</div>



<div class=destra>

	
<input class=dati type="text" name="titolo" placeholder="Inserisci un titolo" /> 


 <input class=dati type="text" name="regista" placeholder="Inserisci un regista" list="lista-registi"/>


 <input   class=datiAttore name="attore" placeholder="Inserisci un attore" list="lista-attori"/> <input  type="text" name="attore2" placeholder="Inserisci un attore" list="lista-attori"  class=datiAttore /> 
 <input class=dati type="text" name="immagine" placeholder="Inserisci un URL immagine" /> 
<input  class=dati type="text" name="anno" placeholder="Inserisci l'anno di produzione" /> 
<input class=dati type="text" name="durata" placeholder="Inserisci la durata del film" />  
 <select class=datiSel name="mood" > <%while(res4.next()){
		out.println("<option value="+ res4.getString("IDmood") +">"+res4.getString("Mood")+"</option>");
	} %> </select> 

	<select class=datiSel name="genere"> 
	<%while(res3.next()){
		out.println("<option value="+ res3.getString("IDgenere") +">"+res3.getString("Genere")+"</option>");
	} %> </select>
	<select class=datiSel name="stato" ><%while(res5.next()){
		out.println("<option value="+ res5.getString("IDstato") +">"+res5.getString("stato")+"</option>");
	} %> </select>


<datalist id="lista-registi">
<%
while(res.next()){
out.println("<option>"+res.getString("Regista")+"</option>"); }%>
</datalist>

<datalist id="lista-attori">
<%
while(res2.next()){
out.println("<option>"+res2.getString("Attore")+"</option>"); }%>
</datalist>
</div>

</div>

<input class=BottoneConferma type=submit value="Aggiungi titolo">

</form>

<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>

</body>
</html>