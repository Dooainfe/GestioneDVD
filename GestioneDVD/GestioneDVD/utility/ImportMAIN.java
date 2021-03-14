package utility;


import org.apache.commons.lang3.StringUtils;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;



public class ImportMAIN {
    public static void main(String[] args) {
        try {

            //Registro il connettore
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Effettuo la connessione al database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionedvdfinal", "root", "");

            //Creo dei diversi Statement per ciascuna colonna/table per leggibilità di codice e necessità(Vedi idStmt)
            Statement stmtAttori = con.createStatement();
            Statement stmtRegisti = con.createStatement();
            Statement idStmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Statement stmtFilm = con.createStatement();

            //Dichiaro i campi per i vari values
            String titolo, durata, anno, regista, attore1, attore2, IDmood, IDstato, IDgenere, immagine;

            //Dichiaro i campi che faranno da indice per ritagliare i valori correttamente
            int indexOfTitolo, indexOfDurata, indexOfAnno, indexOfRegista, indexOfAttore1, indexOfAttore2, indexOfMood, indexOfStato, indexOfImmagine;
            int counter = 0;

            //Dichiaro i campi per gli ID dei record nel momento in cui li inserisco
            String IDattore1 = null, IDattore2 = null, IDregista = null;

            //Dico al BuffereReader di leggere RecordDaInserire.txt
            BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\Ryzen\\Desktop\\RecordDaInserire.txt"));


            String fraseRecord;

            //fraseRecord è uguale alla prossima riga (in maniera progressiva) finchè non finiscono
            while((fraseRecord=br.readLine())!=null){

                //Assegno alla variabile l'indice di ; nella stringa fraseRecord
            indexOfTitolo = fraseRecord.indexOf(";");

            //Attraverso il metodo ordinalIndexOf della libreria StringUtils assegno ai vari campi l'indice di n ;
            indexOfRegista = StringUtils.ordinalIndexOf(fraseRecord, ";", 2);
            indexOfAnno = StringUtils.ordinalIndexOf(fraseRecord, ";", 3);
            indexOfDurata = StringUtils.ordinalIndexOf(fraseRecord, ";", 4);
            indexOfMood = StringUtils.ordinalIndexOf(fraseRecord, ";", 5);
            indexOfStato = StringUtils.ordinalIndexOf(fraseRecord, ";", 6);
            indexOfImmagine = StringUtils.ordinalIndexOf(fraseRecord, ";", 7);
            indexOfAttore1 = StringUtils.ordinalIndexOf(fraseRecord, ";", 8);
            indexOfAttore2 = StringUtils.ordinalIndexOf(fraseRecord, ";", 9);



            //Qui uso gli indici creati prima per "ritagliarmi" il valore dalla linea intera
            titolo = fraseRecord.substring(0, indexOfTitolo);
            regista = fraseRecord.substring(indexOfTitolo + 1, indexOfRegista);
            anno = fraseRecord.substring(indexOfRegista + 1, indexOfAnno);
            durata = fraseRecord.substring(indexOfAnno + 1, indexOfDurata);
            IDmood = fraseRecord.substring(indexOfDurata + 1, indexOfMood);
            IDstato = fraseRecord.substring(indexOfMood + 1, indexOfStato);
            immagine = fraseRecord.substring(indexOfStato + 1, indexOfImmagine);
            attore1 = fraseRecord.substring(indexOfImmagine + 1, indexOfAttore1);
            attore2 = fraseRecord.substring(indexOfAttore1 + 1, indexOfAttore2);
            IDgenere = fraseRecord.substring(indexOfAttore2 + 1);

            System.out.println(titolo);
            System.out.println(regista);
            System.out.println(anno);
            System.out.println(durata);
            System.out.println(IDmood);
            System.out.println(IDstato);
            System.out.println(immagine);
            System.out.println(attore1);
            System.out.println(attore2);
            System.out.println(IDgenere);


            System.out.println("-------------------------------");
        counter++;

        System.out.println("Record n: "+counter);

        //SE il valore assegnato ad attore1 contiene un'apice Mysql avrà problemi a leggerlo
            if(attore1.contains("'")){

            //Quindi creo uno StringBuilder e appendo immediatamente dopo l'apice, un altro apice in modo tale da non generare nessuna eccezione(Documentazione MySql)
            StringBuilder sb = new StringBuilder();
            sb.append(attore1);
            sb.insert(sb.indexOf("'"),"'");
            attore1 = sb.toString();
            }

            if(attore2.contains("'")){
                StringBuilder sb = new StringBuilder();
                sb.append(attore2);
                sb.insert(sb.indexOf("'"),"'");
                attore2 = sb.toString();
            }

                if(regista.contains("'")){
                    StringBuilder sb = new StringBuilder();
                    sb.append(regista);
                    sb.insert(sb.indexOf("'"),"'");
                    regista = sb.toString();
                }

                if(titolo.contains("'")){
                    StringBuilder sb = new StringBuilder();
                    sb.append(titolo);
                    sb.insert(sb.indexOf("'"),"'");
                    titolo = sb.toString();
                }


                //Faccio una query e controllo se nella tabella attori esiste già l'attore presente nel record da inserire
            ResultSet corrispondenzaAttori = stmtAttori.executeQuery("SELECT * FROM tattori WHERE Attore = '"+attore1+"'");
            if(corrispondenzaAttori.next()){
                //SE esiste già, assegna ad IDattore1, l'id passatomi dal db
            IDattore1 = corrispondenzaAttori.getString("IDattore");
            }else{
                //ALTRIMENTI inserisci l'attore nella tabella attori, prelevane l'id appena inserito e dallo ad IDattore1
                stmtAttori.executeUpdate("INSERT INTO tattori (IDattore, Attore) VALUES (NULL, '"+attore1+"')");
                corrispondenzaAttori = stmtAttori.executeQuery("SELECT * FROM tattori WHERE Attore = '"+attore1+"'");
                if(corrispondenzaAttori.next()){
                    IDattore1 = corrispondenzaAttori.getString("IDattore");
                }
            }
                System.out.println("Ho inserito il primo attore del film");

            corrispondenzaAttori = stmtAttori.executeQuery("SELECT * FROM tattori WHERE Attore = '"+attore2+"'");
            if(corrispondenzaAttori.next()){
                IDattore2 = corrispondenzaAttori.getString("IDattore");
            }else{
                stmtAttori.executeUpdate("INSERT INTO tattori (IDattore, Attore) VALUES (NULL, '"+attore2+"')");
                corrispondenzaAttori = stmtAttori.executeQuery("SELECT * FROM tattori WHERE Attore = '"+attore2+"'");
                if(corrispondenzaAttori.next()){
                    IDattore2 = corrispondenzaAttori.getString("IDattore");
                }
            }

                System.out.println("Ho inserito il secondo attore del film");


            //Effettuo la stessa cosa col regista
            ResultSet corrispondenzaRegisti = stmtRegisti.executeQuery("SELECT * FROM tregisti WHERE Regista = '"+regista+"'");
            if(corrispondenzaRegisti.next()){
                IDregista = corrispondenzaRegisti.getString("IDregista");
            }else{
                stmtAttori.executeUpdate("INSERT INTO tregisti (IDregista, Regista) VALUES (NULL, '"+regista+"')");
                corrispondenzaRegisti = stmtRegisti.executeQuery("SELECT * FROM tregisti WHERE Regista = '"+regista+"'");
                if(corrispondenzaRegisti.next()){
                    IDregista = corrispondenzaRegisti.getString("IDregista");
                }
            }
                System.out.println("Ho inserito il regista del film");

            //Effettuo la stessa cosa col titolo per evitare doppioni(Una misura preventiva in più)
            ResultSet corrispondenzaFilm = stmtRegisti.executeQuery("SELECT * FROM film WHERE Titolo = '"+titolo+"'");
            if(corrispondenzaFilm.next()){
                System.out.println("Il Titolo e' stato gia'� inserito.");
            }else{
            String sqlInsertFilm = "INSERT INTO film VALUES(NULL, '"+titolo+"', '"+IDregista+"', '"+anno+"', '"+durata+"', '"+IDmood+"', '"+IDstato+"', '"+immagine+"')";
            stmtFilm.executeUpdate(sqlInsertFilm);}

            //Faccio una query al db con uno statement particolare che mi consente di andare a prendere l'ultimo record inserito e lo assegno ad IDfilm
            ResultSet lastID_film = idStmt.executeQuery("SELECT * FROM film");
            String lastID = null;

            if(lastID_film.last()){
                lastID = lastID_film.getString("IDfilm");
            }
                System.out.println("Ho inserito il film");


            //Qui effettuo tutte gli opportuni insert nelle tabelle usate per le relazioni many to many usando gli ID che mi sono procurato precedentemente
            String sqlInsertGenere = "INSERT INTO tfilm_generi VALUES ('"+lastID+"', '"+IDgenere+"')";
            String sqlInsertAttore = "INSERT INTO tfilm_attori VALUES ('"+lastID+"', '"+IDattore1+"')";
            String sqlInsertAttore2 = "INSERT INTO tfilm_attori VALUES ('"+lastID+"', '"+IDattore2+"')";
            stmtAttori.executeUpdate(sqlInsertAttore);
                System.out.println("Ho inserito il primo attore del film nella tabellacuscinetto");
            stmtAttori.executeUpdate(sqlInsertAttore2);
                System.out.println("Ho inserito il secondo attore del film nella tabellacuscinetto");
            stmtAttori.executeUpdate(sqlInsertGenere);
                System.out.println("Ho inserito il genere del film nella tabellacuscinetto");


                br.close();
            }
        }catch(Exception x){
            System.out.println();
            x.printStackTrace();
        }



    }

}