%%%% -*- Mode: Prolog -*-

%%json/1
%%start operation
json(X) :-
    string_to_list_of_characters(X, Y),
    is_a_string(Y).


%% is_a_number/1
%% check that it is an positive, negative or decimal number

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
%%check that it is an string

is_a_string([X]) :-
    atom_length(X,1),
    char_type(X, lower),!.

is_a_string([X | Xs]) :-
    is_a_string([X]),
    is_a_string(Xs).


%%to_list/2
%%conver string to list

to_list(String, Characters) :-
name(String, Xs),
maplist( number_to_character,
Xs, Characters ).

number_to_character(Number, Character) :-
name(Character, [Number]).

%%%% end of file -- JSON.pl
