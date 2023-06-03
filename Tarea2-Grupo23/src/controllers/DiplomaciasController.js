import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDiplomacias = async(req, res) => {
    try {
        const diplomacias = await prisma.diplomacias.findMany()
        if (diplomacias.length === 0){res.status(204).json()}
        else {res.json(diplomacias)}
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getDiplomaciaById = async (req, res) => {
    try {
        const {id_reino_1, id_reino_2} = req.params 
        const diplomacia = await prisma.diplomacias.findUnique({
            where: {
                id_reino_1_id_reino_2: {
                    id_reino_1: Number(id_reino_1),
                    id_reino_2: Number(id_reino_2)
                }
            }
        })
        if (diplomacia === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {res.json(diplomacia)}
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearDiplomacia = async (req, res) => {
    try {
        const {id_reino_1, id_reino_2, es_aliado} = req.body
        if (id_reino_1 === undefined || id_reino_2 === undefined || es_aliado === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const diplomacia = await prisma.diplomacias.create({
                data: {
                    id_reino_1,
                    id_reino_2,
                    es_aliado
                }
            })
            res.status(201).json(diplomacia)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarDiplomacia = async (req, res) => {
    try {
        const {id_reino_1, id_reino_2} = req.params
        const {es_aliado} = req.body
        var diplomacia = await prisma.diplomacias.findUnique({
            where: {
                id_reino_1_id_reino_2: {
                    id_reino_1: Number(id_reino_1),
                    id_reino_2: Number(id_reino_2)
                }
            }
        })
        if (diplomacia === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {
            diplomacia = await prisma.diplomacias.update ({
                where: {
                    id_reino_1_id_reino_2: {
                        id_reino_1: Number(id_reino_1),
                        id_reino_2: Number(id_reino_2)
                    }
                },
                data: {es_aliado}
            })
            res.json(diplomacia)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarDiplomacia = async (req, res) => {
    try {
        const {id_reino_1, id_reino_2} = req.params
        var diplomacia = await prisma.diplomacias.findUnique({
            where: {
                id_reino_1_id_reino_2: {
                    id_reino_1: Number(id_reino_1),
                    id_reino_2: Number(id_reino_2)
                }
            }
        })
        if (diplomacia === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {
            diplomacia = await prisma.diplomacias.delete({
                where: {
                    id_reino_1_id_reino_2: {
                        id_reino_1: Number(id_reino_1),
                        id_reino_2: Number(id_reino_2)
                    }
                }
            })
            res.json({message: "Eliminado con éxito"})
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const DiplomaciasController = {
    getDiplomacias,
    getDiplomaciaById,
    crearDiplomacia,
    actualizarDiplomacia,
    eliminarDiplomacia
}

export default DiplomaciasController