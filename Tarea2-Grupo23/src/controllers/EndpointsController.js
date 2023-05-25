import prisma from '../prismaClient.js'

//TOP 5 PERSONAJES CON MAS FUERZA
const top5PersonajesConMasFuerza = async (req, res) => {
    const personajes = await prisma.Personajes.findMany()
    let respuesta = personajes.sort((p1, p2) => (p1.fuerza < p2.fuerza) ? 1 : (p1.fuerza > p2.fuerza) ? -1 : 0);   
    res.json(respuesta.slice(0, 5))
}

//PERSONAJE CON MAS KARTS
const personajeConMasKarts = async (req, res) => {
    let arreglo = []
    const karts = await prisma.Karts.findMany()
    for (const kart of karts){
        var flag = false
        var contador = 0
        for (const subarreglo of arreglo){
            if (subarreglo[0] === kart.id){
                flag = true,
                arreglo[contador][1] = subarreglo[1] + 1
            }
            contador = contador + 1
        }
        if (flag === false){
            arreglo.push([kart.id, 1])
        }
    }
    arreglo = arreglo.sort((p1, p2) => (p1[1] < p2[1]) ? 1 : (p1[1] > p2)[1] ? -1 : 0)
    const personaje = await prisma.Personajes.findUnique({
        where: {
            id: Number(arreglo[0][0])
        }
    })
    const respuesta = {
        "nombre": personaje.nombre,
        "cantidad de karts": arreglo[0][1]
    }
    res.json(respuesta)
}

const EndpointsController = {
    top5PersonajesConMasFuerza,
    personajeConMasKarts
}

export default EndpointsController