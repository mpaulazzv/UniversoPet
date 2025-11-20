CREATE USER 'veterinaria'@'%' IDENTIFIED BY 'universopet';
create database veterinaria;
GRANT USAGE ON veterinaria.* TO 'veterinaria'@'%';
GRANT ALL PRIVILEGES ON veterinaria.* TO 'veterinaria'@'%';
use veterinaria;

create table
    Ciudades (
        idCiudad INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        ciudad VARCHAR(50) NOT NULL
    );

create table Estados(
    idEstado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    estado VARCHAR(50) NOT NULL
);

create table
    Sedes(
        idSede INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        img LONGTEXT NOT NULL,
        titulo VARCHAR(200) Not null,
        descripcion VARCHAR(200) not null,
        idCiudad INT not null,
        idEstado INT not null,
        FOREIGN KEY (idCiudad) REFERENCES Ciudades(idCiudad),
        FOREIGN KEY (idEStado) REFERENCES Estados(idEstado)
    );

create table EstadosCitas(
    idEStadoCita INT AUTO_INCREMENT PRIMARY KEY,
    estadoCita VARCHAR(20) NOT NULL
);

create table
    Servicios (
        idServicio INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(40) NOT NULL,
        idName VARCHAR(40) NOT NULL,
        descripcion VARCHAR(900) NOT NULL,
        imgVista LONGTEXT NOT NULL,
        imgServicio LONGTEXT NOT NULL,
        idEstado INT NOT NULL,
        FOREIGN KEY (idEStado) REFERENCES Estados(idEstado)
    );

create table TipoAnimal (
    idTipoAnimal INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipoAnimal VARCHAR(30) NOT NULL
);

create table Razas (
    idRaza INT AUTO_INCREMENT PRIMARY KEY,
    raza varchar(30) NOT NULL,
    idTipoAnimal INT,
    FOREIGN KEY (idTipoAnimal) REFERENCES TipoAnimal(idTipoAnimal) 
);

create table TipoPersonal(
    idTipoPersonal INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipoPersonal VARCHAR(50)
);

create table Usuarios(
    idUsuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(100) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fotoPerfil LONGTEXT,
    idEstado INT NOT NULL,
    celular BIGINT NOT NULL,
    edad INT NOT NULL,
    FOREIGN KEY (idEStado) REFERENCES Estados(idEstado) 
);

create table admins (
    admin VARCHAR(20) PRIMARY KEY NOT NULL,
    password VARCHAR (200) NOT NULL
);

create table Mascotas(
    idMascota INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre varchar(50) NOT NULL,
    fechaNac DATE NOT NULL,
    peso INT NOT NULL,
    idRaza INT NOT NULL,
    idEstado INT NOT NULL,
    imagen LONGTEXT,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idRaza) REFERENCES Razas(idRaza),
    FOREIGN KEY (idEstado) REFERENCES Estados(idEstado),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
);


create table
    Personal(
        cedula bigint PRIMARY KEY NOT NULL,
        password VARCHAR(100),
        nombres VARCHAR(100) NOT NULL,
        apellidos VARCHAR(100) NOT NULL,
        email VARCHAR (200) NOT NULL,
        profesion VARCHAR (600) NOT NULL,
        fotoPerfil LONGTEXT NULL,
        idTipoPersonal INT NOT NULL,
        idEstado INT NOT NULL,
        FOREIGN KEY (idTipoPersonal) REFERENCES TipoPersonal(idTipoPersonal),
        FOREIGN KEY (idEstado) REFERENCES Estados(idEstado)
    );

ALTER TABLE Personal MODIFY fotoPerfil LONGTEXT NULL;

create table Citas(
    idCita INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fechaInicio DATETIME NOT NULL,
    idServicio INT NOT NULL,
    idMascota INT NOT NULL,
    cedula BIGINT NOT NULL,
    idSede INT NOT NULL,
    idEStadoCita INT NOT NULL,
    FOREIGN KEY (idServicio) REFERENCES Servicios(idServicio),
    FOREIGN KEY (idMascota) REFERENCES Mascotas(idMascota),
    FOREIGN KEY (cedula) REFERENCES Personal(cedula),
    FOREIGN KEY (idEStadoCita) REFERENCES EstadosCitas(idEStadoCita),
    FOREIGN KEY(idSede) REFERENCES Sedes(idSede)
);

create table Diagnosticos(
    idDiagnostico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descDIagnostico VARCHAR(2000) NOT NULL,
    comentario VARCHAR (2000) ,
    idCita INT NOT NULL,
    FOREIGN KEY (idCita) REFERENCES Citas(idCita)
);

create table DiagnosticosxCita(
    idCita INT NOT NULL,
    idDiagnostico INT NOT NULL,
    PRIMARY KEY (idCita, idDiagnostico),
    FOREIGN KEY (idCita) REFERENCES Citas(idCita),
    FOREIGN KEY (idDiagnostico) REFERENCES Diagnosticos(idDiagnostico)
);

insert into admins (admin, password) values ('admin', 'admin');