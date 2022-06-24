create database qlsp;

Create table product(
    codeP int primary key,
    nameP varchar(255),
    priceP double
);
create table orders(
    codeO int primary key,
    dateO date,
    totalMoney double
);
create table OrderDetail(
	codeP int ,
	codeO int,
	soluong int ,
    primary key(codeP,codeO),
    foreign key (codeP) references product(codeP),
	foreign key (codeO) references orders(codeO)
);

INSERT INTO `product` (`codeP`, `nameP`, `priceP`) VALUES ('1', 'banh mi', '8.2');
INSERT INTO `product` (`codeP`, `nameP`, `priceP`) VALUES ('2', 'bim bim', '5.2');
INSERT INTO `product` (`codeP`, `nameP`, `priceP`) VALUES ('3', 'mi tom', '9.2');
INSERT INTO `product` (`codeP`, `nameP`, `priceP`) VALUES ('4', 'nuoc hoa', '7.2');



-- viet trigger tự động cập nhật số tiền của hóa đơn sau khi mua thêm hàng

DELIMITER $$
CREATE TRIGGER tgSetStatus 
 after insert on orderdetail
 FOR EACH ROW
BEGIN
	update orders set totalMoney = totalMoney + (new.soluong * (select priceP from product where codeP = new.codeP ))where codeO = new.codeO;
END
$$


-- viet trigger tự động cập nhật số tiền của hóa đơn sau khi xóa
DELIMITER $$
CREATE TRIGGER tgSetStatus 
 after delete on orderdetail
 FOR EACH ROW
BEGIN
	update orders set totalMoney =totalMoney - (old.soluong * (select priceP from product where codeP = old.codeP ))where codeO = old.codeO;
END
$$



