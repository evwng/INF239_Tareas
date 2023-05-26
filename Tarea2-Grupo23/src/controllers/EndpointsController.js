import prisma from '../prismaClient.js'

//TOP 5 PERSONAJES CON MAS FUERZA
const top5PersonajesConMasFuerza = async (req, res) => {
    const personajes = await prisma.personajes.findMany()
    let respuesta = personajes.sort((p1, p2) => (p1.fuerza < p2.fuerza) ? 1 : (p1.fuerza > p2.fuerza) ? -1 : 0);   
    res.json(respuesta.slice(0, 5))
}

//PERSONAJE CON MAS KARTS
const personajeConMasKarts = async (req, res) => {
    const karts = await prisma.karts.findMany()
    let arreglo = []
    for (const kart of karts){
        var flag = false
        if (arreglo.length > 0){
            for (var contador = 0; contador < arreglo.length; contador++){
                if (arreglo[contador][0] === kart.id_personaje){
                    arreglo[contador][1] += 1
                    flag = true
                }
            }
        }
        if (flag === false){arreglo.push([kart.id_personaje, 1])}
    }
    arreglo = arreglo.sort((a, b) => b[1] - a[1])
    const personaje = await prisma.personajes.findUnique({
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

//CANTIDAD DE PERSONAJES QUE HABITAN EL REINO <id_reino>
const cantidadHabitantes = async (req , res) => {
    var contador = 0
    const { id_reino } = req.params
    const personajes_habitan_reinos = await prisma.personaje_habita_reino.findMany()
    for (const habitante of personajes_habitan_reinos){
        if (habitante.id_reino === Number(id_reino)){
            contador = contador + 1
        }
    }
    const respuesta = {
        "id_reino": id_reino,
        "Cantidad de personajes que habitan el reino": contador
    }
    res.json(respuesta)
}

//GOBERNANTE
const gobernante = async (req , res) => {
    const { id_reino } = req.params
    const gobernantes_habitan_reinos = await prisma.personaje_habita_reino.findMany({
        where: {
            es_gobernante: true 
        }
    })
    const personajes = await prisma.personajes.findMany()
    var respuesta = []
    if ( id_reino === undefined ){
        for (const gobernante_habita_reino of gobernantes_habitan_reinos){
            for (const personaje of personajes){
                if (personaje.id === gobernante_habita_reino.id_personaje){
                    respuesta.push(personaje)
                }
            }
        }
    }
    else {
        for(const gobernante_habita_reino of gobernantes_habitan_reinos){
            if (gobernante_habita_reino.id_reino === Number(id_reino)){
                for (const personaje of personajes){
                    if (personaje.id === gobernante_habita_reino.id_personaje){
                        respuesta.push(personaje)
                    }
                }
            }
        }
    }
    res.json(respuesta)
}

const EndpointsController = {
    top5PersonajesConMasFuerza,
    personajeConMasKarts,
    cantidadHabitantes,
    gobernante
}

export default EndpointsController