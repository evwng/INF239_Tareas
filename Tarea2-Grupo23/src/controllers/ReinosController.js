import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getReinos = async(req, res) => {
    try {
        const reinos = await prisma.reinos.findMany()
        res.json(reinos)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getReinoById = async (req, res) => {
    try {
        const {id} = req.params
        const reino = await prisma.reinos.findUnique({
            where: {id: Number(id)}
        })
        res.json(reino)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearReino = async (req, res) => {
    try {
        const {nombre, ubicacion, superficie} = req.body
        if (nombre === undefined || ubicacion === undefined || superficie === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const reino = await prisma.reinos.create({
                data: {
                    nombre,
                    ubicacion,
                    superficie,
                }
            })
            res.json(reino)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarReino = async (req, res) => {
    try {
        const {id} = req.params
        const {nombre, ubicacion, superficie} = req.body
        if (nombre === undefined || ubicacion == undefined || superficie == undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const reino = await prisma.reinos.update ({
                where: {id: Number(id)},
                data: {
                    nombre,
                    ubicacion,
                    superficie
                }
            })
            res.json(reino)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarReino = async (req, res) => {
    try {
        const {id} = req.params
        const reino = await prisma.reinos.delete({
            where: {id: Number(id)}
        })
        res.json(reino) 
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const ReinosController = {
    getReinos,
    getReinoById,
    crearReino,
    actualizarReino,
    eliminarReino
}

export default ReinosController