import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDefensas = async(req, res) => {
    try {
        const d = await prisma.defensas.findMany()
        res.json(d)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getDefensaById = async (req, res) =>{
    try {
        const { id } = req.params
        const d = await prisma.defensas.findUnique({
            where: {
                id: Number(id)
            }
        })
        res.json(d)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearDefensa = async (req, res) => {
    try {
        const { defensa } = req.body
        if (defensa === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const d = await prisma.defensas.create({
                data: {
                    defensa
                }
            })
            res.json(d)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarDefensa = async (req, res) => {
    try {
        const { id } = req.params
        const { defensa } = req.body
        if (defensa === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const d = await prisma.defensas.update ({
                where: {
                    id: Number(id)
                },
                data: {
                    defensa
                }
            })
            res.json(d)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//REMOVE
const eliminarDefensa = async (req, res) => {
    try {
        const { id } = req.params
        const d = await prisma.defensas.delete({
            where: {
                id: Number(id)
            }
        })
        res.json(d)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const DefensasController = {
    getDefensas,
    getDefensaById,
    crearDefensa,
    actualizarDefensa,
    eliminarDefensa
}

export default DefensasController