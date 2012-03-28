-module (ball).
-export ([ball/3]).


ball(X, _, 0) -> X-1;
ball(X, Y, Acc) -> 
	ball((X+(Y*math:pow(0.9, Acc))), Y, Acc-1).