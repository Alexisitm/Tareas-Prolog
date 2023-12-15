
# Desarrollo de Eliza - Pancreatitis y Beatles
## Nombre: Luis Alexis Cortes Cortez ~~~~  Materia: Prolog ~~~~ 
## Fecha de Entrega 14/12/2023 Presencial

# ELIZA 

ELIZA es un programa de procesamiento del lenguaje natural que simula una conversación terapéutica. Fue desarrollado en la década de 1960 por Joseph Weizenbaum, un informático alemán-estadounidense. ELIZA es conocida como uno de los primeros "chatbots" y es considerada un hito en la historia de la inteligencia artificial.

## Funcionamiento

1. **Imitación de Rogerian:** ELIZA utiliza una técnica terapéutica llamada "Rogerian" para simular la interacción de un terapeuta no directivo. Se centra en reflejar las preguntas y declaraciones del usuario para fomentar la expresión de pensamientos y sentimientos.

2. **Análisis de patrones:** ELIZA identifica patrones en las declaraciones del usuario y responde de manera predefinida en función de esos patrones. Por ejemplo, si el usuario menciona sentirse triste, ELIZA podría responder con empatía sin abordar directamente el problema.

3. **Transformación de frases:** ELIZA utiliza reglas para transformar las declaraciones del usuario en preguntas, inversiones gramaticales y otras respuestas terapéuticas. Esto crea la ilusión de comprensión y participación activa.

## Ejemplo de Conversación

Usuario: Estoy sintiéndome muy estresado en el trabajo.

ELIZA: Parece que estás sintiendo mucho estrés en el trabajo. ¿Puedes contarme más sobre eso?


## Funcionalidad Principal

1. **Saludo Inicial:**
   - El programa comienza saludando al usuario como Eliza y pidiendo al usuario que ingrese una petición.
   - La entrada se lee con `readln(Input)`.

```prolog
eliza :-
    writeln('Hola, soy Eliza, tu chatbot.'),
    writeln('Por favor, ingresa tu peticion. Usa minusculas y un punto al final:'),
    readln(Input),
    eliza(Input), !.
```

2. **Respuestas de Despedida:**
    - Se proporcionan respuestas de despedida específicas si el usuario ingresa ciertas frases, como 'bye' o 'adios'. El programa se cierra después de estas respuestas.
```prolog
eliza(Input) :-
    Input == ['bye'],
    writeln('Adios, espero haberte ayudado.'), !.
eliza(Input) :-
    Input == ['adios', '.'],
    writeln('Adios, nos vemos.'), !.
eliza(Input) :-
    Input == ['Adios', '.'],
    writeln('Te vas por la sombrita .'), !.
```

3. **Conversación Basada en Plantillas:**
   - Utiliza plantillas para estimular respuestas específicas.

```prolog
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.
```

4.  **Plantillas de Respuestas Generales**
- Se definen plantillas para responder a diversas frases o patrones de entrada. Cada plantilla tiene un estímulo (`Stim`), una respuesta (`Resp`), y un índice del estímulo (`IndStim`).
- Aqui los temas de las plantillas se dividen lo que le gusta eliza, lo que hace y lo que es.
- Posteriormente se generaron plantillas para responder sobre dos temas en especifico, la enfermedad pancreatitis y albums e integrantes de los Beatles
```prolog
template([hola, mi, nombre, es, s(_), '.'], ['hola', 0, 'como', estas, '?'], [4]).
template([mi, nombre, es, s(_), '.'], ['hola', 'como', estas, 0, '?'], [3]).
template([hola, ',', mi, nombre, es, s(_), '.'], ['hola', 0, 'como', estas, '?'], [6]).
template([ola, ',', mi, nombre, es, s(_), '.'], ['hola', 'como', estas, 0, '?'], [6]).
template([hola, _], ['hola', 'como', estas, '?'], []).
template([yo, s(_), yo, soy, s(_), '.'], [por, que, tu, 0, eres, 1, '?'], [1, 4]).
template([yo, te, s(_), '.'], [por, que, tu, me, 0,'?'], [2]).
template([yo, soy, s(_), '.'], [por, que, eres, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gusta, s(_), _], [flagLike], [2]).
template([te, gustan, los, s(), _], [flagLike1], [3]).
template([te, gustan, las, s(), _], [flagLike2], [3]).
template([te, gusta, el, s(), _], [flagLike3], [3]).
template([te, gusta, la, s(), _], [flagLike4], [3]).

% pregunta algo que hace eliza
template([tu, s(_), _], [flagDo], [1]).

% pregunta algo que es eliza
template([eres, un, s(_), '?'], [flagIs], [2]).
template([eres, tu, s(_), '?'], [flagIs], [2]).

% Eliza enfermera
template([creo, que, tengo, s(_), '.'], [flagsin], [3]).
template([tengo, s(_)], [flagsin1], [1]).
template([tratamiento, de, s(_), '.'], [flagsin2], [2]).
template([especialista, en, s(_), '.'], [flagsin3], [2]).
template([sintomas, de, s(), '.'], [flagsin4],[2]).
template([si, tengo, s(_), y, s(_), quizas, sea, pancreatitis, '?'], [flagsin5], [2, 4]).
template([s(_), y, s(_), de, que ,son, '?'], [flagsin5], [0, 2]).
template([si, tengo, s(_), s(_), y, s(_), quizas, sea, pancreatitis, '?'], [flagsin6], [2, 3, 5]).
template([s(_), s(_), y, s(_), de, que ,son, '?'], [flagsin6], [0, 1, 3]).

% Eliza beatles 
template([conoces, a, los, s(_), '?'], [flagsin7], [3]).
template([conoces, el, album, s(_)], [flagsin8], [3]).
template([son, s(_), y, s(_), todos, albums, de, los, beatles, '?'], [flagsin9], [1, 3]).
template([s(_), y, s(_), pertenecen, a, los, beatles, '?'], [flagsin9], [0, 2]).
template([son, s(_), s(_), y, s(_), todos, albums, de, los, beatles, '?'], [flagsin10], [1, 2, 4]).
template([s(_), s(_), y, s(_), pertenecen, a, los, beatles, '?'], [flagsin10], [0, 1, 3]).
template([son, s(_), y, s(_), todos, integrantes, de, los, beatles, '?'], [flagsin11], [1, 3]).

%bonus
template([como, estas, '?'], [yo, estoy, bien, gracias, por, preguntar,'.'], []).
template([yo, pienso, que, _], [bueno, esa, es, solo, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([yo, tengo, s(_), con, s(_), '.'], ['Tu', tienes, que, lidear, con, tu, 0, y, tu, 1, de, una, manera, madura, '.'], [2, 4]).
template([profa, s(_), _], ['No', yo, no, puedo, ayudarte, ',', soy, solo, una, maquina], []). 
template([cuenta, me, un, s(_), _], ['No', yo, no, puedo, ',', yo, soy, mala, en, eso], []). 
template(_, ['porfa', explicame, un, poco, mas, '.'], []).
```
  5. **Hechos y reglas de eliza**
   -En este apartado se definio los hechos de la pancreatitis y de los albums de los beatles
   ```prolog
% Pancreatitis
sintomade(dolor_abdominal,pancreatitis).
sintomade(nauseas,pancreatitis).
sintomade(inflamacion,pancreatitis).
sintomade(vomito,pancreatitis).
sintomade(coloracion_amarilleta,pancreatitis).

sintomade1(coloracion_amarilleta, vomito).
sintomade1(coloracion_amarilleta, inflamacion).
sintomade1(coloracion_amarilleta, nauseas).
sintomade1(coloracion_amarilleta, dolor_abdominal).
sintomade1(vomito, inflamacion).
sintomade1(vomito, nauseas).
sintomade1(vomito, dolor_abdominal).
sintomade1(vomito, coloracion_amarilleta).
sintomade1(inflamacion, coloracion_amarilleta).
sintomade1(inflamacion, nauseas).
sintomade1(inflamacion, dolor_abdominal).
sintomade1(inflamacion, vomito).
sintomade1(nauseas, dolor_abdominal).
sintomade1(nauseas, coloracion_amarilleta).
sintomade1(nauseas, vomito).
sintomade1(nauseas, inflamacion).
sintomade1(dolor_abdominal, coloracion_amarilleta).
sintomade1(dolor_abdominal, vomito).
sintomade1(dolor_abdominal, inflamacion).
sintomade1(dolor_abdominal, nauseas).

sintomade2(coloracion_amarilleta, vomito, nauseas).
sintomade2(coloracion_amarilleta, vomito, inflamacion).
sintomade2(coloracion_amarilleta, vomito, dolor_abdominal).
sintomade2(coloracion_amarilleta, nauseas, inflamacion).
sintomade2(coloracion_amarilleta, nauseas, dolor_abdominal).
sintomade2(coloracion_amarilleta, inflamacion, dolor_abdominal).
sintomade2(vomito, nauseas, inflamacion).
sintomade2(vomito, nauseas, dolor_abdominal).
sintomade2(vomito, inflamacion, dolor_abdominal).
sintomade2(vomito, nauseas, inflamacion).
sintomade2(inflamacion, dolor_abdominal, coloracion_amarilleta).
sintomade2(inflamacion, dolor_abdominal, vomito).
sintomade2(inflamacion, dolor_abdominal, nauseas).
sintomade2(inflamacion, nauseas, dolor_abdominal).
sintomade2(inflamacion, dolor_abdominal, coloracion_amarilleta).
sintomade2(coloracion_amarilleta, dolor_abdominal, inflamacion).
sintomade2(nauseas, inflamacion, dolor_abdominal).

% tratamiento de
tratamientode(analgesicos,pancreatitis).
tratamientode(succion_nasogastrica,pancreatitis).
tratamientode(insulina,pancreatitis).

% especialista de
especialistade(gastroenterologo,pancreatitis).
especialistade(endocrinologo,pancreatitis).

% beatles
musicode(paul_mccartney,john_lennon).
musicode(paul_mccartney,george_harrison).
musicode(paul_mccartney,ringo_starr).
musicode(john_lennon,paul_mccartney).
musicode(john_lennon,george_harrison).
musicode(john_lennon,ringo_starr).
musicode(george_harrison,paul_mccartney).
musicode(george_harrison,john_lennon).
musicode(george_harrison,ringo_starr).
musicode(ringo_starr,paul_mccartney).
musicode(ringo_starr,john_lennon).
musicode(ringo_starr,george_harrison).


albumde(please_please_me,beatles).
albumde(with_the_beatles,beatles).
albumde(a_hard_days_night,beatles).
albumde(beatles_for_sale,beatles).
albumde(help,beatles).
albumde(rubber_soul,beatles).
albumde(revolver,beatles).
albumde(sgt_peppers_lonely_hearts_club_band,beatles).
albumde(magical_mystery_tour,beatles).
albumde(white_album,beatles).
albumde(yellow_submarine,beatles).
albumde(abbey_road,beatles).
albumde(let_it_be,beatles).

albumde1(please_please_me, with_the_beatles).
albumde1(please_please_me, a_hard_days_night).
albumde1(please_please_me, beatles_for_sale).
albumde1(please_please_me, help).
albumde1(please_please_me, rubber_soul).
albumde1(please_please_me, revolver).
albumde1(please_please_me, sgt_peppers_lonely_hearts_club_band).
albumde1(please_please_me, magical_mystery_tour).
albumde1(please_please_me, white_album).
albumde1(please_please_me, yellow_submarine).
albumde1(please_please_me, abbey_road).
albumde1(please_please_me, let_it_be).
albumde1(with_the_beatles, please_please_me).
albumde1(with_the_beatles, a_hard_days_night).
albumde1(with_the_beatles, beatles_for_sale).
albumde1(with_the_beatles, help).
albumde1(with_the_beatles, rubber_soul).
albumde1(with_the_beatles, revolver).
albumde1(with_the_beatles, sgt_peppers_lonely_hearts_club_band).
albumde1(with_the_beatles, magical_mystery_tour).
albumde1(with_the_beatles, white_album).
albumde1(with_the_beatles, yellow_submarine).
albumde1(with_the_beatles, abbey_road).
albumde1(with_the_beatles, let_it_be).
albumde1(a_hard_days_night, please_please_me).
albumde1(a_hard_days_night, with_the_beatles).
albumde1(a_hard_days_night, beatles_for_sale).
albumde1(a_hard_days_night, help).
albumde1(a_hard_days_night, rubber_soul).
albumde1(a_hard_days_night, revolver).
albumde1(a_hard_days_night, sgt_peppers_lonely_hearts_club_band).
albumde1(a_hard_days_night, magical_mystery_tour).
albumde1(a_hard_days_night, white_album).
albumde1(a_hard_days_night, yellow_submarine).
albumde1(a_hard_days_night, abbey_road).
albumde1(a_hard_days_night, let_it_be).
albumde1(beatles_for_sale, please_please_me).
albumde1(beatles_for_sale, with_the_beatles).
albumde1(beatles_for_sale, a_hard_days_night).
albumde1(beatles_for_sale, help).
albumde1(beatles_for_sale, rubber_soul).
albumde1(beatles_for_sale, revolver).
albumde1(beatles_for_sale, sgt_peppers_lonely_hearts_club_band).
albumde1(beatles_for_sale, magical_mystery_tour).
albumde1(beatles_for_sale, white_album).
albumde1(beatles_for_sale, yellow_submarine).
albumde1(beatles_for_sale, abbey_road).
albumde1(beatles_for_sale, let_it_be).
albumde1(help, please_please_me).
albumde1(help, with_the_beatles).
albumde1(help, a_hard_days_night).
albumde1(help, beatles_for_sale).
albumde1(help, rubber_soul).
albumde1(help, revolver).
albumde1(help, sgt_peppers_lonely_hearts_club_band).
albumde1(help, magical_mystery_tour).
albumde1(help, white_album).
albumde1(help, yellow_submarine).
albumde1(help, abbey_road).
albumde1(help, let_it_be).
albumde1(rubber_soul, please_please_me).
albumde1(rubber_soul, with_the_beatles).
albumde1(rubber_soul, a_hard_days_night).
albumde1(rubber_soul, beatles_for_sale).
albumde1(rubber_soul, help).
albumde1(rubber_soul, revolver).
albumde1(rubber_soul, sgt_peppers_lonely_hearts_club_band).
albumde1(rubber_soul, magical_mystery_tour).
albumde1(rubber_soul, white_album).
albumde1(rubber_soul, yellow_submarine).
albumde1(rubber_soul, abbey_road).
albumde1(rubber_soul, let_it_be).
albumde1(revolver, please_please_me).
albumde1(revolver, with_the_beatles).
albumde1(revolver, a_hard_days_night).
albumde1(revolver, beatles_for_sale).
albumde1(revolver, help).
albumde1(revolver, rubber_soul).
albumde1(revolver, sgt_peppers_lonely_hearts_club_band).
albumde1(revolver, magical_mystery_tour).
albumde1(revolver, white_album).
albumde1(revolver, yellow_submarine).
albumde1(revolver, abbey_road).
albumde1(revolver, let_it_be).
albumde1(sgt_peppers_lonely_hearts_club_band, please_please_me).
albumde1(sgt_peppers_lonely_hearts_club_band, with_the_beatles).
albumde1(sgt_peppers_lonely_hearts_club_band, a_hard_days_night).
albumde1(sgt_peppers_lonely_hearts_club_band, beatles_for_sale).
albumde1(sgt_peppers_lonely_hearts_club_band, help).
albumde1(sgt_peppers_lonely_hearts_club_band, rubber_soul).
albumde1(sgt_peppers_lonely_hearts_club_band, revolver).
albumde1(sgt_peppers_lonely_hearts_club_band, magical_mystery_tour).
albumde1(sgt_peppers_lonely_hearts_club_band, white_album).
albumde1(sgt_peppers_lonely_hearts_club_band, yellow_submarine).
albumde1(sgt_peppers_lonely_hearts_club_band, abbey_road).
albumde1(sgt_peppers_lonely_hearts_club_band, let_it_be).
albumde1(magical_mystery_tour, please_please_me).
albumde1(magical_mystery_tour, with_the_beatles).
albumde1(magical_mystery_tour, a_hard_days_night).
albumde1(magical_mystery_tour, beatles_for_sale).
albumde1(magical_mystery_tour, help).
albumde1(magical_mystery_tour, rubber_soul).
albumde1(magical_mystery_tour, revolver).
albumde1(magical_mystery_tour, sgt_peppers_lonely_hearts_club_band).
albumde1(magical_mystery_tour, white_album).
albumde1(magical_mystery_tour, yellow_submarine).
albumde1(magical_mystery_tour, abbey_road).
albumde1(magical_mystery_tour, let_it_be).
albumde1(white_album, please_please_me).
albumde1(white_album, with_the_beatles).
albumde1(white_album, a_hard_days_night).
albumde1(white_album, beatles_for_sale).
albumde1(white_album, help).
albumde1(white_album, rubber_soul).
albumde1(white_album, revolver).
albumde1(white_album, sgt_peppers_lonely_hearts_club_band).
albumde1(white_album, magical_mystery_tour).
albumde1(white_album, yellow_submarine).
albumde1(white_album, abbey_road).
albumde1(white_album, let_it_be).
albumde1(yellow_submarine, please_please_me).
albumde1(yellow_submarine, with_the_beatles).
albumde1(yellow_submarine, a_hard_days_night).
albumde1(yellow_submarine, beatles_for_sale).
albumde1(yellow_submarine, help).
albumde1(yellow_submarine, rubber_soul).
albumde1(yellow_submarine, revolver).
albumde1(yellow_submarine, sgt_peppers_lonely_hearts_club_band).
albumde1(yellow_submarine, magical_mystery_tour).
albumde1(yellow_submarine, white_album).
albumde1(yellow_submarine, abbey_road).
albumde1(yellow_submarine, let_it_be).
albumde1(abbey_road, please_please_me).
albumde1(abbey_road, with_the_beatles).
albumde1(abbey_road, a_hard_days_night).
albumde1(abbey_road, beatles_for_sale).
albumde1(abbey_road, help).
albumde1(abbey_road, rubber_soul).
albumde1(abbey_road, revolver).
albumde1(abbey_road, sgt_peppers_lonely_hearts_club_band).
albumde1(abbey_road, magical_mystery_tour).
albumde1(abbey_road, white_album).
albumde1(abbey_road, yellow_submarine).
albumde1(abbey_road, let_it_be).
albumde1(let_it_be, please_please_me).
albumde1(let_it_be, with_the_beatles).
albumde1(let_it_be, a_hard_days_night).
albumde1(let_it_be, beatles_for_sale).
albumde1(let_it_be, help).
albumde1(let_it_be, rubber_soul).
albumde1(let_it_be, revolver).
albumde1(let_it_be, sgt_peppers_lonely_hearts_club_band).
albumde1(let_it_be, magical_mystery_tour).
albumde1(let_it_be, white_album).
albumde1(let_it_be, yellow_submarine).
albumde1(let_it_be, abbey_road).

albumde2(please_please_me, with_the_beatles, a_hard_days_night).
albumde2(please_please_me, with_the_beatles, beatles_for_sale).
albumde2(please_please_me, with_the_beatles, help).
albumde2(please_please_me, with_the_beatles, rubber_soul).
albumde2(please_please_me, with_the_beatles, revolver).
albumde2(please_please_me, with_the_beatles, sgt_peppers_lonely_hearts_club_band).
albumde2(please_please_me, with_the_beatles, magical_mystery_tour).
albumde2(please_please_me, with_the_beatles, white_album).
albumde2(please_please_me, with_the_beatles, yellow_submarine).
albumde2(please_please_me, with_the_beatles, abbey_road).
albumde2(please_please_me, with_the_beatles, let_it_be).
albumde2(please_please_me, a_hard_days_night, beatles_for_sale).
albumde2(please_please_me, a_hard_days_night, help).
albumde2(please_please_me, a_hard_days_night, rubber_soul).
albumde2(please_please_me, a_hard_days_night, revolver).
albumde2(please_please_me, a_hard_days_night, sgt_peppers_lonely_hearts_club_band).
albumde2(please_please_me, a_hard_days_night, magical_mystery_tour).
albumde2(please_please_me, a_hard_days_night, white_album).
albumde2(please_please_me, a_hard_days_night, yellow_submarine).
albumde2(please_please_me, a_hard_days_night, abbey_road).
albumde2(please_please_me, a_hard_days_night, let_it_be).
albumde2(please_please_me, beatles_for_sale, help).
albumde2(please_please_me, beatles_for_sale, rubber_soul).
albumde2(please_please_me, beatles_for_sale, revolver).
albumde2(please_please_me, beatles_for_sale, sgt_peppers_lonely_hearts_club_band).
albumde2(please_please_me, beatles_for_sale, magical_mystery_tour).
albumde2(please_please_me, beatles_for_sale, white_album).
albumde2(please_please_me, beatles_for_sale, yellow_submarine).
albumde2(please_please_me, beatles_for_sale, abbey_road).
```

```prolog
% lo que eliza sabe de un sintomas
elizaKnow(X, R):- enfermedad(X), R = ['Ve', con, un, especialista, en, X, para, que, te, ayude, a, tratar, tu, enfermedad].
elizaKnow(X, R):- \+enfermedad(X), R = ['No', se, nada, sobre, X].
enfermedad(pancreatitis).

elizaKnow1(X, R):- sintomade(X, E), R = ['Es', un, sintoma, de, E].	
elizaKnow1(X, R):- \+sintomade(X, _), R = ['No', se, nada, sobre, X].

elizaKnow2(X, R):- obtener_tratamiento(T, X), R = ['El', tratamiento, para, X, es, T].
elizaKnow2(X, R):- \+obtener_tratamiento(_, X), R = ['No', se, de, tratamientos, sobre, X].

obtener_tratamiento(Tratamientos,Enfermedad) :-
    findall(Tramamiento, tratamientode(Tramamiento, Enfermedad), Tratamientos). 

elizaKnow3(X, R):- obtener_especialistas(X, S), R = ['El', especialista, de, X, es, S].
elizaKnow3(X, R):- \+obtener_especialistas(X, _), R = ['No', tengo, especialistas, sobre, X].

obtener_especialistas(Enfermedad, Especialistas) :-
    findall(Especialista, especialistade(Especialista, Enfermedad), Especialistas). 

elizaKnow4(X, R):- obtener_sintomas(X, S), R = ['Los', sintomas, de, X, son, S].
elizaKnow4(X, R):- \+obtener_sintomas(X, _), R = ['No', se, de, los, sintomas, de, X].

obtener_sintomas(Enfermedad, Sintomas) :-
    findall(Sintoma, sintomade(Sintoma, Enfermedad), Sintomas).
% termina

% lo que eliza sabe de dos sintomas
elizaKnow5(X, Y, R):-sintomade1(X, Y), R =[con, esos, sintomas, puedes, tener, pancreatitis].
elizaKnow5(X, Y, R):- \+sintomade1(X, Y), R =[con, esos, sintomas, pancreatitis, no, tienes].

elizaKnow6(X, Y, Z, R):-sintomade2(X, Y, Z), R =[con, esos, sintomas, puedes, tener, pancreatitis].
elizaKnow6(X, Y, Z, R):- \+sintomade2(X, Y, Z), R =[con, esos, sintomas, pancreatitis, no, tienes].

% lo que eliza sabe de los beatles
elizaKnow7(X, R):- grupo(X), R = ['Si', conozco, a, X, preguntame, o, te, puedo , hablar, de, ellos].
elizaKnow7(X, R):- \+grupo(X), R = ['No', se, nada, sobre, X].
grupo(beatles).

elizaKnow8(X, R):- albumde(X, E), R = ['Es', un, album, de, E].	
elizaKnow8(X, R):- \+albumde(X, _), R = ['No', se, nada, sobre, X].

elizaKnow9(X, Y, R):-albumde1(X, Y), R =[esos, albums, son, todos, de, los, beatles].
elizaKnow9(X, Y, R):- \+albumde1(X, Y), R =[esos, albums, no, todos, son, de, los, beatles].

elizaKnow10(X, Y, Z, R):-albumde2(X, Y, Z), R =[esos, albums, son, todos, de, los, beatles].
elizaKnow10(X, Y, Z, R):- \+albumde2(X, Y, Z), R =[esos, albums, no, todos, son, de, los, beatles].

elizaKnow11(X, Y, R):-musicode(X, Y), R =[esos, musicos, son, todos, de, los, beatles].
elizaKnow11(X, Y, R):- \+musicode(X, Y), R =[esos, musicos, no, todos, son, de, los, beatles].

% Lo que le gusta a Eliza
elizaLikes(X, ['Si', me, gusta, X]):- likes(X).
elizaLikes(X, ['No', a, mi, no, me, gusta, X]):- \+likes(X).

% Los
elizaLikes1(X, ['Si', me, gustan, los, X]):- likes(X).
elizaLikes1(X, ['No', a, mi, no, me, gustan, los, X]):- \+likes(X).

% Las
elizaLikes2(X, ['Si', me, gustan, las, X]):- likes(X).
elizaLikes2(X, ['No', a, mi, no, me, gustan, las, X]):- \+likes(X).

% El
elizaLikes3(X, ['Si', me, gusta, el, X]):- likes(X).
elizaLikes3(X, ['No', a, mi, no, me, gusta, el, X]):- \+likes(X).

% La
elizaLikes4(X, ['Si', me, gusta, la, X]):- likes(X).
elizaLikes4(X, ['No', a, mi, no, me, gusta, la, X]):- \+likes(X).
```
```prolog
likes(manzanas).
likes(ponis).
likes(zombies).
likes(futbol).
likes(comer).
likes(correr).
likes(f1).
likes(comida).
likes(peliculas).

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Si', y, me, gusta, hacerlo].
elizaDoes(X, R):- \+does(X), R = ['No','.', eso, es, muy, dificil, para, mi].
does(estudias).
does(trabajas).
does(analisas).
does(programas).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Si', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', yo, no, soy, X].
is0(tonta).
is0(rara).
is0(buena).
is0(amable).
is0(deliz).
is0(redundante).
is0(bot).
```

```prolog
match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza likes1:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike1,
	elizaLikes1(Atom, R).

% Eliza likes2:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike2,
	elizaLikes2(Atom, R).

% Eliza likes3:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike3,
	elizaLikes3(Atom, R).

% Eliza likes3:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike4,
	elizaLikes4(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

% Eliza knows:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin,
	elizaKnow(Atom, R).

% Eliza knows1:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin1,
	elizaKnow1(Atom, R).

% Eliza knows2:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin2,
	elizaKnow2(Atom, R).

% Eliza knows3:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin3,
	elizaKnow3(Atom, R).

% Eliza knows4:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin4,
	elizaKnow4(Atom, R).

% Eliza knows5:
replace0([I,J|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagsin5,
    nth0(J, Input, Atom1),
    nth0(0, Resp, Y),
    Y == flagsin5,
    elizaKnow5(Atom, Atom1, R).

% Eliza knows6:
replace0([I,J,K|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagsin6,
    nth0(J, Input, Atom1),
    nth0(0, Resp, Y),
    Y == flagsin6,
    nth0(K, Input, Atom2),
    nth0(0, Resp, Z),
    Z == flagsin6,
    elizaKnow6(Atom, Atom1, Atom2, R).

% Eliza knows7:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin7,
	elizaKnow7(Atom, R).

% Eliza knows8:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin8,
	elizaKnow8(Atom, R).

% Eliza knows9:
replace0([I,J|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagsin9,
    nth0(J, Input, Atom1),
    nth0(0, Resp, Y),
    Y == flagsin9,
    elizaKnow9(Atom, Atom1, R).

% Eliza knows10:
replace0([I,J,K|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagsin10,
    nth0(J, Input, Atom1),
    nth0(0, Resp, Y),
    Y == flagsin10,
    nth0(K, Input, Atom2),
    nth0(0, Resp, Z),
    Z == flagsin10,
    elizaKnow10(Atom, Atom1, Atom2, R).

% Eliza knows11:
replace0([I,J|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagsin11,
    nth0(J, Input, Atom1),
    nth0(0, Resp, Y),
    Y == flagsin11,
    elizaKnow11(Atom, Atom1, R).


% Eliza knows111:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagsin111,
	elizaKnow111(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
```