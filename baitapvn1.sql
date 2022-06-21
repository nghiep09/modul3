-- cau 3
select * from dongxe where SochoNgoi >5;

-- cau 4

select sp.*,  H.HangXe, D.DonGia
from supplier  sp join dangkycc dk on sp.MaNhaCC = dk.MaDkCC
join dongxe H on dk.DongXe = H.HangXe
join mucphi D on D.MaMP = dk.MaMP
where (H.hangXe = 'Toyota' and D.donGia = 2000) or
(H.hangXe = 'KIA' and D.donGia = 1500);

-- caau 5

select * from supplier order by TenNhaCC asc;
select * from supplier order by Masothue desc;

-- cau 6
select count(SLXDK) from dangkycc where NBDCC > 2011/11/20; 

-- cau 7

select hangxe from dongxe group by hangxe;

