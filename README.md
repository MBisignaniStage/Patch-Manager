Progetto
Nome: PatchManager
Descrizione: Programma che si occuperà della creazione di un file Json, contenente informazioni relative alle patch che verranno applicate ai Database in uso dal ERP SAM.

Sommario
Le Patch conterranno le seguenti informazioni(campi):

Created (Data di creazione);
Db-Type : Potrà essere Aziendale, di configurazione o statistiche avanzate
ID (Integer) : Conterrà l'id che verrà generato dalla tabella ADT nel momento dell'inserimento del file Json nel database;
Descrizione (Descrizione della patch);
Command (es. INSERT INTO....);
PatchId: Questo sarà un GUID generato dal programma(es. 334-242-113);
Struttura del file Json
Il nome del file si presenta nella seguente forma: DB-yyyymmddhhnnsszzz
(es. DB-20250514123512003).
Nel nodo principale del file avremo Created e Db-Type comuni a tutte la patch. Successivamente saranno presenti dei sotto nodi dedicati alla varie patch, se più di una, le quali avranno un loro ID, Description, Command e PatchId.
La validazione avverrà con l'esecuzione della patch in un ambiente reale per verificare che possa essere eseguita senza errori.
Ipotizziamo a carico del programma "JSONTOADT" l'aggiornamento del file Json con l'effettivo ID, ricevuto dalla tabella ADT, che inizialmente sarà nullo (a parità di ID la chiave di confronto sarà il PatchId).
L'utilizzo di questa strutturazione è stato motivato per rispettare un ordinamento tra la varie patch, in modo da non avere errori durante l'esecuzione( es. esecuzione di una INSERT prima di una CREATE).
La validazione ci garantisce che le patch possano essere inserite in cascata o singolarmente.
