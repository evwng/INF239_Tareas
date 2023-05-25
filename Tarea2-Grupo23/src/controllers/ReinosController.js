import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getReinos = async(req, res) => {
    const reinos = await prisma.reinos.findMany()
    res.json(reinos)
}

//GET para obtener solamente un elemento específico de la tabla
const getReinoById = async (req, res) =>{
    const { id } = req.params
    const reino = await prisma.reinos.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(reino)
}

//POST
const crearReino = async (req, res) => {
    const { nombre, ubicacion, superficie } = req.body
    const reino = await prisma.reinos.create({
        data: {
            nombre,
            ubicacion,
            superficie,
        }
    })
    res.json(reino)
}

//PUT
const actualizarReino = async (req, res) => {
    const { id, nombre, ubicacion, superficie } = req.body
    const reino = await prisma.reinos.update ({
        where: {
            id: Number(id)
        },
        data: {
            nombre,
            ubicacion,
            superficie
        }
    })
    res.json(reino)
}

//REMOVE
const eliminarReino = async (req, res) => {
    const { id } = req.params
    const reino = await prisma.reinos.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(reino)
}

const ReinosController = {
    getReinos,
    getReinoById,
    crearReino,
    actualizarReino,
    eliminarReino
}

export default ReinosController