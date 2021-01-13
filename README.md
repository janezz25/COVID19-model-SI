# COVID19-model-SI


### Razlaga modela

Model SEIR je kratica za model Susceptible, Exposed, Infectious in Recovered, kjer poskušamo modelirati dinamiko štirih skupin populacije, ki nastopajo v epidemiji: dovzetnih za bolezen, izpostavljenih bolezni, okuženih in ozdravljenih. Dinamika spreminjanja količin te populacije je zajeta s sistemom štirih diferencialnih enačb prvega reda, ki jih rešujemo z numeričnim postopkom.

Osnovnemu modelu dinamike širjenja bolezni je dodan tudi podmodel, kjer razdelimo okužene na skupine zmerno bolnih, hudo bolnih (tistih, ki potrebujejo bolnišnično zdravljenje), bolnikov na intenzivni negi (ICU) in umrlih.

Začetni parametri modela zajemajo parametre, ki jih je potrebno oceniti iz stanja dinamike širjenja epidemiološke bolezni. Najpomembnejši parameter je stopnja prenosa okužbe R.

Iz modela se ocenjuje tudi **reporodukcijski faktor R**. 
<br><br>


<hr />
<strong>Uporabljeni model SEIR</strong>

Uporabljen je model SEIR na spletni strani https://apps.lusy.fri.uni-lj.si/appsR/CoronaSim5/ 

![Model SEIR](https://github.com/janezz25/COVID19-model-SI/blob/master/jz_SEIR_Slovenija.png)

Predstavitev modela je predstavljena v <a href="https://youtu.be/ZzIbNxvGdo8?t=3041" target="_blank"> videu predavanja </a>.

Razlaga in uporaba modela je predstavljena v <a href="https://youtu.be/WkFdWRNAM8s" target="_blank"> videu </a>.


<hr />
<strong>Določitev parametrov modela</strong>

Potek repordukcijskega števila v modelu je v tem primeru fiksno določen, izračunan po optimizaciji s prileganjem dejanskih podatkov o hospitaliziranih, bolnikov na intenzivni negi in smrti z modelom. Kriterijska funkcija je minimizacija vsote absolutnih napak.

Rezultati vsakodnevnega izračunavanja optimalnega poteka reprodukcijskega števila so na spletni strani:
https://apps.lusy.fri.uni-lj.si/appsR/CoronaSim2/

<hr />
<strong>Literatura</strong>

Matt J. Keeling, Pejman Rohani. 2008. Modelling Infectious Diseases in Humans and Animals. Princeton University Press. http://www.jstor.com/stable/j.ctvcm4gk0.1.

[1] : Earn DJD, Rohani P, Bolker BM, Grenfell BT (2000) <i>A simple model for complex dynamical transitions in epidemics.</i> Science 287: 667-670 <br>
