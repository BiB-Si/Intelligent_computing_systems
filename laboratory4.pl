%болезни и их симптомы
symptom(flu, fever).
symptom(flu, headache).
symptom(flu, runny_nose).
symptom(flu, cough).

symptom(cold, runny_nose).
symptom(cold, cough).
symptom(cold, sore_throat).

symptom(covid19, fever).
symptom(covid19, cough).
symptom(covid19, tiredness).
symptom(covid19, loss_of_taste).
symptom(covid19, loss_of_smell).

%динамические предикаты для сохранения ответов пользователя
:- dynamic(yes/1).
:- dynamic(no/1).

%правило для диагностики болезни на основе всех симптомов
diagnose(Disease) :-
    findall(Symptom, symptom(Disease, Symptom), Symptoms),
    check_all_symptoms(Symptoms).

%проверка всех симптомов для болезни
check_all_symptoms([]).
check_all_symptoms([Symptom | Rest]) :-
    ask(Symptom),
    yes(Symptom),
    check_all_symptoms(Rest).

%запрос симптомов у пользователя
ask(Symptom) :-
    (yes(Symptom) -> true;
    no(Symptom) -> fail;
    format('У вас есть симптом: ~w? (да/нет) ', [Symptom]),
    read(Reply),
    (Reply = да -> assertz(yes(Symptom));
    assertz(no(Symptom)), fail)).

%запуск диагностики вручную
start_diagnosis :-
    format('--- Диагностика болезни ---~n'),
    findall(Disease, (disease(Disease), diagnose(Disease)), Diseases),
    sort(Diseases, UniqueDiseases),
    format('Возможные болезни: ~w~n', [UniqueDiseases]),
    clear_answers.

disease(flu).
disease(cold).
disease(covid19).

clear_answers :-
    retractall(yes(_)),
    retractall(no(_)).
