:-style_check(-discontiguous).
spouse(chingis_khaan,borte).
parent(chingis_khaan,zushi).
parent(chingis_khaan,tsagadai).
parent(chingis_khaan,ugudei_khaan).
parent(chingis_khaan,tolui).
parent(borte,zushi).
parent(borte,tsagadai).
parent(borte,ugudei_khaan).
parent(borte,tolui).
parent(zushi,bat_khaan).
parent(ugudei_khaan,guiug_khaan).
parent(tolui,arigbuh_khaan).
parent(tolui,huleg).
parent(tolui,hubulay_khaan).
parent(tolui,munh_khaan).
parent(hubulay_khaan,tumur_khaan).
parent(hubulay_khaan,khaisan_khaan).
parent(hubulay_khaan,ayurbarbad_khaan).
parent(hubulay_khaan,esuntumur_khaan).
parent(hubulay_khaan,ugeshi_khaan).
parent(khaisan_khaan,huslen_khaan).
parent(khaisan_khaan,tugtumur_khaan).
parent(ayurbarbad_khaan,shadbal_khaan).
parent(esuntumur_khaan,ashidheb_khaan).
parent(huslen_khaan,rinshinbal_khaan).
parent(huslen_khaan,togoontumur_khaan).  
parent(togoontumur_khaan,tugstumur_khaan).
imperor(chingis_khaan).
imperor(zushi).
imperor(tsagadai).
imperor(ugudei_khaan).
imperor(bat_khaan).
imperor(guiug_khaan).
imperor(arigbuh_khaan).
imperor(huleg).
imperor(hubulay_khaan).
imperor(munh_khaan).
imperor(tumur_khaan).
imperor(khaisan_khaan).
imperor(ayurbarbad_khaan).
imperor(esuntumur_khaan).
imperor(ugeshi_khaan).
imperor(huslen_khaan).
imperor(tugtumur_khaan).
imperor(shadbal_khaan).
imperor(ashidheb_khaan).
imperor(rinshinbal_khaan).
imperor(togoontumur_khaan).
imperor(tugstumur_khaan).
female(borte).


ancestor(X, Y) :- parent(X,Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y). 
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
brother(X, Y) :- parent(Z, X),parent(Z, Y),imperor(X),X\=Y.
father(X, Y) :- parent(X, Y), imperor(X).
mother(X,Y) :- parent(X,Y),female(X).
spouse(X,Y) :- spouse(Y,X).
wife(X,Y) :- spouse(X,Y),female(X).
husband(X,Y) :- spouse(X,Y),imperor(X).
uncle(X,Y) :- parent(Z, Y), brother(X, Z).
son(X, Y) :- parent(Y, X), imperor(X).
grandson(X, Y) :- son(X, Y).
grandson(X, Y) :- grandson(X, Z), son(Z, Y).
cousen(X, Y) :- son(X, Z), uncle(Z, Y).
double_uncle(X, Y) :- parent(Z, Y),cousen(X, Z).
not_imperor(X) :- parent(X,_),not(imperor(X)),not(female(X)).
