USE Northwind

--Select Sorgular�nda (Where) �art� Yazmak

SELECT * FROM Personeller

--Personeller tablosunda �ehri London olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London'

--Personeller tablosunda ba�l� .al��t��� ki�i say�s� 5 ten k���k olanlar� listeleyelim.
SELECT * FROM Personeller WHERE BagliCalistigiKisi < 5

--Personeller tablosunda �ehri London ve �lkesi UK olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' AND Ulke = 'UK'

--Personeller tablosunda UnvanEki Mr. olan veya �ehri Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'Seattle' OR UnvanEki = 'Mr.'

--Personeller tablosunda Adi Robert. olan ve King Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Adi = 'Robert' AND SoyAdi = 'King'

--PersonelID'si 5'ten k���k olanlar� getir
SELECT * FROM Personeller WHERE PersonelID = 5

--PersonelID'si 5'ten b�y�k ve e�it olan t�m personelleri getir
SELECT * FROM Personeller WHERE PersonelID >= 5

--1993 y�l�nda i�e ba�layanlar� getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) = 1993

--1992 y�l�ndan sonra i�e ba�layanlar� getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) > 1992

--Do�um tarihi ay�n 29'u olmayanlar� ba�layanlar� getir
SELECT * FROM Personeller WHERE Day(DogumTarihi) <> 29

--Do�um y�l� 1950-1960 y�llar� aras�ndakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) > 1950 AND YEAR(DogumTarihi) < 1960

--Personeller tablosunda ya�ad��� �ehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' OR Sehir = 'Tacoma' OR Sehir = 'Kirkland'

---------------------------------------WHERE FINISH---------------------------------------------

--BETWEEN 

--Do�um y�l� 1950-1960 y�llar� (dahil) aras�ndakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) BETWEEN  1950 AND 1960

--IN 
--Personeller tablosunda ya�ad��� �ehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir IN('London','Tacoma','Kirkland')


----------------------------------------BETWEEN AND IN FINISH---------------------------------------


--LIKE 

--% (NOT IMPORTANT GENERAL) OPERATOR

--�sminin ba� harfi j olan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'j%'

--�sminin son harfi y ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%y'

--�sminin  son 3 harfi ert ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%ert'

--�sminin  ba� harfi r olan ve son harfi t ile biten personeller, getir
--Gereksiz Kullan�m
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%' AND Adi LIKE '%t'
--Daha iyi ��z�m
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%t'


--�sminin i�inde an ge�en personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--�sminin ba� harfi n ve i�inde an ge�en personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'n%an%'

--�sminin i�inde an ge�en personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--�sminin i�inde an ge�en personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'


-- _(NOT IMPORTANT SPECIAL) OPERATOR

--�smini ilk harfi a ikinci harfi farketmez ve ���nc� harfi d olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'a_d%'

--�smini ilk harfi m ikinci-���nc�-d�rd�nc� harfi farketmez be�inci harfi a olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'm___a%'

--[] (or) OPERATOR
--�smini ilk harfi n ya da m ya da r olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[nmr]%'

--�sminin i�erisinde a ya da i olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '%[ai]%'

--[*-*] (Alfabetik Aras�nda) OPERATOR

--�sminin ba� harfi a ile k aras�nda alfabetik s�raya g�re herhangi bir harf olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[a-k]%'

-- [^*] (NOT) OPERATOR

--�sminin ba� harfi a olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^a]%'


--�sminin ba� harfi an olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^an]%'

--Excape(Ka���) Karakterleri
/*
  Like sorgular�nda kulland���m�z %, _, [] gibi �zel ifadeler e�er ki verilerimiz i�erisinde ge�iyorsa 
  sorgulama esnas�nda hata ile kar��la�abiliriz.B�yle durumlarda bu ifadelerin �zel ifade olup 
  olmad���n� escape ila belirleyebiliriz
*/

--Two Method

--[] Operat�r� ile
--Escape Komutu ile

/*
  Alt �izgi ile ba�layan isimler getirilmek istendi�inde sisteme bunu belirtmeliyiz 
  a�a��daki kullan�m yannl�� kullan�md�r.(Sistem t�m kay�tlar� d�nd�r�r) 
*/
--Select * from Personeller WHERE Adi LIKE '_%'

--Alt �izgi ile ba�layan isimleri getir
--Do�ru Kullan�mlar 
Select * from Personeller WHERE Adi LIKE '[_]%'
Select * from Personeller WHERE Adi LIKE '�_%' Escape '�'


-----------------------LIKE OPERATOR AND ESCAPE COMMAND FINISH----------------------------------

--Aggregate Function

--AVG
Select AVG(PersonelID) AS AVERAGE from Personeller 

--MAX
Select MAX(PersonelID) AS MAXIMUM from Personeller 

--MIN
Select MIN(PersonelID) AS MINIMUM from Personeller 

--COUNT
Select COUNT(*) AS TOTAL from Personeller 
Select COUNT(Adi) AS TOTAL from Personeller 

--SUM
Select SUM(PersonelID) AS MINIMUM from Personeller 


-----------------------------------AGGREGATE FUNCTION FINISH----------------------------

--STRING FUNCTION

--LEFT : Soldan(ba�tan) belirtilen karakter say�s�n� getirir
SELECT LEFT(Adi,2) FROM Personeller

--RIGHT : Sa�dan(sondan) belirtilen karakter say�s�n� getirir
SELECT RIGHT(Adi,3) FROM Personeller

--UPPER : B�y�k harfe �evirir
SELECT UPPER(Adi) FROM Personeller

--LOWER : K���k harfe �evirir
SELECT LOWER(Adi) FROM Personeller

--LEN : String uzunlu�unu verir
SELECT LEN(Adi) as LENGTH From Personeller

--SUBSTRING : Belirtilen indexten itibaren belirli say�da karakter getirir
SELECT SUBSTRING(Adi,3,2) FROM Personeller

--LTRIM : Soldan bo�luklar� k�rar
SELECT '          �zkan'
SELECT LTRIM('          �zkan')

--RTRIM : Sa�dan bo�luklar� k�rar
SELECT '�zkan             '
SELECT RTRIM('�zkan          ')

--REVERSE : Tersine �evirir
SELECT REVERSE(Adi) FROM Personeller

--REPLACE : Belirtilen ifadeyi , belirtilen ifade ile de�i�tir
SELECT REPLACE('MY NAME IS �zkan','�zkan','Ekrem')

--STRING_SPLIT : Birinci parametrede verilen metni ikinci parametrede verilen karaktere g�re ayr��t�r�r. 
--Geriye value ad�nda kolon bar�nd�ran ve sat�rlar�nda karaktere g�re ayr��t�rma sonucunu tutan bir tablo d�ner.
SELECT * FROM  STRING_SPLIT('Bu metin bo�luk karakterine g�re ayr��t�r�lacak',' ')

--PATINDEX : �lk parametrede ald��� paterni ikinci parametrede verilen strin i�erisinde arar 
--ve buldu�u ilk indeki d�nd�r�r. Bulamazsa 0 d�ner.
SELECT PATINDEX('%R_A%', 'SA�T ORHAN')

--CHARINDEX : Belirtilen karakterin veri i�inde index numaras�n� verir
SELECT CHARINDEX('r',Adi) FROM Personeller
SELECT MusteriAdi, CHARINDEX(' ',MusteriAdi) AS INDEX_NO FROM Musteriler

--CHARINDEX EXAMPLE
--M��teriler tablosunun MusteriAdi kolonundan sadece adlar� �ekelim
Select MusteriAdi from Musteriler
Select SUBSTRING(MusteriAdi,0,CHARINDEX(' ',MusteriAdi)) from Musteriler
--M��teriler tablosunun MusteriAdi kolonundan sadece soyadlar� �ekelim
Select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi),LEN(MusteriAdi)-CHARINDEX(' ',MusteriAdi)-1) AS SOYAD from Musteriler


----------------------------------------------------STRING FUNCTION FINISH----------------------------------------------------- 

--NUMERICAL TRANSACTIONS(SAYISAL ISLEMLER)

SELECT 3+2
SELECT 3*3
SELECT 4/2
SELECT 9-7

--PI : Pi say�s�n� verir
SELECT PI()

--SIN : Sin�s Al�r
SELECT SIN(PI())

--POWER : �s al�r
SELECT POWER(2,3)

--ABS: Mutlak al�r
SELECT ABS(-12)

--RAND : 0-1 aras� Random say� atar
SELECT RAND()

--FLOOR : Yuvarlama yapar
--0-100 aras� say� �retir
SELECT FLOOR(RAND()*100)


-----------------------------------NUMERICAL TRANSACTIONS-----------------------------------


--DATE FUNCTION 

--GETDATE : Bu g�n�n tarihini verir
SELECT GETDATE()

--DATEADD : Verilen tarihe g�n ay y�l ekler
SELECT DATEADD(DAY,999,GETDATE())
SELECT DATEADD(MONTH,999,GETDATE())
SELECT DATEADD(YEAR,999,GETDATE())

--DATEDIFF : �ki tarih aras� fark� hesaplar 
SELECT DATEDIFF(DAY,'09-07-1999',GETDATE())
SELECT DATEDIFF(MONTH,'09-07-1999',GETDATE())
SELECT DATEDIFF(YEAR,'09-07-1999',GETDATE())

--DATEPART : Verilen tarihin haftan�n,ay�n yahut y�l�n ka��nc� g�n� oldu�unu hesaplar
SELECT DATEPART(DAY,GETDATE())
SELECT DATEPART(MONTH,GETDATE())
SELECT DATEPART(DW,GETDATE())


-----------------------------------DATE FUNCTION FINISH-------------------------------


--TOP COMMAND
SELECT * FROM Personeller
SELECT Top 3 * FROM Personeller

-------------------------------------TOP COMMAND FINISH----------------------------------

--DISTINCT COMMAND
SELECT Sehir FROM Personeller
SELECT DISTINCT Sehir FROM Personeller

-----------------------------------DISTINCT COMMAND FINISH-------------------------------

--GROUP BY
SELECT * FROM Urunler

--Her bir kategoriden ka� tane var s�rayla getir
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID

--Her bir kategoriden tedarik�iye g�re ka� tane var s�rayla getir
SELECT KategoriID,TedarikciID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID,TedarikciID

--Her bir personel toplam ne kadar nakliyet �cretine sahip ve toplam ka� tane sat��� var
SELECT PersonelID,SUM(NakliyeUcreti) AS TOTAL_GAIN,COUNT(*) AS COUNT_TOTAL 
FROM Satislar 
GROUP BY PersonelID

--GROUP BY -> WHERE 
SELECT * FROM Urunler

--Her bir kategoriden ka� tane var Id si 5 den b�y�kleri s�rayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 


--GROUP BY , HAVING

SELECT * FROM Urunler

--Her bir kategoriden ka� tane var Id si 5 den b�y�kleri s�rayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 
HAVING COUNT(*) > 6

-----------------------------------------GROUP BY FINISH------------------------------------------

--Merge Tables Side by Side(Tablolar� Yan yana birle�tirme)
--�lkel y�ntem(NOT JOIN)
SELECT * FROM Personeller
SELECT * FROM Satislar
SELECT * FROM Personeller,Satislar
SELECT  P.PersonelID, S.MusteriID FROM Personeller P,Satislar S WHERE P.PersonelID = S.PersonelID


------------------------------------Merge Tables Side by Side Finish----------------------------------

--INNER JOIN

--Genel Mant�k
--SELECT * FROM Tablo1 Inner Jo�n Tablo2 on Tablo1.�li�kiliKolon=Tablo2.�li�kiliKolon

--Tablolara Alias tan�mlanabilir
--SELECT * FROM Tablo1 t1 Inner Jo�n Tablo2 t2 on t1.�li�kiliKolon=t2.�li�kiliKolon

--�ki tabloyu ili�kisel birle�tirme

--Hangi personel hangi sat��alr� yapm��t�r(Personeller,Satislar)
SELECT * FROM Personeller P INNER JOIN Satislar S ON P.PersonelID = S.PersonelID


--Hangi �r�n hangi kategory de
SELECT U.UrunAdi,K.KategoriAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID

--Where Kullan�m�
--Beverages kategorisindeki �r�nlerim (Urunler,Kategory)
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages'

--Beverages kategorisindeki �r�nlerimin say�s� ka�t�r (Urunler,Kategory)
SELECT COUNT(U.UrunAdi) 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages' 

--Seafood kategorisindeki �r�nlerin listesi
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID
WHERE K.KategoriAdi = 'Seafood'

--Hangi sat��� hangi eleman yapm��(Satislar,Personeller)
SELECT S.SatisID,P.Adi + ' ' + P.SoyAdi AS Personel 
FROM Satislar S INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 

--Faks numaras� "null" olmayan tedarik�ilerin al�nm�� �r�nler nelerdir(Urunler,Tedarik�iler)
SELECT T.Faks,U.UrunAdi 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID = T.TedarikciID 
WHERE T.Faks IS NOT NULL --<> 'NULL'

--�kiden fazla tabloyu ili�kisel birle�tirme

--1997 y�l�ndan sonra Nancy nin sat�� yapt��� firma isimleri(Musteriler,Satislar,Personeller)
SELECT P.Adi,M.SirketAdi 
FROM Musteriler M INNER JOIN Satislar S 
ON M.MusteriID = S.MusteriID INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 
WHERE P.Adi = 'Nancy' AND YEAR(S.SatisTarihi) > 1997

--Limited olan tedarik�ilerden al�nm�� seafood kategorisindeki �r�nlerimin toplam sat�� tutar�(Urunler,Tedarik�iler,Kategoriler)
SELECT SUM(U.HedefStokDuzeyi*U.BirimFiyati) AS TOTAL 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID=T.TedarikciID INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Seafood' AND T.SirketAdi LIKE '%Ltd.%'

--Ayn� tabloyu ili�kisel olarak birle�tirme

--Personellerimin ba�l� olarak �al��t��� ki�ileri listele? (Personeller,Personeller)
SELECT P1.Adi,P2.Adi AS BGK 
FROM Personeller P1 INNER JOIN Personeller P2 
ON P1.BagliCalistigiKisi=P2.PersonelID

--INNER JOIN DE GROUP BY

/*
  Hangi personelin(ad� ve soyad� birlikte), toplam ka� adetlik sat�� yapm��.Sat�� adedi 100 den fazla olanlar 
  ve personelin ad�n�n ba� harfi M olan kay�tlar gelsin(Personeller,Satislar)
*/

SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID
WHERE P.Adi LIKE 'M%'
GROUP BY P.Adi + ' ' + P.SoyAdi 
HAVING COUNT(S.SatisID) > 100 

--Seafood Kategorisindeki �r�nlerin say�s�(Urunler,Kategoriler)
SELECT K.KategoriAdi,COUNT(U.KategoriID) AS TOTAL 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi='Seafood'
GROUP BY K.KategoriAdi

--Hangi personelim toplam ka� adet sat�� yapm��(Personeller,Satislar)
SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_ADET 
FROM Personeller P INNER JOIN Satislar S
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi 

--En �ok Sat�� Yapan personelim
SELECT Top 1 P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi
ORDER BY COUNT(S.SatisID) DESC

/*
  Ad�nda a harfi olan personellerin sat�� id si 10500 den b�y�k olan sat��lar�n toplam tutar�n� (miktar*birimfiyat) 
  en y�ksek toplam tutardan en al�ak tutara s�ralanacak �ekilde 
  ve bu sat��lar�n hangi tarihte ger�ekle�ti�ini listele(Personeller,SatisDetaylar�,Satislar)
*/

SELECT P.Adi + ' ' + P.SoyAdi AS AD,SUM(SD.Miktar*SD.BirimFiyati) AS TOTAL_SALE,S.SatisTarihi
FROM Personeller P INNER JOIN Satislar S
ON S.PersonelID=P.PersonelID INNER JOIN SatisDetaylari SD 
ON SD.SatisID = S.SatisID
WHERE P.Adi LIKE '%a%' AND S.SatisID > 10500
GROUP BY P.Adi + ' ' + P.SoyAdi,S.SatisTarihi 
ORDER BY SUM(SD.Miktar*SD.BirimFiyati) DESC


--------------------------------------------INNER JOIN FINISH---------------------------------------------------------

--OUTER JOIN

--Inner join'de e�le�en veriler getiriliyordu. Outer join'de ise e�le�meyenler getirilir.

--LEFT JOIN

--Join ifadesinin solundaki tablodan t�m kay�tlar� getirir.Sa��ndaki tablodan e�le�enleri yan yana e�le�meyenleri null olarak getirir
USE OrnekVT
SELECT * FROM Oyuncular O LEFT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O LEFT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT JOIN Oyuncular O ON O.FilmId=F.FilmId

--RIGHT JOIN

--Join ifadesinin sa��ndaki tablodan t�m kay�tlar� getirir.Solundaki tablodan e�le�enleri yan yana e�le�meyenleri null olarak getirir
SELECT * FROM Oyuncular O RIGHT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O RIGHT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT JOIN Oyuncular O ON O.FilmId=F.FilmId

--FULL JOIN

--Joinin iki taraf�ndaki tablolardan e�le�en e�le�meyen hepsini getirir
SELECT * FROM Oyuncular O FULL OUTER JOIN Filmler F ON O.FilmId=F.FilmId


--veya
SELECT * FROM Oyuncular O FULL JOIN Filmler F ON O.FilmId=F.FilmId


--------------------------------------------OUTER JOIN FINISH---------------------------------------------------------

--CROSS JOIN
USE Northwind
SELECT COUNT(*) FROM Personeller
SELECT COUNT(*) FROM Bolge

SELECT P.Adi,B.BolgeID FROM Personeller P CROSS JOIN Bolge B

--------------------------------------------CROSS JOIN FINISH---------------------------------------------------------

-- DML (Data Manipulation Language)

--SELECT,INSERT,UPDATE,DELETE
-- SELECT...
-- INSERT...
-- UPDATE...
-- DELETE...

--SELECT 
SELECT * FROM Personeller

--INSERT
INSERT Personeller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��')

--[Dikkat edilmesi gerekenler!!!]
--INTO komudu ile yaz�l�r

INSERT INTO Personeller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��')
--Kolonun kabul etti�i veri tipi ve karakter uzunlu�unda kay�t yap�labilir
--Not Null olan kolonlara bo� b�rak�lamayacaklar�ndan dolay� mutlaka de�er g�nderilmelidir

INSERT INTO Personeller(Adi,SoyAdi,Unvan,UnvanEki) VALUES ('','','a','b')
--Otomatik artan kolonlara de�er g�nderilmez
--Tablodaki se�ilen yahut b�t�n kolonlara g�nderilece�ini belirtip , g�ndermezsek hata verir

--Hatal� Yaz�m
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem')


--[Pratik Kullan�m]
INSERT Personeller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��')
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem','Parlakk�l��')
INSERT Personeller(Adi,SoyAdi) VALUES ('Cavit','Parlakk�l��')

INSERT Personeller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��'),
									  ('Ekrem','Parlakk�l��'),
									  ('Cavit','Parlakk�l��')


--[INSERT Komutu ile Select sorgusu sonucunu farkl� tabloya kaydetme]
INSERT OrnekPersoneller SELECT P.Adi,P.SoyAdi FROM Personeller P
SELECT * FROM OrnekPersoneller

--[Select sorgusu sonucunu gelen verileri tablo olu�turarak kaydetme]
SELECT P.Adi,P.SoyAdi,p.Ulke INTO OrnekPersoneller2 FROM Personeller P
SELECT * FROM OrnekPersoneller2

--Bu y�ntemle primary key foreign key olu�turulamaz sonradan eklenmek isterse eklenebilir manuel olarak.


--UPDATE

--[D�KKAT UPDATE komutu tehlikelidir genellikle where �art� ile kullan�l�r]
UPDATE OrnekPersoneller SET Adi='Mehmet'

--[Where �art� ile yazmak]
UPDATE OrnekPersoneller SET Adi='Mehmet' WHERE Adi='Nancy'

--[Update Sorgusunda Join yap�lar� kullan�larak Birden fazla Tabloda g�ncelleme yapmak]
UPDATE Urunler SET UrunAdi = K.KategoriAdi FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID

--[UPDATE Sorgusunda Subquery ile g�ncelleme yapmak]
UPDATE Urunler SET UrunAdi = (SELECT Adi FROM Personeller WHERE PersonelID = 3)

--[UPDATE Sorgusunda Top Keyword� ile G�ncelleme yapmak]
UPDATE Top(30) Urunler SET UrunAdi = 'x'

--DELETE

DELETE FROM Urunler

--[D�KKAT DELETE komutu tehlikelidir genellikle where �art� ile kullan�l�r]

DELETE FROM Urunler WHERE KategoriID = 3
--Delete sorgusuyla tablo i�erisindeki t�m verileri silmeniz identity kolonunu s�f�rlamayacakt�r.
--Silme i�leminden sonra ilk eklenen veride kal�nd��� yerden id de�eri verecektir


------------------------------------------- DML FINISH-----------------------------------------------------



--UNION | UNION ALL

--UNION
--Birden fazla select sorgusunun sonucunu tek seferde alt alta g�stermemizi sa�lar 

SELECT P.Adi,P.SoyAdi FROM Personeller P
SELECT M.MusteriAdi,M.MusteriUnvani FROM Musteriler M


SELECT P.Adi,P.SoyAdi FROM Personeller P
UNION
SELECT M.MusteriAdi,M.MusteriUnvani FROM Musteriler M

--2 DEN FAZLA
SELECT P.Adi,P.SoyAdi FROM Personeller P
UNION
SELECT M.MusteriAdi,M.MusteriUnvani FROM Musteriler M
UNION
SELECT S.SevkAdi,S.SevkAdresi FROM Satislar S

--Joinler tablolar� yan yana , Union alt alta birle�tirir.Joinlerde belirli (ili�kisel) bir kolon �zerinden birle�tirme yap�l�rken,
--Union da b�yle bir durum yoktur

--Dikkat etmemiz gerekenler
--Union sorgusunun sonucunda olu�an tablolnun kolon isimleri,en �stteki sorgunun kolon isimlerinden olu�ur
--En �stteki sorgudan ka� kolon �ekilmi�se alttaki sorgudan da o kadar kolon �ekilmek zorundad�r
--En �stteki sorgudan �ekilen kolonlar�n tipleriyle,alttaki sorgudan �ekilen kolonlar�n tipleri ayn� olmak zorundad�r
--Union tekrarl� kay�tlar� getirmez

/*
  Union'da Kullan�lan tablolara kolon eklenebilir, Dikkat etmemiz gereken nokta , yukar�daki kurallar �er�evesinde a�a��yad yukar�yada
  ayn� say�da kolon eklenmesi gerekmektedir
*/

SELECT P.Adi,P.SoyAdi,'Personel' AS POSITION FROM Personeller P
UNION
SELECT M.MusteriAdi,M.MusteriUnvani,'Musteri' FROM Musteriler M

--UNION ALL

--UNION Tekrarl� kay�tlar� getirmezken UNION ALL getirir


SELECT P.Adi,P.SoyAdi FROM Personeller P
UNION ALL
SELECT P.Adi,P.SoyAdi FROM Personeller P

----------------------------------UNION AND UNION ALL FINISH-------------------------------------

--WITH ROLLUP

--GROUP BY ile gruplanm�� veri k�mesinde ara toplam al�nmas�n� sa�lar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH ROLLUP

--[Having �art�yla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP HAVING SUM(Miktar) > 100

----------------------------------------WITH ROLLUP FINISH----------------------------------------

--WITH CUBE
--GROUP BY ile gruplanm�� veri k�mesinde teker teker toplam al�nmas�n� sa�lar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH CUBE

--[Having �art�yla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE HAVING SUM(Miktar) > 100

----------------------------------------WITH CUBE FINISH----------------------------------------

--CASE - WHEN - ELSE -END

----Personellerin isim ve soyisimlerinin yan�nda; UnvanEki 'Mr.' ise 'Erkek','Mrs.' ise 'Kad�n' yazs�n

SELECT Adi,SoyAdi,UnvanEki FROM Personeller

SELECT Adi,SoyAdi,
CASE
WHEN UnvanEki = 'Mrs.' OR UnvanEki = 'Ms.' THEN 'Kad�n'
WHEN UnvanEki = 'Mr.' THEN 'Erkek'
ELSE UnvanEki 
END
FROM Personeller

/*
  E�er �r�n�n birim fiyat� 0 - 50 aras� ise '�in Mal�', 50 - 100 aras� ise 'Ucuz', 
  100 - 200 aras� ise 'Normal' , 200'den b�y�k ise 'Pahal�' yazs�n 
*/

SELECT UrunID,BirimFiyati FROM Urunler

SELECT UrunID,
CASE
WHEN BirimFiyati BETWEEN 0 AND 50 THEN '�in Mal�' 
WHEN BirimFiyati BETWEEN 50 AND 100 THEN 'Ucuz'
WHEN BirimFiyati BETWEEN 100 AND 200 THEN 'Normal'
WHEN BirimFiyati > 200 THEN 'Pahal�'
ELSE 
'Belirsiz'
END AS FIYAT
FROM Urunler

-------------------------------- CASE - WHEN - ELSE - END FINISH ---------------------------------


--WITH TIES 

SELECT * FROM SatisDetaylari
SELECT top 6 WITH TIES * FROM SatisDetaylari ORDER BY SatisID


----------------------------------------- WITH TIES FINISH-----------------------------------------------

--WITH

WITH PersonelSatis(id,adi,soyadi,satisId)
AS
(
 SELECT P.PersonelID,P.Adi,P.SoyAdi,S.SatisID 
 FROM Personeller P INNER JOIN Satislar S 
 ON P.PersonelID=S.PersonelID
)
 SELECT * FROM PersonelSatis PS INNER JOIN SatisDetaylari SD ON PS.satisId=SD.SatisID

 
----------------------------------------- WITH FINISH-----------------------------------------------

--SUBQUERY

 SELECT S.SatisID,S.SatisTarihi
 FROM Personeller P INNER JOIN Satislar S 
 ON P.PersonelID=S.PersonelID
 WHERE P.Adi = 'Nancy'
 
 ----------------------

 --Ad� nancy olan personelin sat��lar�n� tarihleriyle birlikte getir
 SELECT SatisID,SatisTarihi 
 FROM Satislar 
 WHERE PersonelID = (SELECT PersonelID FROM Personeller WHERE Adi = 'Nancy')

 --Unvan eki Dr olan Personellerin ismini getir
 SELECT Adi FROM Personeller WHERE Adi = (SELECT Adi FROM Personeller WHERE UnvanEki = 'Dr.')

 --[Dikkat!!!]
 --Sub olan sorgunun d�n�� de�eri bir olmal�d�r birden fazla kay�t getiriyorsa alt sorgu olamaz


 --------------------------------------------SUBQUERY FINISH-----------------------------------------------


 --BULK INSERT

 BULK INSERT Kisiler
 FROM 'D:\ides\Kisiler.txt'
 WITH
 (
	FieldTerminator = '\t',
	RowTerminator = '\n'
 )

 SELECT * FROM Kisiler

 ------------------------------------- BULK INSERT FINISH ---------------------------------


 --TRUNCATE

 --Identity yi 0 lar

 --Kisiler Tablosu temizlenir , id 0 lan�r ve tablonun iskeleti silinmez
 TRUNCATE TABLE Kisiler

------------------------------------- TRUNCATE TABLE FINISH ---------------------------------


-- @@IDENTITY 
--En son insert yap�lan tablodaki verinin id sini yazd�r�r
INSERT Kategoriler(KategoriAdi,Tanimi) VALUES('X','X Kategorisi')
SELECT @@IDENTITY 

------------------------------------- @@IDENTITY FINISH ---------------------------------

--@@ROWCOUNT 
--Sorgudan ka� sat�r etkilenmi�tir onun bilgisini verir
DELETE FROM Personeller WHERE PersonelID = 10000000
SELECT @@ROWCOUNT 

------------------------------------- @@ROWCOUNT  FINISH ---------------------------------

--Identity kolonuna m�dahale etme
DBCC CHECKIDENT(Personeller, RESEED, 1)

-------------------------------------------------------------------------------------------

--NULL CONTROL 

--CASE - WHEN - ELSE -END WITH NULL CONTROL

SELECT MusteriID,Bolge FROM Musteriler

SELECT MusteriAdi,
CASE
    WHEN Bolge IS NULL THEN 'Bolge bilinmiyor'
	ELSE Bolge
END
FROM Musteriler

--Coalesce ile null control
SELECT MusteriAdi, COALESCE(Bolge,'Bolge Bilinmiyor') FROM Musteriler

--ISNULL ile null control
SELECT MusteriAdi, ISNULL(Bolge,'Bolge Bilinmiyor') FROM Musteriler

--NULLIF Fonksiyonu ile null kontrol�
--Fonksiyona verilen kolon, ikinci parametre verilen de�ere e�itse o kolonu Null olarak getirir

SELECT NULLIF(0,0)
SELECT NULLIF(0,2)

SELECT HedefStokDuzeyi FROM Urunler
SELECT AVG(HedefStokDuzeyi) FROM Urunler

--Hedef stok d�zeyi 0 olmayan �r�nlerin ortalamas� nedir ? 
SELECT AVG(HedefStokDuzeyi) FROM Urunler WHERE HedefStokDuzeyi <> 0
SELECT AVG(NULLIF(HedefStokDuzeyi,0)) FROM Urunler

--------------------------------------------------NULLIF FINISH------------------------------------------------


--T-SQL ile VT deki tablolar� listeleme

SELECT * FROM sys.tables
-- ya da
SELECT * FROM sysobjects WHERE xtype = 'U'


--------------------------------------------------------------------------------------------------------------

--T-SQL ile PK olup olmad���n� kontrol etme

SELECT OBJECTPROPERTY(OBJECT_ID('Personeller'),'TableHasPrimaryKey')

--------------------------------------------------------------------------------------------------------------

-- DDL (Data Definition Language)
/*
  T-SQL'de VT nesnelerini yaratmam�z� sa�layan ve bu nesnelerin �zerinde de�i�iklik yapmam�z�
  ve silmemizi sa�layan yap�lar bu ba�l�k alt�nda simgelenmektedir
*/

--CREATE , ALTER, DROP

-- ===CREATE=== 
--VT nesnesi olu�turmam�z� sa�lar. (Database,Table,View,Trigger,StoredProc v.s)

--CREATE ile VT olu�turma

CREATE DATABASE OrnekVT2

CREATE DATABASE OrnekVT2
ON
(
	NAME = 'GG',
	FILENAME = 'D:\ides\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\GG.mdf',
	SIZE = 5,
	FILEGROWTH = 3
)

--NAME : Olu�turulacak VT nin fiziksel ismini belirliyoruz.
--FILENAME : Olu�turulacak VT dosyas�n�n fiziksel dizinini belirtiyoruz.
--SIZE : VT nin ba�lang�� boyutunu mb cinsinden ayarl�yoruz.
--FILEGROWTH : VT boyutunu,ba�lang�� boyutunu ge�ti�i durumda boyutun ne kadar artmas� gerekti�ini mb cinsinden belirtiyoruz

--LOG dosyas�n� olu�turma
CREATE DATABASE OrnekVT2
ON
(
	NAME = 'GG',
	FILENAME = 'D:\ides\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\GG.mdf',
	SIZE = 5,
	FILEGROWTH = 3
)
LOG
ON
(
	NAME = 'GG_LOG',
	FILENAME = 'D:\ides\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\GG.ldf',
	SIZE = 5,
	FILEGROWTH = 3
)

--CREATE ile tablo olu�turma
USE OrnekVT2
CREATE TABLE OrnekTablo
(
	Kolon1 INT,
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

--E�er kolon isminde bo�luk varsa k��eli parantezle yaz exp = [KOLON 1]

-- =Kolona Primary Key ve �dentity �zelli�i kazand�rma
CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

-- ===ALTER=== 
--  VT nesnesi �zerinde de�i�iklik yapmam�z� sa�lar. 

-- ===ALTER ile VT g�ncelleme

ALTER DATABASE OrnekVT2
MODIFY FILE
(
	NAME = 'GG',
	SIZE = 20
)

-- ALTER ile tabloya kolon ekleme
USE OrnekVT2
ALTER TABLE OrnekTablo
ADD Kolon4 NVARCHAR(MAX)

-- ALTER ile tablodaki kolonu g�ncelleme

ALTER TABLE OrnekTablo
ALTER COLUMN Kolon4 INT

-- ALTER ile tablodaki kolonu silme

ALTER TABLE OrnekTablo
DROP COLUMN Kolon4 

-- ALTER ile tabloya constraint ekleme

ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekConstraint DEFAULT 'Bo�' FOR Kolon2

-- ALTER ile tablodaki constrainti silme

ALTER TABLE OrnekTablo
DROP CONSTRAINT OrnekConstraint 

-- SP_RENAME ile Tablo ad� g�ncelleme
SP_RENAME 'OrnekTablo','OrnekTabloYeni'

-- SP_RENAME ile Kolon g�ncelleme
SP_RENAME 'OrnekTablo.Kolon1','Kolon12','COLUMN'

-- ===DROP===

-- VT yi silmemizi sa�lar. 

DROP TABLE OrnekTablo2
DROP DATABASE OrnekVT2


-------------------------------------------------------DDL FINISH------------------------------------------------

--CONSTRAITS (KISITLAYICILAR)

--Constraintler sayesinde tablolar �zerinde istedi�imiz �artlar ve durumlara g�re k�s�tlama yapabiliyoruz.

--1.DEFAULT CONSTRAINT
--2.CHECK CONSTRAINT
--3.PRIMARY KEY CONSTRAINT
--4.UNIQUE CONSTRAINT
--5.FOREIGN KEY CONSTRAINT


-- === DEFAULT CONSTRAINT ===
--Default Constraintler sayesinde kolona bir de�er girilmedi�i takdirde varsay�lan olarak ne girilmesi gerekti�ini belirtebiliyoruz

CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon1Constraint DEFAULT 'Bo�' FOR Kolon1

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Constraint DEFAULT -1 FOR Kolon2


-- === CHECK CONSTRAINT ===
--Bir kolona girilecek olan verinin belirli bir �arta uymas�n� zorunlu tutar.

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- D�KKAT!!!!
/*
  Check constraint olu�turulmadan �nce ilgili tabloda �arta ayk�r� de�erler varsa constraint olu�turulmayacakt�r ! ! !
  Ancak �nceki kay�tlar� g�rmezden gelip genede Check constraint uygulamak istiyorsak "With Nocheck komutu kullan�l�r
*/

ALTER TABLE OrnekTablo
WITH NOCHECK ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- === PRIMARY KEY CONSTRAINT ===
-- Primary Key Constraint ile; o kolona eklenen primary key ile, ba�ka tablolarda 
-- Foreign Key olu�turarak ili�ki kurmam�z m�mk�n olur.
-- Bunun yan�nda o kolonun ta��d��� verinin tekil olaca�� da garanti edilmi� olur. 
-- Primary Key constraint ile ayr�ca CLUSTERED index olu�turulmu�ta olur,

-- D�KKAT!!!
-- PK Constraint Kullan�lan kolon PK �zelli�ine sahip olmamal�d�r

ALTER TABLE OrnekTablo
ADD CONSTRAINT PrimaryId PRIMARY KEY (ID)

-- === UNIQUE CONSTRAINT ===
--Unique constraintlerin tek amac�,Belirtti�imiz de�erlerin tekil olmas�d�r

ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekTabloUnique UNIQUE (Kolon2)

--"Kolon2" kolonuna unique constraint verilerek tekil hale getirilmi�tir.Bundan sonra iki tane ayn� veriden kay�t yap�lamaz


-- === FOREIGN KEY CONSTRAINT===
/*
  Tablolar�n birbiri aras�nda ili�ki kurmas�n� sa�lar.Bu ili�ki neticesinde; foreign key olan kolondaki kar��l���n�n bo�a 
  d��memesi i�in primary key kolonu olan tablodan veri silinmesi, g�ncellenmesini engeller
*/

USE OrnekVT

/*
CREATE TABLE Ogrenciler
(
	OgrenciId INT PRIMARY KEY IDENTITY(1,1),
	DersId INT,
	Adi NVARCHAR(MAX),
	SoyAdi NVARCHAR(MAX)
)

CREATE TABLE Dersler
(
	DersId INT PRIMARY KEY IDENTITY(1,1),
	DersAdi NVARCHAR(MAX),
)
*/

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)

--�u durumda,delete ve update i�lemlerinden kolondaki veriler etkilenmez
--Davran���n� de�i�tirmek i�in a�a��daki komutlar kullan�l�r

-- == Cascade 
-- Ana tablodaki kay�t silindi�inde ya da g�ncelledi�inde, ili�kili kolondaki kar��l���nda otomatik olarak silinir ya da g�ncellenir 

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE CASCADE
ON UPDATE CASCADE

-- == Set Null 
-- Ana tablodaki kay�t silindi�inde ya da g�ncelledi�inde, ili�kili kolondaki kar��l���nda "Null" de�er bas�l�r

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET NULL
ON UPDATE SET NULL

-- == Set Default 
/*
   Ana tablodaki kay�t silindi�inde ya da g�ncelledi�inde, ili�kili kolondaki kar��l���nda o kolonun default de�er bas�l�r
   Bu default de�er dedi�imiz default tipte bir constrainttir.Bunu kendimiz olu�turabiliriz.
*/

ALTER TABLE Ogrenciler
ADD CONSTRAINT DefaultOgrenciler DEFAULT -1 FOR DersId

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT

--Bu ayarlar verildi�i takdirde "no action" �zelli�i ge�erlidir 

--------------------------------------------CONSTRAINT FINISH-------------------------------------------

--VARIABLES(De�i�kenler)

--DECLARE Keyw�rd� ile tan�mlan�rlar

--EXAMPLES

--DECLARE @x INT
--DECLARE @y NVARCHAR(50)
--DECLARE @z MONEY
--DECLARE @x INT,@y NVARCHAR(50),@z MONEY

DECLARE @Yas INT = 3

--SET 
DECLARE @Sayi INT
SET @Sayi = 125

DECLARE @tarih DATETIME
SET @tarih = GETDATE()


-- De�i�ken de�eri okuma

DECLARE @y INT
SET @y = 3
PRINT @y
SELECT @Y

-- Sorgu sonucu gelen verileri de�i�kenle elde etme

USE Northwind
DECLARE @Adi NVARCHAR(MAX),@SoyAdi NVARCHAR(MAX)
SELECT  @Adi=Adi,@SoyAdi=SoyAdi FROM Personeller WHERE PersonelId = 1
SELECT  @Adi,@SoyAdi

--1.Sorgu sonucu gelen sat�r say�s� 1 adet olmal�d�r
--2.Kolonlardaki verilerin tipleri ne ise o verileri temsil edecek de�i�kenlerin tipleride benzer olmal�d�r

-----------------------------------------------VARIABLES FINISH--------------------------------------------

--Batch Kavram� Go

CREATE DATABASE OrnekVT2
GO
USE OrnekVT2
CREATE TABLE OrnekTablo1
(
    ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 NVARCHAR(MAX)
)

------------------------------------------------------------------------------------------------------------

-- If Yap�s� 

-- = : E�itse
-- <> : E�it de�ilse
-- < : K���kse
-- > : B�y�kse

--Tek sat�rl�k �al��ma

DECLARE @Isim NVARCHAR(50)
SET @Isim = 'Ozkan'

IF @Isim = 'Ozkan'
   PRINT 'Evet'
ELSE
   PRINT 'Hay�r'


-- BEGIN END yap�s�(SCOPE)

DECLARE @sayi1 INT = 3
DECLARE @sayi2 INT = 5

IF @sayi1 < @sayi2
   BEGIN
		PRINT 'Evet sayi1 sayi2 den k���kt�r'
		SELECT @sayi1 [Say� 1],@sayi2 [Say� 2]
   END
ELSE
    BEGIN
		PRINT 'Hay�r sayi1 sayi2 den k���k de�ildir'
		SELECT @sayi1 [Say� 1],@sayi2 [Say� 2]
    END


--�rnek 1 
--M��teriler tablosunda Amerikal�(USA) m��teri var m�?

USE Northwind

SELECT * FROM Musteriler WHERE Ulke = 'USA'

IF @@ROWCOUNT > 0
   PRINT 'Evet'
ELSE
   PRINT 'Hay�r'

--�rnek 2
--Ad� '�zkan' SoyAd� 'Parlakk�l��'olan personel var m� ? Varsa evet var desin. Yoksa Kaydetsin.

DECLARE @Adi NVARCHAR(MAX) = '�zkan',@SoyAdi NVARCHAR(MAX) = 'Parlakk�l��'
SELECT * FROM Personeller WHERE Adi = @Adi AND SoyAdi = @SoyAdi

IF @@ROWCOUNT > 0
	PRINT 'Evet var'
ELSE
	BEGIN 
		PRINT 'Hay�r yok'
		INSERT Personeller(Adi,SoyAdi) VALUES (@Adi,@SoyAdi) 
	END



-- IF - ELSE IF - ELSE Yap�s�

DECLARE @Yas INT = 25

IF @Yas>25
	PRINT 'Ya��n�z 25 den b�y�k'
ELSE IF @Yas BETWEEN 15 AND 25
	PRINT 'Ya��n�z 15 - 20 aras�nda'
ELSE IF @Yas BETWEEN 5 AND 15
	PRINT 'Ya��n�z 5 - 15 aras�nda'
ELSE
	PRINT 'Ya��n�z 5 den k���k'


------------------------------------------------ IF FINISH ----------------------------------------------

--EXISTS FUNCTION

IF EXISTS(SELECT * FROM Personeller) 
	PRINT 'Dolu'
ELSE
	PRINT 'Bos'


-------------------------------------------- EXISTS FUNCTION FINISH ----------------------------------------

--WHILE DONGUSU

DECLARE @Sayac INT = 0

WHILE @Sayac < 100
	BEGIN
		PRINT @Sayac
	    SET @Sayac += 1 
	END
	
----------------------------------------------- WHILE FINISH --------------------------------------

--BREAK KOMUTU
USE Northwind
DECLARE @Sayac INT = 0

WHILE @Sayac < 100
	BEGIN
		PRINT @Sayac
	    SET @Sayac += 1 
		IF @Sayac % 5 = 0
			BREAK
	END
	
--CONTINUE KOMUTU

DECLARE @Sayac INT = 0

WHILE @Sayac < 100
	BEGIN
		IF @Sayac % 5 <> 0
		BEGIN
			SET @Sayac += 1 
			CONTINUE
		END
		PRINT @Sayac
		SET @Sayac += 1 
	END

------------------------------------------- BREAK AND CONTINUE FINISH ----------------------------------------

-- Ge�ici tablolar - Temporary Tables
/*
   Genellikle bir SQL Server �zerinde farkl� lokasyonlarda birden fazla ki�i �al��t��� durumlarda ya da verilerin test ama�l� ge�ici bir yerlerde
   tutulmas�, i�lenmesi amac�yla kullan�lan yap�lard�r.
*/

-- Bilinen tablo yap�s�n�n ayn�s�n� sa�larlar. Tek farklar� fiziksel olarak olu�mazlar. Sadece bellekte ge�ici olu�urlar.

-- Select, Update vs. Yap�labilir. �li�ki kurulabilir

-- Sunucu kapat�ld���nda ya da oturum sahibi oturumu kapatt���nda bellekten silinirler

-- #Bir tabloyu fiziksel olarak kopyalama

SELECT * INTO GeciciPersoneller from Personeller
-- Bu �ekildeki bir kullan�mda sadece PK ve FK constraintler olu�turulmazlar.
-- Geri kalan her �ey fiziksel olarak olu�turulur.

-- #Bir tabloyu # ifadesi ile belle�e ge�ici olarak kopyalama
SELECT * INTO #GeciciPersoneller from Personeller

SELECT * FROM #GeciciPersoneller
INSERT #GeciciPersoneller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��')
UPDATE #GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM #GeciciPersoneller  WHERE PersonelID = 11

-- Ge�ici tablo �zerinde her t�rl� i�lemi yapabiliyoruz.
-- # ile olu�turulan tablolar, o an SQL Serverda oturum a�m�� ki�inin sunucu belle�inde olu�ur.
-- Sadece oturum a�an �ah�s kullan�labilir
-- E�er oturum a�an �ah�s SQL Server dan disconnect olursa bu tablo bellekten silinir

-- #Bir tabloyu ## ifadesi ile belle�e ge�ici olarak kopyalama
SELECT * INTO ##GeciciPersoneller from Personeller

SELECT * FROM ##GeciciPersoneller
INSERT ##GeciciPersoneller(Adi,SoyAdi) VALUES ('�zkan','Parlakk�l��')
UPDATE ##GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM ##GeciciPersoneller  WHERE PersonelID = 11


-- ## ile olu�turulan tablolar, o an SQL Serverda oturum a�m�� ki�inin sunucu belle�inde olu�ur.
-- Bu tabloyu oturum a�an �ah�s ve onun SQL Server�nda d��ardan ul�an 3.�ah�slar kullanabilir
-- E�er oturum a�an �ah�s SQL Server dan disconnect olursa bu tablo bellekten silinir
-- Di�er b�t�n �zellikleri # ile olu�turulan tablolarla ayn�d�r


--------------------------------------- Temporary Tables Finish ----------------------------------------


-- Uniqueidentifier Veri tipi

-- int, varchar vs. gibi bir veri tipidir
-- Ald��� de�er, rakamlar ve harflerden olu�an �ok b�y�k bir say�d�r
-- Bundan dolay� bu kolona ayn� de�erin birden fazla gelmesi neredeyse imkans�zd�r
-- O y�zden tekil veri olu�turmak i�in kullan�l�r 

CREATE TABLE OrnekTablo
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Kolon1 NVARCHAR(MAX),
	Kolon2 NVARCHAR(MAX),
	Kolon3 uniqueidentifier
)

--NEWID

SELECT NEWID()
INSERT OrnekTablo VALUES('x','y',NEWID())


----------------------------------- Uniqueidentifier Finish -------------------------------

--VIEW

-- === Kullan�m Amac�

-- Genellikle karma��k sorgular�n tek bir sorgu �zerinden �al��t�r�labilmesidir
-- Bu ama�la raporlama i�lemlerinde kullan�labilir
/*
   Ayn� zamanda g�venlik ihtiyac� oldu�u durumlarda herhangi bir sorgunun 2. - 3. �ah�slardan
   gizlenmesi amac�ylada kullan�l�rlar
*/

-- === Genel �zellikleri ===

-- Herhangi bir sorgunun sonucu tablo olarak ele al�p, ondan sorgu �ekilebilmesini sa�larlar
-- INSERT , UPDATE ve DELETE yapabilirler. Bu i�lemleri fiziksel tabloya yans�t�rlar. ***�nemli
-- VIEW yap�lar� fiziksel olarak olu�turulan sorgulard�r
-- VIEW yap�lar� fiziksel sorgulardan daha yava� �al���rlar

-- Dikkat ! ! !
-- VT elemanlar� CREATE komutuyla olu�turuyorduk. VIEW yap�s�da bir VT yap�s� oldu�u i�in oda CREATE komutuyla olu�turulur

CREATE VIEW vw_Gotur
AS

SELECT P.Adi + ' ' + P.SoyAdi [Ad� Soyad�] , K.KategoriAdi [Kategori Ad�],COUNT(S.SatisID) [Toplam Sat��]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi

SELECT * FROM vw_Gotur
SELECT * FROM vw_Gotur WHERE [Ad� Soyad�] LIKE '%Robert%'

-- View olu�turulurken kolonlara verilen aliaslar View den sorgu �ekilirken kullan�l�r.
-- Bir yandan da view'�n kulland��� ger�ek tablolar�n kolon isimleri, view i�inde alias tan�mlanarak gizlenilmi� olur
-- View i�inde "order by" kullan�lmaz
-- "Order by" View i�inde de�il , view �al���rken sorgu esnas�nda kullan�lmal�d�r

SELECT * FROM vw_Gotur ORDER BY [Toplam Sat��] DESC

-- yok e�er illa view i�inde "order by" kullan�cam diyorsan top komutunu kullanmal�s�n


-- �ok tavsiye edilmez performans a��s�ndan

ALTER VIEW vw_Gotur
AS

SELECT TOP 100 P.Adi + ' ' + P.SoyAdi [Ad� Soyad�] , K.KategoriAdi [Kategori Ad�],COUNT(S.SatisID) [Toplam Sat��]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi 
ORDER BY [Toplam Sat��] DESC

SELECT * FROM vw_Gotur

-- INSERT , UPDATE ve DELETE yapabilirler. Bu i�lemleri fiziksel tabloya yans�t�rlar. ***�nemli

CREATE VIEW OrnekViewPersoneller
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

INSERT OrnekViewPersoneller VALUES('�zkan','Parlakk�l��','Student')
UPDATE OrnekViewPersoneller SET Adi = 'Ekrem' WHERE Adi = '�zkan'
DELETE FROM OrnekViewPersoneller WHERE Adi = '�zkan'


-- == WITH ENCRYPTION  ==

-- E�er yazd���n�z view in kaynak kodlar�n�,Object Explorer penceresinde "Views" kategorisine sa� t�layarak 
-- Design Modda a��p g�r�nt�lemesini istemiyorsak "With Encryption" komutu ile view olu�turmal�y�z
-- Dikkat ! ! !
/*
   "With Encryption" i�leminden sonra view'i olu�turan ki�ide dahil g�remez. Geri d�n��� yoktur.
   Ancak view'i olu�turan �ahs�n komutlar�n yede�ini bulundurmas� gerekmektedir. 
   Ya da "With Encryption" olmaks�z�n view yap�s�n� yeniden alterlamal�y�z
*/
-- Dikkat ! ! !
--Bir dikkat edilmesi gereken �ey de "With Encryption" ifadesi AS den �nce yaz�l�r

CREATE VIEW OrnekViewPersoneller
WITH ENCRYPTION 
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

-- Bu i�lem yapt�ktan sonra Design Modu kapat�lm��t�r


-- == WITH SCHEMABINDING  ==
/*
   E�er view'in kulland��� esas fiziksel tablolar�n kolon isimleri bir �ekilde de�i�tirilir, kolonlar� silinir ya da tablo yap�s� bir
   �ekilde de�i�ikli�e u�rarsa view'in �al��mas� art�k m�mk�n olmayacakt�r
*/
-- View'in kulland��� tablolar ve kolonlar� bu tarz i�lemler yapabilmesi ihtimaline kar�� koruma alt�na al�nabilir
-- Bu koruma "WITH SCHEMABINDING" ile yap�labilir
-- "WITH SCHEMABINDING" ile view Create ya da Alter edilirken, view'in kulland��� tablo, schema ad�yla birlikte verilmelidir.
-- �rne�in, dbo(database owner) bir �ema ad�d�r. �emalar C# taki namespaceler gibi d���n�lebilir
-- "WITH SCHEMABINDING" komutuda AS den �nce yaz�lmal�d�r

USE OrnekVT
CREATE TABLE OrnekTablo
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Kolon1 NVARCHAR(MAX),
)

CREATE VIEW OrnekView
WITH SCHEMABINDING
AS
SELECT Id.Kolon1 FROM dbo.OrnekTablo

ALTER TABLE OrnekTablo
ALTER COLUMN Kolon1 INT


-- === WITH CHECK OPTION ===
-- View'in i�erisindeki sorguda bulunan �arta uygun kay�tlar�n INSERT edilmesine m�sade edilip
-- uymayan kay�tlar�n m�saade edilmemesini sa�layan bir komuttur

USE Northwind
CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'

INSERT OrnekView2 VALUES ('Ahmet','Aksu')
INSERT OrnekView2 VALUES ('Mehmet','Aksu')

-- "WITH ENCRYPTION" ve "WITH SCHEMABINDING" komutlar�ndan farkl� olarak AS den sonra Where �art�n�n sonunda yaz�l�r

CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'
WITH CHECK OPTION


----------------------------------------------------------- VIEW FINISH ------------------------------------------------------------

-- FUNCTION 

-- SCALAR FUNCTION && INLINE FUNCTION

-- T-SQL'de iki tip fonksiyon vard�r.
-- SCALAR FUNCTION = Geriye istedi�imiz bir tipte de�er d�nd�ren fonksiyon
-- INLINE FUNCTION = Geriye tablo d�nd�ren fonksiyon

-- Bu iki fonksiyonda fiziksel olarak VT'de olu�urlar
-- CREATE ile olu�urlar
-- �zerinde �al���lan VT'nin Programmability -> Functions kombinasyonundan olu�turulan fonksiyonlara eri�ebiliriz.


-- == 1.Scalar Function ==

-- == Fonksiyon tan�mlama ==
-- Scalar fonksiyonlara tan�mlad�ktan sonra Programmability -> Function -> Scalar-valued Functions kombinasyonundan eri�ilebilir


CREATE FUNCTION Topla(@Sayi1 INT, @Sayi2 INT) RETURNS INT
AS
	BEGIN
		RETURN @Sayi1 + @Sayi2
	END

SELECT dbo.Topla(2,5)
PRINT dbo.Topla(10,10)

-- �rnek
-- Herhangi bir �r�n�n %18 KDV dahil olmak �zere toplam maliyeti getiren fonksiyonu yazal�m

CREATE FUNCTION Maliyet(@BirimFiyati INT, @StokMiktar INT) RETURNS NVARCHAR(MAX)
AS
	BEGIN
		DECLARE @Sonuc INT = (@BirimFiyati * @StokMiktar * 1.18)
		RETURN @Sonuc
	END

SELECT dbo.Maliyet(10,20) AS Maliyet

-- == 2.Inline Function ==
-- Geriye tablo d�nd�ren fonksiyon
/*
   Geriye tablo d�nd�rece�i i�in bu fonksiyonlar �al��t�r�l�rken sanki bir tablodan 
   sorgu �al��t�r�l�r gibi �al��t�r�l�rlar. Bu y�nleriyle viewlara benzerler. View ile
   yap�lan i�levler Inline Functions'larla yap�labilirler
*/
-- Genellikle viewle benzer i�levler i�in View kullan�lmas� tavsiye edilir

-- == Fonksiyon tan�mlama ==
-- Inline fonksiyonlara tan�mlad�ktan sonra Programmability -> Function -> Table-valued Functions kombinasyonundan eri�ilebilir

--Dikkat ! ! !
--INLINE FUNCTIONS olu�turulurken BEGIN-END yap�s� kullan�lmaz

CREATE FUNCTION tc_Gonder(@Ad NVARCHAR(20),@Soyad NVARCHAR(20)) RETURNS TABLE
AS
	RETURN SELECT Adi,SoyAdi FROM Personeller WHERE Adi = @Ad AND SoyAdi = @Soyad

SELECT * FROM dbo.tc_Gonder('�zkan','Parlakk�l��')


-- == Fonksiyonlarda WITH ENCRYPTION ==
/*
-- E�er ki yazm�� oldu�umuz fonksiyonlar�n kodla�na 2. -3. �ah�s engellemek istiyorsak "WITH ENCRYPTION" 
-- komutunu kullanmal�y�z 
*/
/*
   "WITH ENCRYPTION" i�leminden sonra fonksiyonu olu�turan ki�ide dahil kimse 
   komutlar� g�remez. Geri d�n��� yoktur. Ancak fonk. olu�turan ki�inin komutlar�n yede�ini bulundurmas� gerekmektedir
   Ya da "WITH ENCRYPTION" olmaks�z�n fonksiyonu yeniden alterlamal�y�z.
*/
-- "WITH ENCRYPTION" AS den �nce kullan�lmal�d�r

CREATE FUNCTION OrnekFonksiyon() RETURNS INT
WITH ENCRYPTION
AS
	BEGIN
		RETURN 1
	END

CREATE FUNCTION OrnekFonksiyon2() RETURNS TABLE
WITH ENCRYPTION
AS
		RETURN SELECT * FROM Personeller
	

-- == Otomatik hesaplanabilir kolonlar - Computed Column ==

-- Herhangi bir kolonda fonk. kullan�larak otomatik hesaplanabilir kolonlar (Computed Column) olu�turmak m�mk�nd�r

-- �rnek 
-- ��kt� olarak "_____ kategorisindeki _____ �r�n�n toplam fiyat� : _____ 'd�r." �eklinde bir fonksiyon yazal�m.

CREATE FUNCTION Rapor(@Kategori NVARCHAR(MAX),@UrunAdi NVARCHAR(MAX),@BirimFiyati INT, @Stok INT)
RETURNS NVARCHAR(MAX)
AS 
	BEGIN
		DECLARE @Rapor NVARCHAR(MAX) = @Kategori + ' kategorisindeki ' + @UrunAdi + ' �r�n�n toplam fiyat� ' + 
		CAST(@BirimFiyati * @Stok AS NVARCHAR(MAX)) + ' d�r. ' 
		RETURN @Rapor
	END

SELECT dbo.Rapor(K.KategoriAdi,U.UrunAdi,U.BirimFiyati,U.HedefStokDuzeyi) AS RAPOR
FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID = K.KategoriID

------------------------------------ FUNCTION FINISH ---------------------------------------------

-- STORED PRODUCURE (Sakl� yordamlar)

-- == Genel �zellikleri ==

/* 
   Normal sorgulardan daha h�zl� �al���rlar
   ��nk� normal sorgular Execute edilirken "Execute Plan" i�lemi yap�l�r. Bu i�lem
   s�ras�nda hangi tablodan veri �ekilecek, hangi kolonlar gelecek, b�nlar nerede v.s gibi i�lemler yap�l�r
   Bir sorgu her �al��t�r�ld���nda bu i�lemler aynen tekrar tekrar yap�l�r.
   Fakat sorgu Stored Procudure olarak �al��t�r�l�rsa bu i�lem sadece bir kere yap�l�r ve o da ilk �al��ma esnas�ndad�r.
   Di�er �al��t�rmalarda ise bu i�lemler yap�lmaz .
   Bundan dolay� h�z ve performansta art�� sa�lan�r
*/
-- ��erisinde SELECT, DELETE,UPDATE ve INSERT i�lemleri yap�labilir.
-- �� i�e kullan�labilir
-- ��lerinde fonksiyon olu�turulabilir
/* 
   Sorgular�m�z�n d��ardan alaca�� de�erler parametre olarak Stored Procudure'lere
   ge�irebildi�inizden dolay� , sorgular�m�z�n "SQL Injection" yemelerinide �nlemi� oluruz
   Bu y�nleriyle de daha g�venildirler
*/

-- SP fiziksel bir VT nesnesidir. Haliyle CREATE komutu ile olu�turulur.
-- Fiziksel olarak ilgili VT'nin Programmability -> Stored Procudure kombinasyonundan eri�ilebilir

-- == Geriye de�er d�nd�ren SP yap�s� ==

CREATE PROC UrunGetir
(
	@Fiyat Money
)AS
SELECT * FROM Urunler WHERE BirimFiyati > @Fiyat
RETURN @@ROWCOUNT

EXEC UrunGetir 70
-- Bu �ekilde geriye d�n�len de�eri elde etmeksizin kullan�labilir.

DECLARE @Sonuc INT
EXEC @Sonuc = UrunGetir 70
PRINT CAST(@Sonuc AS NVARCHAR(MAX)) + ' adet �r�n bu i�lemden etkilenmi�tir'


-- == Output ile de�er d�nd�ren  ==

CREATE PROC sp_Ornek
(
	@Id INT,
	@Adi NVARCHAR(MAX) OUTPUT,
	@SoyAdi NVARCHAR(MAX) OUTPUT
)AS
SELECT @Adi = Adi, @SoyAdi = SoyAdi from Personeller WHERE PersonelID = @Id

DECLARE @Adi NVARCHAR(MAX),@SoyAdi NVARCHAR(MAX)
EXEC sp_Ornek 3, @Adi OUTPUT, @SoyAdi  OUTPUT
SELECT @Adi + ' ' + @SoyAdi AS Personel


-- == Genel �rnek ==

/*
   D��ar�dan ald��� isim,soyisim ve �ehir bilgilerini Personeller tablosunda ilgili kolonlara
   ekleyen SP yi yaz�n�z
*/

CREATE PROC sp_PersonelEkle
(
	@Adi NVARCHAR(MAX),
	@SoyAdi NVARCHAR(MAX),
	@Sehir NVARCHAR(MAX)
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle 'Ekrem', 'Parlakk�l��','Sakarya'
SELECT * FROM Personeller

-- == Parametrelere Varsay�lan De�er ==

CREATE PROC sp_PersonelEkle2
(
	@Adi NVARCHAR(MAX) = '�simsiz',
	@SoyAdi NVARCHAR(MAX) = 'Soyads�z',
	@Sehir NVARCHAR(MAX) = '�ehir girilmemi�'
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle2 'Ekrem', 'Parlakk�l��','Sakarya'
-- Burada varsay�lan de�erler devreye girmemektedir
SELECT * FROM Personeller

EXEC sp_PersonelEkle2 
/*
   Normalde bu �ekilde parametrelere de�er g�ndermeksizin �al��mamas� laz�m
   ama varsay�lan de�erler tan�mda belirtildi�i i�in devreye girmektedir
*/

EXEC sp_PersonelEkle2 '�brahim'

-- @Adi parametresi '�brahim' de�erini alacakt�r.Di�er parametreler ise varsay�lan de�erleri alacakt�r

-- EXEC komutu

EXEC('SELECT * FROM Personeller')
SELECT * FROM Personeller

-- Yanl�� kullan�m 
-- 2 EXEC komutu birbirinden ba��ms�z �al���r ve print ekrena sayac de�erini basamaz de�i�ken tan�mlanmam��t�r
EXEC ('DECLARE @Sayac INT = 0')
EXEC ('PRINT @Sayac')

-- Do�ru kullan�m 

EXEC ('DECLARE @Sayac INT = 0 PRINT @Sayac')

-- == SP i�erisinde nesne olu�turma

CREATE PROC sp_TabloOlustur
(
	@TabloAdi NVARCHAR(MAX),
	@Kolon1Adi NVARCHAR(MAX),
	@Kolon1AdiOzellikleri NVARCHAR(MAX),
	@Kolon2Adi NVARCHAR(MAX),
	@Kolon2AdiOzellikleri NVARCHAR(MAX)
)AS
EXEC
('
 CREATE TABLE ' + @TabloAdi + '
 (
	' + @Kolon1Adi + ' ' + @Kolon1AdiOzellikleri + ',
	' + @Kolon2Adi + ' ' + @Kolon2AdiOzellikleri + '
 )
')

EXEC sp_TabloOlustur 'OrnekTablo','Id','INT PRIMARY KEY IDENTITY(1,1)','Kolon2','NVARCHAR(MAX)'

--------------------------------------------- SP FINISH ---------------------------------------------

-- T-SQL - TRIGGERS (Tetikleyiciler)

-- == DML TRIGGER
/*
   Bir tabloda INSERT,UPDATE ve DELETE i�lemleri ger�ekle�tirildi�inde devreye giren yap�lard�r.
   Bu i�lem sonucunda veya s�recinde devreye girerler
*/

-- *INSERTED TABLE
/*
   E�er bir tabloda Insert i�lemi yap�l�yorsa arka planda i�lemler ilk �nce RAM'de olu�turulan 
   inserted isimli bir tablo �zerinde yap�l�r.E�er i�lemde bir problem yoksa inserted tablosundaki 
   veriler fiziksel tabloya insert edilir. ��lem bitti�inde RAM'de olu�turulan bu inserted tablosu
   silinir.
*/

-- *DELETED TABLE
/*
   E�er bir tabloda Delete i�lemi yap�l�yorsa arka planda i�lemler ilk �nce RAM'de olu�turulan 
   deleted isimli bir tablo �zerinde yap�l�r.E�er i�lemde bir problem yoksa deleted tablosundaki 
   veriler fiziksel tablodan silinir. ��lem bitti�inde RAM'den bu deleted tablosuda
   silinir.
*/

-- E�er bir tabloda Update i�lemi yap�l�yorsa RAM'de uptadet isimli bir tablo OLU�TURULMAZ ! ! ! 
-- SQL Server'da ki Update mant��� �nce silme, sonra eklemedir.
/*
   E�er bir tabloda update i�lemi yap�l�yorsa arka planda RAM'de hem deleted hem de inserted tablolar�
   olu�turulur ve bunlar �zerinde i�lemler yap�l�r
*/
/*
   NOT : Update yaparken g�ncellenen kayd�n orjinali deleted tablosunda , g�ncellendikten sonraki hali ise
   inserted tablosunda bulunmaktad�r. ��nk� g�ncelleme demek kayd� �nce silmek sonra eklemek demektir.
*/

/*
   Deleted ve inserted tablolar�, ilgili sorgu sonucu olu�tuklar� i�in o sorgunun kulland���
   kolonlara da sah�p olur. B�ylece deleted ve inserted tablolar�nda select sorgusu yapmak m�mk�nd�r.
*/

-- D�KKAT ! ! !
-- Tan�mlanan Triggerlara ilgili tablonun i�erisindeki Triggers sekmesi alt�ndan eri�ebilir.

CREATE TRIGGER OrnekTrigger
ON Personeller
AFTER INSERT 
AS 
SELECT * FROM Personeller

INSERT Personeller(Adi,SoyAdi) VALUES('�zkan','Parlakk�l��')


-- �rnek 1 
-- Tedarik�iler tablosundan bir veri silindi�inde t�m �r�nlerin fiyat� 10 arts�n

CREATE TRIGGER TriggerTedarikciler
ON Tedarikciler
AFTER DELETE 
AS 
UPDATE Urunler SET BirimFiyati = BirimFiyati + 10
SELECT * FROM Urunler

DELETE FROM Tedarikciler WHERE TedarikciID = 30

-- �rnek 2 
-- Tedarik�iler tablosundan bir veri g�ncellendi�inde,kategoriler tablosunda "Meyve kokteyli" ad�nda bir kategori olu�sun

CREATE TRIGGER TrgTedarikciUpdate
ON Tedarikciler
AFTER UPDATE 
AS 
INSERT Kategoriler(KategoriAdi) VALUES('Meyve kokteyli')
SELECT * FROM Kategoriler

UPDATE Tedarikciler SET MusteriAdi = 'Ekrem' WHERE MusteriAdi = 'Owner'

-- �rnek 3
/*
   Personeller tablosundan bir kay�t silindi�inde silinen kayd�n ad�, soyad�, kim taraf�ndan ve
   hangi tarihte silindi�i ba�ka bir tabloya kay�t edilsin. Bir nevi log tablosu gibi
*/

CREATE TABLE LogTablosu
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Rapor NVARCHAR(MAX)
)

CREATE TRIGGER TrgPersonelDelete
ON Personeller
AFTER DELETE 
AS 
DECLARE @Adi NVARCHAR(MAX) , @SoyAdi NVARCHAR(MAX)
SELECT @Adi = Adi, @SoyAdi = SoyAdi from deleted
INSERT LogTablosu VALUES ('Ad� ve Soyad�' + @Adi + ' ' + @SoyAdi + ' olan personel ' + SUSER_NAME()
						  + ' taraf�ndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde silinmi�tir.')


DELETE FROM Personeller WHERE PersonelID = 11

-- �rnek 4
/*
   Personeller tablosunda update ger�ekle�ti�i anda devreye giren ve bir log tablosuna "Ad� ..."
   olan personel ... yeni ad�yla de�i�tirilerek ... kullan�c� taraf�ndan ... tarihinde g�ncellendi.
   Kal�b�nda bir rapor yazan trg yazal�m
*/


CREATE TRIGGER TrgPersonelUpdate
ON Personeller
AFTER UPDATE 
AS 
DECLARE @EskiAdi NVARCHAR(MAX),@YeniAdi NVARCHAR(MAX)
SELECT @EskiAdi = Adi from deleted
SELECT @YeniAdi = Adi from inserted
INSERT LogTablosu VALUES ('Ad� ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni ad�yla de�i�tirilerek ' + SUSER_NAME()
						  + ' kullan�c� taraf�ndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde g�ncellenmi�tir.')


UPDATE Personeller SET Adi = 'Ekrem' WHERE Adi = '�zkan'

-- === Multiple Actions Trigger ===

CREATE TRIGGER MultiTrigger
ON Personeller
AFTER DELETE,INSERT 
AS 
PRINT 'Hello'

INSERT Personeller(Adi,SoyAdi) VALUES('�zkan','Parlakk�l��')
DELETE FROM Personeller WHERE PersonelId = 30

-- === Instead Of Triggers ===

/*
   �u ana kadar Insert,Update ve Delete i�lemleri yap�l�rken �u �u i�lemi yap 
   mant���yla �al��t�k.(Yan�nda �unu yap)
*/ 
/*
   Instead Of Triggerlar ise Insert,Update ve Delete i�lemleri yerine �u �u i�lemi yap 
   mant���yla �al��maktad�rlar.(Yerine �unu yap)
*/

-- �rnek 5
/*
   Personeller tablosunda update ger�ekle�ti�i anda yap�calak g�ncelle�tirme yerine bir log tablosuna
   "Ad� ..." olan personel ... yeni ad�yla de�i�tirilerek ... kullan�c� taraf�ndan ... tarihinde g�ncellenmek istendi.
   Kal�b�nda bir rapor yazan trg yazal�m.
*/


CREATE TRIGGER TrgPersonelRaporInstead
ON Personeller
INSTEAD OF UPDATE 
AS 
DECLARE @EskiAdi NVARCHAR(MAX),@YeniAdi NVARCHAR(MAX)
SELECT @EskiAdi = Adi from deleted
SELECT @YeniAdi = Adi from inserted
IF @EskiAdi = @YeniAdi
	BEGIN
		INSERT LogTablosu VALUES ('Ad� ' + @EskiAdi + ' olan personel ' + SUSER_NAME()
								  + ' kullan�c� taraf�ndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde g�ncellenmek istendi.')
	END
ELSE
	BEGIN
		INSERT LogTablosu VALUES ('Ad� ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni ad�yla de�i�tirilerek ' + SUSER_NAME()
								  + ' kullan�c� taraf�ndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde g�ncellenmek istendi.')
	END

UPDATE Personeller SET Adi = '�zkan' WHERE Adi = 'Ekrem'

-- �rnek 6 
-- Personeller tablosunda ad� "Andrew" olan kayd�n silinmesini engelleyen ama di�erlerine izin veren trigger� yazal�m

CREATE TRIGGER AndrewTrigger
ON Personeller
AFTER DELETE 
AS 
DECLARE @Adi NVARCHAR(MAX)
SELECT @Adi = Adi from deleted

IF @Adi = 'Andrew'
	BEGIN
		PRINT 'Bu kayd� silemezsin'
		ROLLBACK -- Yap�lan t�m i�lemleri geri al�r
	END

DELETE FROM Personeller WHERE PersonelID = 10

-- == DDL TRIGGER

-- CREATE, ALTER ve DROP i�lemleri sonucunda veya s�recinde devreye girecek olan yap�lard�r. 

CREATE TRIGGER DDL_Trigger
ON DATABASE
FOR drop_table,alter_table,create_function,create_procudure,drop_procudure -- v.s
AS 
PRINT 'Bu i�lem ger�ekle�tirilemez'
ROLLBACK

DROP TABLE LogTablosu

-- D�KKAT ! ! !
-- DDL Triggerlara ilgili veritaban�n�n Programmability -> Database Triggers sekmesi alt�ndan eri�ilir

-- === Trigger'� Devre D��� B�rakma ===
DISABLE TRIGGER TrgPersonelRaporInstead ON Personeller
-- === Trigger'� Aktifle�tirme ===
ENABLE TRIGGER TrgPersonelRaporInstead ON Personeller


------------------------------------------- TRIGGER FINISH -----------------------------------------

-- TRANSACTION

/*
   Birden �ok i�lemin bir arada yap�ld��� durumlarda e�er par�ay� olu�turan i�lemlerden herhangi birinde 
   sorun olursa t�m i�lemi iptal ettirmeye yarar
*/
/*
   �rne�in; kredi kart� ile al��veri� i�lemlerinde transaction i�lemi vard�r. Siz marketten �r�n al�rken
   sizin hesab�n�zdan para d���lecek, marketin hesab�na para aktar�lacakt�r. Bu i�lemde hata olmamas�
   gerekir ve bundan dolay� bu i�lem transaction blo�unda ger�ekle�tirilmelidir. Bu esnada herhangi bir sorun olursa 
   b�t�n i�lemler transaction taraf�ndan iptal edilir.
*/

-- Begin Tran veya Begin Transaction : Transaction i�lemini ba�lat�r.

-- Commit Tran : Transaction i�lemini ba�ar�yla sona erdirir. ��lem(ler)i ger�ekle�tirir
-- Rollback Tran: Transaction i�lemini iptal eder. ��lem(ler)i geri al�r.

-- Commit Tran yerine Commit yaz�labilir.
-- Rollback Tran yerine Rollback yaz�labilir.

/*
   Normalde default olarak her �ey Begin Tran ile ba�lay�p, Commit Tran ile biter. !!!
   Biz bu yap�lar� kullanmasak bile !!!
*/

INSERT Bolge VALUES(5,'Sakarya') -- Varsay�lan olarak Tran kontrol�nde bir i�lemdir.Sonu� olarak da Commit ile biter.

BEGIN TRAN Kontrol
INSERT Bolge VALUES(5,'Sakarya') 
COMMIT

-- Transaction'a isim vermek zorunda de�iliz.

BEGIN TRAN
INSERT Bolge VALUES(5,'Sakarya') 
COMMIT

-- �rnek

BEGIN TRAN Kontrol
DECLARE @i INT
DELETE FROM Personeller WHERE PersonelID > 20
SET @i = @@ROWCOUNT
IF @i = 1
	BEGIN
		PRINT 'Kay�t silindi.'
		COMMIT
	END
ELSE
	BEGIN
		PRINT '��lem ba�ar�s�z.'
		ROLLBACK
	END


-- == Banka uygulamas� ==

-- �rnek
/*
   �ki adet banka tablosu olu�tural�m. Bankalar aras� havale i�lemi ger�ekle�tirelim. Ve bu i�lemleri
   yaparken tran kullanal�m
*/

CREATE DATABASE BankaDb
GO
USE BankaDb
GO
CREATE TABLE ABanka
(
   HesapNo INT,
   Bakiye MONEY,
)
GO
CREATE TABLE BBanka
(
   HesapNo INT,
   Bakiye MONEY,
)
GO
INSERT ABanka VALUES(10,1000),
					(20,2500)
INSERT BBanka VALUES(30,2300),
					(40,760)

GO
ALTER PROC sp_HavaleYap
(
   @BankaKimden NVARCHAR(MAX),
   @BankaKime NVARCHAR(MAX),
   @GonderenHesapNo INT,
   @AlanHesapNo INT,
   @Tutar MONEY
)
AS
BEGIN TRAN Kontrol
DECLARE @GonderenBakiye INT,@AlanBakiye INT,@HesaptakiPara MONEY
  IF @BankaKimden = 'ABanka'
	BEGIN
		SELECT @HesaptakiPara = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
		IF @Tutar > @HesaptakiPara
			BEGIN
				PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta g�nderilmek istenenden az para mevcuttur.'
				ROLLBACK
			END
		ELSE
			BEGIN
				IF @BankaKime = 'BBanka'
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' de�erinde para havale edilmi�tir.'
						PRINT 'Son de�erler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
						+ CAST(@AlanBakiye AS NVARCHAR(MAX))
						COMMIT
					 END
			     ELSE
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' de�erinde para havale edilmi�tir.'
						PRINT 'Son de�erler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
						+ CAST(@AlanBakiye AS NVARCHAR(MAX))
						COMMIT
					 END
			END
	END

ELSE 
	 BEGIN
			SELECT @HesaptakiPara = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
			IF @Tutar > @HesaptakiPara
				BEGIN
					PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta g�nderilmek istenenden az para mevcuttur.'
					ROLLBACK
				END
			ELSE
				BEGIN
					IF @BankaKime = 'ABanka'
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' de�erinde para havale edilmi�tir.'
							PRINT 'Son de�erler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
							+ CAST(@AlanBakiye AS NVARCHAR(MAX))
							COMMIT
						END
					ELSE
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' de�erinde para havale edilmi�tir.'
							PRINT 'Son de�erler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' s�ndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaral� hesapta kalan bakiye :'
							+ CAST(@AlanBakiye AS NVARCHAR(MAX))
							COMMIT
						END
				END
		END


EXEC sp_HavaleYap 'ABanka','BBanka',10,30,100
EXEC sp_HavaleYap 'BBanka','ABanka',30,10,300
EXEC sp_HavaleYap 'BBanka','BBanka',30,40,200
EXEC sp_HavaleYap 'ABanka','ABanka',10,30,100
EXEC sp_HavaleYap 'ABanka','ABanka',10,10,100
EXEC sp_HavaleYap 'ABanka','BBanka',20,40,5000 

SELECT * FROM ABanka
SELECT * FROM BBanka
SELECT * FROM ABankaRaporTablosu
SELECT * FROM BBankaRaporTablosu

CREATE TABLE ABankaRaporTablosu
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Rapor NVARCHAR(MAX)
)

ALTER TRIGGER TrgABankaRapor
ON ABanka
AFTER UPDATE
AS 
DECLARE @EskiBakiye NVARCHAR(MAX),@YeniBakiye NVARCHAR(MAX),@Tutar MONEY
		,@GonderenHesapNo NVARCHAR(MAX),@AlanHesapNo NVARCHAR(Max)
	SELECT @EskiBakiye = Bakiye from deleted
	SELECT @YeniBakiye = Bakiye from inserted
	SELECT @GonderenHesapNo =  HesapNo  FROM deleted
	SELECT @AlanHesapNo = HesapNo FROM inserted
	SET @Tutar = CAST(@EskiBakiye AS MONEY) - CAST(@YeniBakiye AS MONEY)
IF @Tutar < 0
	BEGIN 
		PRINT @AlanHesapNo
		  INSERT ABankaRaporTablosu VALUES ('A bankas�ndaki ' + @AlanHesapNo + ' nolu hesap '
		                                 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' + @EskiBakiye + ' TL den ' + 
										 + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TAR�H�NDE HESAP G�NCELLENM��T�R.')
	END
ELSE
	BEGIN
		PRINT @AlanHesapNo
		INSERT ABankaRaporTablosu VALUES ('A bankas�ndaki ' + @GonderenHesapNo + ' nolu hesap ' 
		                                 + @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL g�ndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TAR�H�NDE HESAP G�NCELLENM��T�R.')
	END



CREATE TABLE BBankaRaporTablosu
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Rapor NVARCHAR(MAX)
)


ALTER TRIGGER TrgBBankaRapor
ON BBanka 
AFTER UPDATE
AS 
DECLARE @EskiBakiye NVARCHAR(MAX),@YeniBakiye NVARCHAR(MAX),@Tutar MONEY
		,@GonderenHesapNo NVARCHAR(MAX),@AlanHesapNo NVARCHAR(Max)
	SELECT @EskiBakiye = Bakiye from deleted
	SELECT @YeniBakiye = Bakiye from inserted
	SELECT @GonderenHesapNo = HesapNo FROM deleted
	SELECT @AlanHesapNo = HesapNo FROM inserted
	SET @Tutar = CAST(@EskiBakiye AS MONEY) - CAST(@YeniBakiye AS MONEY)
IF @Tutar < 0
	BEGIN 
		INSERT BBankaRaporTablosu VALUES ('B bankas�ndaki ' + @AlanHesapNo + ' nolu hesap ' 
										 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' 
										 + @EskiBakiye + ' TL den ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TAR�H�NDE HESAP G�NCELLENM��T�R.')
	END
ELSE
	BEGIN
		INSERT BBankaRaporTablosu VALUES ('B bankas�ndaki ' + @GonderenHesapNo + ' nolu hesap ' 
										 +  @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL g�ndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TAR�H�NDE HESAP G�NCELLENM��T�R.')
	END



------------------------------------------------ TRANSACTION FINISH ------------------------------------------------

-- SQL SERVER VT yede�i alma ve y�kleme

-- 1.YOL
-- Backup ile yedek alma
-- Restore ile yede�i y�kleme

-- 2.YOL (Tavsiye edilen y�ntem)
-- Generate Scripts