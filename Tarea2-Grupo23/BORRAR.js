//ACTUALIZACIÓN 03-06:
//Endpoints
//Status 204 (No content)
//Status 404 (Page Not Found)

//ACTUALIZACIÓN 28-05:
//En actualizar se eliminó error 400 porque si se actualiza sin datos se debería quedar igual
//En eliminaciones en cascada se cambió a if findMany.length !== 0 en vez de findMany !== []
//Se añadió relación m:n entre defensas y reinos cuando se crean y se actualizan (https://www.prisma.io/docs/concepts/components/prisma-schema/relations/many-to-many-relations)

//¿Debería dar error cuando creas otro reino/etc con el mismo cuerpo diferente pk? -> NO
//¿Una persona puede habitar 2 reinos y ser gobernante de ambos?                   -> SÍ

//ERRORES:
//Se crea un elemento que depende de otro sin que el segundo elemento exista -> Status 500
//Error de tipo de dato                                                      -> Status 500
//Crear elemento con la misma llave primaria                                 -> Status 500
//Obtener elementos tales que no existe ninguno                              -> Status 204
//Eliminación en cascada                                                     -> Se eliminan todos los elementos dependientes antes
//Eliminar, actualizar u obtener por id elemento que no existe               -> Status 404
//Ocupar método no programado                                                -> Status 404

//SUPUESTOS:
//Se asume que no hay que revisar si los datos tienen sentido, por ejemplo si la fecha de termino del trabajo es antes que la fecha de inicio
//Se asume que la sintaxis del cuerpo será correcta
//Se asume que no se creará una diplomacia con llave primaria id_reino_1 = 1 e id_reino_2 = 2 si ya existe una con id_reino_1 = 2 e id_reino_2 = 1
//Se asume que no se creará una diplomacia con id_reino_1 = id_reino_2, porque no tiene sentido