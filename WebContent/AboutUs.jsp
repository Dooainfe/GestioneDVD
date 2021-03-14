<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1);
		 font-family:'Nunito', sans-serif;text-align:center;}

.header{color:white;text-align:center;width:100%; height:150px;}

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

.Corpocentrale {width:100%;background-color:white;height:900px; 
		background-image:url(https://burst.shopifycdn.com/photos/indoor-brick-wall-texture.jpg?width=4460&height=4460&exif=1&iptc=1); 
		background-position: center center;background-size:cover;opacity:1;
		position: fixed; right: 0; bottom: 0; min-width: 100%; min-height: 100%;
		width: auto; height: auto; z-index: -100;}
		
.testo {background-color: #212329;
    position: absolute; background: rgba(0, 0, 0, 0.5);color: #f1f1f1;border-radius:10px;
    width:60%;height:37%; display:flex; margin:13% 10% 10% 17.5%; padding:3.5%;text-align:center; 
    font-size:20px;text-shadow:1px 1px black; }

.footer {background-color: #212329;
    padding-bottom: 2rem 0 4 rem 0;
  background: rgba(0, 0, 0, 0.5);color: #f1f1f1;border-radius:10px;
    width:100%;height:50px; display:flex;margin-top: 450px;padding:1.5%;margin-bottom:-8px;}
.aboutUs {margin-top:10px;border-radius:20px;
		margin: auto;color:white; float:left;width:10%;}
 #btnIndietro {width:7%; margin:auto; float:left;height: 30px;border-radius: 20px;background-color: #212329;
			outline: none;border:none;color: #fff;font-size: 1.2rem;}
#btnIndietro:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
.contactUs {color:white;  float:left;  width:10%;border-radius:20px;
			margin:auto;margin-top:7px;margin-bottom:0.5%;}
.contactUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}
.aboutUs:hover { cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;color: #151515}

@media (max-width:600px) {
.divMenu {width: 6%;}
.scrittaMenu {font-size:20px;}
li{width:150px;height:80px;}
.main {width:66%; font-size:32px;}
.testo {margin:13% 10% 10% 17.5%; padding:3.5%;}
}
</style>
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Walter+Turncoat&display=swap" rel="stylesheet">
</head>

<div class=header>  

  <div class="divMenu">
        <ul> 
        <li><p class="scrittaMenu"> Menu </p> 
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
 <div class="Corpocentrale">
 
 <div class="testo"><span>Ci presentiamo: siamo Antonio Piga, Kevin Farella, Claudia Andriani 
 e Fabrizio Rossini, quattro ragazzi under 30  appassionati di informatica. <br>
  Se hai bisogno di tenere traccia dei tuoi film, abbiamo quello che fa al caso tuo:
  questo catalogo è stato ideato in modo tale da poter rendere piacevole le tue serate dedicate al cinema
  e fare la scelta giusta. All'interno del sito è possibile accedere all'intera 
  selezione di titoli disponibili con un'apposita sezione dettagliata e, se non dovesse essere presente, 
  potrai aggiungere quanti titoli vorrai alla tua raccolta. <br>E' anche presente una funzione di ricerca avanzata
  in cui selezionare il film in base al mood del momento e ti ricorda se è stato già visto, è ancora 
  da vedere o se hai cominciato a vederlo ma non ti è piaciuto lasciandolo a metà.<br> Buona visione!
   </span> 
   </div>
 </div>
	
	
	<div class="footer">	
	<input type="submit" value="Indietro" id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>
	</div>



</body>
</html>
