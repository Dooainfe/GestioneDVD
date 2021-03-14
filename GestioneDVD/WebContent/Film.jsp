<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "utility.*" %>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	//Mi prendo l'id passato da Index.jsp al momento del click.
	String id = request.getParameter("ID");
	
	//Effettuo la connessione al db
	Connection con = Main.connect();
	
	//Effettuo una query per alcune informazioni del film WHERE l'id del film è quello passatomi da Index.jsp
	String sql = "SELECT * FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.idMood) JOIN tstato ON(tstato.IDstato = film.IDstato) WHERE film.IDfilm = "+id; 
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	ResultSet res = stmt.executeQuery(sql);
	
	
	ResultSet resAttori = stmt3.executeQuery("SELECT DISTINCT * FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) WHERE film.idfilm = "+id);
	
	//Sposto il cursore sul record poichè mi serve "Titolo" nel <title>
	if(res.next()){
		
		String attore1 = null, attore2 = null;
		
		//Stampare gli attori
		if(resAttori.next()){
		attore1=resAttori.getString("Attore"); resAttori.next(); attore2 = resAttori.getString("Attore");
		}
		
		
		//La query per ora seleziona le info generali dei film WHERE regista ed anno sono uguali a quello della scheda del film che stiamo esaminando
		sql = "SELECT film.Titolo, tregisti.Regista, tattori.Attore, tmood.Mood, tstato.stato, film.Durata, film.IDfilm, film.Anno, film.Immagine FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.idMood) JOIN tstato ON(tstato.IDstato = film.IDstato) WHERE tregisti.Regista= '"+res.getString("Regista")+"' OR film.Anno = '"+ res.getString("Anno")+"' OR tattori.Attore ='"+attore1+"' OR tattori.Attore ='"+attore2+"';";
		ResultSet res2 = stmt2.executeQuery(sql);
		
		
		
		//Mi predispongo per i film simili nell'head e lasciare il body pulito.
		ArrayList<String> filmSimili = new ArrayList<String>();
		
		
		
		//Mi ciclo tutti i record su chiave "IDfilm" per evitare i doppioni generati dalla query e li aggiungo all'array che userò per ciclare dopo
		while(res2.next()){
			if(!filmSimili.contains(res2.getString("IDfilm"))){
			filmSimili.add(res2.getString("IDfilm"));
			
			}
		}


		//Rimuovo id dall'array cosicchè io non mi ritrovi il film che sto già guardando tra i film simili
			filmSimili.remove(id);
		
		
			
				
			if(!filmSimili.isEmpty()){	
			//String Builder per potermi costruire la query facilmente in base a quelli che sono gli id nell'array	
			StringBuilder finalQuery = new StringBuilder();
			
			//Query SQL in costruzione
			sql = "SELECT * FROM film WHERE IDfilm in (";
			finalQuery.append(sql);
			
			
			for(int i=0; i<filmSimili.size();i++){
				//Se film simili ha più di un record allora SQL vuole le virgole tra un id e l'altro nella sintassi e quindi:
				if(filmSimili.size()>1){
				finalQuery.append(filmSimili.get(i)+", ");
				}
				
				//Se il film ha un solo record la sintassi non richiede virgole.
				if(filmSimili.size()==1){
					finalQuery.append(filmSimili.get(i));
					
				}

			}
			
				//Ultima modifica alla query finale con più di 2 record poichè nell'ultimo record virgola e spazio verranno inserite comunque e vanno rimosse
			if(filmSimili.size()>1){
				finalQuery.delete(finalQuery.length()-2,finalQuery.length());
				}
			
			//Chiudo la parentesi aperta all'inizializzazione di finalQuery e ci aggiungo un ORDER BY RAND per mostrare i filmSimili in ordine casuale.
			finalQuery.append(")  ORDER BY RAND ();");
			
			//Query finale : SELECT * from film WHERE IDfilm in(IDfilmSimili1, IDfilmSimili2, IDfilmSimili3) ORDER BY RAND();
			sql = finalQuery.toString();
			res2 = stmt2.executeQuery(sql);
			
			}
			//---------FINE ELSE DI if(filmSimili.isEmpty()) --linea 51
			String valutazione = Main.estraiValore(res.getString("Titolo"));
	%>

<meta charset="utf-8">
<title>Film - <%= res.getString("Titolo") %></title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
<style>

.main {font-family: 'Walter Turncoat', corsive;width:45%; font-size:55px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;margin-top:15px;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:4px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:4px solid #337af1; border-radius:300px;font-weight: bold;}

span:hover {cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515; border-radius:300px; }





body {width:100%; height:100%;font-family:'Nunito', sans-serif;}


.corpoCentrale {width:100%;background-color:white; 
		background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1); 
		background-size:cover;opacity:1;
		 right: 0; bottom: 0; min-height: 100%;
		 height: auto; z-index: -100;background-repeat: repeat-y,repeat-x;}


.header{color:white;text-align:center;font-size:24px;
width:100%; height:320px; 
background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));
}





.ModCancDiv{text-align:center;width:92%;margin-left:50px;margin-bottom:50px;}
.immagine{float:center;text-align:center;}

.titFilmSimili{color:white;text-align:center;width:100%;}

	.contenitoreDati{width:100%;float:center;}	
		.modificacancellaTasti{text-align:center;color:black; width:90px;border-radius:10px;
			margin-bottom:0.5%;padding:5px; margin-left:0px;}
			.modificacancellaTasti:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
.
.titoloHeader{width:30%;margin-top:20px;}

.titolo{color:white;
text-align:center;}

.anno {color:white;
text-align:center;}


.regista{color:white;
text-align:center;}

.filmSimili{color:white;}

.durata {color:white;text-align:center;}
.stato {color:white;text-align:center;}
.mood {color:white;text-align:center;}

.TastoHomeHeader{float:left;border-radius:3px; background-image: 
		linear-gradient(to right, #ced4da, #dee2e6, #e9ecef); 
		margin:5px;padding:10px;width: 20%; height:50px; 
		background-color:trasparent;opacity:0.6; color:black; 
		font-weight:bold; font-size: 14px margin-left:10px;
		margin-top:18px; border-radius:14px; }
		
		
		
		
		.containerBarra {margin-top:-63px;margin-right:20px;float: right;
        width: 25%;}
.cercaContainer {box-shadow: inset 5px 5px 5px grey; border:none;
        background-image: url("https://icon-library.com/images/black-search-icon-png/black-search-icon-png-2.jpg");
       	width: 95%; height: 35px; color: black;font: normal normal normal 20pt 'Play'; 
        background-color: #FFFFFF;background-position: 290px; background-repeat: no-repeat;background-attachment:inherit;
      	padding: 5px 5px 5px 20px; border: 1px solid #000000; border-radius: 20px;float:right;}	

		
		
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



.immagineDett{margin-top:20px;margin-bottom:15px;width:190px;height:290px;}

.filmSimili{width:23%;float:left;margin-left:20px;}
.titFilmSimili{width:100%;text-align:center;font-size:35px;margin-top:25px;margin-bottom:25px;}
		
		
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




</style>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kreon&family=Walter+Turncoat&display=swap" rel="stylesheet">
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


<%


out.println("<div class=ContenitoreDati>");
out.println("<div class=titolo>Titolo: "+res.getString("Titolo") + "</div>");
out.println("<div class=regista>Regia: " +res.getString("Regista")+ "</div>");
out.println("<div class=anno> Anno: "+res.getInt("Anno")+"</div>");
out.println("<div class=durata> Attori principali: "+attore1+", "+attore2+"</div>");
out.println("<div class=durata> Genere: "+res.getString("Genere")+"</div>");
out.println("<div class=durata>Durata:"+res.getInt("Durata")+"'</div> ");
out.println("<div class=durata>Valutazione: "+valutazione+"</div> </div>");
out.println("<div class=Img+Tasti> <div class=immagine><input class=immagineDett type='image' src="+ res.getString("Immagine")+"</div> </div>");
out.println("<form action='Modifica.jsp' method='post'>");
out.println("<div class=ModCancDiv><input class=modificacancellaTasti type='button' onclick=location.href='Cancella.jsp?ID="+res.getString("IDfilm")+"' value='Cancella'>"); 
out.println("<input  class=modificacancellaTasti type='submit' value='Modifica'>");
out.println("<input type=hidden value='"+res.getString("IDfilm")+"'name ='ID' </div></form></div>");



	%>
	
	
	
	<% 
	// -------------------------------------------FILM SIMILI
	if(!filmSimili.isEmpty()){
		out.println("<div class=titFilmSimili>Film Simili</div>");
	
	
	
	//Ciclo i record della query per i film simili e predispongo un div per ciascuno di loro.
		while(res2.next()){
			out.println("<div class=filmSimili>"+Main.stampaDiv(res2.getString("IDfilm"), res2.getString("Immagine"), res2.getString("Titolo"))+"</div>");
		}
	
	}
	
		con.close();
		}
%>
<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>

</div>
</html>