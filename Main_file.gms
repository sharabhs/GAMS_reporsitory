sets i/1*5/;

variable x(i),d(i);
binary variable N(i);
parameter a(i);
a('1')=50;
a('2')=100;
a('3')=150;
a('4')=100;
a('5')=75;

parameter y(i);
y('1')=500;
y('2')=1000;
y('3')=1500;
y('4')=1000;
y('5')=750;

parameter P;
P=520;
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


p=500;
option LP=MOSEK;
solve unitcommitment minimizing O using LP;
unitcommitment.optfile=1;
display x.l,O.l;

p=540;
option LP=MOSEK;
solve unitcommitment minimizing O using LP;
unitcommitment.optfile=1;
display x.l,O.l;
