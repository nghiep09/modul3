create database TicketFilm;

create table tblPhim(
PhimID int primary key,
Ten_phim varchar(255),
Loai_Phim varchar(255),
Thoi_gian int
);

create table tblPhong(
PhongID int primary key,
Ten_phong varchar(255),
Trang_thai varchar(255)
);

create table tblGhe(
GheID int primary key,
PhongID int,
foreign key(PhongID) references tblPhong(PhongID),
So_ghe varchar(255)
);
create table tblVe(
PhimID int,
foreign key(PhimID) references tblPhim(PhimID),
GheID int,
foreign key(GheID) references tblGhe(GheID),
Ngay_Chieu datetime,
Trang_Thai varchar(255)
);

insert into tblphim values (1,'Em Bé Hà Nội','Tâm Lý',90);
insert into tblphim values (2,'Nhiệm vụ bất khả thi','Hành động',100);
insert into tblphim values (3,'Dị nhân','Viễn tưởng','90');
insert into tblphim values (4,'Cuốn theo chiều gió','Tình cảm',120);

insert into tblphong values (1,'Phòng chiếu 1','1');
insert into tblphong values (2,'Phòng chiếu 2','1');
insert into tblphong values (3,'Phòng chiếu 3','0');


insert into tblghe values (1,1,'A3');
insert into tblghe values (2,1,'B5');
insert into tblghe values (3,2,'A7');
insert into tblghe values (4,2,'D1');
insert into tblghe values (5,3,'T2');

insert into tblve values (1,1,'2008-10-20','Đã bán'),(1,3,'2008-11-20','Đã bán'),(1,4,'2008-12-23','Đã bán'),(2,1,'2009-02-14','Đã bán'),(3,1,'2009-02-14','Đã bán'),(2,5,'2009-03-08','Chưa Đã bán'),(2,3,'2009-03-08','Chưa Đã bán');

-- Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian) 


select * from tblphim order by Thoi_gian asc;

-- Hiển thị Ten_phim có thời gian chiếu dài nhất

select * from tblphim order by Thoi_gian desc limit 1;

-- Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select * from tblphim order by Thoi_gian asc limit 1;

-- Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select * from tblghe where So_ghe like 'A%';

-- Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)

-- Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:			
-- Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- Nếu Trang_thai=null thì gán Trang_thai=’Unknow’
-- Sau đó hiển thị bảng tblPhong 



update tblphong set trang_thai = case when trang_thai=0 then 'Đang Sửa' 
when trang_thai =1 then 'Đang sử dụng' else 'Unknow' 
end
 where phongid>0;

 -- update tblphong set trang_thai = if(trang_thai>0,'Đang sửa','Đang sử dụng');

-- Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 

select * from tblphim where length(Ten_phim)  >15 and length(Ten_phim)< 25;

-- Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’

select concat(ten_phong,' ',trang_thai) as 'trạng thái phòng chiếu' from tblphong;
 

-- Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian


create table tblRank (

)



