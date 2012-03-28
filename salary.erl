-module (salary).
-export([salary/1]).

salary(X) -> {(X*80), (X*0.8), (X*80*0.8), (((X-14)/14)*100)}.