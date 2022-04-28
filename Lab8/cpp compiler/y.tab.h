/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INC = 258,
    INT = 259,
    VOID = 260,
    ID = 261,
    RETURN = 262,
    IF = 263,
    ELSE = 264,
    NUM = 265,
    FOR = 266,
    WHILE = 267,
    ASN = 268,
    SC = 269,
    OPR = 270,
    UNOP = 271,
    UNSPC = 272,
    COUT = 273,
    CIN = 274,
    OUT = 275,
    IN = 276,
    STRNG = 277,
    STRUCT = 278,
    DOUBLE = 279,
    FLOAT = 280,
    CHAR = 281,
    OP = 282,
    CP = 283,
    OCB = 284,
    CCB = 285,
    OSB = 286,
    CSB = 287
  };
#endif
/* Tokens.  */
#define INC 258
#define INT 259
#define VOID 260
#define ID 261
#define RETURN 262
#define IF 263
#define ELSE 264
#define NUM 265
#define FOR 266
#define WHILE 267
#define ASN 268
#define SC 269
#define OPR 270
#define UNOP 271
#define UNSPC 272
#define COUT 273
#define CIN 274
#define OUT 275
#define IN 276
#define STRNG 277
#define STRUCT 278
#define DOUBLE 279
#define FLOAT 280
#define CHAR 281
#define OP 282
#define CP 283
#define OCB 284
#define CCB 285
#define OSB 286
#define CSB 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
