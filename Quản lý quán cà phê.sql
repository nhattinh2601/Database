CREATE DATABASE QuanLyQuanCafe
GO
--csdl mỗi lần thực hiện có "go" thì sẽ thực hiện ~ câu lệnh ở trên nó
USE QuanLyQuanCafe
--dùng use để chuyển từ thanh có chữ master ở trên về cơ sở dữ liệu đang dùng
GO

--Food
--Table
--FoodCategory
--Account
--Bill
--BillInfo

CREATE TABLE TableFood
(
   id INT IDENTITY PRIMARY KEY,
   name NVARCHAR(100) NOT NULL DEFAULT N'bàn chưa đặt tên',
   status NVARCHAR(100) NOT NULL  DEFAULT N'trống'--để hiển thị có người hay không mặc dù tên status trùng với tên gì đó no ko sao
)
GO

CREATE TABLE Account
(
  UserName NVARCHAR(100) PRIMARY KEY,
  DisplayName NVARCHAR(100) NOT NULL DEFAULT N'DisplayName',
  Password NVARCHAR(1000) NOT NULL DEFAULT 0,
  Type INT NOT NULL DEFAULT 0 -- admin:1 || staff :0
)
GO

CREATE TABLE FoodCategory
(
  id INT IDENTITY PRIMARY KEY,
  name NVARCHAR(100) DEFAULT N'Chưa đặt tên',
)
GO

CREATE TABLE Food
(
  id INT IDENTITY PRIMARY KEY,
  name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
  idCategory INT NOT NULL,
  price FLOAT NOT NULL DEFAULT 0,
  
  FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
  id INT IDENTITY PRIMARY KEY,
  DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
  DateCheckOut DATE ,
  idTable INT NOT NULL,
  status INT NOT NULL DEFAULT 0--1:đã thanh toán hoặc 0:chưa thanh toán
  FOREIGN KEY(idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
  id INT IDENTITY PRIMARY KEY,
  idBill INT NOT NULL,
  idFood INT NOT NULL,
  count INT NOT NULL DEFAULT 0

  FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
  FOREIGN KEY(idFood) REFERENCES dbo.Food(id)
)
GO

--khóa ngoại : mục đích của khóa ngoại là ràng buộc toàn vẹn dữ liệu






