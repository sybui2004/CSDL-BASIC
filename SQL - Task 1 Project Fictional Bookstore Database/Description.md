# Objective: Manage and analyze data for a bookstore that includes information about books, authors, sales, and customers.

## Database Structure

### Books Table: Contains details about each book.
- Fields: BookID, Title, AuthorID, Genre, Price, PublishDate

### Authors Table: Stores information about authors.
- Fields: AuthorID, AuthorName, BirthYear, Nationality

### Sales Table: Records each book sale.
- Fields: SaleID, BookID, CustomerID, SaleDate, Quantity, TotalPrice

### Customers Table: Information about customers.
- Fields: CustomerID, CustomerName, Email, JoinDate

### Suggested Steps to Begin:

#### 1. Start by designing the schema for each table, considering the fields and data types.
#### 2. Create the tables in your SQL environment.
#### 3. Begin tackling the tasks, starting with basic data manipulations and progressing to more complex queries.
 
### These tasks will cover Basic Data Manipulation, Intermediate Querying, and Advanced Data Manipulation.
#### Basic Data Manipulation Tasks
#### 1. Insert New Records
- Add 3 new book to the Books table. Ensure it has a unique BookID and is linked to an existing AuthorID.
- Insert 3 new author into the Authors table, with details of your choice.
#### 2. Update Existing Records
- Increase the price of all books in the 'Fantasy' genre by 10%.
- Update the email address of a customer (choose any CustomerID).
#### 3. Delete Records
- Remove all books published before the year 2000.
- Delete a customer record (choose any CustomerID) and all their associated sales records.

#### Intermediate Querying Tasks
#### 1. Filtering and Sorting
- Retrieve all books that are either 'Science Fiction' or 'Mystery' and cost more than $20, sorted by price in descending order.
- Find customers who joined after January 1, 2020, and have an email address with the domain 'gmail.com'.
#### 2. Aggregate Functions
- Calculate the total number of books sold for each genre.
- Find the average sale total price for each year.
#### 3. Grouping Data
- List the number of books written by each author (AuthorName) and order the result by this count in descending order.
- Display the total sales (TotalPrice) per customer, only including those who have spent more than $200 in total.

#### Advanced Data Manipulation Tasks
#### 1. Complex Conditions
- For each book in the Books table, use a CASE statement to categorize the price into 'Cheap', 'Moderate', 'Expensive'.
- Update the TotalPrice in the Sales table by applying a 5% discount to all sales where more than 3 copies of a book were sold.
#### 2. Subqueries and Advanced Updates/Deletes
- Update the TotalPrice in the Sales table to reflect a 10% discount on all books written by authors born before 1970.
- Delete all sales records for books that have not been sold in the last year.