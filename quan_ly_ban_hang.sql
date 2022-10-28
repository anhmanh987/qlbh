create database quản_lý_bán_hàng

use quản_lý_bán_hàng

create table hàng_hóa(
id int primary key identity(1,1),
tên_mặt_hàng nvarchar(50),
nhà_sản_Xuất nvarchar(50),
xuất_xứ nvarchar(50),
giá_nhập float,
giá_bán float,
ngày_sản_xuất date
)
go

create table bán_hàng(
id_đơn_hàng int primary key identity(1,1),
chú_thích nvarchar(50),
ngày_bán date,
số_lượng int
)
go

alter table bán_hàng
add id_hang_hoa int
go

alter table bán_hàng
add constraint fk_bán_hàng_hàng_hóa foreign key (id_hang_hoa) references hàng_hóa (id)

insert into hàng_hóa(tên_mặt_hàng,nhà_sản_Xuất,xuất_xứ,giá_nhập,giá_bán,ngày_sản_xuất)values
('mathang1','nhasanxuat1','vietnam',2000,4000,'2021-02-15'),
('mathang2','nhasanxuat2','Japan',3000,5000,'2021-02-15'),
('mathang3','nhasanxuat3','Japan',4000,6000,'2021-02-15'),
('mathang4','nhasanxuat4','vietnam',5000,7000,'2021-02-15'),
('mathang5','nhasanxuat5','vietnam',6000,8000,'2021-02-15'),
('mathang6','nhasanxuat6','Japan',7000,10000,'2021-02-15'),
('mathang7','nhasanxuat7','vietnam',8000,12000,'2021-02-15'),
('mathang8','nhasanxuat8','Japan',9000,13000,'2021-02-15'),
('mathang9','nhasanxuat9','vietnam',12000,15000,'2021-02-15'),
('mathang10','nhasanxuat10','vietnam',22000,30000,'2021-02-15')
go

insert into bán_hàng(id_hang_hoa,chú_thích,ngày_bán,số_lượng)values
(2,'chuthich1','2021-02-22',2),
(3,'chuthich2','2021-02-22',3),
(4,'chuthich3','2021-02-22',4),
(5,'chuthich4','2021-02-22',5),
(5,'chuthich5','2021-02-22',6),
(7,'chuthich6','2021-02-22',7),
(6,'chuthich7','2021-02-22',8),
(5,'chuthich8','2021-02-22',9),
(3,'chuthich9','2021-02-22',2),
(1,'chuthich10','2021-02-22',3)
go

select *from bán_hàng
select *from hàng_hóa

select hàng_hóa.tên_mặt_hàng,hàng_hóa.nhà_sản_xuất,hàng_hóa.xuất_xứ,hàng_hóa.giá_nhập,hàng_hóa.giá_bán,hàng_hóa.ngày_sản_xuất,bán_hàng.chú_thích,bán_hàng.ngày_bán,bán_hàng.số_lượng
from hàng_hóa,bán_hàng
where hàng_hóa.id=bán_hàng.id_hang_hoa

select hàng_hóa.tên_mặt_hàng,hàng_hóa.nhà_sản_xuất,hàng_hóa.xuất_xứ,hàng_hóa.giá_nhập,hàng_hóa.giá_bán,hàng_hóa.ngày_sản_xuất,bán_hàng.chú_thích,bán_hàng.ngày_bán,bán_hàng.số_lượng
from hàng_hóa,bán_hàng
where hàng_hóa.id=bán_hàng.id_hang_hoa
and hàng_hóa.xuất_xứ = 'vietnam'

select hàng_hóa.tên_mặt_hàng,hàng_hóa.nhà_sản_xuất,hàng_hóa.xuất_xứ,hàng_hóa.giá_nhập,hàng_hóa.giá_bán,hàng_hóa.ngày_sản_xuất,bán_hàng.chú_thích,bán_hàng.ngày_bán,bán_hàng.số_lượng, sum (hàng_hóa.giá_bán * bán_hàng.số_lượng) 'tổng'
from hàng_hóa,bán_hàng
where hàng_hóa.id=bán_hàng.id_hang_hoa
group by hàng_hóa.tên_mặt_hàng,hàng_hóa.nhà_sản_xuất,hàng_hóa.xuất_xứ,hàng_hóa.giá_nhập,hàng_hóa.giá_bán,hàng_hóa.ngày_sản_xuất,bán_hàng.chú_thích,bán_hàng.ngày_bán,bán_hàng.số_lượng

