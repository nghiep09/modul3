create database QuanLyDiemThi;

create table GiaoVien(
MaGv int primary key,
TenGv varchar(255),
sdt varchar(40)
);
create table HocSinh(
MaHs int primary key,
TenHs varchar(255),
NgaySinh datetime,
Lop varchar(40),
GT varchar(40),
MaGv int,
foreign key(MaGv) references GiaoVien(MaGv)
);
create table MonHoc(
MaMH int primary key,
TenMH varchar(50)
);

create table BangDiem(
	MaHs int,
    MaMH int,
    DiemThi INT,
    NgayKT DATETIME,
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);
alter table MonHoc ADD  MaGv int;
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);