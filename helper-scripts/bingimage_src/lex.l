%option noyywrap
%option noinput
%{
#include <string.h>
#include <ctype.h>
%}
INTEGER [0-9]+
CHAR [a-z]+

%%




.*"<"url">" {}

"<""/"url.*     {}


%%
#include <math.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char *argv[])
{
	const char * homedir = getenv("HOME");
	system("curl -s \"https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=sv-se\" > ~/.cache/bingimage/temp");
	FILE* out;
	if (argc !=2)	out = stdout;
	else			out = fopen(argv[1], "w");
	
	char s[256];
	sprintf(s, "%s/.cache/bingimage/temp", homedir);
	FILE* in = fopen(s, "r");
	yyin = in;
	yyout = out;
	fprintf(out, "www.bing.com");
	yylex();
	if (argc != 2) fclose(out);
	fclose(in);
}
