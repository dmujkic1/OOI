using Pkg
using LinearAlgebra

#zadatak3
using Plots
function crtanje_grafa(s::String)
    global x=range(-5,5,length=100)
    y=eval(Meta.parse(s))
    return plot(x,y)
end

crtanje_grafa("sin.(x)")
crtanje_grafa("x.^2")

Pkg.add("Interact")
Pkg.add("IJulia")
Pkg.add("Blink")
using IJulia
using Interact
using Blink

#GUI za zadatak3
#=predlazem da pri unosenju fja prekopirate citavu fju u polje a ne brisat pa pisat slovo po slovo da 
ne bi doslo do nezeljenog ponasanja=#
w3=Window()

ui3 = @manipulate for Funkcija = "sin.(x)" 
    graf = crtanje_grafa(Funkcija)
end

Blink.body!(w3, ui3)