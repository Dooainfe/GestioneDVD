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
    width:60%;height:40%; margin:13% 10% 10% 20.5%;}
    
    .divEmail {width:36%;  float:left; margin-left:11%;margin-top: 3.5%;}
    #nome {font-size:30px;margin-right: 8%;text-shadow:1px 1px black;}
    #mail {width:30px;height:30px;  float:left;margin-top:4px;}
    #link {text-shadow:1px 1px black;cursor: pointer;}
    .divLinkedin {width:39%; float:right;margin-right:10%;margin-top: 3.5%;}
    #nome1 {font-size:30px;margin-right: 8%;text-shadow:1px 1px black;}
    #linkedin {width:30px;height:30px;  float:left;margin-top:4px;}
    #link1{text-shadow:1px 1px black; cursor: pointer;}
    
.footer {background-color: #212329;
    padding-bottom: 2rem 0 4 rem 0;
  background: rgba(0, 0, 0, 0.5);color: #f1f1f1;border-radius:10px;
    width:100%;height:50px; display:flex;margin-top: 450px;padding:1.5%;margin-bottom:0;}
.aboutUs {margin-top:10px; border-radius:20px;
		margin: auto;color:white; float:left;width:10%;}
#btnIndietro {width:7%; margin:auto; float:left;height: 30px;border-radius: 20px;background-color: #212329;
			outline: none;border:none;color: #fff;font-size: 1.2rem;}
#btnIndietro:hover{cursor:pointer;background-color:#337af1;transition: all 0.4s ease-out;}
.contactUs {color:white;  float:left;  width:10%; border-radius:20px;
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
 
 <div class="testo">
 <div class="divEmail">
 	<span id="nome">Inviaci una mail:</span>
 	 <img  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAAAVFBMVEUejL7///9kr9KAvtrU6fIrksErlMHG4u6Oxd7x+PtOpMuHwdzf7vU2mMWVyeBFoMmiz+Tp9PnO5vGu1uf2+vxutNW62+t4uthcq9Cq0+bj8fdAncebHavNAAACz0lEQVR4nO3b23KCMBAG4AVBKiiIYrHt+79nDQmBSMIhLOy0s3vRmZ74Pyu1yaYLAXEBA8x3b3kdblp1fnMDyiyGHSrOSjsg3yW+IeQWwCndK17U8/QOKIs98wGK0gRUuz5+UWllAA575wMc+oBo/3yAqAcIKQBhBygp8gFKDbjSAK4a8KABPDRg59eAtgoNONIAjtSAmAEMYAADGMAABjCAAX8DcAzrg3fV4VjPYQ7gcg9W1v2yBtD1Efzr9PQHFNX6/CCoXPueaYDcQFeRb52lwLX5nwQ81UPIXD/DqfpUF3A8CZMA3cvyFLT5Qe4JEBdITt6CJv/29Xrz6QlIXp/6SH0FMj/+EI9iDQA8BSof1gP8BHeVjwHwEeh8FMByQZePA1gqaPIj+XcIB7BMIPPVRZEASwRGPhpgvsDMxwPMFVzNfETAPMF7PiZgjmCQjwqYFgzzcQFTAks+MmBcYMvHBowJrPnoALcgt+bjA1yCJv883ATgA+wCV/4WAJvAmb8JYChw528DUOeuWiDX74l1I7oFQJ/7Zv18h2ADQJNfNc9Cc+KbBcGIAB8g80N5H9Qq/3xwCdABKr+9E7/u6v57VHYBNkDntwJ9/4d2ATJA3n/qpLUVqN8/uwAXYOS3Av37/7QJNliQPMwP9F5/ZEfHFOAvyYyT7vQ7uQy+whCgL0rHT9rT8l2AvSyfOukv3gXIG5N6In8owN2aTecD/JgC1M3pnPyX4NwXYG7P5+UDXPoCxAbF3PyXIOoEawCiz3T1yAc4dgKxWPdt04mFRhl7NamONyWIxS3p26hsWrVJ6NWmi6XgRzyN3q1a1awWtbxhfdbf69+spm/Xkx9Y0B/ZwOpDq7FL/5FjOwYwgAEMYAADGMAABvxnQPfv/eQDDuQjHuRDLuRjPuSDTvSjXuTDbvTjfuQDj2N9hC1qOPIZkA+9BvRjv6JoB59JigG/WkUuZFUoKfgAAAAASUVORK5CYII=" id="mail"/> 
 	<a  href="mailto:antonio.piga93@gmail.com" id="link">antonio.piga93@gmail.com</a>
 	<a  href="mailto:claudia.andriani@tim.it" id="link">claudia.andriani@tim.it</a>
 	<a  href="mailto:kevin.farella@outlook.it" id="link">kevin.farella@outlook.it</a>
 	<a  href="mailto:frossini96@outlook.it" id="link">frossini96@outlook.it</a>
 	</div>
 	<div class="divLinkedin">
 	 <img src="https://iconarchive.com/download/i54049/danleech/simple/linkedin.ico" id="linkedin"/>  
 	<span id="nome1">Visita i nostri social:</span>
 	<a href="https://www.linkedin.com/in/antonio-piga-62a52117b/" target="_blank" id="link1">Antonio Piga</a>
 	<a href="https://www.linkedin.it/claudiandriani/" target="_blank" id="link1">Claudia Andriani</a>
 	<a  href="https://www.linkedin.com/in/kevin-farella/" target="_blank" id="link1"> Kevin Farella</a>
 	<a  href="www.linkedin.com/in/-rossini-fabrizio" target="_blank" id="link1">Fabrizio Rossini</a>
	</div>
 		
 
  </div>
 	
	</div>

	<div class="footer">	
	<input type="submit" value="Indietro" id="btnIndietro" onClick="history.go(-1);return true;">
<div class="aboutUs"><a href="AboutUs.jsp">About Us</a></div>
	<div class="contactUs"><a href="ContactUs.jsp">Contact Us</a></div>

	</div>



</body>
</html>
