-module (hhfuns).
-compile(export_all).


one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().


increment([]) -> [];
increment([H|T]) -> [H+1| increment(T)].

incr(X) -> X + 1.
map(_, []) -> [];
map(F, [H|T]) -> [F(H) | map(F,T)].

map2(F,L) ->
	reverse(fold(fun(X,Acc) -> [F(X)|Acc] end, [], L)).


filter(Pred, L) -> lists:reverse(filter(Pred, L,[])).
 
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
	case Pred(H) of
		true  -> filter(Pred, T, [H|Acc]);
		false -> filter(Pred, T, Acc)
	end.

filter2(Pred, L) ->
	F = fun(X,Acc) ->
			case Pred(X) of
				true  -> [X|Acc];
				false -> Acc
			end
		end,
	reverse(fold(F, [], L)).

%% this is batshit.
%%PrepareAlarm = fun(Room) ->
%%					io:format("Alarm set in ~s.~n", [Room]),
%%					fun() -> io:format("Alarm set in ~s, call Batman!~n", [Room]) end
%%				end.

base(A) ->
	B = A + 1,
	F = fun() -> A * B end,
	F().


a() ->
	Secret = "pony",
	fun() -> Secret end.
 
b(F) ->
	"a/0's password is "++F().



%% only keep even numbers
even(L) -> lists:reverse(even(L,[])).
 
even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
	even(T, [H|Acc]);
even([_|T], Acc) ->
	even(T, Acc).
 
%% only keep men older than 60
old_men(L) -> lists:reverse(old_men(L,[])).
 
old_men([], Acc) -> Acc;

old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
	old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
	old_men(People, Acc).


fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H,Start), T).


reverse(L) ->
	fold(fun(X,Acc) -> [X|Acc] end, [], L).

