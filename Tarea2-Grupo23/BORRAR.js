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
//EliminarPersonaje
//top5PersonajesConMasFuerza