/Script to parse a tab delimited excel file, extracting ISINs from it.
/file name: ISIN.xls.

raw:("****"; "\t") 0: `:ISIN.xls;
//ssr to replace spaces with underscores for column names.
raw[;0]:{ssr[x;" ";"_"]} each raw[;0];
dictkeys: `$raw[;0];
tblASX: flip dictkeys!(flip 1_flip raw);
isins:4_`$exec ISIN_code from tblASX;