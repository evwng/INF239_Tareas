import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getPersonajes = async(req, res) => {
    const personajes = await prisma.personajes.findMany()
    res.json(personajes)
}

//GET para obtener solamente un elemento específico de la tabla
const getPersonajesById = async (req, res) =>{
    const { id } = req.params 
    const personaje = await prisma.personajes.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(personaje)
}

//POST
const crearPersonaje = async (req, res) => {
    const { nombre, fuerza, fecha_nacimiento, objeto } = req.body
    const personaje = await prisma.personaje.create({
        data: {
            nombre,
            fuerza,
            fecha_nacimiento,
            objeto
        }
    })
    res.json(personaje)
}

//PUT
const actualizarPersonaje = async (req, res) => {
    const personajes = await prisma.personajes.update
}

//REMOVE
const eliminarPersonaje = async (req, res) => {
    const { id } = req.params
    const personaje = await prisma.personajes.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(personaje)
}

const PersonajesController = {
    getPersonajes,
    getPersonajesById,
    crearPersonaje,
    actualizarPersonaje,
    eliminarPersonaje
}

export default PersonajesController