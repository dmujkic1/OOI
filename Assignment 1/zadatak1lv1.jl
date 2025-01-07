#=zadaca radjena u paru 
radili:
Amina Kazazović
Daris Mujkić=#
using LinearAlgebra
#zadatak1
function sabiranje_oduzimanje(a=0,b=0)
    if(size(a)==size(b))
        return a+b,a-b
    end 
    return (0,0)
end

sabiranje_oduzimanje(2,3)
sabiranje_oduzimanje([3 2 4],[2 3])
sabiranje_oduzimanje([2 3 2; 2 1 2],[1 2 3; 1 1 1])
sabiranje_oduzimanje([2 3; 2 1],[1 2 3; 1 1 1])

#GUI za zadatak1 
using Pkg
Pkg.add("Interact")
Pkg.add("IJulia")
Pkg.add("Blink")
using IJulia
using Interact
using Blink

w1=Window()

function parse_input(input::String)
    try 
        eval(Meta.parse(input))
    catch
        0
    end
end

ui1=@manipulate for Prvi_broj="0",Drugi_broj="0"
    zbir,razlika=sabiranje_oduzimanje(parse_input(Prvi_broj),parse_input(Drugi_broj))
    textbox(string("Rezultat je: zbir = ", zbir, "\n, razlika = ", razlika))
end

Blink.body!(w1,ui1)