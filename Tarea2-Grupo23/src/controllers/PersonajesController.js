import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getPersonajes = async(req, res) => {
    try {
        const personajes = await prisma.personajes.findMany()
        res.json(personajes)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getPersonajesById = async (req, res) => {
    try {
        const {id} = req.params 
        const personaje = await prisma.personajes.findUnique({
            where: {id: Number(id)}
        })
        res.json(personaje)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearPersonaje = async (req, res) => {
    try {
        const {nombre, fuerza, fecha_nacimiento, objeto} = req.body
        if (nombre === undefined || fuerza === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const personaje = await prisma.personajes.create({
                data: {
                    nombre,
                    fuerza,
                    fecha_nacimiento,
                    objeto
                }
            })
            res.status(201).json(personaje)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarPersonaje = async (req, res) => {
    try {
        const {id} = req.params
        const {nombre, fuerza, fecha_nacimiento, objeto} = req.body
        const personajes = await prisma.personajes.update ({
            where: {id: Number(id)},
            data: {
                nombre,
                fuerza,
                fecha_nacimiento,
                objeto
            }
        })
        res.json(personajes)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarPersonaje = async (req, res) => {
    try {
        const {id} = req.params
        //ELIMINACIÓN EN CASCADA: TABLA PERSONAJE_TIENE_TRABAJO
        const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.findMany({
                where: {id_personaje: Number(id)}
        })
        console.log(personaje_tiene_trabajo)
        if (personaje_tiene_trabajo.length !== 0){
            personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.deleteMany({
                    where: {id_personaje: Number(id)}
            })
        }
        //ELIMINACIÓN EN CASCADA: TABLA PERSONAJE_HABITA_REINO
        const personaje_habita_reino = await prisma.personaje_habita_reino.findMany({
            where: {id_personaje: Number(id)}
        })
        if (personaje_habita_reino.length !== 0){
            personaje_habita_reino = await prisma.personaje_habita_reino.deleteMany({
                where: {id_personaje: Number(id)}
            })
        }
        //ACTUALIZACIÓN EN CASCADA: TABLA KARTS
        const karts = await prisma.karts.findMany({
            where: {id_personaje: Number(id)}
        })
        if (karts.length !== 0){
            karts= await prisma.karts.updateMany({
                where: {id_personaje: Number(id)},
                data : {
                    modelo: karts.modelo,
                    color: karts.color,
                    velocidad_maxima: karts.velocidad_maxima,
                    id_personaje: null
                }
            })
        }
        //ELIMINACIÓN
        const personaje = await prisma.personajes.delete({
            where: {id: Number(id)}
        })
        res.json({message: "Eliminado con éxito"})
    }
    catch (error){console.log(error)
        res.status(500).json({message: "Internal Server Error"})}
}

const PersonajesController = {
    getPersonajes,
    getPersonajesById,
    crearPersonaje,
    actualizarPersonaje,
    eliminarPersonaje
}

export default PersonajesController