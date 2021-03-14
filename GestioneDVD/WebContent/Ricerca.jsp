<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<head>

<% 
	//ArrayList per avere contenitore dei film delle varie queries senza creare doppioni.
	ArrayList<Integer> filmTrovati = new ArrayList<Integer>();
	
	//Effettuo la connessione al db
	Connection con = Main.connect();
	
	//Controlla tutti i film e mi seleziona quelli in cui il titolo è simile alla ricerca.
	String sqlCatalogo = "SELECT * FROM film JOIN tregisti ON(tregisti.IDregista = film.IDregista) WHERE Titolo like '%"+ request.getParameter("ricerca")+"%'"; 


	//Creo il resultset
	try{
	Statement stmt = con.createStatement();
	ResultSet res = stmt.executeQuery(sqlCatalogo);
	ResultSet resInfo, resAttori, resGeneri;
	
	//Creo vari Statement per leggibilità di codice e poichè questi saranno gli stm a generare i resultset portanti del body ed è quindi necessario che essi non vadano in contrasto.
	Statement stmInfo=con.createStatement(), stmAttori=con.createStatement(), stmGeneri=con.createStatement();
	
	
	
	//Aggiungo all'array contenitore tutti gli ID trovati.
	while(res.next()){	
	filmTrovati.add(res.getInt("IDfilm"));
	}

	//Controlla tutti i film e mi seleziona quelli che hanno un regista il cui nome è simile a quello di ricera.
	sqlCatalogo = "SELECT * FROM film JOIN tregisti ON(tregisti.IDregista = film.IDregista) WHERE tregisti.Regista LIKE '%"+request.getParameter("ricerca")+"%'";
	res = stmt.executeQuery(sqlCatalogo);
	
	//Aggiungo all'array assicurandomi che l'id da inserire non sia già presente (Cosi evito doppioni)
	while(res.next()){
	if(!filmTrovati.contains(res.getInt("IDfilm"))){	
	filmTrovati.add(res.getInt("IDfilm"));
		}
	}
	
	//Controlla tutti i film e mi seleziona quelli che hanno un attore il cui nome è simile a quello di ricera.
	sqlCatalogo = "SELECT tfilm_attori.IDfilm FROM tfilm_attori JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) WHERE tattori.Attore LIKE '%"+request.getParameter("ricerca")+"%'";
	res = stmt.executeQuery(sqlCatalogo);
	
	
	//Aggiungo all'array assicurandomi che l'id da inserire non sia già presente (Cosi evito doppioni)
	while(res.next()){
	if(!filmTrovati.contains(res.getInt("IDfilm"))){	
	filmTrovati.add(res.getInt("IDfilm"));
			}
	}	
		

	//Inizializzo lo stringbuilder per costruirmi la query automaticamente ed indipendentemente dal numero di elementi nell'array
	StringBuilder finalQueryInfo = new StringBuilder();
	StringBuilder finalQueryAttori = new StringBuilder();
	StringBuilder finalQueryGeneri = new StringBuilder();
	String sqlInfoResult ="SELECT * FROM film JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.idMood) JOIN tstato ON(tstato.IDstato = film.IDstato) WHERE film.IDfilm in (";
	String sqlAttoriResult ="SELECT film.Titolo,tattori.Attore FROM film JOIN tfilm_attori ON tfilm_attori.IDfilm = film.IDfilm JOIN tattori ON tattori.IDattore = tfilm_attori.IDattore WHERE film.IDfilm in (";
	String sqlGeneriResult ="SELECT film.Titolo, tgeneri.Genere FROM film JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) WHERE film.IDfilm in (";

	finalQueryInfo.append(sqlInfoResult);
	finalQueryAttori.append(sqlAttoriResult);
	finalQueryGeneri.append(sqlGeneriResult);

	//Se film simili ha più di un record allora SQL vuole le virgole tra un id e l'altro nella sintassi e quindi:
	for(int i=0; i<filmTrovati.size();i++){
		if(filmTrovati.size()>1){
		finalQueryInfo.append(filmTrovati.get(i)+", ");
		finalQueryAttori.append(filmTrovati.get(i)+", ");
		finalQueryGeneri.append(filmTrovati.get(i)+", ");
		}
	
	//Se il film ha un solo record la sintassi non richiede virgole.
	if(filmTrovati.size()==1){
		finalQueryInfo.append(filmTrovati.get(i));
		finalQueryAttori.append(filmTrovati.get(i));
		finalQueryGeneri.append(filmTrovati.get(i));
		}
	}

	//Ultima modifica alla query finale con più di 2 record poichè nell'ultimo record virgola e spazio verranno inserite comunque e vanno rimosse e Group By di chiusura ai generi
	if(filmTrovati.size()>1){
	finalQueryInfo.delete(finalQueryInfo.length()-2,finalQueryInfo.length());
	finalQueryAttori.delete(finalQueryAttori.length()-2,finalQueryAttori.length());
	finalQueryGeneri.delete(finalQueryGeneri.length()-2,finalQueryGeneri.length());
	}
	
	finalQueryInfo.append(");");
	finalQueryAttori.append(");");
	finalQueryGeneri.append(")");
	finalQueryGeneri.append(" GROUP BY film.Titolo;");

	//"Casto" lo StringBuilder per poter passare la Stringa allo stm
	sqlInfoResult = finalQueryInfo.toString();
	sqlAttoriResult = finalQueryAttori.toString();
	sqlGeneriResult = finalQueryGeneri.toString();

	//Query cuscinetto qualora non ci fossero film simili ----------DA RIVEDERE
	if(filmTrovati.isEmpty()){
		sqlCatalogo = "SELECT * FROM film WHERE film.IDfilm = 0";
	}
	//Creo resultset e ciclo nel body
	
	resInfo = stmInfo.executeQuery(sqlInfoResult);
	resAttori = stmAttori.executeQuery(sqlAttoriResult);
	resGeneri = stmGeneri.executeQuery(sqlGeneriResult);

%>


<meta charset="UTF-8">
<title>Ricerca - <%=request.getParameter("ricerca") %></title>

<style type="text/css">
@media screen and (min-width:1000px){
body {background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1);
		 font-family:'Nunito', sans-serif;text-align:center;}
.header{color:white;text-align:center;width:100%; height:150px;
		background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));}
		
.divMenu { width: 10%; float: left;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5);color: #f1f1f1;opacity:0.7;}
.scrittaMenu {font-size:30px; color:white;background-color: #212329;
   		background: rgba(0, 0, 0, -0.5); color: #f1f1f1; }
 p:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
ul{margin: 0; padding:0; list-style-type: none;}
li{float:left;background-color:#151515;border:none; 
      	width:200px;height:105px;}
a{display: block; text-decoration: none;color:white; padding:10px;}
li a:hover {background-color: #e8e8e4;color: #151515;text-decoration: 
none;cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;
}
li ul {display: none;}
li:hover ul{display: block;position: absolute;z-index:1;width:150px;
            background: #151515;color:white; background-color: #212329;
            background: rgba(0, 0, 0, -0.5);color: #f1f1f1;cursor:pointer;
            background-color:#337af1;transition: all 0.4s ease-out;}


.main {font-family: 'Walter Turncoat', corsive;width:45%; font-size:55px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;margin-top:15px;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:4px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:4px solid #337af1; border-radius:300px;font-weight: bold;}

span:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515; border-radius:300px; }
#formRicerca{text-align:right;}

.containerBarra {margin-top:-82px;margin-right:20px;float: right;
        width: 25%;}
.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
        background-image: url("https://icon-library.com/images/black-search-icon-png/black-search-icon-png-2.jpg");
       	width: 85%; height: 35px; color: black;font: normal normal normal 20pt 'Nunito'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;}	

		
.film{color:white;width:190px;height:280px;
text-align:center;margin-top:10px; margin-bottom: 16%;}
input{box-shadow:0 0 15px 5px black;border-radius:10px;float:left; height:280px; width: 190px}
.corpoCentrale{width:100%;padding-left:30%;padding-top:10%;}

.esterno {width:60%;height:auto;margin-left:30%;}
  
  		/*.locandina {width:140px;height:200px;margin-top:7%;margin-left:20%;}*/
  
		.destra {color:#f1f1f1; width:25%; 
		color:white; margin-top: -31.5%;
			text-align:center; margin-left:20%;padding:0 0.5%;margin-bottom:8%;
			background-color: #212329;
    padding-bottom: 2rem 0 4 rem 0;
  background: rgba(0, 0, 0, 0.5);color: #f1f1f1;border-radius:10px;}
		.text {text-align:justify; display:block;text-decoration: none;color:white;padding:0.5%; }

input{box-shadow:0 0 15px 5px black;border-radius:10px;}

.footer {background-color: #212329;
    padding-bottom: 2rem 0 4 rem 0;
  background: rgba(0, 0, 0, 0.5);color: #f1f1f1;border-radius:10px;
    width:100%;height:50px; display:flex;margin-top: 450px;padding:1.5%;margin-bottom:-8px;position:relative;}
.aboutUs {margin-top:10px;
		margin: auto;color:white; float:left;width:10%;}
#btnIndietro {width:7%; margin:auto; float:left;height: 30px;border-radius: 20px;background-color: #212329;
			outline: none;border:none;color: #fff;font-size: 1.2rem;}
#btnIndietro:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
.contactUs {color:white;  float:left;  width:10%;
			margin:auto;margin-top:7px;margin-bottom:0.5%;}
.contactUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
.aboutUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
}
</style>
</head>
<body>
<div class="header">
	<div class="divMenu">
        <ul> 
        <li><p class="scrittaMenu"> Menu </p> 
        <ul> 
        <li><a href="http://localhost:8080/GestioneDVD/Catalogo.jsp">Accesso al Catalogo</a></li>
        <li><a href="Aggiungi.jsp">Nuovo Titolo </a></li>
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


<div class="corpoCentrale">
	
		
				<% 
				while(resInfo.next()){
					
			        out.println("<div class='film'> <form action='Film.jsp' method='post'><input type='hidden' value="+ resInfo.getString("IDfilm")+" name='ID'><input type='image' src="+ resInfo.getString("Immagine") +"></form></div>" );				
					%>		
		
				<% 		
					
					resAttori.next();
        resGeneri.next();
    	out.println("<div class= destra >");
        out.println("<span class=text><i>Titolo:</i> "+resInfo.getString("Titolo")+"</span>");
        out.println("<span class=text><i>Anno:</i> "+resInfo.getString("Anno")+"</span>");
        out.println("<span class=text><i>Durata:</i> "+resInfo.getString("Durata")+"</span>");
        out.println("<span class=text><i>Genere:</i> "+resGeneri.getString("Genere")+"</span>");
        out.println("<span class=text><i>Attore1:</i> "+resAttori.getString("Attore")+"</span>");
        resAttori.next();
        out.println("<span class=text><i>Attore2:</i> "+resAttori.getString("Attore")+"</span>");
        out.println("<span class=text><i>Regista:</i> "+resInfo.getString("Regista")+"</span>");
        out.println("<span class=text><i>Tag:</i> "+resInfo.getString("Stato")+"</span>");
        out.println("<span class=text><i>Mood:</i> "+resInfo.getString("Mood")+"</span>");
        out.println("</div>");
        
       
        %>
							


<% } 
 		con.close();
	    } catch (SQLException e1) {
	     e1.printStackTrace();
	     }
		%>
</div>
<div style='clear:both'></div>

<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>
</body>
</html>

