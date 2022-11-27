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
SELECT SOHD,NGAYHD,TENSP,DVT,DONGIA,SOLUONG,MANV,TEN
FROM HoaDon,NhanVien,SanPham,HoaDonCT
WHERE TEN='Tram';






