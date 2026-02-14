unit PatchManagerRT.Messages;

interface

{Query error messages}
resourcestring

DISKLABEL_NAME_UPPERCASE = 'La prima lettera della Disk-Based Table deve essere maiuscola';

CREATEVIEW_NAME_SYNTAX = 'Il nome %s deve seguire la sintassi “vw_ResultSet”.' + sLineBreak +
                            'Consulta le linee guida per sapere la sintassi corretta.';

CREATEVIEW_NAME_UPPERCASE = 'La prima lettera del Result set [%s] deve essere maiuscola.';

FOREIGNKEY_REFERENCE = 'Sembra che %s faccia riferimento a una Foreign key.'+ sLineBreak
                      + 'Usa la sintassi corretta presente sulle linee guida.' + sLineBreak
                      + 'Vuoi Modificarla?';

FOREIGNKEY_NAME_SYNTAX = 'Sintassi della foreign KEY [%s] non valida. '+ sLineBreak +
                          'Usa la sintassi corretta presente sulle linee guida';

UPPERCASE_MISS = 'Uppercase Mancante in : [%s]';

{log message}

LOG_INS_MESSAGE = 'Inserimento di %s effettuato';

ERR_LOG_SAVE_MESSAGE = 'Salvataggio di %s fallito. Codice errore %s';

LOG_SAVE_MESSAGE = 'Salvataggio di %s effettuato in %s';

ERR_LOG_INS_MESSAGE = 'Inserimento di %s fallito. Codice errore : %s';

ERR_SAVE_FILE_LOG = 'Salvataggio del file log fallito';

{validation Errors}

RS_PATCHMANAGER_FIELD_REQUIRED = 'Campo %s mancante';

{DIRECTORY SELECTION}

LOGDIR_SELECTION_MESSAGE = 'Seleziona una directory per il file log';
JSONDIR_SELECTION_MESSAGE = 'Seleziona una directory per il file json';

implementation

end.
