# En este ejercicio realizamos el famoso problema de fibonacci de manera recursiva
fibo(0,0). 
fibo(1,1). 
fibo(N,R):-N>1,
A is N-1,B is N-2,
fibo(A,T1),fibo(B,T2),
R is T1+T2.