


const id_reino = 2
const personajes_habitan_reinos = [
    { 
        "id_personaje": 1,
        "id_reino": 1,
        "es_gobernante": false    
    },
    {
        "id_personaje": 2,
        "id_reino": 2,
        "es_gobernante": false
    },
    {
        "id_personaje": 3,
        "id_reino": 1,
        "es_gobernante": true
    },
    {
        "id_personaje": 4,
        "id_reino": 2,
        "es_gobernante": true
    }
]
var contador = 0
for (const habitante of personajes_habitan_reinos){
    if (habitante.id_reino === id_reino){
        contador += 1
    }
}
console.log(contador)
const respuesta = {
    "id_reino": id_reino,
    "Cantidad de personajes que habitan el reino": contador
}
console.log(respuesta)