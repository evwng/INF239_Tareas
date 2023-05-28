//POR HACER:
//(1) REVISAR METODOS Y ERRORES
//(2) AGREGAR DATOS EN BD
//---> PERSONAJES:30
//---> KARTS:7
//---> REINOS:5
//---> DIPLOMACIAS: 6
//(3) DOCUMENTAR EN POSTMAN

//ERRORES:
//Eliminación en cascada (listo)
//Se pone el nombre del atributo sin comillas dobles -> se cae //supuesto
//Ocupar un método no programado -> error 500
//Se crea un elemento que depende del otro sin que el elemento del que depende exista -> error 500
//Errores de tipo -> error 500
//Eliminar elemento que no existe -> error 500
//Actualizar elemento que no existe -> error 500
//Obtener elemento que no existe -> retorna null
//Obtener todos los elementos siendo que no existe ninguno -> retorna []
//Crear algo q ya existe (pk q no son autoincrement) -> error 500
//¿Se crea una diplomacia con id_reino_1=1 y id_reino_2=2 cuando ya existe una que tiene id_reino_1=2 y id_reino_2=1?
//Eliminar defensa de id 1 que existe -> error 500
//¿Debería dar error cuando creas otro reino/etc con el mismo cuerpo diferente pk?
//GetDiplomaciaById cuando va de id 1 a id 1 --> retorna null
//¿una persona puede habitar 2 reinos y ser gobernante de ambos? Sí, un personaje puede habitar varios reinos

//ACTUALIZACIÓN 28-05:
//(1) En actualizar se eliminó error 400 porque si se actualiza sin datos se debería quedar igual
//(2) En eliminaciones en cascada se cambió a if findMany.length !== 0 en vez de findMany !== []
//(3) Se añadió relación m:n entre defensas y reinos cuando se crean y se actualizan (https://www.prisma.io/docs/concepts/components/prisma-schema/relations/many-to-many-relations)
//(4) ¿Debería tirar error si es que existen elementos que no cumplen su relación?
//Por ejemplo, existen personajes que no tienen personaje_habita_reino a pesar de que se exige tener al menos uno
//En ese caso al crear un personaje deberías crear personaje_habita_reino, pero a su vez al crear personaje_habita_reino se debería crear un reino

//REVISADO:
//PERSONAJES:
//CrearPersonaje
//GetPersonajes
//GetPersonajeById
//ActualizarPersonaje (ACTUALIZADO)
//EliminarPersonaje --> error 500 (ACTUALIZADO)
//DEFENSAS:
//CrearDefensa (ACTUALIZADO)
//GetDefensas
//GetDefensaById
//ActualizarDefensa (ACTUALIZADO)
//EliminarDefensa --> error 500 (ACTUALIZADO)
//REINOS:
//CrearReino (ACTUALIZADO)
//GetReinos
//GetReinoById
//ActualizarReino (ACTUALIZADO)
//EliminarReino --> error 500 (ACTUALIZADO)
//TRABAJOS:
//CrearTrabajo
//GetTrabajos 
//GetTrabajoById 
//ActualizarTrabajo (ACTUALIZADO)
//EliminarTrabajo (ACTUALIZADO)
//KARTS:
//CrearKart
//GetKarts
//GetKartById
//ActualizarKart (ACTUALIZADO)
//EliminarKart
//PERSONAJE_TIENE_TRABAJO:
//CrearPersonaje_tiene_trabajo
//GetPersonajes_tienen_trabajos
//GetPersonaje_tiene_trabajoById
//ActualizarPersonaje_tiene_trabajo -->error 500 (ME FUNCIONA BIEN)(ACTUALIZADO)
//EliminarPersonaje_tiene_trabajo --> error 500  (ME FUNCIONA BIEN)
//PERSONAJE_HABITA_REINO:
//CrearPersonaje_habita_reino
//GetPersonajes_habitan_reinos
//GetPersonaje_habita_reinoById
//ActualizarPersonaje_habita_reino (ACTUALIZADO)
//EliminarPersonaje_habita_reino
//DIPLOMACIAS:
//CrearDiplomacias
//GetDiplomacias
//GetDiplomaciaById
//ActualizarDiplomacia (ACTUALIZADO)
//EliminarDiplomacia
//ENDPOINTS:
//top5PersonajesConMasFuerza
//personajeConMasKarts
//cantidadHabitantes
//gobernante