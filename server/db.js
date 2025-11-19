//Crear una base de datos
//Crear un usuario veterinario@% y darle todos los permisos
//Crear una tabla veterinaria

import { createPool } from "mysql2/promise"

export const pool = createPool({
    host: 'localhost',
    port: 3306,
    user: 'veterinaria',
    password: 'universopet',
    database: 'veterinaria'
})