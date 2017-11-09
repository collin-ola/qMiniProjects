/system["l makeData.q -rows ", .z.x 1];

getFirsts1:{
	tblMaxValues: exec max price by sym from trade; 
	maxKeys::key tblMaxValues;
	maxVals::value tblMaxValues;
	cnt::count tblMaxValues;
	res::`long$();
	{if[cnt>0; res::res,exec i from trade where sym=maxKeys[cnt-1], price=first maxVals[cnt-1]; .z.s[cnt-:1]]}[];
	select from trade where i in value exec first i by sym from trade where i in res
	}

getFirsts2:{
	t:exec max price by sym from trade; 
	res:{[thisSym;thisPrice]exec i from trade where sym=thisSym, price=first thisPrice}'[key t; value t];
	select from trade where i in value exec first i by sym from trade where i in raze res
	}

getFirsts3:{select from trade where price=(max;price)fby sym, i=(first;i)fby sym}


	
	