# GestioneDVD

Il progetto mira a sviluppare un catalogo personale di Film la cui gestione avvenga esclusivamente dal sito stesso pertanto sono disponibili funzioni base come:
-Aggiungi Film
-Modifica Film
-Rimuovi Film
-Ricercare un titolo presente nel catalogo

Ovviamente ciascuna di queste funzioni è stata ottimizzata al meglio e comunica con tutte e 9 le tables presenti nel database.
*************************************************************************************************************************************************************************
Alcune delle modifiche apportate:

-La ricerca generale trova i titoli anche per regista o attore oltre che per titolo.
-Aggiungi e Modifica hanno funzioni di autocompilazione per aiutare l'utente a non inserire eventuali doppioni di registi o attori

Sono state inoltre aggiunte complessivamente alcune funzioni aggiuntive a tutto il progetto quali:

-Ricerca Avanzata: Permette all'utente di effettuare una ricerca applicando molteplici filtri ad essa

-Tool di importazione rapida dei records nel database in maniera coerente in tutte le tabelle esistenti.

-Film Simili: Nel momento in cui si va a vedere la scheda di dettaglio di un film, verranno automaticamente trovati dei film simili e che condividono col film parametri come Genere, Regista, Attore principale

-Citazione Randomica: Nella pagina del Catalogo verrà stampata a schermo una frase random presa dalla tabella citazioni e, qualora il film della citazione fosse presente in Catalogo, si genererà automaticamente anche l'href che reindirizza alla scheda del film.

-Valutazione dinamica: La quasi totalità dei campi presenti nella scheda di dettaglio del film è "statica" perchè presa dal Database, la valutazione al contrario viene prelavata automaticamente dalla pagina imdb relativa al film in modo automatico ed è pertanto dinamica, come dovrebbe essere after all.

Nessuna istruzione particolare nell'utilizzo se non quella di star attenti a configurare i vari classpath con particolare attenzione alle libs di Jsoup e del connettore jdbc poichè vanno inseriti nella directory WEB-CONTENT/WEB-INF/lib
*************************************************************************************************************************************************************************
La traccia richiedeva di aggirare inoltre la staticità imposta dalle Java server pages, la problematica è stata aggirata implementando delle jsp "cuscinetto" quali:
Aggiungi.jsp -> AddResult.jsp
Modifica.jsp -> ModifyResult.jsp
Cancella.jsp -> CancelResult.jsp

Tuttavia abbiamo anche deciso di proporre una seconda soluzione facendo URL rewriting come in RicercaAvanzata.jsp piuttosto che usare una corrispettiva pagina cuscinetto.
*************************************************************************************************************************************************************************
                                                                  In merito al Package utility
ImportMain.java è il tool creato ad hoc per inserire i record in maniera facile e veloce sfruttando quella che è la sintassi default di un file.csv (campi delimitati da ";" senza spazio alcuno)

Main.java contiene invece:
connect() -> ritorna la connessione jdbc al jsp e risparmiandoci molteplici righe di codice in ciascun .jsp
stampaDiv() -> Ci stampa automaticamente un div con Titolo, Immagine e l'href alla sua pagina in base all'id rendendo quindi il codice meno verboso e più leggero
estraiValore() -> è il metodo che si connette automaticamente alla valutazione di IMDB , preleva il Titolo del film di cui vogliamo guardare i dettagli e si costruisce automaticamente un url di query su imdb, dopodichè prende l'URL del result più consono alla ricerca ed il metodo effettua una seconda estrazione dell'HTML del nuovo url e viene estratta quindi la valutazione del film. Utilizza la libreria Jsoup.
*************************************************************************************************************************************************************************


Enjoy :D
