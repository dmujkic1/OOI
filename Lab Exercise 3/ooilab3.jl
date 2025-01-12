using LinearAlgebra

#=lab3 radili skupa
Amina Kazazovic 19364
Daris Mujkic 19413=#

function rijesi_simplex(A,b,c)
    broj_redova, broj_kolona= size(A) 
    if length(b)!=broj_redova || length(c)!=broj_kolona
        error("Neadekvatne dimenzije matrice/vektora")
    end
    for broj in b
        if broj<0
            error("Elementi vektora b nisu svi pozitivni")
        end
    end
    #formiranje simpleks matrice
    jedinicna_matrica = Matrix(Diagonal(ones(broj_redova)))
    c_nova=vcat(0,c,collect(0 for i in 1:broj_redova))
    simpleks_matrica=vcat(hcat(b,A,jedinicna_matrica),c_nova')
    #=formirati vektor koji sadrži indekse promjenljivih početnog
    baznog rješenja (vektor base)=#
    vektor_base=[]
    for i in 1:broj_redova
        push!(vektor_base,broj_kolona+i)
    end
    while true 
        red_bez_prvog=simpleks_matrica[broj_redova+1, 2:end]
        c_max,indeks_kolone=findmax(red_bez_prvog)
        indeks_kolone=indeks_kolone+1
        if(c_max<=0) break end
        #sad racunamo aij 
        aiq=[]
        for i in 1:broj_redova
            if simpleks_matrica[i, indeks_kolone] > 0
                push!(aiq, simpleks_matrica[i, 1] / simpleks_matrica[i, indeks_kolone])
            else
                push!(aiq, Inf)
            end
        end
        if all(broj->broj<=0,aiq)
            println("Rjesenje je beskonacno. Algoritam terminira ovdje")
            return nothing
        end

        #pravilo slucajnog izbora pri odabiru ko izlazi iz baze da bi se sprijecila degeneracija
         min_vals = findall(x -> x == minimum(aiq), aiq)
         indeks_reda = rand(min_vals)

        #tmin,indeks_reda=findmin(aiq)
        vektor_base[indeks_reda]=indeks_kolone-1 #ovo je sad azuriranje baze
        #imamo indeks reda i kolone pivota pa dijelimo red u kojem se nalazi s njegovom vrijednoscu da bi pivot postao 1
        simpleks_matrica[indeks_reda,:]/=simpleks_matrica[indeks_reda,indeks_kolone]
        #svi u koloni kod pivota trebaju da budu nula osim njega tako da ide formula taj red minus faktor tjst element u koloni pivot
        # puta taj red gdje je pivot (novi red=stari red−faktor×pivot red)
        for i in 1:broj_redova+1
            if i==indeks_reda continue end #jer se ne radi nad pivot redom
            faktor=simpleks_matrica[i,indeks_kolone]
            simpleks_matrica[i,:]-=faktor*simpleks_matrica[indeks_reda,:]
        end
    end
    Z=simpleks_matrica[broj_redova+1,1]
    brojac=1
    println("Z = ",Z*(-1))
    for bazniel in vektor_base
        println("x(",bazniel,") = ",simpleks_matrica[brojac,1])
        brojac=brojac+1
    end
    for i in 1:broj_kolona+broj_redova
        if i in vektor_base
            continue
        else
            println("x(",i,") = ",0)
        end
    end
end

#primjer1 iz predavanja
#=
argmaxZ = 3x1+x2
p.o
0.5x1+0.3x2<=150
0.1x1+0.2x2<=60
x1>=0,x2>=0  strana 34 
=#
rijesi_simplex([0.5 0.3; 0.1 0.2], [150 60;]', [3 1;]')

#=primjer2
 : Za proizvodnju dva proizvoda P1 i P2 koriste se tri sirovine S1, S2 i S3. U sljedećoj tabeli su 
prikazani utrošci svake od sirovina S1, S2 i S3 po jednom kilogramu (kg) proizvoda P1 odnosno jednom 
litru (l) proizvoda P2, zatim raspoloţive količine (zalihe) sirovina S1, S2 i S3 u skladištu, te prodajne 
cijene proizvoda P1 i P2 po jedinici proizvedene količine (kilogramu odnosno litru).
argmaxZ=800X1+1000X2
P.O 
30x1+16x2<=22800
14x1+19x2<=14100
11x1+26x2<=15950
x2<=550
x1>=0 i x2>=0
=# 
rijesi_simplex([30 16; 14 19; 11 26; 0 1;],[22800 14100 15950 550;]', [800 1000;]')

#=primjer3
strana 45
=#

rijesi_simplex([0.25 -8 -1 9 ; 0.5 -12 -0.5 3; 0  0 1 0],[0 0 1;]',[ 3 -80 2 -24;]')