import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getPersonaje_habita_reino = async(req, res) => {
    try {
        const personajes_habitan_reinos = await prisma.personaje_habita_reino.findMany()
        res.json(personajes_habitan_reinos)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getPersonaje_habita_reinoById = async (req, res) => {
    try {
        const {id_personaje, id_reino} = req.params 
        const personaje_habita_reino = await prisma.personaje_habita_reino.findUnique({
            where: {
                id_personaje_id_reino:{
                    id_personaje: Number(id_personaje),
                    id_reino: Number(id_reino),
                }
            }
        })
        res.status(201).json(personaje_habita_reino)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearPersonaje_habita_reino = async (req, res) => {
    try {
        const {id_personaje, id_reino, fecha_registro, es_gobernante} = req.body
        if (id_personaje === undefined|| id_reino === undefined || es_gobernante === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const personaje_habita_reino = await prisma.personaje_habita_reino.create({
                data: {
                    id_personaje,
                    id_reino,
                    fecha_registro,
                    es_gobernante
                }
            })
            res.json(personaje_habita_reino)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarPersonaje_habita_reino = async (req, res) => {
    try {
        const {id_personaje, id_reino} = req.params
        const {fecha_registro, es_gobernante} = req.body
        if (fecha_registro === undefined || es_gobernante === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})} 
        else {
            const personaje_habita_reino = await prisma.personaje_habita_reino.update ({
                where: {
                    id_personaje_id_reino: {
                        id_personaje: Number(id_personaje),
                        id_reino: Number(id_reino)
                    }
                },
                data: {
                    fecha_registro,
                    es_gobernante
                }
            })
            res.json(personaje_habita_reino)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarPersonaje_habita_reino = async (req, res) => {
    try {
        const {id_personaje, id_reino} = req.params
        const personaje_habita_reino = await prisma.personaje_habita_reino.delete({
            where: {
                id_personaje_id_reino: {
                    id_personaje: Number(id_personaje),
                    id_reino: Number(id_reino)
                }
            }
        })
        res.json(personaje_habita_reino)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const Personaje_habita_reinoController = {
    getPersonaje_habita_reino,
    getPersonaje_habita_reinoById,
    crearPersonaje_habita_reino,
    actualizarPersonaje_habita_reino,
    eliminarPersonaje_habita_reino
}

export default Personaje_habita_reinoController