system "l lib.q" /load library functions.
system "l readISIN.q" /load ready parsed ISINs.

verifyCD: {[ISIN] /input: a complete ISIN, with check digit.
	checkDigit: "J"$-1#string ISIN; 
	ISIN: -1_string ISIN;
	rev: reverse splitter[@[`$'ISIN; where ISIN > "@"; : ; `$'string dict[ISIN where ISIN > "@"]]];
	res:(10 - (sum (rev odds count rev), splitter[`$'string 2*rev evns count rev]) mod 10) mod 10;
	breakHerePls;
	$[checkDigit~res; 
		show "Checkdigit verification successful for ISIN ", ISIN, string checkDigit; 
		show "Checkdigit verification failed for ISIN ", ISIN, string checkDigit];
	}
	