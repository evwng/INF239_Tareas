import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getKarts = async(req, res) => {
    const karts = await prisma.karts.findMany()
    res.json(karts)
}

//GET para obtener solamente un elemento específico de la tabla
const getKartById = async (req, res) =>{
    const { id } = req.params
    const kart = await prisma.karts.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(kart)
}

//POST
const crearKart = async (req, res) => {
    const { modelo, color, velocidad_maxima, id_personaje } = req.body
    const kart = await prisma.karts.create({
        data: {
            modelo,
            color,
            velocidad_maxima,
            id_personaje
        }
    })
    res.json(kart)
}

//PUT
const actualizarKart = async (req, res) => {
    const { modelo, color, velocidad_maxima, id_personaje} = req.body
    const kart = await prisma.karts.update ({
        where: {
            id: Number(id)
        },
        data: {
            modelo,
            color,
            velocidad_maxima,
            id_personaje
        }
    })
    res.json(kart)
}

//REMOVE
const eliminarKart = async (req, res) => {
    const { id } = req.params
    const kart = await prisma.karts.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(kart)
}

const KartsController = {
    getKarts,
    getKartById,
    crearKart,
    actualizarKart,
    eliminarKart
}

export default KartsController