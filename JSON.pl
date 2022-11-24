%%%% -*- Mode: Prolog -*-

is_a_number([X]) :-
    is_digit(X).

is_a_number([X | Xs]) :-
    is_digit(X),
    is_a_number(Xs).

is_a_mainus(X) :-
	X = '-'.
    
    

%%%% end of file -- JSON.pl
