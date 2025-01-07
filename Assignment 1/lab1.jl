#zadatak1 
3*(456/23)+31.54+2^6
sin(pi/7)*exp(0.3)*(2+0.9im)
sqrt(2)*log(10)
(5+3im)/(1.2+4.5im)

#zadatak2
a=(atan(5)+exp(5.6))/3
b=(sin(pi/3))^(1/15)
c=(log(15)+1)/23
d=sin(pi/2)+cos(pi)

(a+b)*c
acos(b)*asin(c/11)
((a-b)^4)/d
c^(1/a)+(b*im/(3+2im))

#zadatak3
using LinearAlgebra
A=[1 -4im sqrt(2); log(complex(-1)) sin(pi/2) cos(pi/3); asin(0.5) acos(0.8) exp(0.8)]
B=transpose(A)
A+B
A*B
B*A
det(A)
inv(A)

#zadatak4
N=zeros(8,9)
J=ones(7,5)
K=I(5)+zeros(5,5)
rand(4,9)

#zadatak5
a=[2 7 6; 9 5 1; 4 3 8]
sum(a,dims=2) #dims 2 je za redove
sum(a,dims=1) #dims 1 je za kolone
sum(diag(a))
sum(diag(reverse(a,dims=2))) 
maximum(a,dims=2)
minimum(a,dims=2)
maximum(a,dims=1)
minimum(a,dims=1)
maximum(diag(a))
minimum(diag(a))
maximum(diag(reverse(a,dims=2)))
minimum(diag(reverse(a,dims=2)))

#zadatak6
a=[1 2 3; 4 5 6; 7 8 9]
b=[1 1 1; 2 2 2; 3 3 3]
c=sin.(a)
c=sin.(a*cos.(b))
c=round.(a^(1/3))
c=Int.(round.(a.^(1/3)))

#zadatak7
v1=collect(0:1:99)
v2=collect(0:0.01:0.99)
v3=collect(39:-2:1)

#zadatak8
m1=Int.((ones(4,4).*7))
m2=Int.(zeros(4,4))
m3=Int.(ones(4,8).*3)
a=[m1 m2; m3]
b=Int.(I(8)+zeros(8,8))+a
c=b[1:2:end, :]
d=b[:, 1:2:end]
e=b[1:2:end, 1:2:end]

#funkcije za crtanje
using Plots

#zadatak9
x=range(-pi,pi,length=101)
y=sin.(x)
plot(x,y,title="Sinus",label="sin(x)")
xlabel!("x")
ylabel!("y")

y=cos.(x)
plot(x,y,title="Cosinus",label="cos(x)")

x=range(1,10,length=101)
y1=sin.(1 ./x)
plot(x,y1,title="Inverzni sinus",label="sin(1/x)",
linecolor=:black,linestyle=:solid)

y2=cos.(1 ./x) 
y=[y1 y2]
plot(x,y,shape=[:none :circle],color=[:black :blue],label=["sin(1/x)" "cos(1/x)"])
title!("Inverzni sinus i kosinus")

#zadatak10
x=collect(-8: 0.5: 8)
y=collect(-8: 0.5: 8)
z(x,y) = sin.(sqrt.(x.^2+y.^2))
surface(x,y,z, st=:surface)

#funkcije i metaprogramiranje

#zadatak1
function zbir_razlika_brojeva(a=0,b=0)
    if(size(a)==size(b))
        return a+b,a-b
    end
    return (0,0)
end

#provjera funkcije zbir_razlika_brojeva
zbir_razlika_brojeva(2,3)
zbir_razlika_brojeva([2,3],[4,5])
zbir_razlika_brojeva([2,3,4; 2,4,5],[5, 6,3;3,2,1])
zbir_razlika_brojeva([2,3;1,2],[1,2])

sab_odu(2,2)
sab_odu([2 3 4; 3 4 5],[2 4 3; 1 1 1])

#zadatak12
function suma_matrice(a)
    suma_
end