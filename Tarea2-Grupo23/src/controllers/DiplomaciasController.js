import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDiplomacias = async(req, res) => {
    const diplomacias = await prisma.diplomacias.findMany()
    res.json(diplomacias)
}

//GET para obtener solamente un elemento específico de la tabla
const getDiplomaciaById = async (req, res) =>{
    const { id_reino_1, id_reino_2 } = req.params 
    const diplomacia = await prisma.diplomacias.findUnique({
        where: {
            id_reino_1: Number(id_reino_1),
            id_reino_2: Number(id_reino_2)
        }
    })
    res.json(diplomacia)
}

//POST
const crearDiplomacia = async (req, res) => {
    const { id_reino_1, id_reino_2, es_aliado } = req.body
    const diplomacia = await prisma.diplomacias.create({
        data: {
            id_reino_1,
            id_reino_2,
            es_aliado
        }
    })
    res.json(diplomacia)
}

//PUT
const actualizarDiplomacia = async (req, res) => {
    const { id_reino_2, id_reino_1, es_aliado } = req.body
    const diplomacia = await prisma.diplomacias.update ({
        where: {
            id_reino_1: Number(id_reino_1),
            id_reino_2: Number(id_reino_2)
        },
        data: {
            es_aliado
        }
    })
    res.json(diplomacia)
}

//REMOVE
const eliminarDiplomacia = async (req, res) => {
    const { id_reino_1, id_reino_2 } = req.params
    const diplomacia = await prisma.diplomacias.delete({
        where: {
            id_reino_1: Number(id_reino_1),
            id_reino_2: Number(id_reino_2)
        }
    })
    res.json(diplomacia)
}

const DiplomaciasController = {
    getDiplomacias,
    getDiplomaciaById,
    crearDiplomacia,
    actualizarDiplomacia,
    eliminarDiplomacia
}

export default DiplomaciasController