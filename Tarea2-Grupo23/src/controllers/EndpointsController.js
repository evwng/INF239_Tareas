import prisma from '../prismaClient.js'

//TOP 5 PERSONAJES CON MAS FUERZA
//CASO: no hay personajes                        -> status 204
//CASO: hay menos de 5 personajes                -> status 200 + retorna todos los personajes
//CASO: varios personajes tienen la misma fuerza -> status 200 + retorna solamente 5 personajes
const top5PersonajesConMasFuerza = async (req, res) => {
    try {
        const personajes = await prisma.personajes.findMany()   
        if (personajes.length === 0){res.status(204).json()}
        else {
            let respuesta = personajes.sort((p1, p2) => (p1.fuerza < p2.fuerza) ? 1 : (p1.fuerza > p2.fuerza) ? -1 : 0);
            res.json(respuesta.slice(0, 5))
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PERSONAJE CON MAS KARTS
//CASO: no hay personajes (con karts)                       -> status 204
//CASO: varios personajes tienen la misma cantidad de karts -> status 200 + retorna solamente 1 personaje
const personajeConMasKarts = async (req, res) => {
    try {
        const personajes = await prisma.personajes.findMany({
            include: {personaje_karts: true}
        })
        if (personajes.length > 0){
            var nombre
            var cantidad_karts = 0
            for (const personaje of personajes){
                if (personaje.personaje_karts.length >= cantidad_karts){
                    nombre = personaje.nombre
                    cantidad_karts = personaje.personaje_karts.length
                }
            }
            const respuesta = {
                "nombre": nombre,
                "cantidad de karts": cantidad_karts
            }
            res.json(respuesta)   
        }
        else {res.status(204),json()}
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//CANTIDAD DE PERSONAJES QUE HABITAN EL REINO
//CASO: no existe el reino                     -> status 404
//CASO: no hay personajes que habiten el reino -> status 200 + retorna una cantidad de habitantes igual a 0
const cantidadHabitantes = async (req , res) => {
    try {
        var contador = 0
        const {id_reino} = req.params
        const reino = await prisma.reinos.findUnique({
            where: {id: Number(id_reino)}
        })
        if (reino === null){res.status(404).json({message: "No existe el reino buscado"})}
        else {
            const habitantes = await prisma.personaje_habita_reino.findMany()
            for (const habitante of habitantes){
                if (habitante.id_reino === Number(id_reino)){contador = contador + 1}
            }
            const respuesta = {
                "id_reino": id_reino,
                "Cantidad de personajes que habitan el reino": contador
            }
            res.json(respuesta)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GOBERNANTE
//CASO: no existe el reino                     -> status 404
//CASO: reino no tiene gobernante              -> status 204
//CASO: reinos no tienen gobernantes           -> status 204
const gobernante = async (req , res) => {
    try {
        const {id_reino} = req.params
        var existe_reino = true
        if (id_reino !== undefined){
            const reino = await prisma.reinos.findUnique({
                where: {id: Number(id_reino)}
            })
            if (reino === null){existe_reino = false}
        }
        if (existe_reino === false){res.status(404).json({message: "No existe el reino buscado"})}
        else {
            const gobernantes = await prisma.personaje_habita_reino.findMany({
                where: {es_gobernante: true}
            })
            const personajes = await prisma.personajes.findMany()
            let respuesta = []
            for (const gobernante of gobernantes){
                for (const personaje of personajes){
                    if (personaje.id === gobernante.id_personaje){
                        if (id_reino === undefined || (id_reino !== undefined && gobernante.id_reino === Number(id_reino))){respuesta.push(personaje)}
                    }
                }
            }
            if (respuesta.length === 0){res.status(204).json()}
            else {res.json(respuesta)}
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const EndpointsController = {
    top5PersonajesConMasFuerza,
    personajeConMasKarts,
    cantidadHabitantes,
    gobernante
}

export default EndpointsController