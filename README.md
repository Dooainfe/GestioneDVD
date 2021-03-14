# GestioneDVD

Il progetto mira a sviluppare un catalogo personale di Film la cui gestione avvenga esclusivamente dal sito stesso pertanto sono disponibili funzioni base come:
-Aggiungi Film
-Modifica Film
-Rimuovi Film
-Ricercare un titolo presente nel catalogo

Ovviamente ciascuna di queste funzioni è stata ottimizzata al meglio e comunica con tutte e 9 le tables presenti nel database.

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

Enjoy :D
