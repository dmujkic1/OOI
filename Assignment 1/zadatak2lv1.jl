using Pkg
using LinearAlgebra
#zadatak2
function suma_matrice(a)
    broj_redova=size(a,1)
    broj_kolona=size(a,2)
    suma_matrice=0
    suma_redova=zeros(size(a,1))
    suma_kolona=zeros(size(a,2))
    suma_glavne_dijagonale=0
    suma_sporedne_dijagonale=0
    for i in 1:broj_redova 
        for j in 1:broj_kolona
            suma_matrice+=a[i,j]
            suma_redova[i]+=a[i,j]
            suma_kolona[j]+=a[i,j]
            if size(a,1) == size(a,2)
            if i==j 
                suma_glavne_dijagonale+=a[i,j]
            end
            if (i + j) == (size(a,1)+1)
                suma_sporedne_dijagonale+=a[i,j]
            end
        end
        end
    end
    return suma_matrice,suma_redova,suma_kolona,suma_glavne_dijagonale,suma_sporedne_dijagonale
end

a=[2 3 4; 1 1 2; 5 4 7]
suma_matrice(a)

function parse_input(input::String)
    try 
        eval(Meta.parse(input))
    catch
        0
    end
end

Pkg.add("Interact")
Pkg.add("IJulia")
Pkg.add("Blink")
using IJulia
using Interact
using Blink

#GUI za zadatak2 
w2=Window()

ui2 = @manipulate for Matrica = "0"  # zadani unos matrice
    summ,sumr,sumk,sumgd,sumsd=suma_matrice(parse_input(Matrica))
    textbox(string("Rezultat je: suma matrice= ", summ, ", suma redova = ", sumr, " suma kolona = ",sumk, " suma glavne dijagonale = ",sumgd," suma sporedne dijagonale = ",sumsd))
end

Blink.body!(w2,ui2)

