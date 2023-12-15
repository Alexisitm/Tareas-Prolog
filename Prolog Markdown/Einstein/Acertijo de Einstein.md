# Acertijo de Einstein

El acertijo de Einstein es un famoso problema lógico que se atribuye al genio Albert Einstein. Se dice que solo el 2% de la población mundial es capaz de resolverlo. El acertijo se presenta en forma de una serie de pistas y se debe utilizar la lógica deductiva para llegar a la solución.

## Contexto

1. Hay cinco casas de diferentes colores.
2. En cada casa vive una persona de nacionalidad diferente.
3. Estos cinco propietarios beben una determinada bebida, fuman una marca específica de cigarrillos y tienen una mascota.

## Pistas

Utilizando las siguientes pistas, debes deducir quién tiene el pez como mascota:

1. El británico vive en la casa roja.
2. El sueco tiene un perro como mascota.
3. El danés bebe té.
4. La casa verde está a la izquierda de la casa blanca.
5. El propietario de la casa verde bebe café.
6. La persona que fuma Pall Mall cría pájaros.
7. El dueño de la casa amarilla fuma Dunhill.
8. El hombre que vive en la casa del centro bebe leche.
9. El noruego vive en la primera casa.
10. El fumador de Marlboro vive al lado del que tiene gatos.
11. El hombre que tiene caballos vive al lado del que fuma Dunhill.
12. El dueño que fuma Bluemaster toma cerveza.
13. El alemán fuma Prince.
14. El noruego vive al lado de la casa azul.
15. El fumador de Blend vive al lado del que tiene gatos.
16. El fumador de Blend tiene un vecino que bebe agua.

## Pregunta

¿Quién tiene el pez como mascota?

# Proceso en Prolog
## Definición de hechos para las características

## Nacionalidades
```prolog
nacionalidad(britanico).
nacionalidad(noruego).
nacionalidad(sueco).
nacionalidad(danes).
nacionalidad(aleman).
```
## Mascotas
```prolog
mascota(perro).
mascota(pajaro).
mascota(caballo).
mascota(gato).
mascota(pez).
```
## Bebidas
```prolog
bebida(te).
bebida(cafe).
bebida(leche).
bebida(cerveza).
bebida(agua).
```

## Colores
```Prolog
color(roja).
color(azul).
color(amarilla).
color(blanca).
color(verde).
```
## Cigarrillos
```prolog
cigarro(prince).
cigarro(dunhill).
cigarro(blends).
cigarro(bluemaster).
cigarro(pallMall).
```
## Altura
```prolog
altura(N) :- between(1, 5, N).
```

# Definición de predicados y reglas para resolver el problema
## Predicado solución
```prolog
solucion(Solucion) :-
    posibleVecindario(Solucion),    
    validarSolucion(Solucion).       
```
## Vecindario posible
```prolog
posibleVecindario(Vecindario) :-
    posibleCasa(Casa1),
    posibleCasa(Casa2),
    posibleCasa(Casa3),
    posibleCasa(Casa4),
    posibleCasa(Casa5),
    Vecindario = [Casa1, Casa2, Casa3, Casa4, Casa5],
    validarVecindario(Vecindario).
```
## Casa posible
```prolog
posibleCasa(Casa) :-
    altura(Altura),
    color(Color),
    nacionalidad(Nacionalidad),
    bebida(Bebida),
    cigarro(Cigarro),
    mascota(Mascota),
    Casa = casa(Altura, Color, Nacionalidad, Bebida, Cigarro, Mascota),
    validarCasa(Casa).
```
## Validar cada casa
```prolog
validarCasa(Casa) :- forall(restriccionCasa(RestriccionCasa), cumple(RestriccionCasa, Casa)).
```
## Validar el vecindario
```prolog
validarVecindario(Vecindario) :- forall(restriccionVecindario(RestriccionVecindario), apply(RestriccionVecindario, [Vecindario])).
```
## Validar la solución
```prolog
validarSolucion(Solucion) :-
    validarAlturas(Solucion),
    validarColores(Solucion),
    validarNacionalidades(Solucion),
    validarBebidas(Solucion),
    validarCigarros(Solucion),
    validarMascotas(Solucion).
```
## Validar atributos específicos
```prolog
validarAlturas(Solucion) :- forall(altura(Altura), member(casa(Altura, _, _, _, _, _), Solucion)).
validarColores(Solucion) :- forall(color(Color), member(casa(_, Color, _, _, _, _), Solucion)).
validarNacionalidades(Solucion) :- forall(nacionalidad(Nacionalidad), member(casa(_, _, Nacionalidad, _, _, _), Solucion)).
validarBebidas(Solucion) :- forall(bebida(Bebida), member(casa(_, _, _, Bebida, _, _), Solucion)).
validarCigarros(Solucion) :- forall(cigarro(Cigarro), member(casa(_, _, _, _, Cigarro, _), Solucion)).
validarMascotas(Solucion) :- forall(mascota(Mascota), member(casa(_, _, _, _, _, Mascota), Solucion).
```
#Restricciones y reglas adicionales

## Reglas
```prolog
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
```
## Reglas globales
```prolog
restriccionVecindario(cumpleVecindario(colorCasa(verde), colorCasa(blanca), estaALaIzq)). 
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), mascotaCasa(gato), sonVecinos)). 
restriccionVecindario(cumpleVecindario(mascotaCasa(caballo), cigarroCasa(dunhill), sonVecinos)). 
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), bebidaCasa(agua), sonVecinos)). 
restriccionVecindario(cumpleVecindario(nacionalidadCasa(noruego), colorCasa(azul), sonVecinos)). 
```

## Verificar si afecta a una casa
```prolog
afecta(RestriccionCasa, Casa) :-
        member(Condicion, RestriccionCasa),
        apply(Condicion, [Casa]).
```
## Verificar si se cumple la restricción
```prolog
cumple(RestriccionCasa, Casa) :- not(afecta(RestriccionCasa, Casa)).
cumple(RestriccionCasa, Casa) :-
    afecta(RestriccionCasa, Casa),
    forall(member(Condicion, RestriccionCasa), apply(Condicion, [Casa])).
```

## Cumplir restricciones en el vecindario

```prolog
cumpleVecindario(Cond1, Cond2, Relacion, Solucion) :-
    member(Casa1, Solucion),
    apply(Cond1, [Casa1]),
    member(Casa2, Solucion),
    apply(Cond2, [Casa2]),
    apply(Relacion, [Casa1, Casa2]).
```

## Atributos de una casa
```prolog
alturaCasa(Altura, casa(Altura, _, _, _, _, _)).
colorCasa(Color, casa(_, Color, _, _, _, _)).
nacionalidadCasa(Nacionalidad, casa(_, _, Nacionalidad, _, _, _)).
bebidaCasa(Bebida, casa(_, _, _, Bebida, _, _)).
cigarroCasa(Cigarro, casa(_, _, _, _, Cigarro, _)).
mascotaCasa(Mascota, casa(_, _, _, _, _, Mascota)).
```

## Relaciones de vecindad

```prolog
sonVecinos(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    alturasVecinas(N, M).
    
estaALaIzq(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    izquierda(N, M).
```
## Alturas vecinas

```prolog
alturasVecinas(Altura1, Altura2) :- izquierda(Altura1, Altura2).
alturasVecinas(Altura1, Altura2) :- izquierda(Altura2, Altura1).
izquierda(Altura1, Altura2) :- Altura1 is Altura2 - 1.
```








