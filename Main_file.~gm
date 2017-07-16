sets i/1*1000/;

variable x(i),d(i);
binary variable N(i);
parameter a(i);
a(i) = uniform(1000,2000);

parameter y(i);
y(i) = uniform(1000,2000);;

parameter P;
P=52000;
x.lo(i)=0;



equations Objective,powbal,con1(i),con4(i),con5,con6,con2(i);
variable O,t,dummy;



Objective..  O=e=t;
powbal..  sum(i,x(i))=e=P;
con1(i)..  d(i)=e=a(i)-x(i);
con2(i)..  x(i)=g=40;
con4(i)..  x(i)=l=y(i);
con5..  t+dummy=c=sum(i,d(i));
con6..  dummy=e=0.5


model unitcommitment /all/;
option LP=MOSEK;
solve unitcommitment minimizing O using LP;
unitcommitment.optfile=1;
display x.l,O.l;


p=50000;
option LP=MOSEK;
solve unitcommitment minimizing O using LP;
unitcommitment.optfile=1;
display x.l,O.l;

p=540000;
option LP=MOSEK;
solve unitcommitment minimizing O using LP;
unitcommitment.optfile=1;
display x.l,O.l;
