create database BDMiMascota
go

USE [BDMiMascota]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET DATEFORMAT DMY
GO

CREATE TABLE [dbo].[Administrador](
	[id_administrador] [INTEGER] NOT NULL PRIMARY KEY,
	[nombre_administrador] [varchar] (30) NOT NULL,
	[pass_administrador] [varchar] (30) NOT NULL,
	[correo_administrador] [varchar] (30) NOT NULL
)ON [PRIMARY]

GO

CREATE TABLE [dbo].[Usuario](
	[id_usuario] [INTEGER] IDENTITY(4,1) NOT NULL PRIMARY KEY,
	[nombre_usuario] [varchar](30) NOT NULL,
	[apellido_usuario] [varchar](30) NOT NULL,
	[edad_usuario]  [INTEGER] NOT NULL,
	[correo_usuario] [varchar](100) NOT NULL,
	[login_usuario] [varchar](100) NOT NULL,
	[password_usuario] [varchar](30) NOT NULL,
	[Administrador_id] [INTEGER] FOREIGN KEY REFERENCES [Administrador](id_administrador)
) ON [PRIMARY]

GO

Create TABLE [dbo].[Publicacion](
	[Fecha_Perdida] [DATETIME] NOT NULL,
	[imagen_publicacion] [image] NULL,
	[descripcion_publicacion] [varchar](8000) NOT NULL,
	[nombre_publicacion] [varchar] (30) NOT NULL,
	[id_publicacion] [INTEGER] IDENTITY(3,1) NOT NULL PRIMARY KEY,
	[Usuario_id] [INTEGER] FOREIGN KEY REFERENCES [Usuario](id_usuario)
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Mascota](
	[nombre_mascota] [varchar](30) NOT NULL,
	[id_mascota] [INTEGER] IDENTITY(3,1) NOT NULL PRIMARY KEY,
	[tamaño_mascota] [varchar](10) NOT NULL,
	[edad_mascota] INTEGER NOT NULL,
	[Publicacion_id] [INTEGER] FOREIGN KEY REFERENCES [Publicacion](id_publicacion)
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[Publicacion] ADD UNIQUE(id_publicacion)

GO

ALTER TABLE [dbo].[Usuario] ADD UNIQUE(correo_usuario)

GO

ALTER TABLE [dbo].[Usuario] ADD UNIQUE(login_usuario)

GO

SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Procedimientos almacenados

--ListarPublicaciones, ListarUsuarios y ListarMascotas son consultas que la hara el administrador

CREATE PROCEDURE [dbo].[ListarUsuarios]
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT * FROM Usuario

END

GO


CREATE PROCEDURE [dbo].[ListarPublicaciones]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Fecha_Perdida, nombre_publicacion, id_publicacion, Usuario_id FROM Publicacion
	
END

GO

CREATE PROCEDURE [dbo].[ListarMascotas]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM Mascota
	
END

GO

--TRIGGERS

--Poblacion Inicial


INSERT INTO [dbo].[Administrador](
	id_administrador,
	nombre_administrador,
	pass_administrador,
	correo_administrador
)VALUES(1, 'Ivan', ':v', 'raider304@gmail.com')

GO

SET IDENTITY_INSERT [dbo].[Usuario] ON

INSERT INTO [dbo].[Usuario] (
	id_usuario,
	nombre_usuario,
	apellido_usuario,
	edad_usuario,
	correo_usuario,
	login_usuario,
	password_usuario,
	Administrador_id
)VALUES(1,'Bryan', 'Millaqueo', 21, 'bmillaqueoherrera@gmail.com', 'bry_98', 'nayrb', 1)

GO

SET IDENTITY_INSERT [dbo].[Usuario] OFF

SET IDENTITY_INSERT [dbo].[Usuario] ON

INSERT INTO [dbo].[Usuario] (
	id_usuario,
	nombre_usuario,
	apellido_usuario,
	edad_usuario,
	correo_usuario,
	login_usuario,
	password_usuario,
	Administrador_id
)VALUES(2,'Manuel', 'Ramos', 33, 'ManuelX@gmail.com', 'mnl_8_2', 'iki', 1)

GO

SET IDENTITY_INSERT [dbo].[Usuario] OFF

SET IDENTITY_INSERT [dbo].[Usuario] ON

INSERT INTO [dbo].[Usuario] (
	id_usuario,
	nombre_usuario,
	apellido_usuario,
	edad_usuario,
	correo_usuario,
	login_usuario,
	password_usuario,
	Administrador_id
)VALUES(3, 'Raquel', 'Lolleo', 21, 'Rllo@gmail.com', 'LRaq2', 'raquel2', 1)

GO

SET IDENTITY_INSERT [dbo].[Usuario] OFF

SET IDENTITY_INSERT [dbo].[Publicacion] ON

INSERT INTO [dbo].[Publicacion] (
	Fecha_Perdida,
	imagen_publicacion,
	descripcion_publicacion,
	nombre_publicacion,
	id_publicacion,
	Usuario_id
)VALUES('14-10-2007', NULL, 'Hola me mori :c', 'El perro arrepentido', 1, 1)

GO

SET IDENTITY_INSERT [dbo].[Publicacion] OFF

SET IDENTITY_INSERT [dbo].[Publicacion] ON

INSERT INTO [dbo].[Publicacion] (
	Fecha_Perdida,
	imagen_publicacion,
	descripcion_publicacion,
	nombre_publicacion,
	id_publicacion,
	Usuario_id
)VALUES('14-10-2010', NULL, 'El gato', 'El gato arrepentido', 2, 2)

GO

SET IDENTITY_INSERT [dbo].[Publicacion] OFF

SET IDENTITY_INSERT [dbo].[Mascota] ON

INSERT INTO [dbo].[Mascota](
	nombre_mascota,
	id_mascota,
	tamaño_mascota,
	edad_mascota,
	Publicacion_id
)VALUES('Perro', 1, '2 metros', 50, 1)

GO

SET IDENTITY_INSERT [dbo].[Mascota] OFF

SET IDENTITY_INSERT [dbo].[Mascota] ON

INSERT INTO [dbo].[Mascota](
	nombre_mascota,
	id_mascota,
	tamaño_mascota,
	edad_mascota,
	Publicacion_id
)VALUES('Gato', 2, '2 Litros', 0, 2)

GO

SET IDENTITY_INSERT [dbo].[Mascota] OFF