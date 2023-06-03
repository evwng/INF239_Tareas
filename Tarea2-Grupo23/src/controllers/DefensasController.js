import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getDefensas = async(req, res) => {
    try {
        const d = await prisma.defensas.findMany({
            include: {reinos: true}
        })
        if (d.length === 0){res.status(204).json()}
        else {res.json(d)}
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getDefensaById = async (req, res) => {
    try {
        const {id} = req.params
        const d = await prisma.defensas.findUnique({
            where: {id: Number(id)},
            include: {reinos: true}
        })
        if (d === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {res.json(d)}
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearDefensa = async (req, res) => {
    try {
        const {defensa, reinos_crear, reinos_conectar} = req.body
        if (defensa === undefined || (reinos_crear === undefined && reinos_conectar === undefined)){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const d = await prisma.defensas.create({
                data: {
                    defensa,
                    reinos: {
                        create: reinos_crear,
                        connect: reinos_conectar
                    }
                }
            })
            res.status(201).json(d)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarDefensa = async (req, res) => {
    try {
        const {id} = req.params
        var d = await prisma.defensas.findUnique({
            where: {id: Number(id)}
        })
        if (d === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {
            const {defensa, reinos_crear, reinos_conectar, reinos_desconectar} = req.body
            d = await prisma.defensas.update ({
                where: {id: Number(id)},
                data: {
                    defensa,
                    reinos: {
                        create: reinos_crear,
                        connect: reinos_conectar,
                        disconnect: reinos_desconectar
                    }
                }
            })
            res.json(d)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarDefensa = async (req, res) => {
    try {
        const {id} = req.params
        var d = await prisma.defensas.findUnique({
            where: {id: Number(id)}
        })
        if (d === null){res.status(404).json({message: "No existe el elemento buscado"})}
        else {
            d = await prisma.defensas.delete({
                where: {id: Number(id)}
            })
            res.json({message: "Eliminado con éxito"})
        }
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