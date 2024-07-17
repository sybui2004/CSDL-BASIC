CREATE TABLE [User] (
	user_id INT PRIMARY KEY IDENTITY(1,1),
	--IDENTITY(1, 1): bat dau tu 1 va tang 1
    user_name NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
	--UNIQUE: khong lap lai
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    author_name NVARCHAR(100) NOT NULL,
	date_of_birth DATE,
    biography NVARCHAR(MAX),
    nationality NVARCHAR(50)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL UNIQUE,
    description NVARCHAR(MAX)
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200) NOT NULL,
    summary NVARCHAR(MAX),
	--summary: tom tat
    public_date DATE,
    isbn NVARCHAR(20) UNIQUE,
	--International Standard Book Number: ma so sach quoc te
    author_id INT,
    category_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
	--define khoa phu tu khoa chinh cua bang khac
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO [User] (user_name, password, email)
VALUES ('sy', '12345678', 'symerline2004@gmail.com')

INSERT INTO [User] (user_name, password, email)
VALUES ('sy12', '1234678', 'symerlne2004@gmail.com')

SELECT * FROM [User] 