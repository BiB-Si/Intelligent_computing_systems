translate(apple, pomme).
translate(peach, pêche). 
translate(corn, maïs).
translate(red, rouge).
translate(yellow, jaune).

translate_sentence([Word|Rest], [Translation|TranslatedRest]) :-
    translate(Word, Translation),
    translate_sentence(Rest, TranslatedRest).
translate_sentence([], []).