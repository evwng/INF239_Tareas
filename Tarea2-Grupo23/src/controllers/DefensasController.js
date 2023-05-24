import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDefensas = async(req, res) => {
    const defensas = await prisma.defensas.findMany()
    res.json(defensas)
}

//GET para obtener solamente un elemento específico de la tabla
const getDefensaById = async (req, res) =>{
    const { id } = req.params 
    const defensa = await prisma.defensas.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(defensa)
}

//POST
const crearDefensa = async (req, res) => {
    const { defensa } = req.body
    const defensas = await prisma.defensas.create({
        data: {
            defensa
        }
    })
    res.json(defensas)
}

//PUT
const actualizarDefensa = async (req, res) => {
    const { id } = req.params
    const defensas = await prisma.defensas.update ({
        where: {
            id: Number(id)
        },
        data: {
            defensa
        }
    })
    res.json(defensas)
}

//REMOVE
const eliminarDefensa = async (req, res) => {
    const { id } = req.params
    const defensas = await prisma.defensas.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(defensas)
}

const DefensasController = {
    getDefensas,
    getDefensaById,
    crearDefensa,
    actualizarDefensa,
    eliminarDefensa
}

export default DefensasController