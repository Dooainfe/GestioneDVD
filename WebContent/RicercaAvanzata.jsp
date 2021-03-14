<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "utility.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
header{color:white;text-align:center;font-size:24px;
width:100%; height:300px; 
background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));
background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1) no-repeat center top;}
.header{color:white;text-align:center;font-size:24px;
width:100%; height:320px; 
background-image:linear-gradient(rgba(3, 9, 9, 0.9),rgba(0, 0, 0, 0.0));
}


.titoloAggiungi{width:100%;font-size:50px;text-align:center;color:white;box-shadow: inset 2px 2px 2px grey;margin-bottom:20px;}
body {width:100%; height:100%;font-family:'Nunito', sans-serif;}
.main {font-family: 'Walter Turncoat', corsive;width:40%; font-size:50px; 
		margin-left:27%; padding-top: 1.5%;margin-right:10%;}
.span {margin:5%; }
.letter {padding-left:2%;padding-right:2%;color:#337af1;border:1px solid #337af1; 
		border-radius:300px;font-weight: bold;background: linear gradient(168deg, floralwhite, transparent);}
.letter1 {padding-left:3.2%;padding-right:3.2%; color:#337af1;border:1px solid #337af1; border-radius:300px;font-weight: bold;}

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
      	
      	

.corpoCentrale {width:100%;
		background-image:url("https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1"); 
		background-size:cover;opacity:1;
		 right: 0; bottom: 0; min-height: 100%;
		 height: auto; z-index: -100;background-repeat: repeat-y,repeat-x;}


.contenitoreDatiRicerca{text-align:center;color:white;}





.BottoneConferma{margin-top:20px;width:100%;}
.submitConferma{text-align:center;color:black; width:90px;border-radius:10px;
			margin-bottom:5%;padding:5px; margin-left:47%;margin-right:70%;}
			.submitConferma:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
		



.inpsel{margin-left:35%;margin-right:35%;width:30%;border-radius:5px;box-shadow:0 0 0 0;}



.due{margin-left:25%;width:50%;color:white;}


.film{color:white;width:140px;height:300px;
text-align:center;float:left;margin:30px;border-radius:10px;box-shadow:0 0 15px 5px black;}

input{box-shadow:0 0 15px 5px black;border-radius:10px;}





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
//ArrayList per avere contenitore dei film delle varie queries senza creare doppioni.
	ArrayList<String> filmTrovati = new ArrayList<String>();
	
//Effettuo la connessione al db
	Connection con = Main.connect();


//Booleani per effettuare le determinate queries al db solo se necessarie
boolean bTitolo = false, bAnno = false, bGenere = false, bRegista = false, bAttore = false, bStato = false, bMood = false; 

//bWhere e Counter servono allo stringbuilder per costruire la stringa sql in maniera efficiente
//WHERE serve allo SB per aggiungere il WHERE qualora almeno una condizione fosse presente.
boolean bWhere = false;

//Counter serve invece inserire un AND operator qualora ci fosse più di una condizione da rispettare.
int counter = 0;

String titolo = null, anno = null, anno2 = null, genere = null, regista = null, attore = null, stato = null, mood = null;

//Se il parametro titolo è diverso da null ed è maggiore di 0(non è uno spazio vuoto) -> dai ad i campi i parametri inseriti dall'utente, setta il corrispettivo booleano a true per far capire al codice che esiste un filtro per la ricerca e di conseguenza setto bWhere a true ed aumento il counter
//Qualora il parametro fosse null, -> dagli un valore vuoto (In modo tale che le condizioni non compilate non abbiano il valore "null" nel textfield)
if(request.getParameter("titolo")!=null && request.getParameter("titolo").length()>0){titolo = request.getParameter("titolo"); bTitolo = true; bWhere = true; counter++;}else{titolo = "";}
if(request.getParameter("anno")!=null && request.getParameter("anno").length()>0){anno = request.getParameter("anno"); bAnno = true; bWhere = true; counter++;}else{anno=""; anno2="";}
if(request.getParameter("anno2")!=null && request.getParameter("anno2").length()>0){anno2 = request.getParameter("anno2"); bAnno = true; bWhere = true; counter++;}else{genere = "";}
if(request.getParameter("genere")!=null && request.getParameter("genere").length()>0){genere = request.getParameter("genere"); bGenere = true; bWhere = true; counter++;}else{genere = "";}
if(request.getParameter("regista")!=null && request.getParameter("regista").length()>0){regista = request.getParameter("regista"); bRegista = true; bWhere = true; counter++;}
if(request.getParameter("attore")!=null && request.getParameter("attore").length()>0){attore = request.getParameter("attore"); bAttore = true; bWhere = true; counter++;}
if(request.getParameter("stato")!=null && request.getParameter("stato").length()>0){stato = request.getParameter("stato"); bStato = true; bWhere = true; counter++;}
if(request.getParameter("mood")!=null && request.getParameter("mood").length()>0){mood = request.getParameter("mood"); bMood = true; bWhere = true; counter++;}


//StringBuilder per costruire la query in base a quelli che sono i miei canoni.
StringBuilder finalQuery = new StringBuilder();

//Una Query completa con join su tutte le tabelle
finalQuery.append("SELECT * FROM film JOIN tfilm_attori ON(tfilm_attori.IDfilm = film.IDfilm) JOIN tattori ON(tfilm_attori.IDattore = tattori.IDattore) JOIN tfilm_generi ON(tfilm_generi.IDfilm = film.IDfilm) JOIN tgeneri ON(tgeneri.IDgenere = tfilm_generi.IDgenere) JOIN tregisti ON(tregisti.IDregista = film.IDregista) JOIN tmood ON(tmood.IDmood = film.IDmood) JOIN tstato ON(tstato.IDstato = film.IDstato)");

//Inserisco un WHERE nella query qualora l'esistenza di un parametro abbia settato il booleano a true
if(bWhere){finalQuery.append(" WHERE ");}

//Se Titolo è stato inserito ed è maggiore di 0 (Poichè inviare la query coi campi vuoti andava a corrompere la query sql)
if(bTitolo && titolo.length()>0){
	finalQuery.append("film.Titolo LIKE '%"+ titolo +"%'");
	if(counter>1){
		finalQuery.append(" AND ");
	}	
}
//Una query di operazione sull'anno compreso tra x ed y
if(bAnno && anno.length()>0 && anno2.length()>0){
	finalQuery.append("film.Anno > '"+ anno +"' AND film.Anno < '"+anno2+"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Genere
if(bGenere && genere.length()>0){
	finalQuery.append("tfilm_generi.IDgenere = '"+ genere +"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Regista
if(bRegista && regista.length()>0){
	finalQuery.append("film.IDregista = '"+ regista  +"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Attore
if(bAttore && attore.length()>0){
	finalQuery.append("tfilm_attori.IDattore = '"+ attore +"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Tag
if(bStato && stato.length()>0){
	finalQuery.append("film.IDstato = '"+ stato +"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Mood
if(bMood && mood.length()>0){
	finalQuery.append("film.IDmood = '"+ mood +"'");
	if(counter>1){
		finalQuery.append(" AND ");
	}
}

//Query (semi)finale che andrà a trovarmi tutti i record in base alle condizioni inserite dall'utente
String finalSql = null;

//Questo poichè L'AND per risparmiare un codice molto verboso viene messo alla fine di ogni condizione inserita e dunque viene tagliato da questo taglio finale
if(counter>1){
finalSql = finalQuery.substring(0, finalQuery.length()-5);
}else{
	finalSql = finalQuery.toString();
}



//Prende i vari attori/registi/generi dalle tabelle
String sql2_regista = "SELECT * from tregisti";
String sql3_attore = "SELECT * from tattori";
String sql4_generi = "SELECT * from tgeneri";

//Creo diversi Statement per leggibilità del codice e per non causare possibili interferenze
Statement stmt2 = con.createStatement();
Statement stmt3 = con.createStatement();
Statement stmt4 = con.createStatement();
Statement stmtGeneri = con.createStatement();
Statement finalStmt = con.createStatement();
Statement resultStmt = con.createStatement();

//Creo diversi ResultSet per leggibilità del codice e per non causare possibili interferenze col codice
ResultSet res2 = stmt2.executeQuery(sql2_regista);
ResultSet res3 = stmt3.executeQuery(sql3_attore);
ResultSet res4 = stmt4.executeQuery(sql4_generi);
ResultSet finalRes = finalStmt.executeQuery(finalSql);
ResultSet resultRes = null;


//Mi ciclo tutti i record trovati dalla query finale per evitare i doppioni generati ed aggiungo all'array gli id che ciclerò dopo
		while(finalRes.next()){
			if(!filmTrovati.contains(finalRes.getString("IDfilm"))){
			filmTrovati.add(finalRes.getString("IDfilm"));			
			}
		}
//Se sono stati trovati dei record inizializza uno StringBuilder
if(!filmTrovati.isEmpty()){
StringBuilder ResultQuery = new StringBuilder();

//Query SQL in costruzione per ciclare l'array
String result = "SELECT * FROM film WHERE IDfilm in (";
ResultQuery.append(result);

for(int i=0; i<filmTrovati.size();i++){
	//Se film simili ha più di un record allora SQL vuole le virgole tra un id e l'altro nella sintassi e quindi:
	if(filmTrovati.size()>1){
	ResultQuery.append(filmTrovati.get(i)+", ");
	}
	
	//Se il film ha un solo record la sintassi non richiede virgole.
	if(filmTrovati.size()==1){
		ResultQuery.append(filmTrovati.get(i));
		
	}

}


//Ultima modifica alla query finale con più di 2 record poichè nell'ultimo record virgola e spazio verranno inserite comunque e vanno rimosse
if(filmTrovati.size()>1){
	ResultQuery.delete(ResultQuery.length()-2,ResultQuery.length());
	}

//Chiudo la parentesi aperta all'inizializzazione di finalQuery e ci aggiungo un ORDER BY RAND per mostrare i filmSimili in ordine casuale.
ResultQuery.append(")  ORDER BY RAND ();");

//Query finale : SELECT * from film WHERE IDfilm in(IDfilmSimili1, IDfilmSimili2, IDfilmSimili3) ORDER BY RAND();
result = ResultQuery.toString();
resultRes = resultStmt.executeQuery(result);
}

//---------------------------------------------------------- GENERI

ResultSet resGeneri = stmtGeneri.executeQuery(sql4_generi);


%>
<meta charset="ISO-8859-1">
<title>Ricerca Avanzata - </title>
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
	
	 <div class=titoloAggiungi>Ricerca Avanzata</div>
<form action = 'RicercaAvanzata.jsp' method='get'>

 <div class=contenitoreDatiRicerca> 


<p class=due>   Titolo: </p> <input class=inpsel type="text" name="titolo" placeholder= '<%= titolo %>' /> 
<p class=due>   Anno  </p> <input  class=inpsel type="text" name="anno" placeholder="da '<%= anno %>' "/> <p><input  class=inpsel type="text" name="anno2" placeholder="a '<%= anno2 %>'" /> </p>


 <p class=due>  Genere: </p><select  class=inpsel name="genere" > 
 
       <option selected> <%= genere %> </option>
       
       <% //Ciclo tutta la tabella dei generi creando tante options per il select quanti sono i record di generi nella nostra table
       while(res4.next()){
    	   out.print("<option value='"+res4.getString("IDgenere")+"'>"+res4.getString("Genere")+"</option>");}
       %>
       </select>
 <p class=due>  Regista: </p><select   class=inpsel name="regista"> 
       <option></option>
       <% //Ciclo tutta la tabella dei registi creando tante options per il select quanti sono i record di registi nella nostra table
       while(res2.next()){
    	   out.print("<option value='"+res2.getString("IDregista")+"'>"+res2.getString("Regista")+"</option>");}
        %>
       
       </select>
 <p class=due>  Attore: </p> <select   class=inpsel name="attore" > 
       <option></option>
       <% //Ciclo tutta la tabella degli attori creando tante options per il select quanti sono i record di attori nella nostra table
       while(res3.next()){
    	   if(!res3.getString("IDattore").equals(attore)){
    	   out.print("<option value='"+res3.getString("IDattore")+"'>"+res3.getString("Attore")+"</option>");}
       }%>
       </select> 
       
 <p class=due>  Tag: </p> <select    class=inpsel name="stato"> 
       <option></option>
       <option value="1">Visto</option>
       <option value="2">Non Visto</option>
       <option value="3">Da Guardare</option>
       <option value="5">Da Riguardare</option>
       <option value="6">Da Finire</option>
       <option value="4">Droppato</option>
       </select> 
  <p class=due>  Mood: </p> <select  class=inpsel name="mood"> 
       <option></option>
       <option value="1">Relax</option>
       <option value="2">Famiglia</option>
       <option value="3">Spensierato</option>
       <option value="4">Tristezza</option>
       <option value="5">Romantico</option>
       <option value="6">Suspense</option>
       <option value="7">Rabbia Repressa</option>
       </select>
            </div>
                    <div class="BottoneConferma"> <input type=submit class=submitConferma>
</div>                                             
             </form>


 
        


<% while(resultRes.next()){
	out.println(Main.stampaDiv(resultRes.getString("IDfilm"), resultRes.getString("Immagine"), resultRes.getString("Titolo")));
}


while(resGeneri.next()){
	if(genere.equalsIgnoreCase(resGeneri.getString("IDgenere")))
	out.println("<a href='RicercaAvanzata.jsp?titolo=&anno=&anno=&genere="+resGeneri.getString("IDgenere")+"&regista=&attore=&stato=&mood='>"+resGeneri.getString("Genere")+"</a>");
}

	con.close();
%>

<div class="footer">	
	<input type="submit" value="Indietro"id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>

</body>
</html>