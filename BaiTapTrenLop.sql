2.
alter table SANPHAM
add GHICHU varchar(20)

3.
alter table KHACHHANG
add LOAIKH tinyint

4.
alter table SANPHAM
alter column GHICHU varchar(100)

5.
alter table SANPHAM
drop column GHICHU

6.
ALTER TABLE KHACHHANG  
ALTER COLUMN LOAIKH VARCHAR(20)

7.
ALTER TABLE SANPHAM  
ALTER COLUMN DVT NCHAR(10) NOT NULL CHECK (DVT IN( 'CAY','HOP','CAI','QUYEN','CHUC'))

--8
ALTER TABLE SANPHAM ADD CONSTRAINT SANPHAM_GIA CHECK(GIA > 500)

--9
ALTER TABLE HOADON ADD CONSTRAINT SL_MUA CHECK(SL > 1)

--10
ALTER TABLE KHACHHANG ADD CONSTRAINT NGDK_NGSINH CHECK(NGDK > NGSINH)

--11
ALTER TABLE HOADON ADD CONSTRAINT NGHD_NGDK CHECK(HOADON.NGHD > KHACHHANG.NGDK)

--12
ALTER TABLE HOADON ADD CONSTRAINT NGHD_NGDK CHECK(HOADON.NGHD > KHACHHANG.NGDK)

--11
SELECT SOHD FROM CTHD
WHERE MASP IN ('BB01', 'BB02')

--12
SELECT SOHD FROM CTHD
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20

--13
SELECT SOHD FROM CTHD A
WHERE A.MASP = 'BB01'AND SL BETWEEN 10 AND 20 AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02' AND SL BETWEEN 10 AND 20 AND A.SOHD = B.SOHD)

--14 
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC' AND C.SOHD IN(SELECT DISTINCT C2.SOHD
FROM CTHD C2 INNER JOIN HOADON H
ON C2.SOHD = H.SOHD
WHERE NGHD ='1/1/2007')

--15
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NOT EXISTS(SELECT * 
FROM SANPHAM S2 INNER JOIN CTHD C
ON S2.MASP = C.MASP AND S2.MASP = S.MASP)