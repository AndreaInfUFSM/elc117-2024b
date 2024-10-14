
% Adapted from: http://cse.csusb.edu/dick/cs320/prolog/story.plg

tellStory([]).
tellStory(P) :- P = choose(L), random_member(M, L), tellStory(M).
tellStory(A) :- atomic(A), write(A), nl.
tellStory([H|T]) :- tellStory(H), tellStory(T).

go :-
  Story = ['Earth',choose(Continue)],
  Continue = [Catastrophe, Science, Attack, Collision],
  
  Catastrophe = [
    choose(['burns up', 'freezes', 'falls into the sun']),'and',PossibleMegadeath],
    
  Collision = [
    'is struck by a giant',
    choose(['comet', 'asteroid', 'cloud']),
    choose(['but is saved.', 'and is destroyed', ['but',Saved]])],
    
  PossibleMegadeath = [choose(['everybody dies.', 
      [choose(['a hero', 'everybody','almost everybody']),
       choose(['dies',Saved,Rescued])] ] )],
       
  Rescued = ['is rescued by', Sizes, Extraterrestrial, Beings],
  Saved = ['is saved by',choose(['earth',Extraterrestrial]),'scientists.','The', Science],
  
  Science = ['scientists', choose(['invent','discover']),Sizes,Beings,Whichetc],
  Attack = ['is attacked by', Sizes,Extraterrestrial,Beings,Whichetc],
  
  Sizes = [choose(['tiny', 'giant', 'enormous'])],
  Extraterrestrial = [choose(['Martian', 'Lunar', 'ExtraGalactic'])],
  Beings = [choose(['bugs', 'reptiles', 'blobs', 'superbeings'])],
  
  Whichetc = ['who',choose([Wantwomen,Friendly])],
  Friendly = [choose([Friendly1,Friendly2,Friendly3])],
  Friendly1 = ['are friendly',choose(['.',choose([['and',Denoument],HappyEnding])] )],
  Friendly2 = [choose(['are friendly but misunderstood',
                       'misunderstand us',
                       'understand us all too well',
                       Hungry]),Butetc],
  Friendly3 = [Hungry,choose(['and eat us.',['and',Denoument]])],
  
  Hungry = ['look upon us as a source of nourishment'],
  Wantwomen = ['want our women, and take a few and leave.'],
  Butetc = [choose(['and are','and are not']),'radioactive','and',Trytokill],
  Trytokill = [choose([['can be killed by',Killers],['can not be killed by',Killers,Soetc]])],
  Killers = [choose([Killer,[Killer,'and',Killer]])],
  Killer = [choose(['a crowd of peasants',
                   'the Army',
                   'the Navy',
                   'the Air Force',
                   'the Marines',
                   'the Coast Guard',
                   'the Atom Bomb'])],

  Soetc = [choose(['but they die from catching a cold.',
                   'so they kill us.',
                   'so they put us under a benign dictatorship.',
                   'so they eat us.',
                   ['so scientists invent a weapon', 
                     choose(['which turns them into disgusting lumps',
                             'which kills them',
                             ['which fails',Soetc]] ) ],
                   ['But',Denoument] ] ) ],
  
  Denoument = [choose([['a cute little kid convinces them people are OK,',Ending],
                       ['a priest talks to them of God,',Ending],
                       
                       ['they fall in love with this beautiful girl',choose([Ending,HappyEnding])]   ] ) ],
  
  Ending = [choose(['and they die.', 'and they leave.', 'and they turn into disgusting lumps.']) ],
  HappyEnding = ['and they get married and live happily forever after.'],  
  tellStory(Story),!.
