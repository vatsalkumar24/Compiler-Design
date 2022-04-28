%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}
%%
select					return SELECT;
from					return FROM;
where					return WHERE;
like                    return LIKE;
desc                    return DESC;
asc                     return ASC;
"group by"              return GROUP;
having                  return HAVING;
"order by"              return ORDER;
or                      return OR;
and                     return AND;
[0-9]+                  return NUM;
[a-zA-Z][a-zA-Z0-9]+	return ID;
[*]						return *yytext;
[,]						return *yytext;
[=]						return *yytext;
[<=]                    return LE;
[]>=]                   return GE;
[!=]                    return NE;
\n						return *yytext;
[ \t]+					/* ignore whitespace */;
.                       return yytext[0];
%%