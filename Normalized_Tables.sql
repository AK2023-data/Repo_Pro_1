
SET XACT_ABORT ON

BEGIN TRANSACTION DBD

CREATE TABLE [Employee] (
    [Employee_Id] INt  NOT NULL ,
    [FirstName] VARCHAR(20)  NOT NULL ,
    [LastName] VARCHAR(20)  NOT NULL ,
    [Gender] CHAR(1)  NOT NULL ,
    [Email] VARCHAR(50)  NOT NULL ,
    [DOB] DATE  NOT NULL ,
    [DOJ] DATE  NOT NULL ,
    [Salary] INT  NOT NULL ,
    [Address] VARCHAR(200)  NOT NULL ,
    [Aadhar_No] CHAR(12)  NOT NULL ,
    [PAN_No] VARCHAR(10)  NOT NULL ,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED (
        [Employee_Id] ASC
    )
)

CREATE TABLE [Project] (
    [Project_Name] VARCHAR(100)  NOT NULL ,
    [Employee_Id] INT  NOT NULL ,
    [Start_Date] DATE  NOT NULL ,
    [End_Date] DATE  NOT NULL ,
    [Phase] VARCHAR(20)  NOT NULL ,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED (
        [Project_Name] ASC
    )
)

CREATE TABLE [Client] (
    [Client_ID] INT  NOT NULL ,
    [Client_Name] VARCHAR(50)  NOT NULL ,
    [Client_Address] VARCHAR(200)  NOT NULL ,
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED (
        [Client_ID] ASC
    )
)

CREATE TABLE [Vendor] (
    [Vendor_ID] INT  NOT NULL ,
    [Vendor_Name] VARCHAR(50)  NOT NULL ,
    [Vendor_Address] VARCHAR(200)  NOT NULL ,
    CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED (
        [Vendor_ID] ASC
    )
)

CREATE TABLE [Parts] (
    [Project_Name] VARCHAR(100)  NOT NULL ,
    [Part_Name] VARCHAR(100)  NOT NULL ,
    [Quantity] INT  NOT NULL ,
    [Rate_Per_Peice] DECIMAL(18,2)  NOT NULL ,
    [Total_Amount] DECIMAL(18,2)  NOT NULL 
)

CREATE TABLE [Invoice] (
    [Invoice_No] VARCHAR(20)  NOT NULL ,
    [Date_of_Creation] DATE  NOT NULL ,
    [Project_Name] VARCHAR(100)  NOT NULL ,
    [Vendor_ID] INT  NOT NULL ,
    [Client_ID] INT  NOT NULL ,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED (
        [Invoice_No] ASC
    )
)

ALTER TABLE [Employee] WITH CHECK ADD CONSTRAINT [FK_Employee_Employee_Id] FOREIGN KEY([Employee_Id])
REFERENCES [Project] ([Employee_Id])

ALTER TABLE [Employee] CHECK CONSTRAINT [FK_Employee_Employee_Id]

ALTER TABLE [Vendor] WITH CHECK ADD CONSTRAINT [FK_Vendor_Vendor_ID] FOREIGN KEY([Vendor_ID])
REFERENCES [Invoice] ([Vendor_ID])

ALTER TABLE [Vendor] CHECK CONSTRAINT [FK_Vendor_Vendor_ID]

ALTER TABLE [Parts] WITH CHECK ADD CONSTRAINT [FK_Parts_Project_Name] FOREIGN KEY([Project_Name])
REFERENCES [Project] ([Project_Name])

ALTER TABLE [Parts] CHECK CONSTRAINT [FK_Parts_Project_Name]

ALTER TABLE [Invoice] WITH CHECK ADD CONSTRAINT [FK_Invoice_Project_Name] FOREIGN KEY([Project_Name])
REFERENCES [Project] ([Project_Name])

ALTER TABLE [Invoice] CHECK CONSTRAINT [FK_Invoice_Project_Name]

ALTER TABLE [Invoice] WITH CHECK ADD CONSTRAINT [FK_Invoice_Client_ID] FOREIGN KEY([Client_ID])
REFERENCES [Client] ([Client_ID])

ALTER TABLE [Invoice] CHECK CONSTRAINT [FK_Invoice_Client_ID]

COMMIT TRANSACTION DBD