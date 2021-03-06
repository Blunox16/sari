create database sari
go
USE [sari]
GO
/****** Object:  StoredProcedure [dbo].[insertararea]  s  Script Date: 04/12/2015 23:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertararea]
(
   	@area varchar(50),
	@descripcion varchar(50),
	@telefono varchar(50),
	@id_empleado int
)
AS
   	SET NOCOUNT OFF;
INSERT INTO [dbo].area([area], [descripcion], [telefono] , [id_empleado]) VALUES (@area, @descripcion, @telefono, @id_empleado);
GO
/****** Object:  StoredProcedure [dbo].[insertarempleados]    Script Date: 04/12/2015 23:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarempleados]
(
   	@nombre varchar(50),
	@apellido_p varchar(50),
	@apellido_m varchar (50),
	@direccion varchar (50),
	@telefono varchar (50),
	@correo varchar (50),
	@sexo varchar (50),
	@ultimoid int OUTPUT
)
AS
   	SET NOCOUNT OFF;
INSERT INTO  [dbo].empleado(Nombre,apellido_p,apellido_m,direccion,telefono,correo,sexo) VALUES (@nombre,@apellido_p,@apellido_m,@direccion,@telefono,@correo,@sexo);

SELECT * FROM empleado WHERE (id_empleado = SCOPE_IDENTITY())
SELECT @ultimoid= SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[insertarusuario]    Script Date: 04/12/2015 23:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarusuario]
(
   	@usuario varchar(50),
	@pass varchar(50), 
	@id_empleado int,
	@privilegio varchar(50)
)
AS
   	SET NOCOUNT OFF;
INSERT INTO [dbo].usuario(usuario, pass, id_empleado, privilegio) VALUES (@usuario,@pass,@id_empleado,@privilegio);

GO
/****** Object:  Table [dbo].[area]    Script Date: 04/12/2015 23:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[area](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[area] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[caracteristicas] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[id_empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[atiende]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atiende](
	[id_proveedor] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
 CONSTRAINT [PK_atiende] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC,
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_entradas]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_entradas](
	[id_detalle_entrada] [int] IDENTITY(1,1) NOT NULL,
	[id_entrada] [int] NULL,
	[id_suministro] [int] NULL,
	[no_articulos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_producto]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_producto](
	[id_compra] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio_venta] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_salida]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_salida](
	[id_detalle_salida] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_salida] [int] NOT NULL,
	[no_articulos] [int] NULL,
 CONSTRAINT [PK_detalle_salida] PRIMARY KEY CLUSTERED 
(
	[id_detalle_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_servicio]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_servicio](
	[id_compra] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[precio_venta] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC,
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido_p] [varchar](50) NULL,
	[apellido_m] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[sexo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entradas]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entradas](
	[id_entrada] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[hora] [time](7) NULL,
	[descripcion] [varchar](200) NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[identificador] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[modelo] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[grupo] [varchar](50) NULL,
	[localizacion] [varchar](50) NULL,
	[precio_compra] [money] NULL,
	[unidad_medida] [varchar](20) NULL,
	[cantidad_medida] [int] NULL,
	[stock] [int] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK__producto__FF341C0D0AD2A005] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[tel_1] [varchar](20) NULL,
	[tel_2] [varchar](20) NULL,
	[ciudad] [varchar](50) NULL,
	[direccion] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[salida]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[salida](
	[id_salida] [int] IDENTITY(1,1) NOT NULL,
	[hora] [time](7) NULL,
	[fecha] [datetime] NULL,
	[descripcion] [varchar](200) NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[servicios](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[identificador] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sol_compra]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sol_compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[caracteristicas] [varchar](200) NULL,
	[tipo] [varchar](50) NULL,
	[monto] [money] NULL,
	[fecha] [datetime] NULL,
	[estatus] [varchar](50) NULL,
	[id_usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[suministra]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suministra](
	[id_suministro] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_producto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_suministro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 04/12/2015 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[id_empleado] [int] NULL,
	[privilegio] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[atiende]  WITH CHECK ADD  CONSTRAINT [proveedor_atiende] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[atiende] CHECK CONSTRAINT [proveedor_atiende]
GO
ALTER TABLE [dbo].[atiende]  WITH CHECK ADD  CONSTRAINT [servicios_atiende] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[atiende] CHECK CONSTRAINT [servicios_atiende]
GO
ALTER TABLE [dbo].[detalle_entradas]  WITH CHECK ADD FOREIGN KEY([id_entrada])
REFERENCES [dbo].[entradas] ([id_entrada])
GO
ALTER TABLE [dbo].[detalle_entradas]  WITH CHECK ADD FOREIGN KEY([id_entrada])
REFERENCES [dbo].[entradas] ([id_entrada])
GO
ALTER TABLE [dbo].[detalle_entradas]  WITH CHECK ADD FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministra] ([id_suministro])
GO
ALTER TABLE [dbo].[detalle_entradas]  WITH CHECK ADD FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministra] ([id_suministro])
GO
ALTER TABLE [dbo].[detalle_entradas]  WITH CHECK ADD FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministra] ([id_suministro])
GO
ALTER TABLE [dbo].[detalle_producto]  WITH CHECK ADD FOREIGN KEY([id_compra])
REFERENCES [dbo].[sol_compra] ([id_compra])
GO
ALTER TABLE [dbo].[detalle_producto]  WITH CHECK ADD FOREIGN KEY([id_compra])
REFERENCES [dbo].[sol_compra] ([id_compra])
GO
ALTER TABLE [dbo].[detalle_producto]  WITH CHECK ADD  CONSTRAINT [FK__detalle_p__id_pr__3B75D760] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle_producto] CHECK CONSTRAINT [FK__detalle_p__id_pr__3B75D760]
GO
ALTER TABLE [dbo].[detalle_salida]  WITH CHECK ADD  CONSTRAINT [FK_detalle_salida_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle_salida] CHECK CONSTRAINT [FK_detalle_salida_producto]
GO
ALTER TABLE [dbo].[detalle_salida]  WITH CHECK ADD  CONSTRAINT [FK_detalle_salida_salida] FOREIGN KEY([id_salida])
REFERENCES [dbo].[salida] ([id_salida])
GO
ALTER TABLE [dbo].[detalle_salida] CHECK CONSTRAINT [FK_detalle_salida_salida]
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_compra])
REFERENCES [dbo].[sol_compra] ([id_compra])
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_compra])
REFERENCES [dbo].[sol_compra] ([id_compra])
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_compra])
REFERENCES [dbo].[sol_compra] ([id_compra])
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[detalle_servicio]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[sol_compra]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[sol_compra]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[sol_compra]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[sol_compra]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[suministra]  WITH CHECK ADD FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[suministra]  WITH CHECK ADD  CONSTRAINT [FK__suministr__id_pr__35BCFE0A] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[suministra] CHECK CONSTRAINT [FK__suministr__id_pr__35BCFE0A]
GO
ALTER TABLE [dbo].[suministra]  WITH CHECK ADD FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id_empleado])
GO

--#############################################################################
USE [master]
GO
/****** Object:  Database [SARI_RH_Candy]    Script Date: 04/12/2015 23:12:53 ******/
CREATE DATABASE [SARI_RH_Candy]
go 

ALTER DATABASE [SARI_RH_Candy] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SARI_RH_Candy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SARI_RH_Candy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET ARITHABORT OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SARI_RH_Candy] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SARI_RH_Candy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SARI_RH_Candy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SARI_RH_Candy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SARI_RH_Candy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SARI_RH_Candy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SARI_RH_Candy] SET  MULTI_USER 
GO
ALTER DATABASE [SARI_RH_Candy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SARI_RH_Candy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SARI_RH_Candy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SARI_RH_Candy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SARI_RH_Candy]
GO
/****** Object:  Table [dbo].[Candidatos]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Candidatos](
	[id_Candidato] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Ape_Pat] [varchar](50) NOT NULL,
	[Ape_Mat] [varchar](50) NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
	[Fecha_Nac] [date] NOT NULL,
	[Nacionalidad] [varchar](50) NULL,
	[E_Mail] [varchar](100) NULL,
	[Estado_Civil] [varchar](50) NOT NULL,
	[RFC] [varchar](13) NULL,
	[No_IMSS] [varchar](20) NULL,
	[CURP] [varchar](18) NOT NULL,
	[Telefono1] [varchar](15) NULL,
	[Telefono2] [varchar](15) NULL,
	[Cali_Hab_Sup] [int] NULL,
	[Cali_Cap_Dec] [int] NULL,
	[Cali_Cap_Eva] [int] NULL,
	[Cali_Hab_ERI] [int] NULL,
	[Cali_Sen_Com] [int] NULL,
	[id_Direccion] [int] NULL,
	[id_PrefLab] [int] NULL,
	[id_MoreInfo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Candidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direcciones](
	[id_Direccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Num_Int] [int] NULL,
	[Num_Ext] [int] NOT NULL,
	[Colonia] [varchar](50) NOT NULL,
	[CP] [int] NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Provincia] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estudios]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estudios](
	[id_Estudios] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [varchar](50) NULL,
	[Nivel_Estudios] [varchar](50) NULL,
	[Institucion] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Titulo] [varchar](50) NULL,
	[Fecha_I] [date] NULL,
	[Fecha_T] [date] NULL,
	[Promedio] [float] NULL,
	[id_Candidato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Estudios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historia_Laboral]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historia_Laboral](
	[id_HistLab] [int] IDENTITY(1,1) NOT NULL,
	[Puesto] [varchar](50) NULL,
	[Empresa] [varchar](50) NULL,
	[Fecha_I] [date] NULL,
	[Fecha_T] [date] NULL,
	[Area] [varchar](50) NULL,
	[Industria] [varchar](50) NULL,
	[Sueldo] [money] NULL,
	[Motivo_Salida] [varchar](255) NULL,
	[Jefe_In] [varchar](50) NULL,
	[Puesto_Jefe] [varchar](50) NULL,
	[Telefono_Jefe] [varchar](50) NULL,
	[Contacto] [bit] NULL,
	[Comentarios] [varchar](255) NULL,
	[id_Candidato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_HistLab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[More_Info]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[More_Info](
	[id_MoreInfo] [int] IDENTITY(1,1) NOT NULL,
	[Idiomas] [varchar](255) NULL,
	[Herra_Ofi] [varchar](255) NULL,
	[Herra_Info] [varchar](255) NULL,
	[Cursos] [varchar](255) NULL,
	[Cono_Tec] [varchar](255) NULL,
	[Cono_Fina] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_MoreInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Preferencias_Laborales]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Preferencias_Laborales](
	[id_PrefLab] [int] IDENTITY(1,1) NOT NULL,
	[Turno] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Puesto] [varchar](50) NULL,
	[Sueldo] [money] NULL,
	[Objetivo] [varchar](255) NULL,
	[Extra] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_PrefLab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Preguntas_Test]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Preguntas_Test](
	[id_Pregunta] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [varchar](255) NULL,
	[Capacidad] [int] NULL,
	[Valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Referencias]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Referencias](
	[id_Referencia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_R] [varchar](50) NULL,
	[Direccion_R] [varchar](255) NULL,
	[Ocupacion_R] [varchar](50) NULL,
	[Telefono_R] [varchar](50) NULL,
	[id_Candidato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Respuestas_Test]    Script Date: 04/12/2015 23:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Respuestas_Test](
	[Inciso] [int] NULL,
	[Pregunta] [int] NULL,
	[Respuesta] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Candidatos] ADD  DEFAULT ((0)) FOR [Cali_Hab_Sup]
GO
ALTER TABLE [dbo].[Candidatos] ADD  DEFAULT ((0)) FOR [Cali_Cap_Dec]
GO
ALTER TABLE [dbo].[Candidatos] ADD  DEFAULT ((0)) FOR [Cali_Cap_Eva]
GO
ALTER TABLE [dbo].[Candidatos] ADD  DEFAULT ((0)) FOR [Cali_Hab_ERI]
GO
ALTER TABLE [dbo].[Candidatos] ADD  DEFAULT ((0)) FOR [Cali_Sen_Com]
GO
ALTER TABLE [dbo].[Direcciones] ADD  DEFAULT ('México') FOR [Pais]
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD FOREIGN KEY([id_Direccion])
REFERENCES [dbo].[Direcciones] ([id_Direccion])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD FOREIGN KEY([id_MoreInfo])
REFERENCES [dbo].[More_Info] ([id_MoreInfo])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD FOREIGN KEY([id_PrefLab])
REFERENCES [dbo].[Preferencias_Laborales] ([id_PrefLab])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Estudios]  WITH CHECK ADD FOREIGN KEY([id_Candidato])
REFERENCES [dbo].[Candidatos] ([id_Candidato])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Historia_Laboral]  WITH CHECK ADD FOREIGN KEY([id_Candidato])
REFERENCES [dbo].[Candidatos] ([id_Candidato])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Referencias]  WITH CHECK ADD FOREIGN KEY([id_Candidato])
REFERENCES [dbo].[Candidatos] ([id_Candidato])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Respuestas_Test]  WITH CHECK ADD FOREIGN KEY([Pregunta])
REFERENCES [dbo].[Preguntas_Test] ([id_Pregunta])
ON UPDATE CASCADE
GO
USE [master]
GO
ALTER DATABASE [SARI_RH_Candy] SET  READ_WRITE 
GO
--###########################################################################################
--ALTER DATABASE RH SET OFFLINE WITH ROLLBACK IMMEDIATE
use master
go
--drop database RH
--go
create database RH
go
use RH
GO

Create table Direccion(iddireccion int identity(1,1) primary key,calle varchar(50) ,numerointerior char(10) ,numeroexterior char(10) ,colonia varchar(50) ,codigopostal int,estado varchar(30),pais varchar(30));
go
Create proc insertarDireccion 
@calle varchar(50), 
@numerointerior char(15),
@numeroexterior char(15),
@colonia varchar(50),
@codigopostal int,
@estado varchar(30),
@pais varchar(30),
@return int output
as
insert into Direccion(calle, numerointerior, numeroexterior, colonia,codigopostal, estado, pais) values(@calle, @numerointerior, @numeroexterior, @colonia,@codigopostal, @estado, @pais)
set @return=(select @@identity)
go

Create proc editarDireccion
@id int, 
@calle varchar(50), 
@numerointerior char(15),
@numeroexterior char(15),
@colonia varchar(50),
@codigopostal int,
@estado varchar(30),
@pais varchar(30)
as
update Direccion set calle=@calle, numerointerior=@numerointerior, numeroexterior=@numeroexterior, colonia=@colonia,codigopostal=@codigopostal, estado=@estado, pais=@pais where iddireccion=@id;
go

create table Telefono(idtelefono int primary key identity(1,1),numero varchar(15) ,tipo varchar(15));
go
create procedure insertaTelefono
@numero varchar(15),
@tipo varchar(15),
@return int output
as
insert into Telefono(numero,tipo) values (@numero,@tipo)
set @return=(select @@identity)
go

create procedure editaTelefono
@id int,
@numero varchar(15),
@tipo varchar(15)
as
update Telefono set numero=@numero,tipo=@tipo where idtelefono=@id;
go

create table Persona (idpersona int primary key identity (1,1), nombre varchar (60), apaterno varchar (30),amaterno varchar (30), curp varchar (18) unique, rfc varchar (15) unique, fechanac date,sexo varchar(15),estadocivil varchar(15), fkdireccion int, foreign key (fkdireccion) references Direccion (iddireccion) ON DELETE CASCADE);
go
create procedure insertaPersona
@nombre varchar (60),
@apaterno varchar (30),
@amaterno varchar (30),
@curp varchar (18),
@rfc varchar (15),
@fechanac date,
@sexo varchar(15),
@estadocivil varchar(15),
@fkdireccion int,
@return int output
as
insert into Persona(nombre, apaterno,amaterno ,curp, rfc ,fechanac ,sexo ,estadocivil, fkdireccion) values (@nombre,@apaterno,@amaterno,@curp,@rfc,@fechaNac,@sexo,@estadocivil,@fkdireccion)
set @return = (select @@IDENTITY)
go

create procedure editaPersona
@id int,
@nombre varchar (60),
@apaterno varchar (30),
@amaterno varchar (30),
@curp varchar (18),
@rfc varchar (15),
@fechanac date,
@sexo varchar(15),
@estadocivil varchar(15),
@fkdireccion int
as
update Persona set nombre=@nombre, apaterno=@apaterno,amaterno=@amaterno,curp=@curp,rfc=@rfc,fechanac=@fechanac,sexo=@sexo,estadocivil=@estadocivil, fkdireccion=@fkdireccion where idpersona=@id;
go

create table contacto(fktelefono int,fkpersona int,foreign key(fktelefono) references Telefono(idtelefono)ON DELETE CASCADE ,foreign key(fkpersona) references Persona(idpersona) ON DELETE CASCADE,primary key(fkpersona,fktelefono))
go
create procedure insertacontacto
@fktelefono int,
@fkpersona int,
@return int output
as
insert into contacto(fktelefono,fkpersona) values (@fktelefono,@fkpersona)
set @return= (select @@identity)
go


create table Empleado(idempleado int identity(1,1) primary key, area varchar(20),puesto varchar(30),foto varchar(250),fkpersona int unique, foreign key(fkpersona) references Persona(idpersona) ON DELETE CASCADE)
go
create procedure insertaEmpleado
@area varchar(20),
@puesto varchar(30),
@foto varchar(250),
@fkpersona int,
@return int output
as
insert into Empleado(area ,puesto,foto,fkpersona) values (@area,@puesto,@foto,@fkpersona)
set @return= (select @@identity)
go

create procedure editaEmpleado
@id int,
@area varchar(20),
@puesto varchar(30),
@foto varchar(250),
@fkpersona int
as
update Empleado set area=@area ,puesto=@puesto,foto=@foto,fkpersona=@fkpersona where idempleado=@id;
go

Create table Habilidad(idhabilidad int identity(1,1) primary key,tipo varchar(50),descripcion varchar(200),fkempleado int, foreign key(fkempleado) references Empleado(idempleado) ON DELETE CASCADE);
go
create procedure insertaHabilidad
@tipo varchar(50),
@descripcion varchar(200),
@fkempleado int,
@return int output
as
insert into Habilidad (tipo,descripcion,fkempleado) values (@tipo,@descripcion,@fkempleado);
set @return = (Select @@identity)
GO
create procedure editaHabilidad
@id int,
@tipo varchar(50),
@descripcion varchar(200),
@fkempleado int
as
update Habilidad set tipo=@tipo,descripcion=@descripcion,fkempleado=@fkempleado where idhabilidad = @id;
GO

create table Idioma(ididioma int identity(1,1) primary key ,nombre varchar(200) ,nivel varchar(50),descripcion varchar(250),fkempleado int, foreign key(fkempleado) references Empleado(idempleado) ON DELETE CASCADE);
go
create procedure insertaIdioma
@idioma varchar(200),
@nivel varchar(50),
@descripcion varchar (250),
@fkempleado int,
@return int output
as
insert into Idioma (nombre,nivel,descripcion,fkempleado) values (@idioma,@nivel,@descripcion,@fkempleado);
set @return = (Select @@identity)
go
create procedure editaIdioma
@id int,
@idioma varchar(200),
@nivel varchar(50),
@descripcion varchar (250),
@fkempleado int
as
update Idioma set nombre=@idioma,nivel=@nivel,descripcion=@descripcion,fkempleado=@fkempleado where ididioma=@id;
go

create table Academico(idacademico int identity(1,1) primary key,inicio date,fin date,titulobtenido varchar(100),institucion varchar(100),fkempleado int, foreign key(fkempleado) references Empleado(idempleado) ON DELETE CASCADE)
go
create procedure insertaAcademico
@inicio date,
@fin date,
@titulobtenido varchar(100),
@institucion varchar(100),
@fkempleado int,
@return int output
as
insert into Academico(inicio,fin,titulobtenido,institucion,fkempleado) values (@inicio,@fin,@titulobtenido,@institucion ,@fkempleado)
set @return= (select @@identity)
go
create procedure editaAcademico
@id int,
@inicio date,
@fin date,
@titulobtenido varchar(100),
@institucion varchar(100),
@fkempleado int
as
update Academico set inicio=@inicio,fin=@fin,titulobtenido=@titulobtenido,institucion=@institucion,fkempleado=@fkempleado where idacademico=@id; 
go

create table Jornada(idjornada int identity(1,1) primary key,tipo varchar(30),diasemana int, turno varchar(20),hrentrada varchar(15),hrsalida varchar(15)) 
go
create procedure insertaJornada
@tipo varchar(30),
@diasemana int, 
@turno varchar(20),
@hrentrada varchar(15),
@hrsalida varchar(15), 
@return int output
as
insert into Jornada(tipo ,diasemana , turno ,hrentrada ,hrsalida ) values (@tipo, @diasemana, @turno, @hrentrada, @hrsalida)
set @return= (select @@identity)
go
create procedure editaJornada
@id int,
@tipo varchar(30),
@diasemana int, 
@turno varchar(20),
@hrentrada varchar(15),
@hrsalida varchar(15)
as
update Jornada set tipo=@tipo,diasemana=@diasemana, turno=@turno,hrentrada=@hrentrada,hrsalida=@hrsalida where idjornada=@id; 
go

create table asiste(fkempleado int,fkjornada int, foreign key(fkempleado) references Empleado(idempleado) ON DELETE CASCADE,foreign key(fkjornada) references Jornada(idjornada) ON DELETE CASCADE,primary key(fkjornada,fkempleado))
go
create procedure insertasiste
@fkempleado int,
@fkjornada int,
@return int output
as
insert into asiste values(@fkempleado,@fkjornada);
set @return=(select @@identity);
go

create procedure eliminaPersona
@idElimP int
as
delete from Persona where idpersona = @idElimP;
go
create procedure eliminaAcademico
@idElimA int
as
delete from Academico where idacademico = @idElimA;
go
create procedure eliminaAsiste
@idElimAs int
as
delete from asiste where fkempleado = @idElimAs;
go
create procedure eliminaContacto
@idElimCn int
as
delete from contacto where fktelefono = @idElimCn;
go
create procedure eliminaDireccion
@idElimD int
as
delete from Direccion where iddireccion = @idElimD;
go
create procedure eliminaEmpleado
@idElimE int
as
delete from Empleado where idempleado = @idElimE;
go
create procedure eliminaHabilidad
@idElimH int
as
delete from Habilidad where idhabilidad = @idElimH;
go
create procedure eliminaIdioma
@idElimI int
as
delete from Idioma where ididioma = @idElimI;
go
create procedure eliminaJornada
@idElimJ int
as
delete from Jornada where idjornada = @idElimJ;
go
create procedure eliminaTelefono
@idElimT int
as
delete from Telefono where idtelefono = @idElimT;
go
--###############################################################
create proc [dbo].[insertar_servicio]
@identificador as varchar(50),
@nombre as varchar(50),
@descripcion as varchar(50),
@precio as money
as
insert into servicios(identificador,nombre,descripcion,precio)Values(@identificador,@nombre,@descripcion,@precio)

GO


create proc [dbo].[insertar_atiende]
@id_proveedor as int,
@id_servicio as int
as 
insert into atiende(id_proveedor,id_servicio)Values(@id_proveedor,@id_servicio)

GO


create proc [dbo].[insertar_proveedor]
@nombre as varchar(50),
@tel_1 as varchar(50),
@tel_2 as varchar(50),
@ciudad as varchar(60),
@direccion as varchar(100)
as 
insert into proveedor(nombre,tel_1,tel_2,ciudad,direccion)Values(@nombre,@tel_1,@tel_2,@ciudad,@direccion);

go



/*Creación del procedimiento almacenado para la inserción de datos en
la tabla "producto"*/
create proc InsDatos
(
@identificador varchar (50),
@nombre varchar (50),
@marca varchar (50),
@modelo varchar (50),
@descripcion varchar (100),
@grupo varchar (50),
@localizacion varchar (50),
@precio_compra money,
@unidad_medida varchar (20),
@cantidad_medida int,
@stock int,
@fecha datetime
)
as insert into producto values(@identificador, @nombre,@marca,@modelo,@descripcion,@grupo,
@localizacion, @precio_compra,@unidad_medida,@cantidad_medida,@stock,@fecha)
GO

create proc InsSuministra
@id_proveedor int,
@id_producto int
as
insert into suministra (suministra.id_proveedor,suministra.id_producto) 
values(@id_proveedor,@id_producto);