
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
<style type="text/css">
body {width:100%; height:100%;font-family:'Nunito', sans-serif;}


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

		
       
.titoloModifica{width:100%;font-size:50px;text-align:center;color:white;box-shadow: inset 2px 2px 2px grey;margin-bottom:20px;margin-top:20px;}
       

.divMenu { width: 10%; float: left;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5); color: #f1f1f1; opacity:0.6}
.scrittaMenu {font-size:30px; color:white;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5); color: #f1f1f1; margin-bottom:30px;margin-top:30px;}
 pan:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
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
            
            #formRicerca{text-align:right; }

.containerBarra {margin-top:-63px;margin-right:20px;float: right;
        width: 25%;}

.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
        background-image: url("https://icon-library.com/images/black-search-icon-png/black-search-icon-png-2.jpg");
       	width: 85%; height: 35px; color: black;font: normal normal normal 20pt 'Play'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;}	



.ContenitoreLabelDati{margin-left:50px;margin-top:60px;width:50%;height:310px;float:center;}
            .sinistra {width:15%;float:left;height:300px;font-size:19px;}
        .destra{width:60%;float:left;height:300px;margin-left:2px;}
        .dati{width:90%;padding:2.1%;}
        .datiSel{width:95.7%;padding:2.1%;}
       .text {margin:3%; padding:3%; width:85%; color:white;}
    

  		.locandina {width:140px;height:300px; border:1px solid yellow;margin:auto;}
  
		
		
		.textArea {margin:3%;padding:2% width:68%; }
		

.BottoneConferma{text-align:center;color:black; width:10%;border-radius:10px;
			margin-bottom:0.5%;padding:5px; margin-left:150px;font-family:'Nunito', sans-serif;}
			.BottoneConferma:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}


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
<% 
	
	//Effettuo la connessione al db
	Connection con = Main.connect();
	
	//Prende tutti i campi dal film che corrisponde all'id passatomi da Film.jsp
	String sql = "SELECT film.Titolo, film.Durata, film.IDfilm, film.Anno, tregisti.Regista, tattori.Attore, tmood.Mood, tstato.stato, tgeneri.Genere, tfilm_attori.IDattore, tfilm_generi.IDgenere, film.IDregista FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.idMood) JOIN tstato ON(tstato.IDstato = film.IDstato) WHERE film.IDfilm = "+ request.getParameter("ID");
	String sql2_regista = "SELECT * from tregisti";
	String sql3_attore = "SELECT * from tattori";
	String sql4_generi = "SELECT * from tgeneri";
	
	
	//Creo statement ed i resultSet che mi servono a completare il Form.

	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	Statement stmt4 = con.createStatement();
	ResultSet res = stmt.executeQuery(sql);
	ResultSet res2 = stmt2.executeQuery(sql2_regista);
	ResultSet res3 = stmt3.executeQuery(sql3_attore);
	ResultSet res4 = stmt4.executeQuery(sql4_generi);
	

if(res.next()){}
String titolo = res.getString("Titolo");

%>
<meta charset="ISO-8859-1">
<title>Modifica Film - <%=titolo%></title>
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

 <div class=titoloModifica>Modifica un film</div>
	<form action= 'ModifyResult.jsp' method='post'>
<div class=ContenitoreLabelDati>
<div class="sinistra">
				<p class="text">Titolo:</p>
				<p class="text">Anno:</p>
				<p class="text" >Durata:</p>
				<p class="text">Genere:</p>
				<p class="text">Regista:</p>			
				<p class="text">Attore:</p>    
				<p class="text">Stato:</p>
				<p class="text">Mood:</p>
				</div>
	<div class="destra">
	<input class="dati"type="text" name="titolo" value="<%= titolo %>" >
	<input class="dati"type="text" name="anno" value= '<%= res.getString("Anno") %>'>
	<input  class="dati" type="text" name="durata" value= <%=res.getString("Durata") %> >
	<select class="datiSel" name="genere">
	 <option value="<%= res.getString("IDgenere") %>"><%=res.getString("Genere") %></option>
       <% while(res4.next()){
    	   if(!res4.getString("IDgenere").equals(res.getString("Idgenere"))){
    	   out.print("<option value='"+res4.getString("IDgenere")+"'>"+res4.getString("Genere")+"</option>");}
       } %>
       
       </select>
       <select class="datiSel" name="regista"> 
       <option value=<%= res.getString("IDregista") %>><%=res.getString("Regista") %></option>
       <% while(res2.next()){
    	   if(!res2.getString("IDregista").equals(res.getString("Idregista"))){
    	   out.print("<option value='"+res2.getString("IDregista")+"'>"+res2.getString("Regista")+"</option>");}
       } %>
         
       </select>
       <select class="datiSel" name="attore"> 
       <option value=<%= res.getString("IDattore") %>><%=res.getString("Attore") %>:</option>
       <% while(res3.next()){
    	   if(!res3.getString("IDattore").equals(res.getString("IDattore"))){
    	   out.print("<option value='"+res3.getString("IDattore")+"'>"+res3.getString("Attore")+"</option>");}
       } %>
       </select> 
       <select  class="datiSel" name="stato"> 
     <% //   <option value=""><%= res.getString("stato")</option> %>
       <option value="1">Visto</option>
       <option value="2">Non Visto</option>
       <option value="3">Da Guardare</option>
       <option value="5">Da Riguardare</option>
       <option value="6">Da Finire</option>
       <option value="4">Droppato</option>
       </select> 
       <select class="datiSel"name="mood"> 
      <% // <option value=""><%=res.getString("Mood") </option>%>
       <option value="1">Relax</option>
       <option value="2">Famiglia</option>
       <option value="3">Spensierato</option>
       <option value="4">Tristezza</option>
       <option value="5">Romantico</option>
       <option value="6">Suspense</option>
       <option value="7">Rabbia Repressa</option>
       </select>       
       
	</div>	
	    		
				
</div>




 
 
           
<div >
<input   type="hidden" value='<%=res.getString("IDfilm") %>' name='ID'>
<input  class="BottoneConferma"type=submit>
</div>                                                              
  
</form>

<% 

	con.close();
%>

<div class="footer">	
	<input type="submit" value="Indietro" id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>

	</div>
	</div>
	
</body>
</html>

