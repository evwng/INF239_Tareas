-- CreateTable
CREATE TABLE "defensas" (
    "id" SERIAL NOT NULL,
    "defensa" VARCHAR(45) NOT NULL,

    CONSTRAINT "defensas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "diplomacias" (
    "id_reino_1" INTEGER NOT NULL,
    "id_reino_2" INTEGER NOT NULL,
    "es_aliado" BOOLEAN NOT NULL,

    CONSTRAINT "diplomacias_pkey" PRIMARY KEY ("id_reino_1","id_reino_2")
);

-- CreateTable
CREATE TABLE "karts" (
    "id" SERIAL NOT NULL,
    "modelo" VARCHAR(45) NOT NULL,
    "color" VARCHAR(45) NOT NULL,
    "velocidad_maxima" INTEGER,
    "id_personaje" INTEGER,

    CONSTRAINT "karts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "personajes" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(45) NOT NULL,
    "fuerza" INTEGER NOT NULL,
    "fecha_nacimiento" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "objeto" VARCHAR(30),

    CONSTRAINT "personajes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "personaje_habita_reino" (
    "id_personaje" INTEGER NOT NULL,
    "id_reino" INTEGER NOT NULL,
    "fecha_registro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "es_gobernante" BOOLEAN NOT NULL,

    CONSTRAINT "personaje_habita_reino_pkey" PRIMARY KEY ("id_personaje","id_reino")
);

-- CreateTable
CREATE TABLE "personaje_tiene_trabajo" (
    "id_trabajo" INTEGER NOT NULL,
    "id_personaje" INTEGER NOT NULL,
    "fecha_inicio" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fecha_termino" DATE,

    CONSTRAINT "personaje_tiene_trabajo_pkey" PRIMARY KEY ("id_personaje","id_trabajo")
);

-- CreateTable
CREATE TABLE "reinos" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(45) NOT NULL,
    "ubicacion" VARCHAR(45) NOT NULL,
    "superficie" INTEGER NOT NULL,

    CONSTRAINT "reinos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "trabajos" (
    "id" SERIAL NOT NULL,
    "descripcion" VARCHAR(45),
    "sueldo" INTEGER NOT NULL,

    CONSTRAINT "trabajos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_defensasToreinos" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_defensasToreinos_AB_unique" ON "_defensasToreinos"("A", "B");

-- CreateIndex
CREATE INDEX "_defensasToreinos_B_index" ON "_defensasToreinos"("B");

-- AddForeignKey
ALTER TABLE "diplomacias" ADD CONSTRAINT "diplomacias_id_reino_1_fkey" FOREIGN KEY ("id_reino_1") REFERENCES "reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "diplomacias" ADD CONSTRAINT "diplomacias_id_reino_2_fkey" FOREIGN KEY ("id_reino_2") REFERENCES "reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "karts" ADD CONSTRAINT "karts_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "personajes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaje_habita_reino" ADD CONSTRAINT "personaje_habita_reino_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaje_habita_reino" ADD CONSTRAINT "personaje_habita_reino_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaje_tiene_trabajo" ADD CONSTRAINT "personaje_tiene_trabajo_id_trabajo_fkey" FOREIGN KEY ("id_trabajo") REFERENCES "trabajos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "personaje_tiene_trabajo" ADD CONSTRAINT "personaje_tiene_trabajo_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_defensasToreinos" ADD CONSTRAINT "_defensasToreinos_A_fkey" FOREIGN KEY ("A") REFERENCES "defensas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_defensasToreinos" ADD CONSTRAINT "_defensasToreinos_B_fkey" FOREIGN KEY ("B") REFERENCES "reinos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
