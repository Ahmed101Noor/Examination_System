CREATE TABLE StudentExam (
    ExamID INT,
    StdID INT,
    StdExamDegree INT,

	constraint PK_StudentExam_ExamID PRIMARY KEY (ExamID,StdID),

	constraint FK_StudentExam_Exam_ExamID foreign key (ExamID) 
	references Exam(ID),

	constraint FK_StudentExam_Student_StdID foreign key (StdID) 
	references Person.Student(ID),
);

ALTER TABLE StudentExam
ADD CONSTRAINT CK_StudentExam_Degree_Valid
CHECK (StdExamDegree >= 0);
