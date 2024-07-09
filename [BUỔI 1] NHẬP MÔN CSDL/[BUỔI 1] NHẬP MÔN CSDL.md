# **BUỔI 1 - NHẬP MÔN CSDL**

## **I. CSDL là gì ?**

- là tập hợp tất cả các dữ liệu rời rạc thành 1 hệ thống dữ liệu có thứ tự và có thể liên kết các dữ liệu với nhau.
- VD: Trong cuộc sống bạn có thể thấy rất nhiều cơ sở dữ liệu đó, nếu bạn vào thư viện thì ở trên đó là một cơ sở dữ liệu, phân loại sách theo chủ đề: xã hội, tự nhiên, khoa học … đó cũng là một dạng cở sở dữ liệu đơn giản.
- Mục đích : vì cho dễ quản lý và tìm kiếm, thống nhất việc lưu trữ thông tin, có thể tìm kiếm một cách nhanh chóng khi cần thông tin nào đó và cũng có thể lôi các “dòng họ” liên quan với thông tin đó ra luôn.

## **II. Hệ quản trị CSDL là gì ?**
- là phần mềm cung cấp cho ta chức năng để tạo mới, lưu trữ CSDL và nó có thể chỉnh sửa CSDL cũ cho hợp lý nếu không cần thì nó delete tất cả CSDL luôn. Ngoài ra nó còn bảo mật và kiêm luôn “bảo kê” CSDL bời người quản trị.
> [!NOTE]
> **bảo mật** nghĩa là nó mã hóa dữ liệu sang dạng mà người ta xem không hiểu, nếu muốn hiểu thì phải giải mã.
> **bảo kê** nghĩa là khi tạo xong CSDL dù bạn đã biết CSDL nằm ở đâu thì bạn cũng không có quyền xóa hay copy được, chỉ khi sử dụng hệ quản trị CSDL bạn mới có thể copy hay backup dữ liệu.
> VD: Access, SQL Server, MySQL, Oracle,….

- Mỗi Hệ quản trị CSDL khác nhau sẽ viết bằng ngôn ngữ quản trị CSDL khác nhau. Tuy nhiên có 1 số câu lệnh trong SQL Server vs MySQL vs Ocracle lại có cấu trúc lệnh và chức năng giống nhau!

### Mục đích tạo ra ngôn ngữ Hệ quản trị CSDL:
- Định nghĩa dữ liệu (Database Definition Language – DDL) là mô tả thuộc tính, định nghĩa các đối tượng trong CSDL.
- Thao tác dữ liệu (Database Manipulation Language – DML) là thao tác xử lý đối tượng trong CSDL như thêm, xóa, sửa, truy vấn…
- Kiểm soát dữ liệu (Database Control Language – DCL)  là để điều khiểng tính tương đồng của dữ liệu.
### Một số loại hệ quản trị DB:
- Hệ quản trị CSDL đơn nhiệm dành cho cá nhân sử dụng để giải quyết các vấn đề nhỏ.+ Hệ quản trị CSDL đa nhiệm (Hệ quản trị CSDL  trung tâm )dành cho tổ chức nhỏ hoặc  trung bình sử dụng và người người sử dụng cuối truy nhập CSDL thông qua thiết bị đầu cuối.


![Alt text](https://github.com/sybui2004/JAVA---PROPTIT/blob/main/BUOI%2012%20BAI%20TAP%20CUOI%20KHOA%201%20-%20THU%20VIEN%20DO%20HOA%20SWING/B1-1.png)

- Hệ quản trị CSDL Client / Server dành cho mọi tổ chức từ nhỏ – lớn. Những yêu cầu của người sử dụng cuối và trình ứng dụng sẽ được xử lý tại máy trạm(Client) sau đó những yêu cầu cần thiết sẽ được chuyển tới Hệ quản trị CSDL ở máy chủ (Server)

![Alt text](https://github.com/sybui2004/JAVA---PROPTIT/blob/main/BUOI%2012%20BAI%20TAP%20CUOI%20KHOA%201%20-%20THU%20VIEN%20DO%20HOA%20SWING/B1-2.png)

=> Tất cả các loại trên đều có Hệ quản trị CSDL đặt ở 1 nơi nên gọi là  mô hình Hệ quản trị CSDL tập trung vì thế nếu có vần đề xảy ra tại tại nơi đặt CSDL thì sẽ ảnh hướng đến toàn bộ hoạt động của hệ thống doanh nghiệp!

**Vì thế các doanh nghiệp lớn thường không đặt Hệ quản trị CSDL ở 1 nơi mà họ thường sao lưu CSDL mới rồi mã hóa chuyển đến nhiều nơi có Hệ quản trị CSDL của họ, nhằm đảm bảo CSDL không bị thất thoát nếu gặp sự cố ở 1 nơi nào đó đặt Hệ quản trị CSDL. Đó được gọi là mô hình Hệ quản trị CSDL phân tán.**

## **III. Câu lệnh tạo database, table trong MS SQL Server**
1. **Câu lệnh tạo database**
- Nhấp vào New Query hoặc phím tắt Ctrl + N
- Nhập câu lệnh có cú pháp sau
```sql
CREATE DATABASE <tên database>
```
- Tên DB thường đặt:
    <Tên Database> <DB> <Phương thức tạo Database>
- Bôi đen dòng lệnh > Excute (Phím tắt F5)

![Alt text](https://github.com/sybui2004/JAVA---PROPTIT/blob/main/BUOI%2012%20BAI%20TAP%20CUOI%20KHOA%201%20-%20THU%20VIEN%20DO%20HOA%20SWING/B1-3.png)

Tương tự câu lệnh xóa:
```sql
DROP DATABASE <tên database cần xóa>
```

2. **Câu lệnh tạo table**
- Lệnh CREATE TABLE dùng để tạo cấu trúc bảng trong  CSDL.
- Bảng có cấu trúc gồm các cột (column) và các dòng (row).
- Trong  CSDL bảng thường có khoá chính (primary key).
- Bảng dùng để lưu trữ dữ liệu, các thông tin của một đối tượng trong thực tế.
- Các bảng thường liên hệ với nhau bằng các mối quan hệ.
- Bảng được tạo trong các Schema (mặc định là schema dbo).

```sql
CREATE TABLE Tên_bảng
(
    Tên_cột_1 Kiểu_dữ_liệu,
    Tên_cột_2 Kiểu_dữ_liệu,
    ...
    Tên_cột_n Kiểu_dữ_liệu
)
```

VD:

Tạo bảng có tên D22 trên CSDL PROPTIT

```sql
CREATE TABLE D22
(
    ID char(2) PRIMARY KEY,
    NAME nvarchar(50) NOT NULL
)
```

hay
```sql
CREATE TABLE NHANVIEN
(
    ID int IDENTITY(10,5) PRIMARY KEY,
    HO nvarchar(30) NOT NULL,
    TEN nvarchar(20) NOT NULL,
    NGAYSINH datetime,
    LUONG int,
    GIOITINH bit,
    MAPB char(2)
)
```
