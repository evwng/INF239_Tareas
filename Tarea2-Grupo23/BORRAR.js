//201
//Errores de eliminación en cascada (listo) -> revisar
//Se pone el nombre del atributo sin comillas dobles -> se cae //supuesto
//Ocupar un método q no está -> 500
//Se crea un elemento que depende del otro sin que el elemento del que depende exista -> error 500
//Errores de tipo -> error 500
//Eliminar un personaje que no existe -> error 500
//Actualizar un personaje que no existe -> error 500
//Obtener un personaje que no existe -> retorna null
//Obtener todos los personajes siendo que no existe ninguno -> retorna []
//Crear algo q ya existe (pk q no son autoincrement) -> error 500
//¿Se crea una diplomacia con id_reino_1=1 y id_reino_2=2 cuando ya existe una que tiene id_reino_1=2 y id_reino_2=1?
//Eliminar defensa de id 1 que existe -> error 500
//¿Debería dar error cuando creas otro reino/etc con el mismo cuerpo diferente pk?
//GetDiplomaciaById cuando va de id 1 a id 1 --> retorna null
//¿una persona puede habitar 2 reinos y ser gobernante de ambos?

//REVISAR METODOS Y ERRORES

//AGREGAR DATOS EN BD
//PERSONAJES:30
//KARTS:7
//REINOS:5
//DIPLOMACIAS: 6

//DOCUMENTAR EN POSTMAN

//REVISADO:
//CrearPersonaje
//GetPersonajes
//GetPersonajeById
//ActualizarPersonaje 
//EliminarPersonaje --> error 500
//CrearDefensa
//GetDefensas
//GetDefensaById
//ActualizarDefensa
//EliminarDefensa --> error 500
//CrearReino
//GetReinos
//GetReinoById
//ActualizarReino
//EliminarReino --> error 500
//CrearTrabajo
//GetTrabajos 
//GetTrabajoById 
//ActualizarTrabajo
//EliminarTrabajo
//CrearKart
//GetKarts
//GetKartById
//ActualizarKart
//EliminarKart
//CrearPersonaje_tiene_trabajo
//GetPersonajes_tienen_trabajos
//GetPersonaje_tiene_trabajoById
//ActualizarPersonaje_tiene_trabajo -->error 500
//EliminarPersonaje_tiene_trabajo --> error 500
//CrearPersonaje_habita_reino
//GetPersonajes_habitan_reinos
//GetPersonaje_habita_reinoById
//ActualizarPersonaje_habita_reino
//EliminarPersonaje_habita_reino
//CrearDiplomacias
//GetDiplomacias
//GetDiplomaciaById
//ActualizarDiplomacia
//EliminarDiplomacia
//top5PersonajesConMasFuerza
//personajeConMasKarts
//cantidadHabitantes
//gobernante