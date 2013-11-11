
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/09/2013 12:51:00
-- Generated from EDMX file: D:\GitHub\Pascual_AppDigiEncuesta\Codigo\DigiEncuesta\DigiEncuesta.Datos\Modelo.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DigiEncuesta];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Preguntas'
CREATE TABLE [dbo].[Preguntas] (
    [Numeracion] int  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [Id_Pregunta] int  NOT NULL,
    [EncuestaPregunta_Pregunta_Id_Encuesta] int  NOT NULL,
    [Tipo_Pregunta_Id_TipoPregunta] int  NOT NULL
);
GO

-- Creating table 'Respuestas'
CREATE TABLE [dbo].[Respuestas] (
    [Valor] nvarchar(max)  NOT NULL,
    [Id_Respuesta] int  NOT NULL,
    [Pregunta_Id_Pregunta] int  NOT NULL,
    [Persona_Id_Persona] int  NOT NULL
);
GO

-- Creating table 'Encuestadores'
CREATE TABLE [dbo].[Encuestadores] (
    [Id_Encuestador] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Contraseña] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Encuestas'
CREATE TABLE [dbo].[Encuestas] (
    [Fecha] nvarchar(max)  NOT NULL,
    [Muestra] int  NOT NULL,
    [Publico] nvarchar(max)  NOT NULL,
    [Id_Encuesta] int  NOT NULL,
    [Nombre_Encuesta] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tipo_Encuestas'
CREATE TABLE [dbo].[Tipo_Encuestas] (
    [Id_TipoPregunta] int  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Opciones'
CREATE TABLE [dbo].[Opciones] (
    [Numeral] nvarchar(max)  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [Id_Opcion] int  NOT NULL,
    [OpcionPregunta_Opcion_Id_Pregunta] int  NOT NULL
);
GO

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [Id_Persona] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Barrio] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Edad] int  NOT NULL,
    [Encuesta_Id_Encuesta] int  NOT NULL
);
GO

-- Creating table 'EncuestadorEncuesta'
CREATE TABLE [dbo].[EncuestadorEncuesta] (
    [Encuestador_Id_Encuestador] int  NOT NULL,
    [EncuestadorEncuesta_Encuestador_Id_Encuesta] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id_Pregunta] in table 'Preguntas'
ALTER TABLE [dbo].[Preguntas]
ADD CONSTRAINT [PK_Preguntas]
    PRIMARY KEY CLUSTERED ([Id_Pregunta] ASC);
GO

-- Creating primary key on [Id_Respuesta] in table 'Respuestas'
ALTER TABLE [dbo].[Respuestas]
ADD CONSTRAINT [PK_Respuestas]
    PRIMARY KEY CLUSTERED ([Id_Respuesta] ASC);
GO

-- Creating primary key on [Id_Encuestador] in table 'Encuestadores'
ALTER TABLE [dbo].[Encuestadores]
ADD CONSTRAINT [PK_Encuestadores]
    PRIMARY KEY CLUSTERED ([Id_Encuestador] ASC);
GO

-- Creating primary key on [Id_Encuesta] in table 'Encuestas'
ALTER TABLE [dbo].[Encuestas]
ADD CONSTRAINT [PK_Encuestas]
    PRIMARY KEY CLUSTERED ([Id_Encuesta] ASC);
GO

-- Creating primary key on [Id_TipoPregunta] in table 'Tipo_Encuestas'
ALTER TABLE [dbo].[Tipo_Encuestas]
ADD CONSTRAINT [PK_Tipo_Encuestas]
    PRIMARY KEY CLUSTERED ([Id_TipoPregunta] ASC);
GO

-- Creating primary key on [Id_Opcion] in table 'Opciones'
ALTER TABLE [dbo].[Opciones]
ADD CONSTRAINT [PK_Opciones]
    PRIMARY KEY CLUSTERED ([Id_Opcion] ASC);
GO

-- Creating primary key on [Id_Persona] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([Id_Persona] ASC);
GO

-- Creating primary key on [Encuestador_Id_Encuestador], [EncuestadorEncuesta_Encuestador_Id_Encuesta] in table 'EncuestadorEncuesta'
ALTER TABLE [dbo].[EncuestadorEncuesta]
ADD CONSTRAINT [PK_EncuestadorEncuesta]
    PRIMARY KEY NONCLUSTERED ([Encuestador_Id_Encuestador], [EncuestadorEncuesta_Encuestador_Id_Encuesta] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Encuestador_Id_Encuestador] in table 'EncuestadorEncuesta'
ALTER TABLE [dbo].[EncuestadorEncuesta]
ADD CONSTRAINT [FK_EncuestadorEncuesta_Encuestador]
    FOREIGN KEY ([Encuestador_Id_Encuestador])
    REFERENCES [dbo].[Encuestadores]
        ([Id_Encuestador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EncuestadorEncuesta_Encuestador_Id_Encuesta] in table 'EncuestadorEncuesta'
ALTER TABLE [dbo].[EncuestadorEncuesta]
ADD CONSTRAINT [FK_EncuestadorEncuesta_Encuesta]
    FOREIGN KEY ([EncuestadorEncuesta_Encuestador_Id_Encuesta])
    REFERENCES [dbo].[Encuestas]
        ([Id_Encuesta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EncuestadorEncuesta_Encuesta'
CREATE INDEX [IX_FK_EncuestadorEncuesta_Encuesta]
ON [dbo].[EncuestadorEncuesta]
    ([EncuestadorEncuesta_Encuestador_Id_Encuesta]);
GO

-- Creating foreign key on [Encuesta_Id_Encuesta] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [FK_EncuestaPersona]
    FOREIGN KEY ([Encuesta_Id_Encuesta])
    REFERENCES [dbo].[Encuestas]
        ([Id_Encuesta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EncuestaPersona'
CREATE INDEX [IX_FK_EncuestaPersona]
ON [dbo].[Personas]
    ([Encuesta_Id_Encuesta]);
GO

-- Creating foreign key on [EncuestaPregunta_Pregunta_Id_Encuesta] in table 'Preguntas'
ALTER TABLE [dbo].[Preguntas]
ADD CONSTRAINT [FK_EncuestaPregunta]
    FOREIGN KEY ([EncuestaPregunta_Pregunta_Id_Encuesta])
    REFERENCES [dbo].[Encuestas]
        ([Id_Encuesta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EncuestaPregunta'
CREATE INDEX [IX_FK_EncuestaPregunta]
ON [dbo].[Preguntas]
    ([EncuestaPregunta_Pregunta_Id_Encuesta]);
GO

-- Creating foreign key on [Tipo_Pregunta_Id_TipoPregunta] in table 'Preguntas'
ALTER TABLE [dbo].[Preguntas]
ADD CONSTRAINT [FK_Tipo_PreguntaPregunta]
    FOREIGN KEY ([Tipo_Pregunta_Id_TipoPregunta])
    REFERENCES [dbo].[Tipo_Encuestas]
        ([Id_TipoPregunta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Tipo_PreguntaPregunta'
CREATE INDEX [IX_FK_Tipo_PreguntaPregunta]
ON [dbo].[Preguntas]
    ([Tipo_Pregunta_Id_TipoPregunta]);
GO

-- Creating foreign key on [OpcionPregunta_Opcion_Id_Pregunta] in table 'Opciones'
ALTER TABLE [dbo].[Opciones]
ADD CONSTRAINT [FK_OpcionPregunta]
    FOREIGN KEY ([OpcionPregunta_Opcion_Id_Pregunta])
    REFERENCES [dbo].[Preguntas]
        ([Id_Pregunta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OpcionPregunta'
CREATE INDEX [IX_FK_OpcionPregunta]
ON [dbo].[Opciones]
    ([OpcionPregunta_Opcion_Id_Pregunta]);
GO

-- Creating foreign key on [Pregunta_Id_Pregunta] in table 'Respuestas'
ALTER TABLE [dbo].[Respuestas]
ADD CONSTRAINT [FK_RespuestaPregunta]
    FOREIGN KEY ([Pregunta_Id_Pregunta])
    REFERENCES [dbo].[Preguntas]
        ([Id_Pregunta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RespuestaPregunta'
CREATE INDEX [IX_FK_RespuestaPregunta]
ON [dbo].[Respuestas]
    ([Pregunta_Id_Pregunta]);
GO

-- Creating foreign key on [Persona_Id_Persona] in table 'Respuestas'
ALTER TABLE [dbo].[Respuestas]
ADD CONSTRAINT [FK_PersonaRespuesta]
    FOREIGN KEY ([Persona_Id_Persona])
    REFERENCES [dbo].[Personas]
        ([Id_Persona])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonaRespuesta'
CREATE INDEX [IX_FK_PersonaRespuesta]
ON [dbo].[Respuestas]
    ([Persona_Id_Persona]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------