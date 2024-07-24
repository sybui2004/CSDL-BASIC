# **BUỔI 2 - CƠ BẢN VỀ THIẾT KẾ CƠ SỞ DỮ LIỆUL**

## **I. Lý thuyết về thiết kế cơ sở dữ liệu**
1. ***Thiết kế cơ sở dữ liệu là gì?***
- là quá trình mô hình hóa nhằm chuyển đổi các đối tượng từ thế giới thực (Real-world system) sang các bảng trong hệ thống cơ sở dữ liệu (Database system) đáp ứng các yêu cầu lưu trữ và khai thác dữ liệu.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/1.png)

Trong đó,

- People: những người tham gia vào hệ thống, cần làm việc với những người này để xác định các dữ liệu cần lưu trữ, cần khai thác.
- Documents: tài liệu cần khảo sát các tài liệu trong hệ thống để xác định dữ liệu.
- Facilities(cơ sở vật chất): cần quan tâm những cơ sở vật chất nào cần quản lý.
- Other systems: cần tìm hiểu nghiên cứu các hệ thống tương tự để thu thập thêm dữ liệu.

2. ***Các bước thực hiện thiết kế CSDL***

> [!NOTE]
> - Xác định các thành phần dữ liệu
> - Chia nhỏ các thành phần dữ liệu ra thành các phần nhỏ nhất mà hệ thống sử dụng
>- Xác định các bảng và các cột
>- Xác định khóa chính, khóa ngoại và mối quan hệ
>- Kiểm tra cấu trúc cơ sở dữ liệu được thiết kế với qui định chuẩn hóa

Ví dụ để thiết kế cơ sở dữ liệu cho hệ thống có mẫu hóa đơn sau:
![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/2.png)

**Bước 1: Xác định các thành phần dữ liệu**
- Dựa trên việc:
    + Phân tích hệ thống hiện tại
    + Đánh giá, xem xét các hệ thống tương tự
    + Phỏng vấn người dùng
    + Phân tích các tài liệu trong hệ thống hiện tại

- Khảo sát hóa đơn trên chúng ta thu được các thành phần dữ liệu sau đây:

```sql
InvoiceNo: Số hóa đơn (INT)

InvoiceDate: Ngày ghi hóa đơn(DATETIME)

CustomerName: Tên khách hàng(NVARCHAR)

CustomerCompany: Tên công ty khách hành(NVARCHAR)

CustomerAddress: Địa chỉ khách hàng(NVARCHAR)

CustomerAccountNo: Số tài khoản của khách hàng(INT)

PaymentMethod: Phương thức thanh toán(NVARCHAR)

CustomerTaxNo: Mã số thuế của khách hàng(INT)

SequenceNo: Số thứ tự mua (INT)

ProductName: Tên sản phẩm(NVARCHAR)

Unit: Đơn vị tính của sản phẩm(NVARCHAR)

Quantity: Số lượng(INT)

UnitPrice: Đơn giá(INT)

Amount: Thành tiền(INT)

TotalAmount: Tổng tiền(INT)

VAT: Thuế giá trị gia tăng(INT)

TotalPay: Tổng tiền phải trả(INT)

ByText: Ghi bằng chữ(NVARCHAR)
```

- Cần loại bỏ các dữ liệu trùng ở các dạng sau:
    + Hai thành phần dữ liệu nhưng trỏ đến một thành phần dữ liệu thực tế
    + Bỏ những thành phần tính toán được
    + Những trường không cần lưu trữ hoặc không có thực

- Xem xét danh sách các thành phần ở trên chúng ta loại các trường sau:
    + Amount: Thành phần này được tính từ đơn giá * số lượng

    + TotalAmount: Thành phần này được tính bằng tổng các mục thành tiền.

    + TotalPay: Thành phần này được tính bằng TotalAmount – VAT amount

    + ByText: Được đọc từ tổng tiền phải trả.

**Bước 2: Chia nhỏ các thành phần dữ liệu thành đơn vị nhỏ nhất hữu dụng**

> [!NOTE]
> CustomerName có giá  trị là Nguyễn Văn A, trường này có thể tách ra là Lastname (Nguyễn), Middlename (Văn) và Firstname (A). Tuy nhiên, có hệ thống thì lưu hết vào một trường là ‘Nguyễn Văn A’ như giao hàng chẳng hạn, có hệ thống chia ra là ‘Nguyễn Văn’, ‘A’ như hệ thống quản lý sinh viên, có hệ thống chia ra thành ‘Nguyễn’, ‘Văn’, ‘A’ như hệ thống quản lý bay… Do vậy, bạn cần xem xét hệ thống bạn đang xây dựng sẽ lưu như thế nào.

Trong hệ thống này do hay sắp xếp theo tên khách hàng nên chúng ta tách nó ra thành 02 phần là CustomerLastName và CustomerFirstName.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/3.png)

Tương tự trường CustomerAddress cung vậy, để quản lý theo tỉnh/thành phố và quận/huyện chúng ta chia nó ra thành 03 trường như sau: CustomerAddress, CustomerDistrict và CustomerCity.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/4.png)

- Sau khi tách các trường cần thiết và loại bỏ các trường không cần thiết ta có các thành phần dữ liệu như sau:
```sql
InvoiceNo: Số hóa đơn(INT)

InvoiceDate: Ngày ghi hóa đơn(DATETIME)

CustomerFirstName: Tên khách hàng(NVARCHAR)

CustomerLastName: Họ và tên lót của khách hàng(NVARCHAR)

CustomerCompany: Tên công ty khách hành(NVARCHAR)

CustomerAddress: Địa chỉ khách hàng(NVARCHAR)

CustomerCity: Thành phố khách hàng đang ở(NVARCHAR)

CustomerDistrict: Quận khách hàng đang ở(NVARCHAR)

CustomerAccountNo: Số tài khoản của khách hàng(INT)

PaymentMethod: Phương thức thanh toán(NVARCHAR)

CustomerTaxNo: Mã số thuế của khách hàng(INT)

SequenceNo: Số thứ tự mua hành(INT)

ProductName: Tên sản phẩm(NVARCHAR)

Unit: Đơn vị tính của sản phẩm(NVARCHAR)

Quantity: Số lượng(INT)

UnitPrice: Đơn giá(INT)

Amount: Thành tiền(INT)
```
**Bước 3: Xác định các bảng và các cột cho cơ sở dữ liệu**

- Thực hiện theo các bước sau:
    + Nhóm các trường theo các thực thể (Entities)
    + Kiểm tra lại các trường thừa/thiếu.

- Dựa trên 2 bước trên ta chia thành 3 thực thể:
    + Invoice(Hóa đơn)
    + Customer (Khách hàng)
    + Product (Sản phẩm)

- Nhóm dữ liệu vào các thực thể:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/5.png)

Kiểm tra lại các trường thừa/thiếu: Nếu thấy thiếu thì thêm vào còn nếu thừa thì có thể xem xét đến việc loại bỏ hoặc bổ sung vào các thực thể.

**Bước 4: Xác định khóa chính, khóa ngoại và mối quan hệ giữa các thực thể**

- Xác định khóa chính cho các thực thể
- Xác định quan hệ giữa các thực thể
- Phân tách để đưa về mô hình nhị nguyên
- Bổ sung khóa ngoại

Khóa chính xác định như sau:
- Chọn từ một trường có sẵn đủ điều kiện làm khóa chính như InvoiceNo chẳng hạn.
- Nếu chưa có bạn có thể bổ sung một trường tự tăng để làm khóa chính như CustomerNo, ProductNo.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/6.png)

Xem xét các thực thể bạn có để xác định các định mối quan hệ của chúng, chúng ta có các thực thể Customer, Product và Invoice thì mối quan hệ của chúng chỉ có thể là Customer mua Product và sinh ra Invoice để ghi nhận thông tin.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/7.png)

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/8.png)

- Quan hệ giữa Customer và Invoice, chúng ta thấy mỗi khách hàng có thể mua nhiều đơn hàng, nhưng mỗi đơn hàng chỉ bán cho 1 khách hàng. Do vậy quan hệ này là 1-n.
- Tương tự quan hệ giữa Invoice và Product, mỗi hóa đơn có thể mua nhiều sản phẩm, mỗi sản phẩm có thể bán cho nhiều hóa đơn nên quan hệ này là quan hệ n-n.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/9.png)

- Theo mô hình cơ sở dữ liệu quan hệ nếu để tồn tại mối quan hệ n-n nó sẽ gây ra dư thừa dữ liệu. Do vậy, bạn cần tách quan hệ ra thành các quan hệ 1-n bằng cách thêm vào bảng dữ liệu mới. Trong ví dụ trên chúng ta thêm vào bảng InvoiceDetails để tách nó ra thành 02 quan hệ 1-n như sau:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/10.png)

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/11.png)

- Các giá trị ở vùng bôi đen có giá trị lặp đi lặp lại và dẫn đến sai sót nên bạn cần phải tách phần này ra thành bảng riêng để thành hai bảng Invoice và InvoiceDetails.

- Quan hệ n-n chứa dư thừa dữ liệu và có khả năng gây sai sót nên bạn cần thêm bảng và tách chúng ta thành các quan hệ 1-n để giảm dư thừa dữ liệu.

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/12.png)


- Bổ sung khóa ngoại cho các mối quan hệ:
Khi đã xác định xong các mối quan hệ, cần đặt các khóa ngoại vào các bảng bên n trong  quan hệ 1-n  để tạo liên kết giữa chúng. Lúc này chúng ta có cấu trúc cơ sở dữ liệu như sau:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/13.png)

**Bước 5: Chuẩn hóa cơ sở dữ liệu**
> [!NOTE]
> Cái này sẽ tìm hiểu ở mục sau
3. ***Thế nào là thiết kế CSDL tốt?***
Một thiết kế CSDL tốt cần phải có cấu trúc rõ ràng, hiệu quả và linh hoạt để đáp ứng nhu cầu của tổ chức. Cụ thể:

- **`Được chuẩn hóa`**: Nghĩa là dữ liệu được phân chia thành các bảng nhỏ có quan hệ với nhau, giúp loại bỏ sự dư thừa và cải thiện tính toàn vẹn, hiệu quả của dữ liệu.
 - **`Có tính hiệu quả`**: Đảm bảo sử dụng tối ưu các nguồn lực như dung lượng lưu trữ và công suất xử lý, để các truy vấn được thực hiện nhanh chóng. 
- **`Có tính linh hoạt`**: Có thể thích ứng với các yêu cầu và dữ liệu mới mà không cần thiết kế lại toàn bộ hệ thống.
- **`Có khả năng mở rộng`**: Để xử lý lượng dữ liệu và truy vấn ngày càng tăng mà không làm giảm hiệu suất. 
- **`Đảm bảo an toàn`**: Có các biện pháp bảo vệ dữ liệu khỏi truy cập và thao tác trái phép, duy trì tính bảo mật và toàn vẹn của dữ liệu.

4. ***Lợi ích khi thiết kế CSDL tốt***
Tương tự như việc thiết kế CSDL tốt thì sẽ nhận được những lợi ích:

- Hiệu suất tối ưu:

    + Truy vấn nhanh hơn: Các truy vấn và thao tác dữ liệu sẽ diễn ra nhanh chóng hơn, giúp giảm thời gian xử lý và cải thiện hiệu suất hệ thống.
    + Giảm bớt sự trùng lặp: Giảm thiểu sự trùng lặp dữ liệu giúp tiết kiệm không gian lưu trữ và cải thiện hiệu suất khi đọc và ghi dữ liệu.

- Tính toàn vẹn và nhất quán của dữ liệu:

    + Tránh mâu thuẫn dữ liệu: Thiết kế tốt đảm bảo rằng dữ liệu luôn nhất quán và không có mâu thuẫn giữa các bảng và mối quan hệ.
    + Duy trì tính toàn vẹn: Các ràng buộc và khóa ngoại giúp duy trì tính toàn vẹn của dữ liệu, đảm bảo rằng các mối quan hệ giữa các bảng luôn hợp lệ.
- Dễ bảo trì và mở rộng:

    + Dễ thêm mới: Thiết kế tốt cho phép dễ dàng thêm các bảng, cột hoặc mối quan hệ mới mà không làm ảnh hưởng đến các phần khác của hệ thống.
    + Bảo trì dễ dàng: Việc cập nhật, sửa lỗi và duy trì hệ thống trở nên đơn giản hơn nhờ thiết kế rõ ràng và hợp lý.
- Bảo mật dữ liệu:

    + Phân quyền truy cập: Thiết kế tốt cho phép phân quyền truy cập dữ liệu theo các cấp độ khác nhau, đảm bảo rằng chỉ những người có thẩm quyền mới có thể truy cập và thao tác dữ liệu quan trọng.
    + Kiểm soát lỗi: Các cơ chế kiểm soát lỗi và xác thực dữ liệu giúp bảo vệ hệ thống khỏi các lỗi dữ liệu và truy cập trái phép.
- Khả năng mở rộng: Dễ dàng mở rộng trong tương lai

- Giảm chi phí:

    + Tiết kiệm tài nguyên: Thiết kế tối ưu giúp sử dụng hiệu quả tài nguyên hệ thống như CPU, RAM và bộ nhớ, giảm chi phí phần cứng và phần mềm.
    + Giảm chi phí phát triển: Dễ bảo trì và mở rộng giúp giảm chi phí phát triển và bảo trì hệ thống về lâu dài.
Một thiết kế cơ sở dữ liệu tốt không chỉ đảm bảo hoạt động ổn định và hiệu quả của hệ thống mà còn hỗ trợ tối ưu cho các nhu cầu kinh doanh và phát triển trong tương lai.

## **II. Lược đồ quan hệ E-R**

- Thực thể là một đối tượng trong thế giới thực.

- Một nhóm bao gồm các thực thể tương tự nhau tạo thành một tập thực thể

- Để xác định một tập thực thể cần phải thiết lập một số hữu hạn các tính chất đặc trưng của tất cả các thực thể trong tập thực thể đó, gọi là các thuộc tính.

- Mối liên kết giữa 2 thực thể được gọi là quan hệ
**`Lược đồ quan hệ E-R là đồ thị biểu diễn các tập thực thể, thuộc tính và mối quan hệ`**

***Các ký hiệu trong lược đồ E-R***

- Đỉnh: là tên thực thể, tên thuộc tính, tên quan hệ
- Cung: là đường nối giữa tập thực thể và thuộc tính, mối quan hệ và tập thực thể

Ví dụ lược đồ E-R:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/14.png)

***Các kiểu liên kết trong lược đồ E-R***

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/15.png)

## **III. Mô hình dữ liệu quan hệ**
- Mô hình dữ liệu quan hệ(RDM) là mô hình biểu diễn cơ sở dữ liệu dưới dạng một tập hợp các quan hệ (bảng giá trị). Mỗi bảng giá trị có các cột và hàng được gọi lần lượt là thuộc tính (attributes) và bộ giá trị (tuples). Mỗi bộ giá trị (tuple) kí hiệu một thực thể hoặc mối quan hệ trong thế giới thực. Tên của quan hệ và tên của các thuộc tính sẽ góp phần giải thích ý nghĩa của từng bộ.
- Có thể hiểu RDM qua các đặc điểm sau:
    + Bảng: Là tập hợp các dòng và cột tương ứng với các bản ghi và trường. Mỗi bảng một tên duy nhất
    + Dòng: Mỗi dòng là một bản ghi cụ thể chứa các giá trị cho các thuộc tính khác nhau
    + Cột: Mỗi cột là một trường trong bảng như tên, địa chỉ, ngày sinh…
    + Khóa chính: Là một cột hoặc tổng hợp các cột trong bảng, có giá trị duy nhất cho mỗi dòng.
    + Khóa ngoại: Là một cột trong bảng, tham chiếu tới khóa chính của bảng khác để thiết lập mối quan hệ giữa các bảng
    + Liên kết: Bao gồm 3 loại chính là: một - một; một - đến - nhiều và nhiều - đến - nhiều
    + Truy vấn: Là cách lấy thông tin cần thiết từ các bảng dựa trên điều kiện cụ thể

- Lợi ích:
    + Tính tiện lợi: Khi truy vấn dữ liệu trong bảng phức tạp vẫn có thể dễ dàng thực hiện các thao tác một cách đơn giản và hiệu quả. Người dùng có thể tìm kiếm thông tin hay tổng hợp thông tin từ nhiều bảng khác nhau
    + Tính linh hoạt: Khi muốn thay đổi theo yêu cầu của tình hình hiện tại thì người dùng có thể dễ dàng thêm bớt, sửa đổi các bảng và mối quan hệ mà sẽ không làm ảnh hưởng lớn tới hệ thống
    
## **IV. Chuẩn hóa dữ liệu: 1NF, 2NF, 3NF.**

- Chuẩn hóa cơ sở dữ liệu là áp dụng các qui tắc cho thiết kế của cơ sở dữ liệu nhằm giúp giảm dư thừa dữ liệu trong quá trình thiết kế Cơ sở dữ liệu

**`Chuẩn 1 (1NF – First Normal Form): Giá trị được lưu trữ trong các ô phải là các giá trị đơn (scalar value) và trong bảng không có cột nào lặp lại.`**

**`Chuẩn 2 (2NF – Second Normal Form): Mọi trường không phải là khóa phải phụ thuộc vào khóa chính.`**

**`Chuẩn 3 (3NF – Third Normal Form): Mọi trường không phải là khóa chỉ phụ thuộc vào khóa chính mà thôi.`**

- Tiến trình để đưa bảng dữ liệu về chuẩn 1:
    + Chia các thành phần dữ liệu thành đơn vị nhỏ nhất hữu dụng
    + Loại bỏ các trường lặp lại, các trường tính toán trong bảng chúng ta có chuẩn 1

- Tiến trình để đưa bảng dữ liệu về chuẩn 2:
    + Từ chuẩn 1, tách các trường không phụ thuộc vào khóa chính ra bảng riêng ta sẽ được chuẩn 2.

- Tiến trình để đưa bảng dữ liệu về chuẩn 3:
    + Từ chuẩn 2, tách các trường không phụ thuộc hoàn toàn vào khóa chính (có nghĩa là có phụ thuộc thêm ít nhất một trường khác nữa ngoài khóa chính) ra bảng khác chúng ta sẽ được chuẩn 3.

- Lấy mẫu bài đã làm ở trên:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/2.png)


```sql
Bảng Invoice (Hóa đơn)

InvoiceNo: Số hóa đơn

InvoiceDate: Ngày ghi hóa đơn

CustomerName: Tên khách hàng

CustomerCompany: Tên công ty khách hành

CustomerAddress: Địa chỉ khách hàng

CustomerAccountNo: Số tài khoản của khách hàng

PaymentMethod: Phương thức thanh toán

CustomerTaxNo: Mã số thuế của khách hàng

SequenceNo: Số thứ tự mua hành

ProductName: Tên sản phẩm

Unit: Đơn vị tính của sản phẩm

Quantity: Số lượng

UnitPrice: Đơn giá

Amount: Thành tiền

TotalAmount: Tổng tiền

VAT: Thuế giá trị gia tăng

TotalPay: Tổng tiền phải trả

ByText: Ghi bằng chữ
```

***1. Đưa bảng dữ liệu về chuẩn 1:***
- Chia các thành phần dữ liệu thành đơn vị nhỏ nhất hữu dụng:
    + Chia trường CustomerName thành CustomerFirstName và CustomerLastName
    + Chia trường CustomerAddress thành CustomerAddress, CustomerDistrict và CustomerCity
- Loại bỏ các trường lặp lại và tính toán
    + Loại bỏ các trường: Amount, TotalAmount, TotalPay, ByText

Lúc này bảng được như sau:

```sql
Bảng Invoice (Hóa đơn)

InvoiceNo: Số hóa đơn

InvoiceDate: Ngày ghi hóa đơn

CustomerFirstName: Tên khách hàng

CustomerLastName: Họ lót khách hàng

CustomerCompany: Tên công ty khách hành

CustomerAddress: Địa chỉ khách hàng

CustomerDistrict: Quận nơi khách hàng đang ở

CustomerCity: Thành phố nơi khách hàng đang ở

CustomerAccountNo: Số tài khoản của khách hàng

PaymentMethod: Phương thức thanh toán

CustomerTaxNo: Mã số thuế của khách hàng

SequenceNo: Số thứ tự mua hành

ProductName: Tên sản phẩm

Unit: Đơn vị tính của sản phẩm

Quantity: Số lượng

UnitPrice: Đơn giá

VAT: Thuế giá trị gia tăng
```
- Từ chuẩn 1, xem xét các trường không phụ thuộc vào khóa chính để tách ra thành bảng riêng.

- Xem xét từ trên xuống chúng ta sẽ thấy các trường: **`CustomerFirstName, CustomerLastName, CustomerCompany, CustomerAddress, CustomerDistrict, CustomerCity, CustomerAccountNo, CustomerTaxNo`** phụ thuộc vào khách hàng chứ không phụ thuộc vào hóa đơn nên tách nhóm này ra thành bảng Khách hàng (Customer), phát sinh mã khách hàng làm khóa chính.
- Các trường: **`ProductName, Unit`** phụ thuộc vào sản phẩm chứ không phải hóa đơn nên tách ra thành bảng Sản phẩm (Product) và phát sinh khóa chính cho nó.

Lúc này chúng ta có được 03 bảng dữ liệu như sau:
```sql
Customer

    CustomerNo

    CustomerFirstName

    CustomerLastName

    CustomerCompany

    CustomerAddress

    CustomerDistric

    CustomerCity

    CustomerAccountNo

    CustomerTaxNo

Product

    ProductNo

    ProductName

    Unit

Invoice

    InvoiceNo

    InvoiceDate

    PaymentMethod

    SequenceNo

    Quantity

    UnitPrice

    VAT

```

Xác định mối quan hệ và đặt khóa ngoại cho trường CustomerNo và ProductNo chúng ta được sơ đồ thực thể cho mức 2 như sau:

![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/16.png)

- Xem xét các trường từ các bảng không phụ thuộc hoàn toàn vào khóa chính ra bảng khác để về chuẩn 3.

- Các trường ở bảng Customer và Product đã phụ thuộc hoàn toàn vào khóa chính nên các bảng này đã ở chuẩn 3
- Các trường **`SequenceNo, Quantity, UnitPrice`** của bảng Invoice bên cạnh việc phụ thuộc vào hóa đơn nó còn phải phụ thuộc vào ProductNo (mặt hàng nào) nữa mới biết được giá trị của nó. Nên các trường này không phụ thuộc hoàn toàn vào khóa chính. Tách các trường này ra bảng mới và đặt tên thành InvoiceDetails và phát sinh khóa chính cho nó.
- Lúc này bảng Invoice được chia thành Invoice và InvoiceDetails như sau:

<<<<<<< HEAD
![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/13.png)
=======
![Alt text](https://github.com/sybui2004/CSDL-BASIC/blob/main/%5BBU%E1%BB%94I%202%5D%20C%C6%A0%20B%E1%BA%A2N%20V%E1%BB%80%20THI%E1%BA%BET%20K%E1%BA%BE%20C%C6%A0%20S%E1%BB%9E%20D%E1%BB%AE%20LI%E1%BB%86U/13.png)

>>>>>>> 3ef21dc3e0694fcbd6a8037452f47b0d12687a1e
