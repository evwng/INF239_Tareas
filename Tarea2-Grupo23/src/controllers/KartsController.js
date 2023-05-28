import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getKarts = async(req, res) => {
    try {
        const karts = await prisma.karts.findMany()
        res.json(karts)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getKartById = async (req, res) => {
    try {
        const {id} = req.params
        const kart = await prisma.karts.findUnique({
            where: {id: Number(id)}
        })
        res.json(kart)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearKart = async (req, res) => {
    try {
        const {modelo, color, velocidad_maxima, id_personaje} = req.body
        if (modelo === undefined || color === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const kart = await prisma.karts.create({
                data: {
                    modelo,
                    color,
                    velocidad_maxima,
                    id_personaje
                }
            })
            res.status(201).json(kart)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarKart = async (req, res) => {
    try {
        const {id} = req.params
        const {modelo, color, velocidad_maxima, id_personaje} = req.body
        if (modelo === undefined || color === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const kart = await prisma.karts.update ({
                where: {id: Number(id)},
                data: {
                    modelo,
                    color,
                    velocidad_maxima,
                    id_personaje
                }
            })
            res.json(kart)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarKart = async (req, res) => {
    try {
        const {id} = req.params
        const kart = await prisma.karts.delete({
            where: {id: Number(id)}
        })
        res.json(kart)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const KartsController = {
    getKarts,
    getKartById,
    crearKart,
    actualizarKart,
    eliminarKart
}

export default KartsController