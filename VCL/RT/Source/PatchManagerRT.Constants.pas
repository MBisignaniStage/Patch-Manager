unit PatchManagerRT.Constants;

interface
uses
  spring.Collections;

const

{VALIDATED QUERY Regex}

VALIDATED_CREATE_REGEX = 'IF\s+OBJECT_ID' +
                          '\s*+\(\s*+\''\s*+(?:\[?\s*\w+\s*+]?\.)?\[?\w+\]?\s*+''' +
                          '\s*+\,\s*+\''\s*+U\s*\''\s*+\)\s*+IS\s+NULL' +
                          '\s*+BEGIN' +
                          '\s+(.*?)' +
                          '\s*+END';
VALIDATED_ADDCOLUMN_REGEX =
                          'IF\s+COLUMNPROPERTY\s*+\(\s*+OBJECT_ID' +
                          '\s*+\(\s*+\''\s*+(?:\[?\s*\w+\s*+]?\.)?\[?\s*\w+\s*+]?' +
                          '\s*+\''\s*+\,\s*+\''\s*+U\s*\''\s*+\)\s*+\,' +
                          '\s*+\''\s*+\w+\s*+\''\s*+\,' +
                          '\s*+\''\s*+\w+\s*+\''\s*+\)\s*+IS\s+NULL' +
                          '\s*+BEGIN' +
                          '\s+(.*?)' +
                          '\s+END';
VALIDATED_CREATEVIEW_REGEX =
                          'IF\s*+\(\s*+OBJECT_ID\s*+\(' +
                          '\s*+N\''\s*+\[?\s*+\w+\s*+\]?\s*+\''\s*+\,' +
                          '\s*+N\''\s*+V\s*+\''\s*+\)\s*+IS\s+NULL\s*+\)' +
                          '\s*+exec\s*+\(\s*+\''\s*+(.*?)\s*+\''\s*+\)';
VALIDATED_ADDFOREIGNKEY_REGEX =
                          'IF\s+OBJECT_ID\s*+\(''\[?\s*\w+\s*+]?''\s*+\)' +
                          '\s*+IS\s+NULL\s*+BEGIN\s+(.*?)\s+END';
VALIDATED_INSERTINTO_PARDEF_REGEX =
                          '(.*?)\bAND\b';

{NOVALIDATED QUERY FORMAT}

NOVALIDATED_CREATE_DB = 'IF OBJECT_ID(''dbo.%s'',''U'')IS NULL' + sLineBreak +
                                  'BEGIN' + sLineBreak +
                                   '%s' + sLineBreak +
                                   'END';
NOVALIDATED_CREATE_NODB = 'IF OBJECT_ID(''%s.%s'',''U'')IS NULL' + sLineBreak +
                                  'BEGIN' + sLineBreak +
                                   '%s' + sLineBreak +
                                   'END';
NOVALIDATED_FOREIGNKEY = 'IF OBJECT_ID(''[%s]'')IS NULL' + sLineBreak +
                                  'BEGIN' + sLineBreak +
                                  '%s' + sLineBreak +
                                  'END';
NOVALIDATED_ADDCOLUMN_DB = 'IF COLUMNPROPERTY(OBJECT_ID(''%s'',''U''),' +
                                      '''%s'',''Columnid'') IS NULL' + sLineBreak +
                                      'BEGIN' + sLineBreak +
                                      '%s' + sLineBreak +
                                      'END';
NOVALIDATED_ADDCOLUMN_NODB = 'IF COLUMNPROPERTY(OBJECT_ID(''%s.%s'',''U''),' +
                                      '''%s'',''Columnid'') IS NULL' + sLineBreak +
                                      'BEGIN' + sLineBreak +
                                      '%s' + sLineBreak +
                                      'END';
NOVALIDATED_CREATEVIEW =  'IF (OBJECT_ID(N''[%s]'',N''V'') is null)' + sLineBreak +
                          'exec(''%s'')';

NOVALIDATED_INSERT_PARDEF = '%s' + sLineBreak +
                            'AND' + sLineBreak +
                            ' (NOT EXISTS (SELECT ID FROM Pardef WHERE (Chiave=''%s'')))';


{REGEX}

CREATE_REGEX = 'create\s+table\s+(?:\[?(\w+)\]?\.)?\[?(\w+)\]?';

CREATE_REGEX_NODB = 'create\s+table\s+(?:\[?\w+\]?\.)?\[?(\w+)\]?';

ALTER_REGEX = 'alter\s+table\s+(?:\[?\w+\]?\.)?\[?(\w+)\]?';


FOREIGNKEY_REGEX =  'alter\s+table\s+(?:\[?\w+\]?\.)?\[?(\w+)\]?' +
                    '\s+with\s+check\s+add\s+constraint\s+\[?(\w+)\]?' +
                    '\s+foreign\s+key\s*+\(\[?(\w+)\]?\)'+
                    '\s*+references\s+(?:\[?\w+\]?\.)?\[?(\w+)\]?\s*+\(\[?(\w+)\]?\)';


ADDCOLUMN_REGEX = 'alter\s+table\s+(?:\[?(\w+)\]?\.)?\[?(\w+)\]?' +
                  '\s+add\s+\[?(\w+)\]?\s+\w+\s+constraint' +
                  '\s+\[?(\w+)\]?\s+foreign\s+key\s*+\(\[?(\w+)\]?\)'
                  +'\s*+references\s+(?:\[?\w+\]?\.)?\[?(\w+)\]?\s*+\(\[?(\w+)\]?\)';

CREATEVIEW_REGEX =  'create\s+view\s+' +
                    '(?:\[?\w+\]?\.)?\[?(\w+)\]?';

CREATEVIEW_NAME_REGEX = 'vw_([A-Za-z][\w]*)\b';

INSERT_PARDEF_REGEX = 'insert\s+into\s*+(?:\[?\w+\]?\.)?\[?\s*+PARDEF\]?' +
                      '\s*+.*\s*+select\s*+\''\s*+([^'' ]*)';


{Json file Fields}

DATA_CREAZIONE_NAME = 'Created';
DATABASE_TYPE_NAME = 'DBType';
ID_PATCH_ADT_NAME = 'ID';
DESCRIPTION_PATCH_NAME = 'Description';
COMMAND_PATCH_NAME =  'Command';
ID_PATCH_NAME = 'PatchID';
PATCHES_ROOT_NAME = 'Patches';

{JSON file name}
JSON_FILE_NAME = 'Prova.json';


{CONFIG file Fields}
JSONFILEDIR_FIELD_NAME = 'JsonDir';
LOGFILEDIR_FIELD_NAME = 'LogDir';
SERVER_FIELD_NAME = 'Server';
USERNAME_FIELD_NAME = 'User_name';
PASSWORD_FIELD_NAME = 'Password';
DATABASE_FIELD_NAME = 'Database';

{CONFIG file name}

CONFIG_FILE_NAME = 'Config.json';


{format date}
FORMAT_DATE_JSON = 'yyyy-mm-dd hh:nn:ss.zzz';

{DATABASE TYPES}
DATABASES: array[0..2] of string = ('Aziendale', 'Configurazione', 'Statistiche Avanzate');




implementation

end.
