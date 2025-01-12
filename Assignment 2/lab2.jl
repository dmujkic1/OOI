#=lab radili u paru 
Amina Kazazovic
Daris Mujkic=#

#zadatak1
using JuMP
using HiGHS

#=Neko preduzeće plasira na trţište dvije vrste mljevene kafe K1 i K2. Očekivana zarada je 3
novčane jedinice (skraćeno n.j.) po kilogramu za kafu K1 (tj. 3 n.j./kg), a 2 n.j./kg za kafu K2. Pogon
za prţenje kafe je na raspolaganju 150 sati sedmično, a pogon za mljevenje kafe 60 sati sedmično. =#
model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2>=0)
@objective(model,Max,3x1+2x2)
@constraint(model,c1,0.5x1+0.3x2<=150)
@constraint(model,c2,0.1x1+0.2x2<=60)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))

delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)

#=Potrebno je obezbijediti vitaminsku terapiju koja će sadrţavati četiri vrste vitamina V1, V2,
V3 i V4. Na raspolaganju su dvije vrste vitaminskih sirupa S1 i S2 čije su cijene 40 n.j./g i 30 n.j./g
respektivno. Vitaminski koktel mora sadrţavati najmanje 0.2 g, 0.3 g, 3 g i 1.2 g vitamina V1, V2, V3 i
V4 respektivno.=#
model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2>=0)
@objective(model,Min,40x1+30x2)
@constraint(model,c1,0.1x1>=0.2)
@constraint(model,c2,0.1x2>=0.3)
@constraint(model,c3,0.5x1+0.3x2>=3)
@constraint(model,c4,0.1x1+0.2x2>=1.2)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))

delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)

#=Planira se proizvodnja tri tipa detrdţenta D1, D2 i D3. Sa trgovačkom mreţom je dogovorena
isporuka tačno 100 kg detrdţenta bez obzira na tip. Za uvoz odgovarajućeg repromaterijala planirano
su sredstva u iznosu od 110 $. Po jednom kilogramu detrdţenta, za proizvodnju detrdţenata D1, D2 i
D3 treba nabaviti repromaterijala u vrijednosti 2 $, 1.5 $ odnosno 0.5 $. TakoĎer je planirano da se za
proizvodnju uposle radnici sa angaţmanom od ukupno barem 120 radnih sati, pri čemu je za
proizvodnju jednog kilograma detrdţenata D1, D2 i D3 potrebno uloţiti respektivno 2 sata, 1 sat
odnosno 1 sat. Prodajna cijena detrdţenata D1, D2 i D3 po kilogramu respektivno iznosi 10 KM, 5 KM
odnosno 8 KM. Formirati matematski model iz kojeg se moţe odrediti koliko treba proizvesti svakog
od tipova detrdţenata da se pri tome ostvari maksimalna moguća zarada=#
model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2>=0)
@variable(model,x3>=0)
@objective(model,Max,10x1+5x2+8x3)
@constraint(model,c1,x1+x2+x3==100)
@constraint(model,c2,2x1+1.5x2+0.5x3<=110)
@constraint(model,c3,2x1+x2+x3>=120)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))
println("x3= ",value(x3))

delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)
delete(model,x3)
unregister(model,:x3)
delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,c3)
unregister(model,:c3)

#zadaci za samostalan rad

#=Fabrika može proizvoditi tri proizvoda P1, P2 i P3, pri čemu se koriste tri sirovine S1, S2 i S3. Za 
proizvodnju prvog proizvoda koriste se dvije količinske jedinice prve i tri količinske jedinice druge 
sirovine. Za proizvodnju drugog proizvoda koriste se dvije količinske jedinice prve, tri količinske jedinice 
druge i jedna količinska jedinica treće sirovine. Za proizvodnju trećeg proizvoda potrebno je dvije 
količinske jedinice prve sirovine i jedna količinska jedinica treće sirovine. Dobit od jedne količinske 
jedinice prvog proizvoda je dvije novčane jedinice, od drugog tri novčane jedinice, a od trećeg jedna 
novčana jedinica. Ako su količine sirovina za planski period ograničene na četiri količinske jedinice za 
prvu sirovinu, dvije za drugu i tri za treću, potrebno je napraviti optimalni plan proizvodnje koji de uz 
zadana ograničenja ostvariti najveću novčanu dobit.=#

model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2>=0)
@variable(model,x3>=0)
@objective(model,Max,2x1+3x2+x3)
@constraint(model,c1,2x1+2x2+2x3<=4)
@constraint(model,c2,3x1+3x2<=2)
@constraint(model,c3,x2+x3<=3)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))
println("x3= ",value(x3))

delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)
delete(model,x3)
unregister(model,:x3)
delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,c3)
unregister(model,:c3)

#=Fabrika proizvodi dva proizvoda. Za proizvodnju oba proizvoda koristi se jedna sirovina čija količina je 
ograničena na 20 kg u planskom periodu. Za pravljenje svakog kilograma prvog proizvoda potroši se 250 
grama sirovine,a za pravljenje svakog kilograma drugog proizvoda potroši se 750 grama sirovine. Dobit od 
prvog proizvoda je 3 KM po kilogramu, a od drugog 7 KM po kilogramu. Potrebno je napraviti plan 
proizvodnje koji maksimizira dobit, pri čemu je potrebno povesti računa da je količina proizvoda koji se 
mogu plasirati na tržište ograničena. Prvog proizvoda može se prodati maksimalno 10 kg, a drugog 9 kg.=#

model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2>=0)
@objective(model,Max,3x1+7x2)
@constraint(model,c1,x1<=10)
@constraint(model,c2,x2<=9)
@constraint(model,c3,0.25x1+0.75x2<=20)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))

delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)
delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,c3)
unregister(model,:c3)

#=Tri proizvoda pakuju se u jednu kutiju zapremine 8 m3. Gustine proizvoda su 1 kg/m3, 2 kg/m3 i 3 kg/m3, a 
prodajne cijene 8 KM/kg, 5 KM/kg i 4 KM/kg respektivno. Potrebno je odrediti koliko metara kubnih 
svakog od proizvoda treba smjestiti u kutiju da bi se ostvarila maksimalna vrijednost kutije. Težina kutije 
pri tome ne smije preći 12 kg. =#

model=Model(HiGHS.Optimizer)
@variable(model,x1>=0)
@variable(model,x2<=0)
@variable(model,x3>=0)
@objective(model,Min,8x1-10x2+15x3)
@constraint(model,c1,-2x1-3x3<=-3)
@constraint(model,c2,3x1-5x2+2x3==5)
print(model)

optimize!(model)
termination_status(model)
primal_status(model)
println("Rjesenje je ",objective_value(model))
println("x1= ",value(x1))
println("x2= ",value(x2))
println("x3= ",value(x3))
println("x4=",145-value(c2))
println("x5= ",-(40-value(c3)))
println("x6= ",200-value(c4))



delete(model,x1)
unregister(model,:x1)
delete(model,x2)
unregister(model,:x2)
delete(model,x3)
unregister(model,:x3)
delete(model,c1)
unregister(model,:c1)
delete(model,c2)
unregister(model,:c2)
delete(model,c3)
unregister(model,:c3)