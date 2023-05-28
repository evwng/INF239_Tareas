import prisma from '../prismaClient.js'

//GET para obtener todos los elementos de la tabla
const getTrabajos = async(req, res) => {
    try {
        const trabajos = await prisma.Trabajos.findMany()
        res.json(trabajos)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//GET para obtener solamente un elemento específico de la tabla
const getTrabajoById = async (req, res) => {
    try {
        const {id} = req.params 
        const trabajo = await prisma.Trabajos.findUnique({
            where: {id: Number(id)}
        })
        res.json(trabajo)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//POST
const crearTrabajo = async (req, res) => {
    try {
        const {descripcion, sueldo} = req.body
        if (sueldo === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const trabajo = await prisma.trabajos.create({
                data: {
                    descripcion,
                    sueldo
                }
            })
            res.json(trabajo)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//PUT
const actualizarTrabajo = async (req, res) => {
    try {
        const {id} = req.params
        const {descripcion, sueldo} = req.body
        if (sueldo === undefined){res.status(400).json({message: "Solicitud incorrecta. Faltan datos"})}
        else {
            const trabajo = await prisma.trabajos.update ({
                where: {id: Number(id)},
                data: {
                    descripcion,
                    sueldo
                }
            })
            res.json(trabajo)
        }
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

//DELETE
const eliminarTrabajo = async (req, res) => {
    try {
        const {id} = req.params
        //ELIMINACIÓN EN CASCADA: TABLA PERSONAJE_TIENE_TRABAJO
        const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.findMany({
            where: {id_trabajo: Number(id)}
        })
        if (personaje_tiene_trabajo != []){
            const personaje_tiene_trabajo = await prisma.personaje_tiene_trabajo.deleteMany({
                where: {id_trabajo: Number(id)}
            })
        }
        const trabajo = await prisma.trabajos.delete({
            where: {id: Number(id)}
        })
        res.status(201).json(trabajo)
    }
    catch (error){res.status(500).json({message: "Internal Server Error"})}
}

const TrabajosController = {
    getTrabajos,
    getTrabajoById,
    crearTrabajo,
    actualizarTrabajo,
    eliminarTrabajo
}

export default TrabajosController