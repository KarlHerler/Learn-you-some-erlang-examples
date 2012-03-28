-module (fibonacci).
-export ([fib/1, fib2/1]).


fib_tr(0, Result, _) -> Result;
fib_tr(Iter, Result, Next) -> fib_tr(Iter-1, Next, Result+Next).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> (fib(N-1)+fib(N-2)).

fib2(N) -> fib_tr(N, 0, 1).