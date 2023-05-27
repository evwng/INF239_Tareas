import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getPersonaje_tiene_trabajo = async(req, res) => {
    try {
        const personajes_tienen_trabajos = await prisma.personaje_tiene_trabajo.findMany()
        res.json(personajes_tienen_trabajos)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getPersonaje_tiene_trabajoById = async (req, res) => {
    try {
        const {id_personaje, id_trabajo} = req.params 
        const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.findUnique({
            where: {
                id_personaje_id_trabajo: {
                    id_personaje: Number(id_personaje),
                    id_trabajo: Number(id_trabajo)
                }
            }
        })
        res.json(personaje_tiene_trabajo)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearPersonaje_tiene_trabajo = async (req, res) => {
    try {
        const {id_personaje, id_trabajo, fecha_inicio, fecha_termino} = req.body
        if (id_personaje === undefined|| id_trabajo === undefined || fecha_inicio === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.create({
                data: {
                    id_personaje,
                    id_trabajo,
                    fecha_inicio,
                    fecha_termino
                }
            })
            res.json(personaje_tiene_trabajo)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarPersonaje_tiene_trabajo = async (req, res) => {
    try {
        const {id_personaje, id_trabajo} = req.params
        const {fecha_inicio, fecha_termino} = req.body
        if (fecha_inicio === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.update ({
                where: {
                    id_personaje_id_trabajo: {
                        id_personaje: Number(id_personaje),
                        id_trabajo: Number(id_trabajo)
                    }
                },
                data: {
                    fecha_inicio,
                    fecha_termino
                }
            })
            res.json(personaje_tiene_trabajo)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarPersonaje_tiene_trabajo = async (req, res) => {
    try {
        const {id_personaje, id_trabajo} = req.params
        const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.delete({
            where: {
                id_personaje_id_trabajo: {
                    id_personaje: Number(id_personaje),
                    id_trabajo: Number(id_trabajo) 
                }
            }
        })
        res.json(personaje_tiene_trabajo)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const Personaje_tiene_trabajoController = {
    getPersonaje_tiene_trabajo,
    getPersonaje_tiene_trabajoById,
    crearPersonaje_tiene_trabajo,
    actualizarPersonaje_tiene_trabajo,
    eliminarPersonaje_tiene_trabajo
}

export default Personaje_tiene_trabajoController