const karts = 
    [{"id": 1,
     "id_personaje": 1},
    {"id": 2,
     "id_personaje": 1},
    {"id": 3,
     "id_personaje": 1},
    {"id": 4,
     "id_personaje": 2},
    {"id": 5,
     "id_personaje": 3},
    {"id": 6,
     "id_personaje": 3},
    {"id": 7,
     "id_personaje": 3},
    {"id": 8,
     "id_personaje": 3}
]

var arreglo = []
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

console.log(arreglo)

arreglo = arreglo.sort((a, b) => b[1] - a[1])

console.log(arreglo)


const personaje = [
    {"id": 3,
     "nombre": "Holaaa"},
]

const respuesta = {
    "nombre": personaje[0].nombre,
    "cantidad de karts": arreglo[0][1]
}

console.log(respuesta)