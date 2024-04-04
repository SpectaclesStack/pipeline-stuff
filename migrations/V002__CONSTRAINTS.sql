ALTER TABLE Users
ADD CONSTRAINT UsersPK
PRIMARY KEY(UserId);
GO

ALTER TABLE Users
ADD CONSTRAINT UniqueEmail
UNIQUE (Email);
GO

ALTER TABLE Users
ADD CONSTRAINT UniqueUserName
UNIQUE (UserName);
GO

ALTER TABLE Questions
ADD CONSTRAINT QuestionsPK
PRIMARY KEY(QuestionId);
GO

ALTER TABLE Questions
ADD CONSTRAINT QuestionsFK
FOREIGN KEY(UserId) REFERENCES Users(UserId);
GO

ALTER TABLE Answers
ADD CONSTRAINT AnswersPK
PRIMARY KEY(AnswerId);
GO

ALTER TABLE Answers
ADD CONSTRAINT AnswersFK1
FOREIGN KEY(UserId) REFERENCES Users(UserId);
GO

ALTER TABLE Answers
ADD CONSTRAINT AnswersFK2
FOREIGN KEY(QuestionId) REFERENCES Questions(QuestionId);
GO