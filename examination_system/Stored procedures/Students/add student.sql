CREATE OR ALTER PROCEDURE AddStudent_Prc
   
    @FName NVARCHAR(50),
    @LName NVARCHAR(50),
    @TM_ID INT,
    @BranchID INT,
    @IntakeID INT,
    @UserID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
    
        IF NOT EXISTS (SELECT 1 FROM [Person].UserTable WHERE ID = @UserID)
        BEGIN
            RAISERROR('Invalid UserID! User does not exist.', 16, 1);
            RETURN;
        END;

       
        INSERT INTO person.Student (FName, LName, UserID,IntakeID, BranchID, TMID)
        VALUES (@FName, @LName,@UserID, @IntakeID, @BranchID, @TM_ID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


-----------------------Check Only training manager can add user--------------------

EXEC AddStudent_Prc
    @FName = 'Khaled',
    @LName = 'Maher',
    @UserID = 5,
    @IntakeID = 2,
    @TM_ID = 1,
    @BranchID = 1
 