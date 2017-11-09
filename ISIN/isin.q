/isin.q
/A script to calculate and return the checkbit for an ISIN.

/ISINs consist of:
/Two alphabetic characters (the ISO 3166-1 alpha-2 code for the issuing country)
/Nine alphanumeric characters  (the National Securities Identifying Number, or NSIN, which identifies the security, padded as necessary with leading zeros)
/A numerical check digit.
/ISINs are always 12 characters.

system "l lib.q" /load library functions.

VOD:`GB00BH4HKS39
TSCO:`GB0008847096
RMG:`GB00BDVZYZ77
AAPL:`US0378331005
BAE:`GB0002634946
TCOR:`AU0000XVGZA3


checkDigit: -1#string AAPL;
ISIN: -1_string AAPL; 

/indices of where the ISIN character is alphabetic
/"@" = 64; "A" = 65.
inds: where ISIN > "@"

/converts letters to their number equivalent, using the dictionary
/to add converted letters to ISIN, cast all to syms.
convLet: `$'string dict[ISIN inds]
newISIN: @[`$'ISIN; inds; : ; convLet]

/splits any 2+ digit numbers into individual digits.
splitISIN: splitter[newISIN];

/reverses splitISIN so that the right most number
/will always be in the evens list.
rev: reverse splitISIN;

/splits numbers in odd and even positions
/into two lists, doubling the even ones.
/as it always contains the right most number.
evenList: 2*rev evns count rev;
oddList: rev odds count rev;

/doubling may have introduced 2+ digit numbers, so split again.
evenList: splitter[`$'string evenList]

total: sum oddList, evenList;

output: (10 - total mod 10) mod 10;

0N!"Checkbit for ISIN ",ISIN, " is: ", string[output];