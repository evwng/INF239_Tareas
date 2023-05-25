import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getTrabajos = async(req, res) => {
    const trabajos = await prisma.Trabajos.findMany()
    res.json(trabajos)
}

//GET para obtener solamente un elemento específico de la tabla
const getTrabajoById = async (req, res) =>{
    const { id } = req.params 
    const trabajo = await prisma.Trabajos.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(trabajo)
}

//POST
const crearTrabajo = async (req, res) => {
    const { descripcion, sueldo } = req.body
    const trabajo = await prisma.trabajos.create({
        data: {
            descripcion,
            sueldo
        }
    })
    res.json(trabajo)
}

//PUT
const actualizarTrabajo = async (req, res) => {
    const { id, descripcion, sueldo } = req.body
    const trabajo = await prisma.trabajos.update ({
        where: {
            id: Number(id)
        },
        data: {
            descripcion,
            sueldo
        }
    })
    res.json(trabajo)
}

//REMOVE
const eliminarTrabajo = async (req, res) => {
    const { id } = req.params
    const trabajo = await prisma.trabajos.delete({
        where: {
            id: Number(id)
        }
    })
    res.json(trabajo)
}

const TrabajosController = {
    getTrabajos,
    getTrabajoById,
    crearTrabajo,
    actualizarTrabajo,
    eliminarTrabajo
}

export default TrabajosController