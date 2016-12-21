
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2016 19:35:36
-- Generated from EDMX file: C:\Users\ASUS\Desktop\KariyerCV\Data\kariyer.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [kariyer];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserTypeUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserTypeUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserResume]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResumeSet] DROP CONSTRAINT [FK_UserResume];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryResume]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResumeSet] DROP CONSTRAINT [FK_CategoryResume];
GO
IF OBJECT_ID(N'[dbo].[FK_CommentResume]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResumeSet] DROP CONSTRAINT [FK_CommentResume];
GO
IF OBJECT_ID(N'[dbo].[FK_PictureResume]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ResumeSet] DROP CONSTRAINT [FK_PictureResume];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_UserPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_UserComment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[CommentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentSet];
GO
IF OBJECT_ID(N'[dbo].[PictureSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PictureSet];
GO
IF OBJECT_ID(N'[dbo].[PaymentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentSet];
GO
IF OBJECT_ID(N'[dbo].[ResumeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ResumeSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Telephone] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Avatar] varbinary(max)  NULL,
    [UserTypeId] int  NOT NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CommentSet'
CREATE TABLE [dbo].[CommentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Baþlýk] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Verified] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PictureSet'
CREATE TABLE [dbo].[PictureSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Resim] varbinary(max)  NOT NULL
);
GO

-- Creating table 'PaymentSet'
CREATE TABLE [dbo].[PaymentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'ResumeSet'
CREATE TABLE [dbo].[ResumeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Baþlýk] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [CommentId] int  NOT NULL,
    [PictureId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [PK_CommentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [PK_PictureSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [PK_PaymentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ResumeSet'
ALTER TABLE [dbo].[ResumeSet]
ADD CONSTRAINT [PK_ResumeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [UserId] in table 'ResumeSet'
ALTER TABLE [dbo].[ResumeSet]
ADD CONSTRAINT [FK_UserResume]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserResume'
CREATE INDEX [IX_FK_UserResume]
ON [dbo].[ResumeSet]
    ([UserId]);
GO

-- Creating foreign key on [CategoryId] in table 'ResumeSet'
ALTER TABLE [dbo].[ResumeSet]
ADD CONSTRAINT [FK_CategoryResume]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryResume'
CREATE INDEX [IX_FK_CategoryResume]
ON [dbo].[ResumeSet]
    ([CategoryId]);
GO

-- Creating foreign key on [CommentId] in table 'ResumeSet'
ALTER TABLE [dbo].[ResumeSet]
ADD CONSTRAINT [FK_CommentResume]
    FOREIGN KEY ([CommentId])
    REFERENCES [dbo].[CommentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentResume'
CREATE INDEX [IX_FK_CommentResume]
ON [dbo].[ResumeSet]
    ([CommentId]);
GO

-- Creating foreign key on [PictureId] in table 'ResumeSet'
ALTER TABLE [dbo].[ResumeSet]
ADD CONSTRAINT [FK_PictureResume]
    FOREIGN KEY ([PictureId])
    REFERENCES [dbo].[PictureSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PictureResume'
CREATE INDEX [IX_FK_PictureResume]
ON [dbo].[ResumeSet]
    ([PictureId]);
GO

-- Creating foreign key on [UserId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_UserPayment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPayment'
CREATE INDEX [IX_FK_UserPayment]
ON [dbo].[PaymentSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_UserComment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment'
CREATE INDEX [IX_FK_UserComment]
ON [dbo].[CommentSet]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------