
USE SpectablesStackDB;
GO

CREATE TABLE [dbo].[Users] (
  UserId INT IDENTITY(1,1) NOT NULL,
  UserName VARCHAR(20) NULL,
  Email NVARCHAR(30) NULL,
  DateCreated DATETIME NULL
);
GO

CREATE TABLE [dbo].[Questions] (
  QuestionId INT IDENTITY(1,1) NOT NULL, 
  UserId INT NOT NULL, 
  Title VARCHAR(100) NOT NULL, 
  Body NVARCHAR(1000) NOT NULL, 
  CreatedAt datetime NULL
);
GO

CREATE TABLE [dbo].[Answers](
  AnswerId INT IDENTITY(1,1) NOT NULL,
  QuestionId INT NOT NULL,
  UserId INT NOT NULL,
  CreatedAt DATETIME NULL
);
GO 