# **BUỔI 3 - SQL CƠ BẢN**

## **I. Query cơ bản**
### 1. ***SELECT***
- Lệnh SELECT trong SQL được sử dụng để lấy dữ liệu từ một bảng trong Database mà trả về dữ liệu ở dạng bảng dữ liệu kết quả.
Cú pháp:

Xác định cột có giá trị muốn lấy:
```sql
SELECT cot1, cot2, cotN FROM ten_bang;
```
Thao tác trên tất cả các cột trong bảng:
```sql
SELECT * FROM ten_bang;
```

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-1.png)
### 2. ***JOIN***
- là phép kết nối dữ liệu từ nhiều bảng lại với nhau, nối 2 bảng, 3 bảng.. với nhau. Khi bạn cần truy vấn các cột dữ liệu từ nhiều bảng khác nhau để trả về trong cùng một tập kết quả , bạn cần dùng JOIN. 2 bảng kết nối được với nhau khi có 1 trường chung giữa 2 bảng này.

#### 2.1. ***INNER JOIN***

- INNER JOIN (Hoặc JOIN): Trả về tất cả các hàng khi có ít nhất một giá trị ở cả hai bảng

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-2.png)

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-3.png)

#### 2.2. ***LEFT OUTER JOIN (Hoặc LEFT JOIN)***
- LEFT OUTER JOIN (Hoặc LEFT JOIN): Trả lại tất cả các dòng từ bảng bên trái, và các dòng đúng với điều kiện từ bảng bên phải

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-4.png)

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-5.png)

#### 2.3. ***RIGHT OUTER JOIN (Hoặc RIGHT JOIN)***
- RIGHT OUTER JOIN (Hoặc RIGHT JOIN): Trả lại tất cả các hàng từ bảng bên phải, và các dòng thỏa mãn điều kiện từ bảng bên trái

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-6.png)

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-7.png)

#### 2.3. ***FULL OUTER JOIN (Hoặc OUTER JOIN)***
- FULL OUTER JOIN (Hoặc OUTER JOIN): Trả về tất cả các dòng đúng với 1 trong các bảng.

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-8.png)

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-9.png)

3. ***ORDER BY***
- Mệnh đề ORDER BY trong SQL được sử dụng để sắp xếp dữ liệu theo thứ tự tăng dần hoặc theo thứ tự giảm dần, trên một hoặc nhiều cột.
Cú pháp:

```sql
SELECT danh_sach_cot

FROM ten_bang

[WHERE dieu_kien]

[ORDER BY cot1, cot2, .. cotN] [ASC | DESC];
```
dieu_kien : là điều kiện để lọc dữ liệu
ASC: tăng dần
DESC: giảm dần

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-10.png)

> [!NOTE]
> Có thể ORDER BY user_name, password: nếu user_ name như nhau thì nó sẽ sắp xếp theo password


4. ***GROUP BY***
- Mệnh đề GROUP BY trong SQL được sử dụng kết hợp với lệnh SELECT để sắp xếp dữ liệu đồng nhất vào trong các nhóm.
- Thường được sử dụg với các hàm COUNT(), MAX(), MIN(), SUM(), AVG()

Cú pháp:

```sql
SELECT cot1, cot2

FROM ten_bang

WHERE [ dieu_kien ]

GROUP BY cot1, cot2

ORDER BY cot1, cot2
```

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-11.png)

5. ***INSERT***
- Lệnh INSERT INTO trong SQL được sử dụng để thêm các hàng dữ liệu mới vào một bảng trong Database.
Cú pháp:

Xác định cột để chèn dữ liệu:
```sql
INSERT INTO TABLE_TEN (cot1, cot2, cot3,...cotN)

VALUES (giatri1, giatri2, giatri3,...giatriN);
```
Thao tác trên tất cả các cột trong bảng
```sql
INSERT INTO TABLE_TEN VALUES (giatri1,giatri2,giatri3,...giatriN);
```
![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-12.png)

6. ***UPDATE***
- Truy vấn UPDATE trong SQL được sử dụng để sửa đổi các bản ghi đang tồn tại trong một bảng. Bạn có thể sử dụng mệnh đề WHERE với truy vấn UPDATE sửa đổi các hàng đã lựa chọn, nếu không, hệ thống sẽ mặc định là tất cả các hàng đều bị tác động.

Cú pháp:

```sql
UPDATE ten_bang
SET cot1 = giatri1, cot2 = giatri2...., cotN = giatriN
WHERE [dieu_kien];
```
![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-13.png)

7. ***Mệnh đề Where***
- Mệnh đề WHERE trong SQL được sử dụng để xác định một điều kiện trong khi lấy dữ liệu từ bảng đơn hoặc nhiều bảng kết hợp. Bạn sẽ sử dụng mệnh đề WHERE để lọc các bản ghi và chỉ lấy lại các bản ghi cần thiết.

Cú pháp:
```sql
SELECT cot1, cot2, cotN

FROM ten_bang

WHERE [dieu_kien]
```
8. ***Từ khóa Distinct***
- Mệnh đề DISTINCT trong SQL được sử dụng kết hợp với lệnh SELECT để loại tất cả các bản sao của bản ghi và chỉ lấy các bản ghi duy nhất.
Cú pháp:
```sql
SELECT DISTINCT cot1, cot2,.....cotN

FROM ten_bang

WHERE [dieu_kien]
```

9. ***Mệnh đề AND & OR***

- Các toán tử AND và OR trong SQL được sử dụng để kết hợp nhiều điều kiện để thu hẹp phạm vi dữ liệu trong một lệnh SQL. Hai loại toán tử này được gọi là toán tử liên hợp. Nó cho phép tồn tại nhiều điều kiện trong mệnh đề WHERE của một lệnh SQL.

Cú pháp:
```sql
SELECT cot1, cot2, cotN

FROM ten_bang

WHERE [dieu_kien_1] AND [dieu_kien_2]...AND [dieu_kien_N];
```

## **II. SubQuery**
- Trong SQL, subquery (hoặc còn gọi là truy vấn con) là một truy vấn được nhúng bên trong một truy vấn khác. Subquery thường được sử dụng để trích xuất dữ liệu từ một bảng hoặc nhiều bảng dựa trên kết quả của truy vấn chính. Subquery có thể xuất hiện trong các mệnh đề SELECT, INSERT, UPDATE, DELETE và thậm chí trong một subquery khác.

### 1. Cú pháp

```sql
SELECT column_name
FROM table_name
WHERE column_name expression operator 
    ( SELECT COLUMN_NAME  from TABLE_NAME   WHERE ... );
```
### 2. Các quy tắc quan trọng trong truy vấn con
- Có thể đặt Truy vấn con trong một số mệnh đề SQL: WHERE , HAVING. 
- Có thể được sử dụng với các câu lệnh SELECT, UPDATE, INSERT, DELETE cùng với toán tử biểu thức. Nó có thể là toán tử đẳng thức hoặc toán tử so sánh như =, >, =, <= và toán tử Like.

-  Là một truy vấn trong một truy vấn khác. Truy vấn bên ngoài được gọi là truy vấn chính và truy vấn bên trong được gọi là truy vấn con.

- Phải được đặt trong dấu ngoặc đơn.

- Nằm ở phía bên phải của toán tử so sánh.

- Lệnh ORDER BY không thể được sử dụng trong Truy vấn con.
- Lệnh GROUPBY có thể được sử dụng để thực hiện chức năng tương tự như lệnh ORDER BY.

Sử dụng các toán tử hàng đơn với Truy vấn con hàng đơn. Sử dụng toán tử nhiều hàng với Truy vấn con nhiều hàng.

### 3. Các loại subquery
- ***Single-Row Subquery***: trả về duy nhất một hàng kết quả. Thường được sử dụng trong các mệnh đề WHERE hoặc HAVING để so sánh với một giá trị cụ thể.
- ***Multiple-Row Subquery***: trả về nhiều hàng kết quả. Thường được sử dụng với các phép toán IN, ANY hoặc ALL để so sánh với tập hợp các giá trị.
- ***Correlated Subquery***: chứa tham chiếu đến cột từ bảng ở một truy vấn ngoài. Nó được sử dụng trong các trường hợp mà dữ liệu của subquery phụ thuộc vào dữ liệu của truy vấn bên ngoài.
### 4. Ví dụ
#### 4.1. Single-Row Subquery
```sql
SELECT *
FROM [dbo].[Author]
WHERE author_id = (SELECT MAX(author_id) FROM [dbo].[Author]);
```
![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-14.png)

#### 4.2. Multiple-Row Subquery
```sql
SELECT * 
FROM [dbo].[Author]
WHERE [author_id] IN (
					SELECT [author_id]
					FROM [dbo].[Book]
					WHERE price > 19000
					GROUP BY [author_id]
);
```

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-15.png)

#### 4.3. Correlated Subquery

```sql
SELECT A.*,(
		SELECT SUM(B.price)
		FROM [dbo].[Book] AS B
		WHERE A.author_id = B.author_id
	) AS TotalPrice

FROM [dbo].[Author] AS A
```

![Alt text](https://github.com/sybui2004/CSDL-C-B-N/blob/main/%5BBU%E1%BB%94I%201%5D%20NH%E1%BA%ACP%20M%C3%94N%20CSDL/-16.png)


