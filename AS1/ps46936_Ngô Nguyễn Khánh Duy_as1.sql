CREATE DATABASE QLNHATRO

USE	QLNHATRO

CREATE TABLE LOAINHA(
	MaLoaiNha smallint  PRIMARY KEY not null, 
	TenLoaiNha nvarchar(50) NOT NULL
)

CREATE TABLE NGUOIDUNG(
	MaND smallint  PRIMARY KEY NOT NULL,
	TenND nvarchar(50) NULL,
	GioiTinh nvarchar(5) NULL,
	DienThoai varchar(15)  NULL,
	DiaChi nvarchar(50) NOT NULL,
	Quan nvarchar(50) null,
	Email nvarchar(50) null
)

CREATE TABLE NHATRO(
	MaNT smallint  PRIMARY KEY NOT NULL,
	MaLoaiNha smallint  NOT NULL,
	MaND smallint NOT NULL,
	DienTich float check(DienTich > 10) NOT NULL,
	GiaPhong int check(GiaPhong > 0) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Quan nvarchar(20) null,
	MoTa nvarchar(20)  NULL,
	NgayDang date NOT NULL,
	foreign key(MaLoaiNha) references LOAINHA(MaLoaiNha),
	foreign key(MaND)  references NGUOIDUNG(MaND)
)

CREATE TABLE DANHGIA(
	MaND smallint  not null,
	MaNT smallint  not null,
	Like_Dislike bit  NULL,
	NoiDung nvarchar(100)  NULL,
	PRIMARY KEY(MaND,MaNT),
	foreign key(MAND) references NGUOIDUNG(MaND),
	foreign key(MANT) references NHATRO(MaNT)
)

INSERT INTO LOAINHA(MaLoaiNha,TenLoaiNha) VALUES
(1,N'Nhà trọ chung chủ'),
(2,N'thuê nhà'),
(3,N'Chung cư'),
(4,N'Ký túc xá')

-- Bảng NGUOIDUNG
INSERT INTO NGUOIDUNG(MaND,TenND,GioiTinh,DienThoai,DiaChi,Quan,Email) VALUES
(1,N'Nguyễn Văn An','nam','0912345001',N'12 Lý Thường Kiệt, Phường 7',N'Tân Bình','an.nguyen@gmail.com'),
(2,N'Trần Thị Mai',N'nữ','0912345002',N'88 Hoàng Hoa Thám, Phường 6',N'Bình Thạnh','mai.tran@gmail.com'),
(3,N'Phạm Quốc Huy','nam','0912345003',N'34 Nguyễn Thái Học, Phường Cầu Ông Lãnh',N'Quận 1','huy.pham@gmail.com'),
(4,N'Lê Thị Ngọc',N'nữ','0912345004',N'19 Lê Văn Sỹ, Phường 13',N'Phú Nhuận','ngoc.le@gmail.com'),
(5,N'Đỗ Minh Tâm','nam','0912345005',N'203 Võ Văn Kiệt, Phường 10',N'Quận 5','tam.do@gmail.com'),
(6,N'Bùi Anh Tuấn','nam','0912345006',N'75 Nguyễn Kiệm, Phường 3',N'Gò Vấp','tuan.bui@gmail.com'),
(7,N'Hoàng Thị Lan',N'nữ','0912345007',N'56 Trường Sa, Phường 17',N'Bình Thạnh','lan.hoang@gmail.com'),
(8,N'Vũ Văn Cường','nam','0912345008',N'321 Trần Não, Phường Bình An',N'Quận 2','cuong.vu@gmail.com'),
(9,N'Nguyễn Thị Hạnh',N'nữ','0912345009',N'27 Điện Biên Phủ, Phường Đa Kao',N'Quận 1','hanh.nguyen@gmail.com'),
(10,N'Phan Văn Khải','nam','0912345010',N'65 Âu Cơ, Phường 9',N'Tân Bình','khai.phan@gmail.com');


-- Bảng NHATRO
INSERT INTO NHATRO(MaNT,MaLoaiNha,MaND,DienTich,GiaPhong,DiaChi,Quan,MoTa,NgayDang) VALUES
(1,2,5,28,1500000,N'45 Cộng Hòa, Phường 4',N'Tân Bình',N'Nhà thoáng mát','2021-03-15'),
(2,1,2,40,3000000,N'120 Nguyễn Văn Đậu, Phường 7',N'Bình Thạnh',N'Hẻm rộng rãi','2021-06-22'),
(3,3,8,65,5000000,N'210 Xa Lộ Hà Nội, Phường Hiệp Phú',N'Thủ Đức',N'Gần siêu thị','2021-07-09'),
(4,4,1,55,4500000,N'78 Trần Hưng Đạo, Phường 10',N'Quận 5',N'Có ban công','2021-09-01'),
(5,2,6,35,2500000,N'32 Phan Văn Trị, Phường 11',N'Gò Vấp',N'Có chỗ để xe','2021-11-10'),
(6,1,3,80,7000000,N'90 Nguyễn Trãi, Phường 3',N'Quận 5',N'Nguyên căn 2 tầng','2021-04-18'),
(7,2,9,30,2000000,N'15 Hoàng Diệu, Phường 12',N'Quận 4',N'Điện nước riêng','2021-08-27'),
(8,3,7,50,4000000,N'65 Cách Mạng Tháng 8, Phường 11',N'Quận 10',N'Có nội thất','2021-05-06'),
(9,4,10,70,6000000,N'10 Lê Quang Định, Phường 14',N'Bình Thạnh',N'Rộng rãi, thoáng','2021-12-02'),
(10,1,4,45,3500000,N'99 Nguyễn Đình Chiểu, Phường 6',N'Quận 3',N'Ngay trung tâm','2021-02-20');


-- Bảng DANHGIA
INSERT INTO DANHGIA(MaND,MaNT,Like_Dislike,NoiDung) VALUES
(1,3,1,N'Nhà rộng rãi'),
(2,5,0,N'Không có thang máy'),
(3,1,1,N'Chủ nhà thân thiện'),
(4,7,0,N'Phòng hơi nhỏ'),
(5,4,1,N'Ban công đẹp'),
(6,2,1,N'Giá hợp lý'),
(7,6,0,N'Ồn ào buổi tối'),
(8,10,1,N'Ngay trung tâm, tiện lợi'),
(9,8,1,N'Có sẵn nội thất'),
(10,9,0,N'Giá cao so với khu vực');



select * from LOAINHA
select * from NHATRO
select * from NGUOIDUNG
select * from DANHGIA