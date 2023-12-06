# nacionalidades
nacionalidad(britanico).
nacionalidad(noruego).
nacionalidad(sueco).
nacionalidad(danes).
nacionalidad(aleman).

# mascotas
mascota(perro).
mascota(pajaro).
mascota(caballo).
mascota(gato).
mascota(pez).

# bebidas
bebida(te).
bebida(cafe).
bebida(leche).
bebida(cerveza).
bebida(agua).

# colores de las casas
color(roja).
color(azul).
color(amarilla).
color(blanca).
color(verde).

# cigarrillos
cigarro(prince).
cigarro(dunhill).
cigarro(blends).
cigarro(bluemaster).
cigarro(pallMall).

# alturas de las casas
altura(N) :- between(1, 5, N).

# Predicado solución
solucion(Solucion) :-
    posibleVecindario(Solucion),    
    validarSolucion(Solucion).       

# vecindario posible
posibleVecindario(Vecindario) :-
    posibleCasa(Casa1),
    posibleCasa(Casa2),
    posibleCasa(Casa3),
    posibleCasa(Casa4),
    posibleCasa(Casa5),
    Vecindario = [Casa1, Casa2, Casa3, Casa4, Casa5],
    validarVecindario(Vecindario).

# casa posible
posibleCasa(Casa) :-
    altura(Altura),
    color(Color),
    nacionalidad(Nacionalidad),
    bebida(Bebida),
    cigarro(Cigarro),
    mascota(Mascota),
    Casa = casa(Altura, Color, Nacionalidad, Bebida, Cigarro, Mascota),
    validarCasa(Casa).

# Valida cada casa 
validarCasa(Casa) :- forall(restriccionCasa(RestriccionCasa), cumple(RestriccionCasa, Casa)).

# Valida el vecindario 
validarVecindario(Vecindario) :- forall(restriccionVecindario(RestriccionVecindario), apply(RestriccionVecindario, [Vecindario])).

# Valida la solucion
validarSolucion(Solucion) :-
    validarAlturas(Solucion),
    validarColores(Solucion),
    validarNacionalidades(Solucion),
    validarBebidas(Solucion),
    validarCigarros(Solucion),
    validarMascotas(Solucion).

# Valida atributos especificos
validarAlturas(Solucion) :- forall(altura(Altura), member(casa(Altura, _, _, _, _, _), Solucion)).
validarColores(Solucion) :- forall(color(Color), member(casa(_, Color, _, _, _, _), Solucion)).
validarNacionalidades(Solucion) :- forall(nacionalidad(Nacionalidad), member(casa(_, _, Nacionalidad, _, _, _), Solucion)).
validarBebidas(Solucion) :- forall(bebida(Bebida), member(casa(_, _, _, Bebida, _, _), Solucion)).
validarCigarros(Solucion) :- forall(cigarro(Cigarro), member(casa(_, _, _, _, Cigarro, _), Solucion)).
validarMascotas(Solucion) :- forall(mascota(Mascota), member(casa(_, _, _, _, _, Mascota), Solucion).

# reglas
restriccionCasa([nacionalidadCasa(britanico), colorCasa(roja)]). 
restriccionCasa([nacionalidadCasa(sueco), mascotaCasa(perro)]). 
restriccionCasa([nacionalidadCasa(danes), bebidaCasa(te)]). 
restriccionCasa([nacionalidadCasa(noruego), alturaCasa(1)]). 
restriccionCasa([nacionalidadCasa(aleman), cigarroCasa(prince)]). 
restriccionCasa([colorCasa(verde), bebidaCasa(cafe)]). 
restriccionCasa([cigarroCasa(pallMall), mascotaCasa(pajaro)]). 
restriccionCasa([colorCasa(amarilla), cigarroCasa(dunhill)]). 
restriccionCasa([alturaCasa(3), bebidaCasa(leche)]). 
restriccionCasa([cigarroCasa(bluemaster), bebidaCasa(cerveza)]). 

# reglas globales
restriccionVecindario(cumpleVecindario(colorCasa(verde), colorCasa(blanca), estaALaIzq)). 
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), mascotaCasa(gato), sonVecinos)). 
restriccionVecindario(cumpleVecindario(mascotaCasa(caballo), cigarroCasa(dunhill), sonVecinos)). 
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), bebidaCasa(agua), sonVecinos)). 
restriccionVecindario(cumpleVecindario(nacionalidadCasa(noruego), colorCasa(azul), sonVecinos)). 

# verifica si afecta a una casa
afecta(RestriccionCasa, Casa) :-
        member(Condicion, RestriccionCasa),
        apply(Condicion, [Casa]).

# Verifica si se cumple 
cumple(RestriccionCasa, Casa) :- not(afecta(RestriccionCasa, Casa)).
cumple(RestriccionCasa, Casa) :-
    afecta(RestriccionCasa, Casa),
    forall(member(Condicion, RestriccionCasa), apply(Condicion, [Casa])).

cumpleVecindario(Cond1, Cond2, Relacion, Solucion) :-
    member(Casa1, Solucion),
    apply(Cond1, [Casa1]),
    member(Casa2, Solucion),
    apply(Cond2, [Casa2]),
    apply(Relacion, [Casa1, Casa2]).

# atributos de una casa
alturaCasa(Altura, casa(Altura, _, _, _, _, _)).
colorCasa(Color, casa(_, Color, _, _, _, _)).
nacionalidadCasa(Nacionalidad, casa(_, _, Nacionalidad, _, _, _)).
bebidaCasa(Bebida, casa(_, _, _, Bebida, _, _)).
cigarroCasa(Cigarro, casa(_, _, _, _, Cigarro, _)).
mascotaCasa(Mascota, casa(_, _, _, _, _, Mascota)).

# relaciones de vecindad
sonVecinos(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    alturasVecinas(N, M).
    
estaALaIzq(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    izquierda(N, M).

# alturas vecinas
alturasVecinas(Altura1, Altura2) :- izquierda(Altura1, Altura2).
alturasVecinas(Altura1, Altura2) :- izquierda(Altura2, Altura1).
izquierda(Altura1, Altura2) :- Altura1 is Altura2 - 1.