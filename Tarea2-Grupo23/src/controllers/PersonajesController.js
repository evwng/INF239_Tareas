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
            res.json(personaje)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarPersonaje = async (req, res) => {
    try {
        const {id} = req.params
        const {nombre, fuerza, fecha_nacimiento, objeto} = req.body
        if (nombre === undefined || fuerza === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
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
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarPersonaje = async (req, res) => {
    try {
        const {id} = req.params
        const personaje = await prisma.personajes.delete({
            where: {id: Number(id)}
        })
        res.json(personaje)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const PersonajesController = {
    getPersonajes,
    getPersonajesById,
    crearPersonaje,
    actualizarPersonaje,
    eliminarPersonaje
}

export default PersonajesController