/V1
getWC: {[words] count each group lower raze " "vs/:words}
d:(); .Q.fc[.Q.fs[{show d+:getWC[x]};`:aLargeFile]]

/V2
d:(); .Q.fc[.Q.fs[{show d+:{[words] count each group lower raze " "vs/:words}[x]};`:aLargeFile]]