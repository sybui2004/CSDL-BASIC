CREATE TABLE [User] (
	id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Book (
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200) NOT NULL,
    summary NVARCHAR(MAX),
	--summary: tom tat
    public_date DATE,
    isbn NVARCHAR(20) UNIQUE,
	--International Standard Book Number: ma so sach quoc te
);


CREATE TABLE Category (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL UNIQUE,
    description NVARCHAR(MAX)
);

CREATE TABLE Author (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
	date_of_birth DATE,
    biography NVARCHAR(MAX),
    nationality NVARCHAR(50)
);

CREATE TABLE Favourite (
    id_user INT NOT NULL,
	id_author INT NOT NULL, 
	like_for_author INT,
	FOREIGN KEY (id_user) REFERENCES [User](id),
	FOREIGN KEY (id_author) REFERENCES [Author](id)
);

CREATE TABLE BelongTo (
    id_book INT NOT NULL,
	id_category INT NOT NULL, 
	FOREIGN KEY (id_book) REFERENCES [Book](id),
	FOREIGN KEY (id_category) REFERENCES [Category](id)
);


CREATE TABLE Written_By (
    id_book INT NOT NULL,
	id_author INT NOT NULL, 
	FOREIGN KEY (id_book) REFERENCES [Book](id),
	FOREIGN KEY (id_author) REFERENCES [Author](id)
);

CREATE TABLE Borrow (
    id_user INT NOT NULL,
	id_book INT NOT NULL, 
	FOREIGN KEY (id_book) REFERENCES [Book](id),
	FOREIGN KEY (id_user) REFERENCES [User](id),
	borrow_date DATETIME NOT NULL, 
	expected_pay_date DATETIME NOT NULL,
	real_pay_date DATETIME,
	price INT
);

