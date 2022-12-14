#Qry1
SELECT TENKH
FROM KhachHang;

#Qry2
SELECT MASP,TENSP
FROM SanPham;

#Qry3
SELECT HO,TEN,DIACHI,DIENTHOAI
FROM NhanVien;

#Qry4
SELECT MAKH,TENKH,DCKHACH
FROM KhachHang
WHERE TENKH LIKE '%Cuong%';

#Qry5
SELECT TENKH,DTKHACH,DCKHACH
FROM KhachHang
WHERE DCKHACH LIKE '%An Duong Vuong%';

#Qry6
SELECT MASP,TENSP,DONGIA
FROM SanPham
WHERE TENSP LIKE '%Sharp%';

#Qry7
SELECT * FROM NhanVien
WHERE PHAI='M';

#Qry8
SELECT * FROM SanPham
WHERE DVT='Hop'AND DVT='Thung';

#Qry9
SELECT * FROM SanPham
WHERE DONGIA BETWEEN 1000000 AND 3000000;

#Qry10
SELECT * FROM SanPham
WHERE TENSP LIKE '%Sharp%' OR TENSP LIKE '%Toshiba%';

#Qry11
SELECT * FROM NhanVien
WHERE TEN LIKE '%Minh%';

#Qry12
SELECT MANV,HO,TEN,NGAYVL,DIACHI,MABP
FROM NhanVien
WHERE PHAI='F'AND MABP LIKE 'CH%';

#Qry13
SELECT * FROM NhanVien
WHERE YEAR(NGAYVL)-YEAR(NGAYSINH) BETWEEN 30 AND 40;

#Qry14
SELECT * FROM NhanVien
WHERE YEAR(CURDATE())-YEAR(NGAYVL)>=9;

#Qry15
SELECT * FROM HoaDon
WHERE DATE(NGAYGIAO)-DATE(NGAYHD)=5;

#Qry16
SELECT * FROM SanPham
WHERE DONGIA>=1000000;

#Cau 6
#Qry17
SELECT HO,TEN,SOHD,NGAYHD,MAKH
FROM NhanVien,HoaDon;

#Qry18
SELECT HoaDon.SOHD,HoaDon.NGAYHD,SanPham.TENSP,SanPham.DVT,SanPham.DONGIA,HoaDonCT.SOLUONG,HoaDon.MANV,NhanVien.TEN
FROM (NhanVien JOIN HoaDon ON NhanVien.MANV=HoaDon.MaNV)
    JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
        ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE NhanVien.TEN='Tram';

#Qry19
SELECT HoaDon.SOHD,HoaDon.NGAYHD,KhachHang.TENKH,NhanVien.TEN
FROM (HoaDon JOIN NhanVien ON HoaDon.MANV=NhanVien.MANV)
JOIN KhachHang ON HoaDon.MaKH = KhachHang.MAKH
WHERE QUARTER(HoaDon.NgayHD)=3 and year(NGAYHD)=2001;

#Qry20
SELECT KhachHang.TENKH, SanPham.TENSP,HoaDonCT.SOLUONG
FROM (KhachHang JOIN HoaDon ON KhachHang.MAKH=HoaDon.MAKH)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE SOLUONG > 50;

#Qry21
SELECT NhanVien.TEN,HoaDon.SOHD,SanPham.TENSP,SanPham.DVT,HoaDonCT.SOLUONG,SanPham.DONGIA
FROM (NhanVien JOIN HoaDon ON NhanVien.MANV=HoaDon.MANV)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD;

#Qry22
SELECT HoaDonCT.SOHD,HoaDon.NGAYHD,SanPham.TENSP,
       ((1-GIAMGIA)*(SOLUONG*DONGIA)) AS 'ThanhTien'
FROM (HoaDon JOIN HoaDonCT ON HoaDon.SOHD=HoaDonCT.SOHD)
JOIN SanPham  ON SanPham.MASP=HoaDonCT.MASP;

# Tinh Doanh thu nam 2001
SELECT SanPham.TENSP,SUM((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS DoanhThu
FROM (HoaDonCT JOIN HoaDon ON HoaDonCT.SOHD=HoaDon.SOHD)
JOIN SanPham ON HoaDonCT.MASP=SanPham.MASP
WHERE YEAR(HoaDon.NGAYHD)=2001
GROUP BY SanPham.TENSP;

#Qry 23
SELECT KhachHang.TenKH,HoaDon.SOHD,HoaDon.NGAYHD,HoaDonCT.SOLUONG,SanPham.DONGIA,SanPham.TENSP,
       ((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS ThanhTien
FROM (KhachHang JOIN HoaDon ON KhachHang.MAKH=HoaDon.MAKH)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE 'ThanhTien' < 2000000 AND TENSP LIKE '%Tu lanh%';

#Qry 24
SELECT KhachHang.TENKH,HoaDon.SOHD,HoaDon.NGAYHD,HoaDonCT.SOLUONG,SanPham.DONGIA,SanPham.TENSP,
       ((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS ThanhTien
FROM (KhachHang JOIN HoaDon ON KhachHang.MAKH=HoaDon.MAKH)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD;

#Qry 25
SELECT SanPham.TENSP,NhanVien.MABP
FROM (NhanVien JOIN HoaDon on NhanVien.MANV=HoaDon.MANV)
JOIN (SanPham JOIN HoaDonCT on SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE NhanVien.MABP='PKD';

#Qry 26
SELECT KhachHang.TENKH,SanPham.TENSP,HoaDonCT.SOLUONG,HoaDonCT.GIAMGIA
FROM (KhachHang JOIN HoaDon ON KhachHang.MaKH = HoaDon.MAKH)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP = HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE HoaDonCT.GIAMGIA IN (5,10,25)
ORDER BY HoaDonCT.GIAMGIA ASC;

#Cau 7
#Qry 27
DECLARE @nhanVien VARCHAR(15)
    SET @nhanVien ='Phuong';
SELECT HoaDon.SOHD,HoaDon.NGAYHD,
        ((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS ValueHD
FROM (NhanVien JOIN HoaDon ON NhanVien.MANV=HoaDon.MANV)
JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE NhanVien.TEN=@nhanVien;

#Qry 28
DECLARE @tenSP VARCHAR(15)
SET @tenSP ='%Tivi%';
SELECT HoaDon.SOHD,KhachHang.TENKH,HoaDonCT.SOLUONG,SanPham.DONGIA,SanPham.TENSP,
       ((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS ValueHD
FROM (KhachHang JOIN HoaDon ON KhachHang.MAKH=HoaDon.MAKH)
         JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
              ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE TENSP LIKE @tenSP;

#Qry 29
DECLARE @T1 DATE
    SET @T1='2000-08-04';
DECLARE @T2 DATE
    SET @T2='2001-12-15'
SELECT KhachHang.TENKH,HoaDonCT.SOLUONG,SanPham.TENSP,NGAYHD
FROM (KhachHang JOIN HoaDon ON KhachHang.MAKH=HoaDon.MAKH)
         JOIN (SanPham JOIN HoaDonCT ON SanPham.MASP=HoaDonCT.MASP)
              ON HoaDon.SOHD=HoaDonCT.SOHD
WHERE NGAYHD IN
(SELECT CASE
    WHEN @T1 <=NGAYHD then NGAYHD else''end
 FROM HoaDon)
AND NGAYHD IN
(select case
    when @T2 >=NGAYHD then NgayHD else''end
 from HoaDon);

#Qry 30
DECLARE @tenBP varchar(3)
    SET @tenBP='CH1';
SELECT SUM((1-GIAMGIA/100)*(SOLUONG*DONGIA)) as 'Doanh so',NhanVien.MABP
from (NhanVien join HoaDon on NhanVien.MANV=HoaDon.MANV)
join (SanPham join HoaDonCT on SanPham.MASP=HoaDonCT.MASP)
on HoaDon.SOHD=HoaDOnCT.SOHD
where MABP=@tenBP
group by MABP;

#Qry 31
DECLARE @namHD char(4)
    SET @namHD='2000';
select HoaDon.SOHD,SUM((1-GIAMGIA/100)*(SOLUONG*DONGIA)) as 'Doanh so',YEAR(HoaDon.NGAYHD)
from (HoaDon join HoaDonCT on HoaDon.SOHD=HoaDonCT.SOHD)
join SanPham on HoaDonCT.MASP=SanPham.MASP
where YEAR(HoaDon.NGAYHD)=@namHD
group by YEAR(HoaDon.NGAYHD),HoaDon.SOHD

#Qry 32 Nhan Vien khong ban duoc san pham nao
select NhanVien.HO,NhanVien.TEN,MANV
from NhanVien
where NhanVien.MANV not in
(select MANV from HoaDon);

#Qry 33 San pham chua ban duoc
select SanPham.MASP,SanPham.TENSP from SanPham
where SanPham.MASP not in
(select MASP from HoaDonCT);

#Cau 8
#Qry 34
select HoaDon.SOHD,HoaDon.NGAYHD,KhachHang.TENKH,NhanVien.HO,NhanVien.TEN,
       SUM((1-GIAMGIA/100)*(SOLUONG*DONGIA)) AS 'Tri gia hoa don'
from (NhanVien join HoaDon on NhanVien.MaNV = HoaDon.MANV)
join (SanPham join HoaDonCT on SanPham.MASP=HoaDonCT.MASP)
Join KhachHang on KhachHang.MAKH=HoaDon.MAKH
where month(NGAYHD)='08' and year(NGAYHD)='2000'
group by HoaDon.SOHD;

#Qry 35
select KhachHang.TENKH,SanPham.TENSP,HoaDonCT.SOLUONG
from (KhachHang join HoaDon on KhachHang.MaKH = HoaDon.MAKH)
join (SanPham join HoaDonCT on SanPham.MASP = HoaDonCT.MASP)
on HoaDon.SOHD=HoaDonCT.SOHD;

#Qry 36
select top 5 HoaDonCT.SOLUONG,SanPham.TENSP
from SanPham join HoaDonCT  on SanPham.MASP = HoaDonCT.MASP
order by HoaDonCT.SOLUONG DESC;

#Qry 37
select sum((1-GIAMGIA/100)*(SOLUONG*DONGIA)) as 'Doanh so',year(NGAYHD)
from (HoaDonCT join SanPham on HoaDonCT.MASP = SanPham.MASP)
join HoaDon on HoaDonCT.SOHD=HoaDon.SOHD
group by year(NGAYHD);

#Qry 38
select top 3

#Qry 39
select NhanVien.MABP,NhanVien.PHAI,BoPhan.TENBP
sum(1) as 'Tong so nhan vien'
sum(case when NhanVien.PHAI='M' then 1 else null end) as 'So nhan vien nam'
sum(case when NhanVien.PHAI='F'then 1 else null end) as 'So nhan vien nu'
from NhanVien join BoPhan  on NhanVien.MABP = BoPhan.MABP
group by BoPhan.TENBP;

#Qry 40
select concat_ws(' ',NhanVien.HO,NhanVien.TEN) as HotenNhanvien,
       SUM((1-GIAMGIA/100)*(SOLUONG*DONGIA)) as Doanhso
sum(case when )
from (NhanVien join HoaDon on NhanVien.MaNV = HoaDon.MANV)
join (SanPham join HoaDonCT on SanPham.MASP = HoaDonCT.MASP)
on HoaDon.SOHD=HoaDonCT.SOHD
group by HotenNhanvien,HoaDon.SOHD;














