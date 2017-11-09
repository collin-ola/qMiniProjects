/Usage: q makeData.q -rows n

/Obtain prices from real data (4 years' worth)
listTSCO: value exec avg(Open, Close, High, Low) by Date from ("DFFFFJ"; enlist csv) 0:`:TSCO.csv;
listSBRY: value exec avg(Open, Close, High, Low) by Date from ("DFFFFJ"; enlist csv) 0:`:SBRY.csv;
listMRW: value exec avg(Open, Close, High, Low) by Date from ("DFFFFJ"; enlist csv) 0:`:MRW.csv;

rows:"I"$.z.x 1; /number of rows to create.
symList:`TSCO`SBRY`MRW;
syms:rows?symList;
priceD:`TSCO`MRW`SBRY!(listTSCO; listSBRY; listMRW); //TODO more prices per sym.
trade:([]date:rows?.z.d + til 30; time:rows?07:50:00+00:00:01*til 30600; sym:syms; price: raze 1?'priceD[syms]; size:rows? (1 + til 25) * 1275);
conds:0 1!`U`A;
condList:conds[`int$(exec time from trade) >= 08:00:00];
trade:update cond:condList from trade;
trade:`date`time xasc select from trade;

absolutePathSplay:"G:/MThree/Work/kdb/Presentations/topThreePrices/newTradeSplay/"

/Save tables in a number of formats
`:newTradeBlob set trade;

`:newTradeSplay/ set .Q.en[`$":", absolutePathSplay]trade; 

system "l newTradeBlob";
trade:select from newTradeBlob;
absolutePathPartitioned:"G:/MThree/Work/kdb/Presentations/topThreePrices/newTradePartitioned/"
{[dte](`$":", absolutePathPartitioned , string[dte],"/newTradePartitioned/")
	set @[;`sym;`p#]`sym xasc delete date from .Q.en[`$":", absolutePathPartitioned] select from trade where date=dte} each distinct trade.date;

system"l topThree.q"





	