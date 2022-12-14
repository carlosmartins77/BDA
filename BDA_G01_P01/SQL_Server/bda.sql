USE [Kickoff]
GO
/****** Object:  Table [dbo].[Amizades]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amizades](
	[IdUtilizador1FK] [int] NOT NULL,
	[IdUtilizador2FK] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario](
	[IdUtilizadorFK] [int] NOT NULL,
	[IdJogoFutebolFK] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElementosEquipa]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElementosEquipa](
	[IdEquipaFK] [int] NOT NULL,
	[IdUtilizadorFK] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipa]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipa](
	[IdEquipa] [int] IDENTITY(1,1) NOT NULL,
	[NomeEquipa] [varchar](255) NOT NULL,
	[DataCriacao] [datetime] NOT NULL,
	[IdUtilizadorCapitaoFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEquipa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JogoFutebol]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JogoFutebol](
	[IdJogoFutebol] [int] NOT NULL,
	[IdEquipa1FK] [int] NOT NULL,
	[IdEquipa2FK] [int] NOT NULL,
	[IDEquipaVencedora] [int] NULL,
	[GolosEquipa1] [int] NULL,
	[GolosEquipa2][int] NULL,
	[HorarioJogo] [date] NOT NULL,
	[Localizacao] [varchar](255) NOT NULL,
	[Status] [varchar](255) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[IdJogoFutebol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[IdLogTypeFK] [int] NOT NULL,
	[IdUtilizadorFK] [int] NOT NULL,
	[DataHorario] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogType](
	[IdLogType] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLogType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacoes]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacoes](
	[IdPublicacao] [int] IDENTITY(1,1) NOT NULL,
	[IdUtilizadorFK] [int] NOT NULL,
	[Conteudo] [varchar](255) NOT NULL,
	[DataHorario] [datetime] NOT NULL,
	[Status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPublicacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 03/12/2022 09:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador](
	[IdUtilizador] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[DataCriacao] [date] NOT NULL,
	[Geolocalizacao] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUtilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amizades]  WITH CHECK ADD FOREIGN KEY([IdUtilizador1FK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[Amizades]  WITH CHECK ADD FOREIGN KEY([IdUtilizador2FK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[Calendario]  WITH CHECK ADD FOREIGN KEY([IdJogoFutebolFK])
REFERENCES [dbo].[JogoFutebol] ([IdJogoFutebol])
GO
ALTER TABLE [dbo].[Calendario]  WITH CHECK ADD FOREIGN KEY([IdUtilizadorFK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[ElementosEquipa]  WITH CHECK ADD FOREIGN KEY([IdEquipaFK])
REFERENCES [dbo].[Equipa] ([IdEquipa])
GO
ALTER TABLE [dbo].[ElementosEquipa]  WITH CHECK ADD FOREIGN KEY([IdUtilizadorFK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[Equipa]  WITH CHECK ADD FOREIGN KEY([IdUtilizadorCapitaoFK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[JogoFutebol]  WITH CHECK ADD FOREIGN KEY([IdEquipa1FK])
REFERENCES [dbo].[Equipa] ([IdEquipa])
GO
ALTER TABLE [dbo].[JogoFutebol]  WITH CHECK ADD FOREIGN KEY([IdEquipa2FK])
REFERENCES [dbo].[Equipa] ([IdEquipa])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([IdLogTypeFK])
REFERENCES [dbo].[LogType] ([IdLogType])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([IdUtilizadorFK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
ALTER TABLE [dbo].[Publicacoes]  WITH CHECK ADD FOREIGN KEY([IdUtilizadorFK])
REFERENCES [dbo].[Utilizador] ([IdUtilizador])
GO
