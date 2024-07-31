# **BUỔI 4 - SQL NÂNG CAO**

## **I. INDEX**
### 1. ***Index là gì***
- Index (hay chỉ mục) là một cấu trúc dữ liệu để tăng hiệu suất truy vấn của cơ sở dữ liệu.
- Index cho phép cơ sở dữ liệu thực hiện một số câu truy vấn có điều kiện nhanh hơn so với thông thường.
- Nhưng index cũng được lưu trên bộ nhớ và tiêu tốn không gian bộ nhớ và thời gian để tạo, cập nhật index nên khi sử dụng index cần phải suy xét kĩ.
- Có 2 loại index:
    -  Clustered Index: Khi tạo khóa chính (primary key) trên bảng thì Clustered Index sẽ được tự động tạo ra, mỗi bảng chỉ có thể có tối đa một Clustered Index.
    -  Non-Clustered Index: Trong một bảng có thể chứa tối đa 249 Non-Clustered Index.
### 2. ***Cú pháp***
#### 2.1 Clustered index
```sql
--1
CREATE CLUSTERED INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)
--2
CREATE UNIQUE CLUSTERED INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)
```
#### 2.2 Non-Clustered Index
```sql
--1
CREATE INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)
--Hoặc
CREATE NONCLUSTERED INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)
--2
CREATE UNIQUE INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)
--Hoặc
CREATE UNIQUE NONCLUSTERED INDEX Tên_chỉ_mục
ON Tên_bảng(Tên_cột_1, Tên_cột_2,...)

```


### 3. ***Khi nào sử dụng index ?***
- nó đặc biệt hữu dụng khi câu lệnh truy vấn được sử dụng thường xuyên (hoặc cột được tạo index thường được truy vấn) và số lượng bản ghi lớn
- Khó để xác định khi nào sử dụng index, nó phụ thuộc nhiều vào các bài toán thực tế tuy nhiên có một số quy luật thường thấy khi chọn một cột (hoặc tập các cột) để tạo index:
    - Khóa và các cột có giá trị độc nhất (unique): Database thường sẽ tự động tạo index cho các cột này nên để tranh việc trùng lặp và tiêu tốn bộ nhớ ta không nên tạo thêm index cho chúng.
    - Tần suất được sử dụng: Khi tần suất sử dụng câu truy vấn càng lớn thì việc tạo index sẽ giúp làm giảm càng nhiều thời gian truy vấn (tính tổng).
    - Số lượng bản ghi của bảng: Số lượng bản ghi của bảng càng nhiều thì tốc độ truy vấn sẽ càng giảm lợi thế của việc sử dụng index trên các bảng này lại càng rõ ràng so với những bảng có số lượng bản ghi ít. Đặc biệt đối với trường hợp một bảng có ít bản ghi (100 - vài nghìn) ta không nên tạo chỉ mục cho chúng.
    - Dữ liệu của bảng tăng trưởng nhanh: Index sẽ tự động cập nhật khi có một bản ghi được thêm vào cơ sở dữ liệu, vì vậy khi đánh chỉ mục cho 1 bảng nó sẽ làm chậm lại các hành động thêm sửa xóa bản ghi. Vậy nên một bảng thường xuyên được cập nhật nên có ít index hơn một bảng hiếm khi cập nhật.
    - Không gian bộ nhớ: Khi tạo index sẽ sử dụng chính không gian bộ nhớ của cơ sở dữ liệu nên khi cơ sở dữ liệu có kích thước lớn ta cần lựa chọn cẩn thận trường nào sẽ sử dụng làm index.
    - Dữ liệu có đa dạng giá trị: Index được tạo dựa trên các giá trị trong cột mà nó trỏ tới ví dụ như cột index được tạo chỉ có 3 giá trị A, B, C thì index được tạo sẽ có giá trị nhỏ hơn nhiều so với cột có dải giá trị trải dài cả bảng chữ cái. Index trên cột có ít giá trị ví dụ cột sex sẽ không làm tăng nhiều tốc độ truy vấn tuy nhiên đối với những cột có nhiều giá trị riêng biệt như cột name sẽ làm tăng tốc độ truy vấn đáng kể.

### 4. ***Ưu điểm của việc sử dụng index***
- Thường sẽ làm tăng hiệu năng truy vấn khi điều kiện rơi vào các cột được đánh chỉ mục.
- Giúp ta có thể truy vấn dữ liệu nhanh hơn.
- Có thể được sử dụng để sắp xếp dữ liệu.
- Các chỉ mục độc nhất đảm bảo tính duy nhất của trường trong cơ sở dữ liệu.
### 5. ***Nhược điểm của việc sử dụng index***
- Làm giảm hiệu năng các câu lệnh insert, update ,delete.
- Chiếm dụng bộ nhớ.

## **II. TRANSACTION**

## **I. Định nghĩa**
- Transaction trong SQL là một nhóm các câu lệnh SQL. Nếu một transaction được thực hiện thành công, tất cả các thay đổi dữ liệu được thực hiện trong transaction được lưu vào cơ sở dữ liệu. Nếu một transaction bị lỗi và được rollback, thì tất cả các sửa đổi dữ liệu sẽ bị xóa (dữ liệu được khôi phục về trạng thái trước khi thực hiện transaction).

## **II. Đặc điểm**
- Transaction có bốn đặc điểm tiêu chuẩn sau:

    - Bảo toàn - đảm bảo rằng tất cả các câu lệnh trong nhóm lệnh được thực thi thành công. Nếu không, transaction bị hủy bỏ tại thời điểm thất bại và tất cả các thao tác trước đó được khôi phục về trạng thái cũ.
    - Nhất quán - đảm bảo rằng cơ sở dữ liệu thay đổi chính xác các trạng thái khi một transaction được thực thi thành công.
    - Độc lập - cho phép các transaction hoạt động độc lập và minh bạch với nhau.
    - Bền bỉ - đảm bảo rằng kết quả của một transaction được commit vẫn tồn tại trong trường hợp lỗi hệ thống.
## **III. Xử lý transaction**
- Các lệnh sau đây được sử dụng để xử lý transaction.

    - COMMIT - để lưu các thay đổi.
    - ROLLBACK - để khôi phục lại các thay đổi.
    - SAVEPOINT - tạo ra các điểm trong transaction để ROLLBACK.
    - SET TRANSACTION - thiết lập các thuộc tính cho transaction.
- Các lệnh điều khiển transaction chỉ được sử dụng với các lệnh thao tác dữ liệu DML như - INSERT, UPDATE và DELETE.

Chúng không thể được sử dụng trong lệnh CREATE TABLE hoặc DROP TABLE vì các hoạt động này được tự động được commit trong cơ sở dữ liệu.

### 1. Lệnh COMMIT
- Lệnh COMMIT được sử dụng để lưu các thay đổi gọi bởi một transaction với cơ sở dữ liệu.

- Lệnh COMMIT lưu tất cả các transaction vào cơ sở dữ liệu kể từ khi lệnh COMMIT hoặc ROLLBACK cuối cùng.
- Cú pháp:
```sql
COMMIT;
```
### 2. Lệnh ROLLBACK
- Lệnh ROLLBACK được sử dụng để hoàn tác các transaction chưa được lưu vào cơ sở dữ liệu. Lệnh này chỉ có thể được sử dụng để hoàn tác các transaction kể từ khi lệnh COMMIT hoặc ROLLBACK cuối cùng được phát hành.
- Cú pháp:

```sql
ROLLBACK;
```

### 3. Lệnh SAVEPOINT

- SAVEPOINT là một điểm trong một transaction khi bạn có thể cuộn transaction trở lại một điểm nhất định mà không quay trở lại toàn bộ transaction.

- Cú pháp:
```sql
SAVEPOINT SAVEPOINT_NAME;
```

- Lệnh này chỉ phục vụ trong việc tạo ra SAVEPOINT trong số tất cả các câu lệnh transaction. Lệnh ROLLBACK được sử dụng để hoàn tác một nhóm các transaction.

Cú pháp để cuộn lại một SAVEPOINT:

```sql
ROLLBACK TO SAVEPOINT_NAME;
```

- Nếu muốn bỏ SAVEPOINT thì ta có cú pháp:
```sql
RELEASE SAVEPOINT SAVEPOINT_NAME;
```
- Khi SAVEPOINT bị xóa, bạn không thể sử dụng lệnh ROLLBACK để hoàn tác các transaction được thực hiện kể từ lần SAVEPOINT cuối cùng.

### 3. Lệnh SET TRANSACTION

- Lệnh SET TRANSACTION có thể được sử dụng để bắt đầu một transaction cơ sở dữ liệu. Lệnh này được sử dụng để chỉ định các đặc tính cho transaction sau. Ví dụ, bạn có thể chỉ định một transaction chỉ được đọc hoặc đọc viết.
- Cú pháp:

```sql
SET TRANSACTION [ READ WRITE | READ ONLY ];
```


