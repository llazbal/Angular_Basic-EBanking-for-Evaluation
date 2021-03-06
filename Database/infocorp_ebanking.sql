USE [master]
GO
/****** Object:  Database [EBanking]    Script Date: 1/15/2016 1:12:07 AM ******/
CREATE DATABASE [EBanking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EBanking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EBanking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EBanking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EBanking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EBanking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EBanking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EBanking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EBanking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EBanking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EBanking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EBanking] SET ARITHABORT OFF 
GO
ALTER DATABASE [EBanking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EBanking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EBanking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EBanking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EBanking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EBanking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EBanking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EBanking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EBanking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EBanking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EBanking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EBanking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EBanking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EBanking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EBanking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EBanking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EBanking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EBanking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EBanking] SET  MULTI_USER 
GO
ALTER DATABASE [EBanking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EBanking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EBanking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EBanking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EBanking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EBanking]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[CuentaId] [int] IDENTITY(1,1) NOT NULL,
	[TipoCuentaId] [int] NOT NULL,
	[Saldo] [decimal](18, 0) NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[CuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[TipoCuentaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[TipoCuentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transferencias]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transferencias](
	[TransferenciaId] [int] IDENTITY(1,1) NOT NULL,
	[CuentaIdOrigen] [int] NOT NULL,
	[CuentaIdDestino] [int] NOT NULL,
	[Monto] [decimal](18, 0) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Transferencias] PRIMARY KEY CLUSTERED 
(
	[TransferenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 

INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (1, 1, CAST(100 AS Decimal(18, 0)), 1)
INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (2, 2, CAST(200 AS Decimal(18, 0)), 1)
INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (3, 1, CAST(300 AS Decimal(18, 0)), 2)
INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (4, 2, CAST(400 AS Decimal(18, 0)), 2)
INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (5, 1, CAST(500 AS Decimal(18, 0)), 3)
INSERT [dbo].[Cuentas] ([CuentaId], [TipoCuentaId], [Saldo], [UsuarioId]) VALUES (6, 2, CAST(600 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
SET IDENTITY_INSERT [dbo].[TipoCuenta] ON 

INSERT [dbo].[TipoCuenta] ([TipoCuentaId], [Nombre]) VALUES (1, N'Caja de Ahorros')
INSERT [dbo].[TipoCuenta] ([TipoCuentaId], [Nombre]) VALUES (2, N'Cuenta Corriente')
SET IDENTITY_INSERT [dbo].[TipoCuenta] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioId], [Nombre]) VALUES (1, N'usuario1')
INSERT [dbo].[Usuarios] ([UsuarioId], [Nombre]) VALUES (2, N'usuario2')
INSERT [dbo].[Usuarios] ([UsuarioId], [Nombre]) VALUES (3, N'usuario3')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_TipoCuenta] FOREIGN KEY([TipoCuentaId])
REFERENCES [dbo].[TipoCuenta] ([TipoCuentaId])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_TipoCuenta]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_Usuarios]
GO
ALTER TABLE [dbo].[Transferencias]  WITH CHECK ADD  CONSTRAINT [FK_Transferencias_Cuentas_Destino] FOREIGN KEY([CuentaIdDestino])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Transferencias] CHECK CONSTRAINT [FK_Transferencias_Cuentas_Destino]
GO
ALTER TABLE [dbo].[Transferencias]  WITH CHECK ADD  CONSTRAINT [FK_Transferencias_Cuentas_Origen] FOREIGN KEY([CuentaIdOrigen])
REFERENCES [dbo].[Cuentas] ([CuentaId])
GO
ALTER TABLE [dbo].[Transferencias] CHECK CONSTRAINT [FK_Transferencias_Cuentas_Origen]
GO
/****** Object:  StoredProcedure [dbo].[Cuenta_SEL_ALL_BYCuentaID]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cuenta_SEL_ALL_BYCuentaID] 
(
	@CuentaID int
)
AS
BEGIN
	SELECT * FROM Cuentas
	WHERE CuentaID = @CuentaID
END

GO
/****** Object:  StoredProcedure [dbo].[Cuentas_SEL_ALL_BYUSER]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Cuentas_SEL_ALL_BYUSER] 
(
	@UsuarioID int
)
AS
BEGIN
	SELECT * FROM Cuentas
	WHERE UsuarioID = @UsuarioID
END

GO
/****** Object:  StoredProcedure [dbo].[Transferencias_INS_NEW]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transferencias_INS_NEW] 
(
	@CuentaIdOrigen int,
	@CuentaIdDestino int,
	@Monto decimal(18,0),
	@Descripcion varchar(1000),
	@Fecha datetime
)
AS
BEGIN
	DECLARE @saldoCuentaOrigen decimal(18,0)
	, @saldoFinalCuentaOrigen decimal(18,0)
	, @saldoFinalCuentaDestino decimal(18,0)
	, @intErrorCode int, @err varchar(100);

	SELECT @saldoCuentaOrigen = c.Saldo
	FROM Cuentas c WHERE CuentaId = @CuentaIdOrigen;

	IF (@saldoCuentaOrigen < @Monto)
	BEGIN
		SET @err = -101; -- 'El saldo de la cuenta no puede ser menor al monto a transferir.';
		RETURN @err;
		--RAISERROR(@err, 1, 1)
	END
	ELSE
		BEGIN TRAN
			INSERT INTO [dbo].[Transferencias]
				   ([CuentaIdOrigen]
				   ,[CuentaIdDestino]
				   ,[Monto]
				   ,[Descripcion]
				   ,[Fecha])
			 VALUES
				   (@CuentaIdOrigen
				   , @CuentaIdDestino
				   , @Monto
				   , @Descripcion
				   , @Fecha);

			SELECT @intErrorCode = @@ERROR
			IF (@intErrorCode <> 0) GOTO PROBLEM

			SET @saldoFinalCuentaOrigen = @saldoCuentaOrigen - @Monto;
			UPDATE Cuentas SET Saldo = @saldoFinalCuentaOrigen
			WHERE CuentaId = @CuentaIdOrigen;
			
			SELECT @intErrorCode = @@ERROR
			IF (@intErrorCode <> 0) GOTO PROBLEM

			SET @saldoFinalCuentaDestino = (SELECT c.Saldo
				FROM Cuentas c WHERE CuentaId = @CuentaIdDestino) + @Monto;
			UPDATE Cuentas SET Saldo = @saldoFinalCuentaDestino
			WHERE CuentaId = @CuentaIdDestino;

			SELECT @intErrorCode = @@ERROR
			IF (@intErrorCode <> 0) GOTO PROBLEM
		
		COMMIT TRAN
		
			   
			RETURN @@IDENTITY;
			   
		PROBLEM:
		IF (@intErrorCode <> 0) BEGIN
			ROLLBACK TRAN
		END
	END


GO
/****** Object:  StoredProcedure [dbo].[Transferencias_SEL_ALL_BYCuentaIdOrigen]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transferencias_SEL_ALL_BYCuentaIdOrigen] 
(
	@CuentaIdOrigen int
)
AS
BEGIN
	SELECT * FROM Transferencias
	WHERE CuentaIdOrigen = @CuentaIdOrigen
END

GO
/****** Object:  StoredProcedure [dbo].[Transferencias_SEL_ALL_BYTransferenciaID]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transferencias_SEL_ALL_BYTransferenciaID] 
(
	@TransferenciaID int
)
AS
BEGIN
	SELECT * FROM Transferencias
	WHERE TransferenciaId = @TransferenciaID
END

GO
/****** Object:  StoredProcedure [dbo].[Transferencias_SEL_ALL_BYUsuarioId]    Script Date: 1/15/2016 1:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transferencias_SEL_ALL_BYUsuarioId] 
(
	@UsuarioIdOrigen int
)
AS
BEGIN
	SELECT TransferenciaId, CuentaIdOrigen, CuentaIdDestino, Monto, Descripcion, Fecha, c.*
	FROM   Transferencias t
	INNER JOIN Cuentas c ON c.CuentaID = t.CuentaIdOrigen AND c.UsuarioId = 1
END

GO
USE [master]
GO
ALTER DATABASE [EBanking] SET  READ_WRITE 
GO
