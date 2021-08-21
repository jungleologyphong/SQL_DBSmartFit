CREATE TABLE User (
    ID int NOT NULL AUTO_INCREMENT,
    roleID int NOT NULL,
    Email varchar(125) UNIQUE NOT NULL,
    Mobile int UNIQUE NOT NULL,
    FullName varchar(50) NOT NULL,
    Gender varchar(4) NOT NULL,
    BirthDay datetime NOT NULL,
    CreateAt datetime NOT NULL,
    Pass varchar(50) NOT NULL,
    IMG varchar(50) NOT NULL,
    PRIMARY KEY (ID)
    FOREIGN KEY (roleID) REFERENCES Role(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE Rolee  (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID),
);

CREATE TABLE PT_Course (
    ID int NOT NULL AUTO_INCREMENT,
    PT_ID int NOT NULL,
    Course_ID int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (PT_ID) REFERENCES User(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (Course_ID) REFERENCES Course(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE Course (
    ID int NOT NULL AUTO_INCREMENT,
    CourseType varchar(255) NOT NULL,
    Name varchar(255) NOT NULL,
    Description varchar(255) NOT NULL,
    Sessions varchar(255) NOT NULL,
    Price double NOT NULL,
    LastPrice double NOT NULL,
    Status_ID int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (CourseType) REFERENCES CourseType(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (Status_ID) REFERENCES CourseStatus(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE CourseType (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Description varchar(255) NOT NULL,
    IMG varchar(255) NOT NULL,
);

CREATE TABLE CourseStatus (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID),
);

CREATE TABLE Registered_Course (
    ID int NOT NULL AUTO_INCREMENT,
    UserID int NOT NULL,
    CourseID int NOT NULL,
    PT_ID int NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (CourseID) REFERENCES Course (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE Lesson (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    IMG varchar(255) NOT NULL,
    CourseID int NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
)

CREATE TABLE BMI (
    ID int NOT NULL AUTO_INCREMENT,
    BMIStats varchar(255) NOT NULL,
    UserID int NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
)

CREATE TABLE Stats (
    ID int NOT NULL AUTO_INCREMENT,
    Height int NOT NULL,
    Weight int NOT NULL,
    Bust int NOT NULL,
    Waist int NOT NULL,
    Hip int NOT NULL,
    CreateAt datetime NOT NULL,
    UpdateAt datetime NOT NULL,
    BMI_ID int NOT NULL,
    FOREIGN KEY (BMI_ID) REFERENCES BMI (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
)

CREATE TABLE Image (
    ID int NOT NULL AUTO_INCREMENT,
    CourseID int NOT NULL,
    SupplementID int NOT NULL,
    EquipmentID int NOT NULL,
    FoodID int NOT NULL,
    Image varchar(255) NOT NULL,
);

CREATE TABLE Bill (
    ID int NOT NULL AUTO_INCREMENT,
    UserID int NOT NULL,
    CourseID int NOT NULL,
    FoodID int NOT NULL,
    EquipmentID int NOT NULL,
    SupplementID int NOT NULL,
    CreateAt datetime NOT NULL,
    Status_ID datetime NOT NULL,
    Price double NOT NULL,
    Discount double NOT NULL,
    TotalPrice double NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (CourseID) REFERENCES Courses (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (FoodID) REFERENCES Food (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (SupplementID) REFERENCES Supplement (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE Equipment (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Description varchar(255) NOT NULL,
    Price double NOT NULL,
    LastPrice double NOT NULL,
    Type varchar(36) NOT NULL,
    Branch varchar(36) NOT NULL,
    Quantity int NOT NULL,
);

CREATE TABLE Supplement (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Description varchar(255) NOT NULL,
    Price double NOT NULL,
    LastPrice double NOT NULL,
    MFG varchar(255) NOT NULL,
    EXP varchar(255) NOT NULL,
    Type varchar(255) NOT NULL,
    MinBMI int NOT NULL,
    MaxBMI int NOT NULL,
    Branch varchar(255) NOT NULL,
    Quantity int NOT NULL,
);

CREATE TABLE Food (
    ID int NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price double NOT NULL,
    LastPrice double NOT NULL,
    MFG varchar(255) NOT NULL,
    EXP varchar(255) NOT NULL,
    ShopId int NOT NULL,
    Calories double NOT NULL,
    Quantity int NOT NULL,
);

CREATE TABLE Product_Rate (
    ID int NOT NULL AUTO_INCREMENT,
    Product_ID int NOT NULL,
    UserID int NOT NULL,
    Rate VARCHAR(255) NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products (ID) ON DELETE CASCADE ON UPDATE NO ACTION,
);

CREATE TABLE Product_Type (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
);

CREATE TABLE BillStatus (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
);


