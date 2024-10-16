:- dynamic 
     movie/3,
     actor/2,
     actress/2,
     genre/2,
     likes/2.
:- discontiguous
     movie/3,
     actor/2,
     actress/2,
     genre/2,
     likes/2.


movie(1, parasite, 2019).
genre(1, dark_comedy).
genre(1, psychological_thriller).
genre(1, drama).
genre(1, thriller).
genre(1, comedy).
actor(1, song_kang_ho).
actor(1, lee_sun_kyun).
actress(1, cho_yeo_jeong).
likes(anonymous1, 1).

movie(2, tusk, 2014).
genre(2, dark_comedy).
genre(2, psychological_horror).
genre(2, horror).
genre(2, comedy).
actor(2, justin_long).
actor(2, michael_parks).
actor(2, haley_joel_osment).
likes(arthur, 2).

movie(3, the_hunger_games, 2012).
genre(3, dystopian_sci_fi).
genre(3, teen_adventure).
genre(3, action).
genre(3, adventure).
genre(3, sci_fi).
genre(3, thriller).
actress(3, jennifer_lawrence).
actor(3, josh_hutcherson).
actor(3, liam_hemsworth).
likes(anonymous2, 3).


movie(4, predestination, 2014).
genre(4, time_travel).
genre(4, action).
genre(4, drama).
genre(4, sci_fi).
genre(4, thriller).
actor(4, ethan_hawke).
actress(4, sarah_snook).
actor(4, noah_taylor).
likes(nicholas, 4).


movie(5, alien_romulus, 2024).
genre(5, monster_horror).
genre(5, space_sci_fi).
genre(5, horror).
genre(5, sci_fi).
genre(5, thriller).
actress(5, cailee_spaeny).
actor(5, david_jonsson).
actor(5, archie_renaux).
likes(anonymous3, 5).


movie(6, the_menu, 2022).
genre(6, dark_comedy).
genre(6, psychological_horror).
genre(6, satire).
genre(6, comedy).
genre(6, horror).
genre(6, thriller).
actor(6, ralph_fiennes).
actress(6, anya_taylor_joy).
actor(6, nicholas_hoult).
likes(miguel, 6).


movie(7, dead_poets_society, 1989).
actor(7, robin_williams).
actor(7, robert_sean_leonard).
actor(7, ethan_hawke).
genre(7, teen_drama).
genre(7, comedy).
genre(7, drama).
likes(anonymous4, 7).


movie(8, everything_everywhere_all_at_once, 2022).
genre(8, adventure_epic).
genre(8, dark_comedy).
genre(8, martial_arts).
genre(8, sci_fi_epic).
genre(8, action).
genre(8, adventure).
genre(8, comedy).
genre(8, fantasy).
genre(8, sci_fi).
actress(8, michelle_yeoh).
actress(8, stephanie_hsu).
actress(8, jamie_lee_curtis).
likes(guilherme, 8).


movie(9, schindlers_list, 1993).
genre(9, epic).
genre(9, historical_epic).
genre(9, prison_drama).
genre(9, biography).
genre(9, drama).
genre(9, history).
actor(9, liam_neeson).
actor(9, ralph_fiennes).
actor(9, ben_kingsley).
likes(anonymous5, 9).


movie(10, happy_death_day, 2017).
genre(10, dark_comedy).
genre(10, slasher_horror).
genre(10, teen_horror).
genre(10, comedy).
genre(10, horror).
genre(10, mystery).
genre(10, thriller).
actress(10, jessica_rothe).
actor(10, israel_broussard).
actress(10, ruby_modine).
likes(anonymous6, 10).


movie(11, inglorious_basterds, 2009).
genre(11, dark_comedy).
genre(11, adventure).
genre(11, drama).
genre(11, war).
actor(11, brad_pitt).
actress(11, diane_kruger).
actor(11, eli_roth).
likes(gustavo, 11).


movie(12, big_fish, 2003).
genre(12, adventure_epic).
genre(12, fairy_tale).
genre(12, adventure).
genre(12, drama).
genre(12, fantasy).
genre(12, romance).
actor(12, ewan_mcgregor).
actor(12, albert_finney).
actor(12, billy_crudup).
likes(kiri, 12).


movie(13, avatar_the_way_of_water, 2022).
genre(13, action_epic).
genre(13, adventure_epic).
genre(13, sci_fi_epic).
genre(13, sea_adventure).
genre(13, action).
genre(13, adventure).
genre(13, fantasy).
genre(13, sci_fi).
actor(13, sam_worthington).
actress(13, zoe_saldana).
actress(13, sigourney_weaver).
likes(anonymous7, 13).


movie(14, surfs_up, 2007).
genre(14, animal_adventure).
genre(14, computer_animation).
genre(14, satire).
genre(14, adventure).
genre(14, animation).
genre(14, comedy).
genre(14, family).
genre(14, sport).
actor(14, shia_labeouf).
actress(14, zooey_deschanel).
actor(14, jon_heder).
likes(righi, 14).

drama_actor(A) :- actor(M, A), genre(M, drama).

allgenres(R) :- findall(G,genre(_,G),L), list_to_set(L,R).
       
countgenres(C) :- allgenres(G), length(G, C).
