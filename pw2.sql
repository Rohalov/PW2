CREATE DATABASE [pw2]
GO

USE [pw2]
GO

CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED (Id)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Surname] [nchar](50) NOT NULL,
	[Email] [nchar](50) NULL,
	[Password] [nchar](20) NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED (Id),
 CONSTRAINT [FK_Students_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([Id])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Description] [nchar](250) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED (Id)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Surname] [nchar](50) NOT NULL,
	[Email] [nchar](50) NULL,
	[Password] [nchar](20) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED (Id)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Grades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED (Id),
 CONSTRAINT [FK_Grades_Students] FOREIGN KEY([StudentId]) REFERENCES [dbo].[Students] ([Id]),
 CONSTRAINT [FK_Grades_Subjects] FOREIGN KEY([SubjectId]) REFERENCES [dbo].[Subjects] ([Id])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Weekday] [nchar](10) NOT NULL,
	[TimeStart] [time](0) NOT NULL,
	[TimeEnd] [time](7) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED (Id),
 CONSTRAINT [FK_Schedule_Subjects] FOREIGN KEY([SubjectId]) REFERENCES [dbo].[Subjects] ([Id]),
 CONSTRAINT [FK_Schedule_Teachers] FOREIGN KEY([TeacherId]) REFERENCES [dbo].[Teachers] ([Id])
) ON [PRIMARY]
GO
