import express from 'express';
import DefensasController from './controllers/DefensasController.js';
import DiplomaciasController from './controllers/DiplomaciasController.js';
import KartsController from './controllers/KartsController.js';
import PersonajesController from './controllers/PersonajesController.js';
import Personaje_habita_reinoController from './controllers/Personaje_habita_reinoController.js';
import Personaje_tiene_trabajoController from './controllers/Personaje_tiene_trabajoController.js';
import ReinosController from './controllers/ReinosController.js';
import TrabajosController from './controllers/TrabajosController.js';
import morgan from 'morgan';

const ENV = process.env;
const app = express();

//middleware
app.use(express.json());
app.use(morgan('dev'));

//endpoints(Routes)

app.get('/api/defensas', DefensasController.getDefensas)
app.get('/api/defensas/:id', DefensasController.getDefensaById)
app.post('/api/defensas', DefensasController.crearDefensa)
app.put('/api/defensas/:id', DefensasController.actualizarDefensa)
app.delete('/api/defensas/:id', DefensasController.eliminarDefensa)

app.get('/api/diplomacias', DiplomaciasController.getDiplomacias)
app.get('/api/diplomacias/:id', DiplomaciasController.getDiplomaciaById)
app.post('/api/diplomacias', DiplomaciasController.crearDiplomacia)
app.put('/api/diplomacias/', DiplomaciasController.actualizarDiplomacia)
app.delete('/api/diplomacias/:id_reino_1/:id_reino_2', DiplomaciasController.eliminarDiplomacia)

app.get('/api/karts', KartsController.getKarts)
app.get('/api/karts/:id', KartsController.getKartById)
app.post('/api/karts', KartsController.crearKart)
app.put('/api/karts/:id', KartsController.actualizarKart)
app.delete('/api/karts/:id', KartsController.eliminarKart)

app.get('/api/personajes', PersonajesController.getPersonajes)
app.get('/api/personajes/:id', PersonajesController.getPersonajesById)
app.post('/api/personajes', PersonajesController.crearPersonaje)
app.put('/api/personajes/:id', PersonajesController.actualizarPersonaje)
app.delete('/api/personajes/:id', PersonajesController.eliminarPersonaje)

app.get('/api/personaje_habita_reino', Personaje_habita_reinoController.getPersonaje_habita_reino)
app.get('/api/personaje_habita_reino/:id_personaje/:id_reino', Personaje_habita_reinoController.getPersonaje_habita_reinoById)
app.post('/api/personaje_habita_reino', Personaje_habita_reinoController.crearPersonaje_habita_reino)
app.put('/api/personaje_habita_reino', Personaje_habita_reinoController.actualizarPersonaje_habita_reino)
app.delete('/api/personaje_habita_reino/:id_personaje/:id_reino', Personaje_habita_reinoController.eliminarPersonaje_habita_reino)

app.get('/api/personaje_tiene_trabajo', Personaje_tiene_trabajoController.getPersonaje_tiene_trabajo)
app.get('/api/personaje_tiene_trabajo/:id_personaje/:id_trabajo', Personaje_tiene_trabajoController.getPersonaje_tiene_trabajoById)
app.post('/api/personaje_tiene_trabajo', Personaje_tiene_trabajoController.crearPersonaje_tiene_trabajo)
app.put('/api/personaje_tiene_trabajo', Personaje_tiene_trabajoController.actualizarPersonaje_tiene_trabajo)
app.delete('/api/personaje_tiene_trabajo/:id_personaje/:id_trabajo', Personaje_tiene_trabajoController.eliminarPersonaje_tiene_trabajo)

app.get('/api/reinos', ReinosController.getReinos)
app.get('/api/reinos/:id', ReinosController.getReinoById)
app.post('/api/reinos', ReinosController.crearReino)
app.put('/api/reinos/:id', ReinosController.actualizarReino)
app.delete('/api/reinos/:id', ReinosController.eliminarReino)

app.get('/api/trabajos', TrabajosController.getTrabajos)
app.get('/api/trabajos/:id', TrabajosController.getTrabajoById)
app.post('/api/trabajos', TrabajosController.crearTrabajo)
app.put('/api/trabajos/:id', TrabajosController.actualizarTrabajo)
app.delete('/api/trabajos/:id', TrabajosController.eliminarTrabajo)

//==========================================================//
app.get('/', (req, res) => {
    res.json({ message: 'Hello World!!' });
})
//==========================================================//


// 404 not found route
app.use((_, res) => {
    res.status(404).json({ message: 'Not found Crack!' });
})


//Init server
app.listen(ENV.API_PORT, () => {
    console.log(`Server running on port ${ENV.API_PORT}`);
})