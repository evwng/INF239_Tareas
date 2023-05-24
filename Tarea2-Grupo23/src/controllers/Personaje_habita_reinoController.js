import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getPersonaje_habita_reino = async(req, res) => {
    const personajes_habitan_reino = await prisma.personaje_habita_reino.findMany()
    res.json(personajes_habitan_reino)
}

//GET para obtener solamente un elemento específico de la tabla
const getPersonaje_habita_reinoById = async (req, res) =>{
    const { id_reino, id_personaje } = req.params 
    const personaje_habita_reino = await prisma.personaje_habita_reino.findUnique({
        where: {
            id_reino: Number(id_reino),
            id_personaje: Number(id_personaje)
        }
    })
    res.json(personaje_habita_reino)
}

//POST
const crearPersonaje_habita_reino = async (req, res) => {
    const { id_personaje, id_reino, fecha_registro, es_gobernante } = req.body
    const personaje_habita_reino = await prisma.personaje_habita_reino.create({
        data: {
            id_personaje,
            id_reino,
            fecha_registro,
            es_gobernante
        }
    })
    res.json( personaje_habita_reino )
}

//PUT
const actualizarPersonaje_habita_reino = async (req, res) => {
    const { id_personaje, id_reino, fecha_registro, es_gobernante } = req.body
    const personaje_habita_reino = await prisma.personaje_habita_reino.update ({
        where: {
            id_personaje: Number(id_personaje),
            id_reino: Number(id_reino)
        },
        data: {
            fecha_registro,
            es_gobernante
        }
    })
    res.json(personaje_habita_reino)
}

//REMOVE
const eliminarPersonaje_habita_reino = async (req, res) => {
    const { id_personaje, id_reino } = req.params
    const personaje_habita_reino = await prisma.personaje_habita_reino.delete({
        where: {
            id_personaje: Number(id_personaje),
            id_reino: Number(id_reino)
        }
    })
    res.json(personaje_habita_reino)
}

const Personaje_tiene_trabajoController = {
    getPersonaje_habita_reino,
    getPersonaje_habita_reinoById,
    crearPersonaje_habita_reino,
    actualizarPersonaje_habita_reino,
    eliminarPersonaje_habita_reino
}

export default Personaje_habita_reinoController