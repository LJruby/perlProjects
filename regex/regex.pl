#!/usr/bin/perl

use Switch;

$filename='input';

if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
	while (my $row = <$fh>) {
		chomp $row; 
		print "\"$row\"\nzawiera:\n";
		switch ($row) {
			case /[a-z]/		{ print "1 mala litere\n"; next; }
			case /\W+\w+/		{ print "co najmniej 1 znak non-word i co najmniej 1 nastepujacy znak word\n"; next; }
			case /^\W*[a-z]+/	{ print "co najmniej 0 znakow non-word na poczatku linii i nastepujaca co najmniej 1 mala litere\n"; next; }
			case /^\w+$/		{ print "na poczatku co najmniej jeden znak word i nastepujacy znak konca linii\n"; next; }
			case /\d/		{ print "1 cyfre\n"; next; }
			case /(.+)\s*\1/	{ print "co najmniej 1 dowolny znak, nastepujace 0 lub wiecej bialych znakow ( , \\t, \\n, \\r, \\f) i nastepujacy wzorzec pierwsze napotkany\n"; next; }
			case /\DOS/		{ print "jeden nieliczbowy znak i nastepujace OS\n"; next; }
			case /\\DOS/		{ print "\\ i nastepujace DOS\n"; next; }
			case /\\\DOS/		{ print "\\, nastepujacy jeden nieliczbowy znak i nastepujace OS\n"; }
		}
		print "-----------------------------------\n";
	}
} else { warn "Could not open file '$filename' $!"; }
