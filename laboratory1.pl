colour(orange, orange).
colour(peach, yellow).
colour(apple, red).
colour(apple, yellow).

fruits(apple).
fruits(peach).

likes(mary, peach).
likes(mary, kukuruza).
likes(mary, apple).

%что любит Beth ?- likes(beth, X). X = apple X = kukuruza
likes(beth, B) :- likes(mary, B), fruits(B), colour(B, red).
likes(beth, B) :- likes(mary, B), B = kukuruza.
% ?-knownfruits(F). F = apple F = peach
knownfruits(F) :- fruits(F).

% Цвета фруктов, которые любят Beth и Mary ?- favoritefruits(Color). Color = red Color = yellow
favoritefruits(Color) :-
    likes(beth, Fruit),
    likes(mary, Fruit),
    fruits(Fruit),
    colour(Fruit, Color).
