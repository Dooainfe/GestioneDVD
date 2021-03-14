<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
body {background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1) no-repeat center top;
		 font-family:'Nunito', sans-serif; text-align:center;position:relative;}
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
<% 
	//Effettuo la connessione al db
	Connection con = Main.connect();
	
//Mi semplifico la query sql per leggibilità dando dei campi.
String titolo = request.getParameter("titolo");
String anno = request.getParameter("anno");
String durata = request.getParameter("durata");
String genere = request.getParameter("genere");
String attore = request.getParameter("attore");
String attore2 = request.getParameter("attore2");
String regista = request.getParameter("regista");
String mood = request.getParameter("mood");
String stato = request.getParameter("stato");
String immagine = request.getParameter("immagine");
String Regista = null;
String Attore = null;
String Attore2 = null;
String lastID = null;


Statement stmt = con.createStatement(); //stmt per insert del film
Statement stm1 = con.createStatement(); //stmt per query di select e insert del regista
Statement stm2 = con.createStatement(); //stmt per query di select e insert degli attori
Statement idStmt = con.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); //stmt per ottenere id del film appena aggiunto ed usarlo per modificare la tabella film_attori e film_generi


//Queries per andare a cerca una corrispondenza di registi tra quello inserito dall'utente e quelli presenti nel db
String sql1 = "SELECT * FROM tregisti WHERE Regista = '"+regista+"'";
String sql2 = "SELECT * FROM tattori WHERE Attore = '"+attore+"'";

//Se c'è corrispondenza, salvo l'id della corrispondenza nel Campo REGISTA, altrimenti faccio un Insert e mi salvo successivamente l'id in Regista ugualmente
ResultSet res1 = stm1.executeQuery(sql1);
if(res1.next()){
Regista = res1.getString("IDregista");
}else{
	stmt.executeUpdate("INSERT INTO tregisti (IDregista, Regista) VALUES (NULL, '"+regista+"')");
	res1 = stm1.executeQuery(sql1);
	if(res1.next()){
		Regista = res1.getString("IDregista");
		}
}

//Se c'è corrispondenza, salvo l'id della corrispondenza nel Campo Attore, altrimenti faccio un Insert e mi salvo successivamente l'id in Attore ugualmente
ResultSet res2 = stm2.executeQuery(sql2);
if(res2.next()){
Attore = res2.getString("IDattore") ;	
}else{
	stmt.executeUpdate("INSERT INTO tattori (IDattore, Attore) VALUES (NULL, '"+attore+"')");
	res2 = stm2.executeQuery(sql2);
	if(res2.next()){
		Attore = res2.getString("IDattore") ;	
		}
}

//Se c'è corrispondenza, salvo l'id della corrispondenza nel Campo Attore2, altrimenti faccio un Insert e mi salvo successivamente l'id in Attore2 ugualmente
sql2 = "SELECT * FROM tattori WHERE Attore = '"+attore2+"'";
res2 = stm2.executeQuery(sql2);
if(res2.next()){
Attore2 = res2.getString("IDattore");	
}else{
	stmt.executeUpdate("INSERT INTO tattori (IDattore, Attore) VALUES (NULL, '"+attore2+"')");
	res2 = stm2.executeQuery(sql2);
	if(res2.next()){
	Attore2 = res2.getString("IDattore");	
	}
}







	//Inserisco i campi inseriti dall'utente nel modulo nella tabella film usando anche l'id regista che mi sono procurato precedentemente
	String sqlInsertFilm = "INSERT INTO film VALUES(NULL, '"+titolo+"', '"+Regista+"', '"+anno+"', '"+durata+"', '"+mood+"', '"+stato+"', '"+immagine+"')";
	stmt.executeUpdate(sqlInsertFilm);
	
	//Effettuo una query per andare a prendere l'id dell'ultimo film inserito(Quello inserito dall'utente)
	ResultSet lastID_film = idStmt.executeQuery("SELECT * FROM film");	
	
	if(lastID_film.last()){
	lastID = lastID_film.getString("IDfilm");
	}	
	
	//Ottenuto L'id del film che abbiamo inserito, andiamo ad inserire anche i dati nella nostra tabella di relazione molti a molti con gli attori
	
	String sqlInsertAttore = "INSERT INTO tfilm_attori VALUES ('"+lastID+"', '"+Attore+"')";
	String sqlInsertAttore2 = "INSERT INTO tfilm_attori VALUES ('"+lastID+"', '"+Attore2+"')";
	stmt.executeUpdate(sqlInsertAttore);
	stmt.executeUpdate(sqlInsertAttore2);
	
	//Ottenuto L'id del film che abbiamo inserito, andiamo ad inserire anche i dati nella nostra tabella di relazione molti a molti con i generi
	String sqlInsertGenere = "INSERT INTO tfilm_generi VALUES ('"+lastID+"', '"+genere+"')";
	stmt.executeUpdate(sqlInsertGenere);
%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kreon&family=Walter+Turncoat&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Film Aggiunto - <%= titolo %></title>
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
<div class=esito>Film Aggiunto correttamente, fanne buon uso!</div>


<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>
	</div>
	</body>
<% con.close(); %>
</html>