import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDefensas = async(req, res) => {
    const d = await prisma.Defensas.findMany()
    res.json(d)
}

//GET para obtener solamente un elemento específico de la tabla
const getDefensaById = async (req, res) =>{
    const { id } = req.params 
    const d = await prisma.Defensas.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(d)
}

//POST
const crearDefensa = async (req, res) => {
    const { defensa } = req.body
    const d = await prisma.Defensas.create({
        data: {
            defensa
        }
    })
    res.json(d)
}

//PUT
const actualizarDefensa = async (req, res) => {
    const { id } = req.params
    const d = await prisma.Defensas.update ({
        where: {
            id: Number(id)
        },
        data: {
            defensa
        }
    })
    res.json(d)
}

//REMOVE
const eliminarDefensa = async (req, res) => {
    const { id } = req.params
    const d = await prisma.Defensas.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(d)
}

const DefensasController = {
    getDefensas,
    getDefensaById,
    crearDefensa,
    actualizarDefensa,
    eliminarDefensa
}

export default DefensasController