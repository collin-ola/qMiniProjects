/function that return a list of all odd/even
/numbers, up to and including x.
odds: {where (til x + 1) mod 2}
evns: {where((til x) mod 2)= 0}

/function to convert a list of syms with 2+ digit 
/numbers to a list with single digit numbers
splitter:{[nums] /pass a symlist as input
	nums: string nums;
	inds: where(count each nums) <> 1;
	numArr: "J"$''nums inds;
	reCombined: @[nums; inds;: ;numArr];
	"J"$'raze string reCombined
	}
	
/dictionary mapping A-Z to 10-36
/dict:(.Q.A)!(10 + til 26) /alternative
dict:(.Q.A)!("i"$.Q.A) -\: 55

/function for string reversal
stringReverse:{[str] /input: string to reverse
	show "Original: ",str;
	len: count str;
	iter: (len div 2);
	do[iter; 
		t:str[iter-:1]; 
		str[iter]:str[-1+len-iter]; 
		str[-1+len-iter]:t
		]
	show "Reversed: ",str;
	}
	