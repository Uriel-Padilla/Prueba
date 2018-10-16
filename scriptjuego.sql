-- Autor:
-- Fecha:
-- Descripcion:

CREATE DATABASE IF NOT EXISTS juego;

-- or

DROP DATABASE IF EXISTS juego;
CREATE DATABASE juego;


USE juego;

CREATE TABLE jugadores(
    idJugador INT NOT NULL AUTO_INCREMENT,
    nombreJugador VARCHAR(45) NOT NULL,
    nivel INT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT jugadores_pk PRIMARY KEY(idJugador)
);

CREATE TABLE campeones(
    idCampeon INT NOT NULL AUTO_INCREMENT,
    nombreCampeon VARCHAR(45) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    precio INT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT campeones_clave_alt UNIQUE (nombreCampeon),
    CONSTRAINT campeones_pk PRIMARY KEY(idCampeon)
);

CREATE TABLE batallas(
    jugadorId INT NOT NULL,
    campeonId INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT batallas_jugadores FOREIGN KEY (jugadorId)
        REFERENCES jugadores (idJugador)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT batallas_campeones FOREIGN KEY (campeonId)
        REFERENCES campeones (idCampeon)
        ON DELETE RESTRICT
        ON UPDATE CASCADE, 
        CONSTRAINT batallas_pk PRIMARY KEY  (jugadorId, campeonId)
);


CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCampeones`(in id int)
BEGIN
	delete from campeones where id= id ;
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCampeones`(in nombre varchar(45),in tipo varchar(45),in precio int,in fecha date )
BEGIN
 insert into campeones values(nombre,tipo,precio,fecha);
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarCampeones`()
BEGIN
	select * from campeones;
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `selecionarporIdcampeones`(in id int)
BEGIN
	select nombreCampeon from campeones where id = id;
END