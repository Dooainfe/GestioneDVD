package utility;

import java.sql.*;
import java.sql.Connection;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;


public class Main {
	
	//Effettua la connessione al db
	public static Connection connect() {
		
		try{
			
			//Registro il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Passo l'indirizzo del db
			String url = "jdbc:mysql://localhost:3306/Gestionedvdfinal";
			
			
			Connection con = DriverManager.getConnection (url, "root", "");
		
		
		return con;
	}catch(Exception s) {return null;}
	
}
		//Il metodo ritorna il codice html per il div con integrati gli id e l'url dell'immagine passati da Index.jsp in un'unica stringa.
	public static String stampaDiv(String id, String Immagine, String titolo) {
		
		return  "<div class='film'><form action='Film.jsp' method='post'><input type='hidden' value="+ id +" name='ID'><input type='image' src="+ Immagine +"><p class=descrizione> " + titolo +"</p></form></div>";
		}	

	
	//Metodo che recupera la valutazione del film da imdb.
	public static String estraiValore(String query) {
		
		//Sistemo la query(Titolo del film) per affinarla a quella che imdb vuole nella sua ricerca
        query = query.replaceAll(" ","+");
        query = query.replaceAll("&", "%26");

        //url in cui s=tt filtra la ricerca ai soli film e q= il titolo che si cerca
        String url ="https://www.imdb.com/find?s=tt&q="+query;
        String baseUrl ="https://www.imdb.com/";
        try {
        	//Mi collego al sito e ne estraggo tutto il contenuto della pagina html
            Document doc = Jsoup.connect(url).get();
            
            	//Prendo l'elemento necessario a ottenere l'href del primo titolo che imdb trova nella ricerca
                Element element3 = doc.selectFirst("#main > div > div.findSection > table > tbody > tr.findResult.odd > td.result_text > a");

                	//Preso l'href mi costruisco l'URL con l'indirizzo della pagina esatta del film automatizzando così il processo
                    StringBuilder sb = new StringBuilder();
                    sb.append(baseUrl);
                     sb.append(element3.attr("href"));
                     
            Document doc1 = Jsoup.connect(sb.toString()).get();

            //Prendo l'html selector della valutazione
            Element element4 = doc1.selectFirst("#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > div.ratingValue > strong");
            
            //La valutazione complessiva basata su n recensioni si trova nel tag <strong title=(valutazione)>
            String finalValue = element4.attr("title");
            
            
            return finalValue;
            

        }catch(Exception exception){
            exception.printStackTrace();
            return "Valutazione non trovata";
        }
    }
	
	
	
	}


	
	