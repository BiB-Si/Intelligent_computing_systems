my_list([melon, peach, red, yellow, apple, corn]).
last_element([X], X).

% Рекурсив
last_element([_|T], X) :-
    last_element(T, X).

% request - my_list(List), last_element(List, Last).
