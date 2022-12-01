%%%% -*- Mode: Prolog -*-


%%jsonparse/2

%jsonparse(JsonString, Object):-
%    string_codes(JsonString, JsonCode),
%    remove_space_elements(JsonCode, JsonFree).


%jsonacces(Jsonobj, Fields, Result).

json(X, Y) :-
    string_codes(X, Z),
    remove_space_elements(Z, W),
    string_codes(Y, W).


%%remove_space_elements/2
%%ture whene Y is equals to X but whitout the space elements


remove_space_elements(X, Y) :-
    remove(32, X, W),
    remove(10, W, Z),
    remove(9, Z, Y),
    !.


remove(_, [], []).
remove(X, [X | Xs], R) :-
    remove(X, Xs, R).
remove(X, [Y | Ys], [Y | Z]) :-
    X \= Y,
    remove(X, Ys, Z).

%%is_space_element/1
%%true whene X is an space element

is_space_element(X) :-
    is_whitespace(X),
    !.

is_space_element(X) :-
    is_newline(X),
    !.

is_space_element(X) :-
    is_tab(X),
    !.


%%is_whitespace/1
%%true whene X is a whitespace
is_whitespace(X) :-
    char_code(' ', Y),
    X = Y,
    !.

%%is_newline/1
%%true whene X is a newline
is_newline(X) :-
    char_code('\n', Y),
    X = Y,
    !.

%%is_tab/1
%%true whene is a tab
is_tab(X) :-
    char_code('\t', Y),
    X = Y,
    !.




%%json/1
%%start operation
json_number(X) :-
    atom_chars(X, Y),
    is_a_number(Y),!.

json_string(X) :-
    atom_codes(X, Y),
    is_a_string(Y),!.

json_array(X) :-
    atom_chars(X, Y),
    is_array(Y),!.

%% is_a_number/1
%% true whene X is an positive, negative or decimal number

is_a_number([X]) :-
    is_digit(X),!.

is_a_number([X | Xs]) :-
    is_digit(X),
    is_a_number(Xs).

is_a_number(['-'| Xs]) :-
    is_a_number(Xs).

is_a_number(['.' | Xs]) :-
    is_a_number(Xs).



%% is_a_string/1
%%true when X is an string

is_a_string([Y]) :-
    Y >= 0,
    Y =< 127.



%%is_a_string([X]) :-
%%    atom_codes(X, Y),
%%    is_a_string(Y).

is_a_string([X | Xs]) :-
    is_a_string([X]),
    is_a_string(Xs).



%%is_array/1
%%true whene X is an array

is_array([Xs]) :-
    is_a_value(Xs).

is_array("[", " ", "]").



is_a_value([Xs]) :-
    is_a_string(Xs).

is_a_value([Xs]) :-
    is_a_number(Xs).



%%%% end of file -- JSON.pl
