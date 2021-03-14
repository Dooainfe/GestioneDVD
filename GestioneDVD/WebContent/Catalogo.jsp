<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<head>
<% 
	//Richiamo il metodo .connect() per collegarmi al mio db.
	Connection con = Main.connect();

	try{
	//Query che effettuo su tutta la tabella film ed ottenere quindi tutti i film all'interno del db
	String sqlCatalogo = "SELECT film.Titolo, film.Immagine, film.IDfilm FROM film"; 
	Statement stmt = con.createStatement();
	ResultSet res = stmt.executeQuery(sqlCatalogo);
	
	
	String sqlCitazione = "SELECT * FROM tcitazioni ORDER BY RAND() LIMIT 1";
	Statement stmt2 = con.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet res2 = stmt2.executeQuery(sqlCitazione);
	
	String citazione = null;
	boolean corrispondenza = false;
	String idCorrispondenza = null;
	
	
	if(res2.next()){
		citazione = res2.getString("Citazione");
	}
	
	
	String sqlCitazioneFilm = "SELECT film.Titolo, film.IDfilm FROM film";
	Statement stmt3 = con.createStatement();
	ResultSet res3 = stmt3.executeQuery(sqlCitazioneFilm);
	
	while(res3.next()){
		if(res3.getString("Titolo").equalsIgnoreCase(res2.getString("Titolo").substring(1, res2.getString("Titolo").length()-1))){
			corrispondenza = true;
			idCorrispondenza = res3.getString("IDfilm");
		}
	}

%>
<meta charset="utf-8">
<title>Catalogo - YourMovies</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
<style type="text/css">



.ListaFilm{width:98%;height:auto;}
body {
		 font-family:'Nunito', sans-serif; text-align:center;position:relative;}
		 .corpoCentrale {width:100%;background-color:white; 
		background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1); 
		background-size:cover;opacity:1;
		 right: 0; bottom: 0; height: 100%;
		 height: auto; z-index: -100;background-repeat: repeat-y,repeat-x;}
 

.header{color:white;text-align:center;font-size:24px;
width:100%; height:320px; 
background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));
}

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







.h1{text-align:center;}


.citazione{color:white;flat:center;font-weight:bold; font-style:italic;margin-bottom:40px;box-shadow:0 0 15px 5px black;border-radius:10px;font-size:20px;}


.film{margin-top:30px;color:white;width:150px;height:300px;
text-align:center;float:left;margin-left:150px;border-radius:10px;box-shadow:0 0 15px 5px black;}

input{box-shadow:0 0 15px 5px black;border-radius:10px;}



  
  



.containerBarra {margin-top:-63px;margin-right:20px;float: right;
        width: 25%;}
.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
       
       	width: 85%; height: 35px; color: black;font: normal normal normal 20pt 'Play'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;}	
.TastoHomeHeader {float:left;border-radius:3px; background-image: 
		linear-gradient(to right, #ced4da, #dee2e6, #e9ecef); 
		margin:5px;padding:10px;width: 20%; height:50px; 
		background-color:trasparent;opacity:0.6; color:black; 
		font-weight:bold; font-size: 14px margin-left:10px;
		margin-top:18px; border-radius:14px;}

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
			
a:visited{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color:white;text-decoration:none;}




.main {font-family: 'Walter Turncoat', corsive;width:45%; font-size:55px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;margin-top:15px;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:4px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:4px solid #337af1; border-radius:300px;font-weight: bold;}

span:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515; border-radius:300px; }


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



<div class=citazione> <% 
       if(corrispondenza){
        out.println("<p>"+citazione+" <a href=Film.jsp?ID='"+idCorrispondenza+"'><u> "+res2.getString("Titolo")+"</u></a></p>");
       }else{
          out.println("<p>"+citazione+" "+res2.getString("Titolo")+"</p>");
       }
        %></div>
<div class=ListaFilm>
	    <%

		//Ciclo i record e predispongo i div per ciascun film nel db.
		while(res.next()){

		//Passo al metodo l'ID(ID che va poi passato a Film.jsp qualora si clicchi sull'img) e l'immagine(per avere un effetto-visivo) di ogni singolo record
		out.println(Main.stampaDiv(res.getString("IDfilm"), res.getString("Immagine"), res.getString("Titolo")));		
		} 
	 	con.close();
		    } catch (SQLException e1) {
			      e1.printStackTrace(); }
	%>
		
	</div>

	

	
<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>

	</div>
	</div>
</body>
</html>