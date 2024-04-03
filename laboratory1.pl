colour(orange, orange).
colour(peach, yellow).
colour(apple, red).
colour(apple, yellow).


fruits(apple).
fruits(peach).


likes(mary, peach).
likes(mary, kukuruza).
likes(mary, apple).


likes(beth, B) :- likes(mary, B), fruits(B), colour(B, red).
likes(beth, B) :- likes(mary, B), B = kukuruza.
