%%%% -*- Mode: Prolog -*-

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



%%is_whitespace/1
%%tre when X is an whitespace

is_whitespace(X) :-
    X = ' '.



%%is_array/1
%%true whene X is an array

is_array(['[', ']']) :-
    !.



is_array([_ | ']']) :-
    !.

is_array(['[' | Xs]) :-
    is_a_string(Xs).

is_array(['[' | Xs]) :-
    is_a_number(Xs).

%%is_array([_|X]) :-
%%    is_a_string(X).

is_array([_|X]) :-
    is_a_number(X).

%%%% end of file -- JSON.pl
