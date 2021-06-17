USE Northwind

--Select Sorgularýnda (Where) Þartý Yazmak

SELECT * FROM Personeller

--Personeller tablosunda þehri London olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London'

--Personeller tablosunda baðlý .alýþtýðý kiþi sayýsý 5 ten küçük olanlarý listeleyelim.
SELECT * FROM Personeller WHERE BagliCalistigiKisi < 5

--Personeller tablosunda þehri London ve ülkesi UK olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' AND Ulke = 'UK'

--Personeller tablosunda UnvanEki Mr. olan veya þehri Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'Seattle' OR UnvanEki = 'Mr.'

--Personeller tablosunda Adi Robert. olan ve King Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Adi = 'Robert' AND SoyAdi = 'King'

--PersonelID'si 5'ten küçük olanlarý getir
SELECT * FROM Personeller WHERE PersonelID = 5

--PersonelID'si 5'ten büyük ve eþit olan tüm personelleri getir
SELECT * FROM Personeller WHERE PersonelID >= 5

--1993 yýlýnda iþe baþlayanlarý getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) = 1993

--1992 yýlýndan sonra iþe baþlayanlarý getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) > 1992

--Doðum tarihi ayýn 29'u olmayanlarý baþlayanlarý getir
SELECT * FROM Personeller WHERE Day(DogumTarihi) <> 29

--Doðum yýlý 1950-1960 yýllarý arasýndakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) > 1950 AND YEAR(DogumTarihi) < 1960

--Personeller tablosunda yaþadýðý þehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' OR Sehir = 'Tacoma' OR Sehir = 'Kirkland'

---------------------------------------WHERE FINISH---------------------------------------------

--BETWEEN 

--Doðum yýlý 1950-1960 yýllarý (dahil) arasýndakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) BETWEEN  1950 AND 1960

--IN 
--Personeller tablosunda yaþadýðý þehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir IN('London','Tacoma','Kirkland')


----------------------------------------BETWEEN AND IN FINISH---------------------------------------


--LIKE 

--% (NOT IMPORTANT GENERAL) OPERATOR

--Ýsminin baþ harfi j olan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'j%'

--Ýsminin son harfi y ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%y'

--Ýsminin  son 3 harfi ert ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%ert'

--Ýsminin  baþ harfi r olan ve son harfi t ile biten personeller, getir
--Gereksiz Kullaným
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%' AND Adi LIKE '%t'
--Daha iyi çözüm
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%t'


--Ýsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--Ýsminin baþ harfi n ve içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'n%an%'

--Ýsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--Ýsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'


-- _(NOT IMPORTANT SPECIAL) OPERATOR

--Ýsmini ilk harfi a ikinci harfi farketmez ve üçüncü harfi d olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'a_d%'

--Ýsmini ilk harfi m ikinci-üçüncü-dördüncü harfi farketmez beþinci harfi a olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'm___a%'

--[] (or) OPERATOR
--Ýsmini ilk harfi n ya da m ya da r olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[nmr]%'

--Ýsminin içerisinde a ya da i olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '%[ai]%'

--[*-*] (Alfabetik Arasýnda) OPERATOR

--Ýsminin baþ harfi a ile k arasýnda alfabetik sýraya göre herhangi bir harf olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[a-k]%'

-- [^*] (NOT) OPERATOR

--Ýsminin baþ harfi a olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^a]%'


--Ýsminin baþ harfi an olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^an]%'

--Excape(Kaçýþ) Karakterleri
/*
  Like sorgularýnda kullandýðýmýz %, _, [] gibi özel ifadeler eðer ki verilerimiz içerisinde geçiyorsa 
  sorgulama esnasýnda hata ile karþýlaþabiliriz.Böyle durumlarda bu ifadelerin özel ifade olup 
  olmadýðýný escape ila belirleyebiliriz
*/

--Two Method

--[] Operatörü ile
--Escape Komutu ile

/*
  Alt çizgi ile baþlayan isimler getirilmek istendiðinde sisteme bunu belirtmeliyiz 
  aþaðýdaki kullaným yannlýþ kullanýmdýr.(Sistem tüm kayýtlarý döndürür) 
*/
--Select * from Personeller WHERE Adi LIKE '_%'

--Alt çizgi ile baþlayan isimleri getir
--Doðru Kullanýmlar 
Select * from Personeller WHERE Adi LIKE '[_]%'
Select * from Personeller WHERE Adi LIKE 'ü_%' Escape 'ü'


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

--LEFT : Soldan(baþtan) belirtilen karakter sayýsýný getirir
SELECT LEFT(Adi,2) FROM Personeller

--RIGHT : Saðdan(sondan) belirtilen karakter sayýsýný getirir
SELECT RIGHT(Adi,3) FROM Personeller

--UPPER : Büyük harfe çevirir
SELECT UPPER(Adi) FROM Personeller

--LOWER : Küçük harfe çevirir
SELECT LOWER(Adi) FROM Personeller

--LEN : String uzunluðunu verir
SELECT LEN(Adi) as LENGTH From Personeller

--SUBSTRING : Belirtilen indexten itibaren belirli sayýda karakter getirir
SELECT SUBSTRING(Adi,3,2) FROM Personeller

--LTRIM : Soldan boþluklarý kýrar
SELECT '          Özkan'
SELECT LTRIM('          Özkan')

--RTRIM : Saðdan boþluklarý kýrar
SELECT 'Özkan             '
SELECT RTRIM('Özkan          ')

--REVERSE : Tersine çevirir
SELECT REVERSE(Adi) FROM Personeller

--REPLACE : Belirtilen ifadeyi , belirtilen ifade ile deðiþtir
SELECT REPLACE('MY NAME IS Özkan','Özkan','Ekrem')

--STRING_SPLIT : Birinci parametrede verilen metni ikinci parametrede verilen karaktere göre ayrýþtýrýr. 
--Geriye value adýnda kolon barýndýran ve satýrlarýnda karaktere göre ayrýþtýrma sonucunu tutan bir tablo döner.
SELECT * FROM  STRING_SPLIT('Bu metin boþluk karakterine göre ayrýþtýrýlacak',' ')

--PATINDEX : Ýlk parametrede aldýðý paterni ikinci parametrede verilen strin içerisinde arar 
--ve bulduðu ilk indeki döndürür. Bulamazsa 0 döner.
SELECT PATINDEX('%R_A%', 'SAÝT ORHAN')

--CHARINDEX : Belirtilen karakterin veri içinde index numarasýný verir
SELECT CHARINDEX('r',Adi) FROM Personeller
SELECT MusteriAdi, CHARINDEX(' ',MusteriAdi) AS INDEX_NO FROM Musteriler

--CHARINDEX EXAMPLE
--Müþteriler tablosunun MusteriAdi kolonundan sadece adlarý çekelim
Select MusteriAdi from Musteriler
Select SUBSTRING(MusteriAdi,0,CHARINDEX(' ',MusteriAdi)) from Musteriler
--Müþteriler tablosunun MusteriAdi kolonundan sadece soyadlarý çekelim
Select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi),LEN(MusteriAdi)-CHARINDEX(' ',MusteriAdi)-1) AS SOYAD from Musteriler


----------------------------------------------------STRING FUNCTION FINISH----------------------------------------------------- 

--NUMERICAL TRANSACTIONS(SAYISAL ISLEMLER)

SELECT 3+2
SELECT 3*3
SELECT 4/2
SELECT 9-7

--PI : Pi sayýsýný verir
SELECT PI()

--SIN : Sinüs Alýr
SELECT SIN(PI())

--POWER : Üs alýr
SELECT POWER(2,3)

--ABS: Mutlak alýr
SELECT ABS(-12)

--RAND : 0-1 arasý Random sayý atar
SELECT RAND()

--FLOOR : Yuvarlama yapar
--0-100 arasý sayý üretir
SELECT FLOOR(RAND()*100)


-----------------------------------NUMERICAL TRANSACTIONS-----------------------------------


--DATE FUNCTION 

--GETDATE : Bu günün tarihini verir
SELECT GETDATE()

--DATEADD : Verilen tarihe gün ay yýl ekler
SELECT DATEADD(DAY,999,GETDATE())
SELECT DATEADD(MONTH,999,GETDATE())
SELECT DATEADD(YEAR,999,GETDATE())

--DATEDIFF : Ýki tarih arasý farký hesaplar 
SELECT DATEDIFF(DAY,'09-07-1999',GETDATE())
SELECT DATEDIFF(MONTH,'09-07-1999',GETDATE())
SELECT DATEDIFF(YEAR,'09-07-1999',GETDATE())

--DATEPART : Verilen tarihin haftanýn,ayýn yahut yýlýn kaçýncý günü olduðunu hesaplar
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

--Her bir kategoriden kaç tane var sýrayla getir
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID

--Her bir kategoriden tedarikçiye göre kaç tane var sýrayla getir
SELECT KategoriID,TedarikciID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID,TedarikciID

--Her bir personel toplam ne kadar nakliyet ücretine sahip ve toplam kaç tane satýþý var
SELECT PersonelID,SUM(NakliyeUcreti) AS TOTAL_GAIN,COUNT(*) AS COUNT_TOTAL 
FROM Satislar 
GROUP BY PersonelID

--GROUP BY -> WHERE 
SELECT * FROM Urunler

--Her bir kategoriden kaç tane var Id si 5 den büyükleri sýrayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 


--GROUP BY , HAVING

SELECT * FROM Urunler

--Her bir kategoriden kaç tane var Id si 5 den büyükleri sýrayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 
HAVING COUNT(*) > 6

-----------------------------------------GROUP BY FINISH------------------------------------------

--Merge Tables Side by Side(Tablolarý Yan yana birleþtirme)
--Ýlkel yöntem(NOT JOIN)
SELECT * FROM Personeller
SELECT * FROM Satislar
SELECT * FROM Personeller,Satislar
SELECT  P.PersonelID, S.MusteriID FROM Personeller P,Satislar S WHERE P.PersonelID = S.PersonelID


------------------------------------Merge Tables Side by Side Finish----------------------------------

--INNER JOIN

--Genel Mantýk
--SELECT * FROM Tablo1 Inner Joýn Tablo2 on Tablo1.ÝliþkiliKolon=Tablo2.ÝliþkiliKolon

--Tablolara Alias tanýmlanabilir
--SELECT * FROM Tablo1 t1 Inner Joýn Tablo2 t2 on t1.ÝliþkiliKolon=t2.ÝliþkiliKolon

--Ýki tabloyu iliþkisel birleþtirme

--Hangi personel hangi satýþalrý yapmýþtýr(Personeller,Satislar)
SELECT * FROM Personeller P INNER JOIN Satislar S ON P.PersonelID = S.PersonelID


--Hangi ürün hangi kategory de
SELECT U.UrunAdi,K.KategoriAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID

--Where Kullanýmý
--Beverages kategorisindeki ürünlerim (Urunler,Kategory)
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages'

--Beverages kategorisindeki ürünlerimin sayýsý kaçtýr (Urunler,Kategory)
SELECT COUNT(U.UrunAdi) 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages' 

--Seafood kategorisindeki ürünlerin listesi
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID
WHERE K.KategoriAdi = 'Seafood'

--Hangi satýþý hangi eleman yapmýþ(Satislar,Personeller)
SELECT S.SatisID,P.Adi + ' ' + P.SoyAdi AS Personel 
FROM Satislar S INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 

--Faks numarasý "null" olmayan tedarikçilerin alýnmýþ ürünler nelerdir(Urunler,Tedarikçiler)
SELECT T.Faks,U.UrunAdi 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID = T.TedarikciID 
WHERE T.Faks IS NOT NULL --<> 'NULL'

--Ýkiden fazla tabloyu iliþkisel birleþtirme

--1997 yýlýndan sonra Nancy nin satýþ yaptýðý firma isimleri(Musteriler,Satislar,Personeller)
SELECT P.Adi,M.SirketAdi 
FROM Musteriler M INNER JOIN Satislar S 
ON M.MusteriID = S.MusteriID INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 
WHERE P.Adi = 'Nancy' AND YEAR(S.SatisTarihi) > 1997

--Limited olan tedarikçilerden alýnmýþ seafood kategorisindeki ürünlerimin toplam satýþ tutarý(Urunler,Tedarikçiler,Kategoriler)
SELECT SUM(U.HedefStokDuzeyi*U.BirimFiyati) AS TOTAL 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID=T.TedarikciID INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Seafood' AND T.SirketAdi LIKE '%Ltd.%'

--Ayný tabloyu iliþkisel olarak birleþtirme

--Personellerimin baðlý olarak çalýþtýðý kiþileri listele? (Personeller,Personeller)
SELECT P1.Adi,P2.Adi AS BGK 
FROM Personeller P1 INNER JOIN Personeller P2 
ON P1.BagliCalistigiKisi=P2.PersonelID

--INNER JOIN DE GROUP BY

/*
  Hangi personelin(adý ve soyadý birlikte), toplam kaç adetlik satýþ yapmýþ.Satýþ adedi 100 den fazla olanlar 
  ve personelin adýnýn baþ harfi M olan kayýtlar gelsin(Personeller,Satislar)
*/

SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID
WHERE P.Adi LIKE 'M%'
GROUP BY P.Adi + ' ' + P.SoyAdi 
HAVING COUNT(S.SatisID) > 100 

--Seafood Kategorisindeki ürünlerin sayýsý(Urunler,Kategoriler)
SELECT K.KategoriAdi,COUNT(U.KategoriID) AS TOTAL 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi='Seafood'
GROUP BY K.KategoriAdi

--Hangi personelim toplam kaç adet satýþ yapmýþ(Personeller,Satislar)
SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_ADET 
FROM Personeller P INNER JOIN Satislar S
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi 

--En çok Satýþ Yapan personelim
SELECT Top 1 P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi
ORDER BY COUNT(S.SatisID) DESC

/*
  Adýnda a harfi olan personellerin satýþ id si 10500 den büyük olan satýþlarýn toplam tutarýný (miktar*birimfiyat) 
  en yüksek toplam tutardan en alçak tutara sýralanacak þekilde 
  ve bu satýþlarýn hangi tarihte gerçekleþtiðini listele(Personeller,SatisDetaylarý,Satislar)
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

--Inner join'de eþleþen veriler getiriliyordu. Outer join'de ise eþleþmeyenler getirilir.

--LEFT JOIN

--Join ifadesinin solundaki tablodan tüm kayýtlarý getirir.Saðýndaki tablodan eþleþenleri yan yana eþleþmeyenleri null olarak getirir
USE OrnekVT
SELECT * FROM Oyuncular O LEFT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O LEFT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT JOIN Oyuncular O ON O.FilmId=F.FilmId

--RIGHT JOIN

--Join ifadesinin saðýndaki tablodan tüm kayýtlarý getirir.Solundaki tablodan eþleþenleri yan yana eþleþmeyenleri null olarak getirir
SELECT * FROM Oyuncular O RIGHT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O RIGHT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT JOIN Oyuncular O ON O.FilmId=F.FilmId

--FULL JOIN

--Joinin iki tarafýndaki tablolardan eþleþen eþleþmeyen hepsini getirir
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
INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç')

--[Dikkat edilmesi gerekenler!!!]
--INTO komudu ile yazýlýr

INSERT INTO Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç')
--Kolonun kabul ettiði veri tipi ve karakter uzunluðunda kayýt yapýlabilir
--Not Null olan kolonlara boþ býrakýlamayacaklarýndan dolayý mutlaka deðer gönderilmelidir

INSERT INTO Personeller(Adi,SoyAdi,Unvan,UnvanEki) VALUES ('','','a','b')
--Otomatik artan kolonlara deðer gönderilmez
--Tablodaki seçilen yahut bütün kolonlara gönderileceðini belirtip , göndermezsek hata verir

--Hatalý Yazým
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem')


--[Pratik Kullaným]
INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç')
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem','Parlakkýlýç')
INSERT Personeller(Adi,SoyAdi) VALUES ('Cavit','Parlakkýlýç')

INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç'),
									  ('Ekrem','Parlakkýlýç'),
									  ('Cavit','Parlakkýlýç')


--[INSERT Komutu ile Select sorgusu sonucunu farklý tabloya kaydetme]
INSERT OrnekPersoneller SELECT P.Adi,P.SoyAdi FROM Personeller P
SELECT * FROM OrnekPersoneller

--[Select sorgusu sonucunu gelen verileri tablo oluþturarak kaydetme]
SELECT P.Adi,P.SoyAdi,p.Ulke INTO OrnekPersoneller2 FROM Personeller P
SELECT * FROM OrnekPersoneller2

--Bu yöntemle primary key foreign key oluþturulamaz sonradan eklenmek isterse eklenebilir manuel olarak.


--UPDATE

--[DÝKKAT UPDATE komutu tehlikelidir genellikle where þartý ile kullanýlýr]
UPDATE OrnekPersoneller SET Adi='Mehmet'

--[Where þartý ile yazmak]
UPDATE OrnekPersoneller SET Adi='Mehmet' WHERE Adi='Nancy'

--[Update Sorgusunda Join yapýlarý kullanýlarak Birden fazla Tabloda güncelleme yapmak]
UPDATE Urunler SET UrunAdi = K.KategoriAdi FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID

--[UPDATE Sorgusunda Subquery ile güncelleme yapmak]
UPDATE Urunler SET UrunAdi = (SELECT Adi FROM Personeller WHERE PersonelID = 3)

--[UPDATE Sorgusunda Top Keywordü ile Güncelleme yapmak]
UPDATE Top(30) Urunler SET UrunAdi = 'x'

--DELETE

DELETE FROM Urunler

--[DÝKKAT DELETE komutu tehlikelidir genellikle where þartý ile kullanýlýr]

DELETE FROM Urunler WHERE KategoriID = 3
--Delete sorgusuyla tablo içerisindeki tüm verileri silmeniz identity kolonunu sýfýrlamayacaktýr.
--Silme iþleminden sonra ilk eklenen veride kalýndýðý yerden id deðeri verecektir


------------------------------------------- DML FINISH-----------------------------------------------------



--UNION | UNION ALL

--UNION
--Birden fazla select sorgusunun sonucunu tek seferde alt alta göstermemizi saðlar 

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

--Joinler tablolarý yan yana , Union alt alta birleþtirir.Joinlerde belirli (iliþkisel) bir kolon üzerinden birleþtirme yapýlýrken,
--Union da böyle bir durum yoktur

--Dikkat etmemiz gerekenler
--Union sorgusunun sonucunda oluþan tablolnun kolon isimleri,en üstteki sorgunun kolon isimlerinden oluþur
--En üstteki sorgudan kaç kolon çekilmiþse alttaki sorgudan da o kadar kolon çekilmek zorundadýr
--En üstteki sorgudan çekilen kolonlarýn tipleriyle,alttaki sorgudan çekilen kolonlarýn tipleri ayný olmak zorundadýr
--Union tekrarlý kayýtlarý getirmez

/*
  Union'da Kullanýlan tablolara kolon eklenebilir, Dikkat etmemiz gereken nokta , yukarýdaki kurallar çerçevesinde aþaðýyad yukarýyada
  ayný sayýda kolon eklenmesi gerekmektedir
*/

SELECT P.Adi,P.SoyAdi,'Personel' AS POSITION FROM Personeller P
UNION
SELECT M.MusteriAdi,M.MusteriUnvani,'Musteri' FROM Musteriler M

--UNION ALL

--UNION Tekrarlý kayýtlarý getirmezken UNION ALL getirir


SELECT P.Adi,P.SoyAdi FROM Personeller P
UNION ALL
SELECT P.Adi,P.SoyAdi FROM Personeller P

----------------------------------UNION AND UNION ALL FINISH-------------------------------------

--WITH ROLLUP

--GROUP BY ile gruplanmýþ veri kümesinde ara toplam alýnmasýný saðlar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH ROLLUP

--[Having þartýyla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP HAVING SUM(Miktar) > 100

----------------------------------------WITH ROLLUP FINISH----------------------------------------

--WITH CUBE
--GROUP BY ile gruplanmýþ veri kümesinde teker teker toplam alýnmasýný saðlar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH CUBE

--[Having þartýyla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE HAVING SUM(Miktar) > 100

----------------------------------------WITH CUBE FINISH----------------------------------------

--CASE - WHEN - ELSE -END

----Personellerin isim ve soyisimlerinin yanýnda; UnvanEki 'Mr.' ise 'Erkek','Mrs.' ise 'Kadýn' yazsýn

SELECT Adi,SoyAdi,UnvanEki FROM Personeller

SELECT Adi,SoyAdi,
CASE
WHEN UnvanEki = 'Mrs.' OR UnvanEki = 'Ms.' THEN 'Kadýn'
WHEN UnvanEki = 'Mr.' THEN 'Erkek'
ELSE UnvanEki 
END
FROM Personeller

/*
  Eðer ürünün birim fiyatý 0 - 50 arasý ise 'Çin Malý', 50 - 100 arasý ise 'Ucuz', 
  100 - 200 arasý ise 'Normal' , 200'den büyük ise 'Pahalý' yazsýn 
*/

SELECT UrunID,BirimFiyati FROM Urunler

SELECT UrunID,
CASE
WHEN BirimFiyati BETWEEN 0 AND 50 THEN 'Çin Malý' 
WHEN BirimFiyati BETWEEN 50 AND 100 THEN 'Ucuz'
WHEN BirimFiyati BETWEEN 100 AND 200 THEN 'Normal'
WHEN BirimFiyati > 200 THEN 'Pahalý'
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

 --Adý nancy olan personelin satýþlarýný tarihleriyle birlikte getir
 SELECT SatisID,SatisTarihi 
 FROM Satislar 
 WHERE PersonelID = (SELECT PersonelID FROM Personeller WHERE Adi = 'Nancy')

 --Unvan eki Dr olan Personellerin ismini getir
 SELECT Adi FROM Personeller WHERE Adi = (SELECT Adi FROM Personeller WHERE UnvanEki = 'Dr.')

 --[Dikkat!!!]
 --Sub olan sorgunun dçnüþ deðeri bir olmalýdýr birden fazla kayýt getiriyorsa alt sorgu olamaz


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

 --Kisiler Tablosu temizlenir , id 0 lanýr ve tablonun iskeleti silinmez
 TRUNCATE TABLE Kisiler

------------------------------------- TRUNCATE TABLE FINISH ---------------------------------


-- @@IDENTITY 
--En son insert yapýlan tablodaki verinin id sini yazdýrýr
INSERT Kategoriler(KategoriAdi,Tanimi) VALUES('X','X Kategorisi')
SELECT @@IDENTITY 

------------------------------------- @@IDENTITY FINISH ---------------------------------

--@@ROWCOUNT 
--Sorgudan kaç satýr etkilenmiþtir onun bilgisini verir
DELETE FROM Personeller WHERE PersonelID = 10000000
SELECT @@ROWCOUNT 

------------------------------------- @@ROWCOUNT  FINISH ---------------------------------

--Identity kolonuna müdahale etme
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

--NULLIF Fonksiyonu ile null kontrolü
--Fonksiyona verilen kolon, ikinci parametre verilen deðere eþitse o kolonu Null olarak getirir

SELECT NULLIF(0,0)
SELECT NULLIF(0,2)

SELECT HedefStokDuzeyi FROM Urunler
SELECT AVG(HedefStokDuzeyi) FROM Urunler

--Hedef stok düzeyi 0 olmayan ürünlerin ortalamasý nedir ? 
SELECT AVG(HedefStokDuzeyi) FROM Urunler WHERE HedefStokDuzeyi <> 0
SELECT AVG(NULLIF(HedefStokDuzeyi,0)) FROM Urunler

--------------------------------------------------NULLIF FINISH------------------------------------------------


--T-SQL ile VT deki tablolarý listeleme

SELECT * FROM sys.tables
-- ya da
SELECT * FROM sysobjects WHERE xtype = 'U'


--------------------------------------------------------------------------------------------------------------

--T-SQL ile PK olup olmadýðýný kontrol etme

SELECT OBJECTPROPERTY(OBJECT_ID('Personeller'),'TableHasPrimaryKey')

--------------------------------------------------------------------------------------------------------------

-- DDL (Data Definition Language)
/*
  T-SQL'de VT nesnelerini yaratmamýzý saðlayan ve bu nesnelerin üzerinde deðiþiklik yapmamýzý
  ve silmemizi saðlayan yapýlar bu baþlýk altýnda simgelenmektedir
*/

--CREATE , ALTER, DROP

-- ===CREATE=== 
--VT nesnesi oluþturmamýzý saðlar. (Database,Table,View,Trigger,StoredProc v.s)

--CREATE ile VT oluþturma

CREATE DATABASE OrnekVT2

CREATE DATABASE OrnekVT2
ON
(
	NAME = 'GG',
	FILENAME = 'D:\ides\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\GG.mdf',
	SIZE = 5,
	FILEGROWTH = 3
)

--NAME : Oluþturulacak VT nin fiziksel ismini belirliyoruz.
--FILENAME : Oluþturulacak VT dosyasýnýn fiziksel dizinini belirtiyoruz.
--SIZE : VT nin baþlangýç boyutunu mb cinsinden ayarlýyoruz.
--FILEGROWTH : VT boyutunu,baþlangýç boyutunu geçtiði durumda boyutun ne kadar artmasý gerektiðini mb cinsinden belirtiyoruz

--LOG dosyasýný oluþturma
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

--CREATE ile tablo oluþturma
USE OrnekVT2
CREATE TABLE OrnekTablo
(
	Kolon1 INT,
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

--Eðer kolon isminde boþluk varsa köþeli parantezle yaz exp = [KOLON 1]

-- =Kolona Primary Key ve Ýdentity özelliði kazandýrma
CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

-- ===ALTER=== 
--  VT nesnesi üzerinde deðiþiklik yapmamýzý saðlar. 

-- ===ALTER ile VT güncelleme

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

-- ALTER ile tablodaki kolonu güncelleme

ALTER TABLE OrnekTablo
ALTER COLUMN Kolon4 INT

-- ALTER ile tablodaki kolonu silme

ALTER TABLE OrnekTablo
DROP COLUMN Kolon4 

-- ALTER ile tabloya constraint ekleme

ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekConstraint DEFAULT 'Boþ' FOR Kolon2

-- ALTER ile tablodaki constrainti silme

ALTER TABLE OrnekTablo
DROP CONSTRAINT OrnekConstraint 

-- SP_RENAME ile Tablo adý güncelleme
SP_RENAME 'OrnekTablo','OrnekTabloYeni'

-- SP_RENAME ile Kolon güncelleme
SP_RENAME 'OrnekTablo.Kolon1','Kolon12','COLUMN'

-- ===DROP===

-- VT yi silmemizi saðlar. 

DROP TABLE OrnekTablo2
DROP DATABASE OrnekVT2


-------------------------------------------------------DDL FINISH------------------------------------------------

--CONSTRAITS (KISITLAYICILAR)

--Constraintler sayesinde tablolar üzerinde istediðimiz þartlar ve durumlara göre kýsýtlama yapabiliyoruz.

--1.DEFAULT CONSTRAINT
--2.CHECK CONSTRAINT
--3.PRIMARY KEY CONSTRAINT
--4.UNIQUE CONSTRAINT
--5.FOREIGN KEY CONSTRAINT


-- === DEFAULT CONSTRAINT ===
--Default Constraintler sayesinde kolona bir deðer girilmediði takdirde varsayýlan olarak ne girilmesi gerektiðini belirtebiliyoruz

CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon1Constraint DEFAULT 'Boþ' FOR Kolon1

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Constraint DEFAULT -1 FOR Kolon2


-- === CHECK CONSTRAINT ===
--Bir kolona girilecek olan verinin belirli bir þarta uymasýný zorunlu tutar.

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- DÝKKAT!!!!
/*
  Check constraint oluþturulmadan önce ilgili tabloda þarta aykýrý deðerler varsa constraint oluþturulmayacaktýr ! ! !
  Ancak önceki kayýtlarý görmezden gelip genede Check constraint uygulamak istiyorsak "With Nocheck komutu kullanýlýr
*/

ALTER TABLE OrnekTablo
WITH NOCHECK ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- === PRIMARY KEY CONSTRAINT ===
-- Primary Key Constraint ile; o kolona eklenen primary key ile, baþka tablolarda 
-- Foreign Key oluþturarak iliþki kurmamýz mümkün olur.
-- Bunun yanýnda o kolonun taþýdýðý verinin tekil olacaðý da garanti edilmiþ olur. 
-- Primary Key constraint ile ayrýca CLUSTERED index oluþturulmuþta olur,

-- DÝKKAT!!!
-- PK Constraint Kullanýlan kolon PK özelliðine sahip olmamalýdýr

ALTER TABLE OrnekTablo
ADD CONSTRAINT PrimaryId PRIMARY KEY (ID)

-- === UNIQUE CONSTRAINT ===
--Unique constraintlerin tek amacý,Belirttiðimiz deðerlerin tekil olmasýdýr

ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekTabloUnique UNIQUE (Kolon2)

--"Kolon2" kolonuna unique constraint verilerek tekil hale getirilmiþtir.Bundan sonra iki tane ayný veriden kayýt yapýlamaz


-- === FOREIGN KEY CONSTRAINT===
/*
  Tablolarýn birbiri arasýnda iliþki kurmasýný saðlar.Bu iliþki neticesinde; foreign key olan kolondaki karþýlýðýnýn boþa 
  düþmemesi için primary key kolonu olan tablodan veri silinmesi, güncellenmesini engeller
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

--Þu durumda,delete ve update iþlemlerinden kolondaki veriler etkilenmez
--Davranýþýný deðiþtirmek için aþaðýdaki komutlar kullanýlýr

-- == Cascade 
-- Ana tablodaki kayýt silindiðinde ya da güncellediðinde, iliþkili kolondaki karþýlýðýnda otomatik olarak silinir ya da güncellenir 

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE CASCADE
ON UPDATE CASCADE

-- == Set Null 
-- Ana tablodaki kayýt silindiðinde ya da güncellediðinde, iliþkili kolondaki karþýlýðýnda "Null" deðer basýlýr

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET NULL
ON UPDATE SET NULL

-- == Set Default 
/*
   Ana tablodaki kayýt silindiðinde ya da güncellediðinde, iliþkili kolondaki karþýlýðýnda o kolonun default deðer basýlýr
   Bu default deðer dediðimiz default tipte bir constrainttir.Bunu kendimiz oluþturabiliriz.
*/

ALTER TABLE Ogrenciler
ADD CONSTRAINT DefaultOgrenciler DEFAULT -1 FOR DersId

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT

--Bu ayarlar verildiði takdirde "no action" özelliði geçerlidir 

--------------------------------------------CONSTRAINT FINISH-------------------------------------------

--VARIABLES(Deðiþkenler)

--DECLARE Keywördü ile tanýmlanýrlar

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


-- Deðiþken deðeri okuma

DECLARE @y INT
SET @y = 3
PRINT @y
SELECT @Y

-- Sorgu sonucu gelen verileri deðiþkenle elde etme

USE Northwind
DECLARE @Adi NVARCHAR(MAX),@SoyAdi NVARCHAR(MAX)
SELECT  @Adi=Adi,@SoyAdi=SoyAdi FROM Personeller WHERE PersonelId = 1
SELECT  @Adi,@SoyAdi

--1.Sorgu sonucu gelen satýr sayýsý 1 adet olmalýdýr
--2.Kolonlardaki verilerin tipleri ne ise o verileri temsil edecek deðiþkenlerin tipleride benzer olmalýdýr

-----------------------------------------------VARIABLES FINISH--------------------------------------------

--Batch Kavramý Go

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

-- If Yapýsý 

-- = : Eþitse
-- <> : Eþit deðilse
-- < : Küçükse
-- > : Büyükse

--Tek satýrlýk çalýþma

DECLARE @Isim NVARCHAR(50)
SET @Isim = 'Ozkan'

IF @Isim = 'Ozkan'
   PRINT 'Evet'
ELSE
   PRINT 'Hayýr'


-- BEGIN END yapýsý(SCOPE)

DECLARE @sayi1 INT = 3
DECLARE @sayi2 INT = 5

IF @sayi1 < @sayi2
   BEGIN
		PRINT 'Evet sayi1 sayi2 den küçüktür'
		SELECT @sayi1 [Sayý 1],@sayi2 [Sayý 2]
   END
ELSE
    BEGIN
		PRINT 'Hayýr sayi1 sayi2 den küçük deðildir'
		SELECT @sayi1 [Sayý 1],@sayi2 [Sayý 2]
    END


--Örnek 1 
--Müþteriler tablosunda Amerikalý(USA) müþteri var mý?

USE Northwind

SELECT * FROM Musteriler WHERE Ulke = 'USA'

IF @@ROWCOUNT > 0
   PRINT 'Evet'
ELSE
   PRINT 'Hayýr'

--Örnek 2
--Adý 'Özkan' SoyAdý 'Parlakkýlýç'olan personel var mý ? Varsa evet var desin. Yoksa Kaydetsin.

DECLARE @Adi NVARCHAR(MAX) = 'Özkan',@SoyAdi NVARCHAR(MAX) = 'Parlakkýlýç'
SELECT * FROM Personeller WHERE Adi = @Adi AND SoyAdi = @SoyAdi

IF @@ROWCOUNT > 0
	PRINT 'Evet var'
ELSE
	BEGIN 
		PRINT 'Hayýr yok'
		INSERT Personeller(Adi,SoyAdi) VALUES (@Adi,@SoyAdi) 
	END



-- IF - ELSE IF - ELSE Yapýsý

DECLARE @Yas INT = 25

IF @Yas>25
	PRINT 'Yaþýnýz 25 den büyük'
ELSE IF @Yas BETWEEN 15 AND 25
	PRINT 'Yaþýnýz 15 - 20 arasýnda'
ELSE IF @Yas BETWEEN 5 AND 15
	PRINT 'Yaþýnýz 5 - 15 arasýnda'
ELSE
	PRINT 'Yaþýnýz 5 den küçük'


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

-- Geçici tablolar - Temporary Tables
/*
   Genellikle bir SQL Server üzerinde farklý lokasyonlarda birden fazla kiþi çalýþtýðý durumlarda ya da verilerin test amaçlý geçici bir yerlerde
   tutulmasý, iþlenmesi amacýyla kullanýlan yapýlardýr.
*/

-- Bilinen tablo yapýsýnýn aynýsýný saðlarlar. Tek farklarý fiziksel olarak oluþmazlar. Sadece bellekte geçici oluþurlar.

-- Select, Update vs. Yapýlabilir. Ýliþki kurulabilir

-- Sunucu kapatýldýðýnda ya da oturum sahibi oturumu kapattýðýnda bellekten silinirler

-- #Bir tabloyu fiziksel olarak kopyalama

SELECT * INTO GeciciPersoneller from Personeller
-- Bu þekildeki bir kullanýmda sadece PK ve FK constraintler oluþturulmazlar.
-- Geri kalan her þey fiziksel olarak oluþturulur.

-- #Bir tabloyu # ifadesi ile belleðe geçici olarak kopyalama
SELECT * INTO #GeciciPersoneller from Personeller

SELECT * FROM #GeciciPersoneller
INSERT #GeciciPersoneller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç')
UPDATE #GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM #GeciciPersoneller  WHERE PersonelID = 11

-- Geçici tablo üzerinde her türlü iþlemi yapabiliyoruz.
-- # ile oluþturulan tablolar, o an SQL Serverda oturum açmýþ kiþinin sunucu belleðinde oluþur.
-- Sadece oturum açan þahýs kullanýlabilir
-- Eðer oturum açan þahýs SQL Server dan disconnect olursa bu tablo bellekten silinir

-- #Bir tabloyu ## ifadesi ile belleðe geçici olarak kopyalama
SELECT * INTO ##GeciciPersoneller from Personeller

SELECT * FROM ##GeciciPersoneller
INSERT ##GeciciPersoneller(Adi,SoyAdi) VALUES ('Özkan','Parlakkýlýç')
UPDATE ##GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM ##GeciciPersoneller  WHERE PersonelID = 11


-- ## ile oluþturulan tablolar, o an SQL Serverda oturum açmýþ kiþinin sunucu belleðinde oluþur.
-- Bu tabloyu oturum açan þahýs ve onun SQL Serverýnda dýþardan ulþan 3.þahýslar kullanabilir
-- Eðer oturum açan þahýs SQL Server dan disconnect olursa bu tablo bellekten silinir
-- Diðer bütün özellikleri # ile oluþturulan tablolarla aynýdýr


--------------------------------------- Temporary Tables Finish ----------------------------------------


-- Uniqueidentifier Veri tipi

-- int, varchar vs. gibi bir veri tipidir
-- Aldýðý deðer, rakamlar ve harflerden oluþan çok büyük bir sayýdýr
-- Bundan dolayý bu kolona ayný deðerin birden fazla gelmesi neredeyse imkansýzdýr
-- O yüzden tekil veri oluþturmak için kullanýlýr 

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

-- === Kullaným Amacý

-- Genellikle karmaþýk sorgularýn tek bir sorgu üzerinden çalýþtýrýlabilmesidir
-- Bu amaçla raporlama iþlemlerinde kullanýlabilir
/*
   Ayný zamanda güvenlik ihtiyacý olduðu durumlarda herhangi bir sorgunun 2. - 3. þahýslardan
   gizlenmesi amacýylada kullanýlýrlar
*/

-- === Genel özellikleri ===

-- Herhangi bir sorgunun sonucu tablo olarak ele alýp, ondan sorgu çekilebilmesini saðlarlar
-- INSERT , UPDATE ve DELETE yapabilirler. Bu iþlemleri fiziksel tabloya yansýtýrlar. ***Önemli
-- VIEW yapýlarý fiziksel olarak oluþturulan sorgulardýr
-- VIEW yapýlarý fiziksel sorgulardan daha yavaþ çalýþýrlar

-- Dikkat ! ! !
-- VT elemanlarý CREATE komutuyla oluþturuyorduk. VIEW yapýsýda bir VT yapýsý olduðu için oda CREATE komutuyla oluþturulur

CREATE VIEW vw_Gotur
AS

SELECT P.Adi + ' ' + P.SoyAdi [Adý Soyadý] , K.KategoriAdi [Kategori Adý],COUNT(S.SatisID) [Toplam Satýþ]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi

SELECT * FROM vw_Gotur
SELECT * FROM vw_Gotur WHERE [Adý Soyadý] LIKE '%Robert%'

-- View oluþturulurken kolonlara verilen aliaslar View den sorgu çekilirken kullanýlýr.
-- Bir yandan da view'ýn kullandýðý gerçek tablolarýn kolon isimleri, view içinde alias tanýmlanarak gizlenilmiþ olur
-- View içinde "order by" kullanýlmaz
-- "Order by" View içinde deðil , view çalýþýrken sorgu esnasýnda kullanýlmalýdýr

SELECT * FROM vw_Gotur ORDER BY [Toplam Satýþ] DESC

-- yok eðer illa view içinde "order by" kullanýcam diyorsan top komutunu kullanmalýsýn


-- Çok tavsiye edilmez performans açýsýndan

ALTER VIEW vw_Gotur
AS

SELECT TOP 100 P.Adi + ' ' + P.SoyAdi [Adý Soyadý] , K.KategoriAdi [Kategori Adý],COUNT(S.SatisID) [Toplam Satýþ]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi 
ORDER BY [Toplam Satýþ] DESC

SELECT * FROM vw_Gotur

-- INSERT , UPDATE ve DELETE yapabilirler. Bu iþlemleri fiziksel tabloya yansýtýrlar. ***Önemli

CREATE VIEW OrnekViewPersoneller
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

INSERT OrnekViewPersoneller VALUES('Özkan','Parlakkýlýç','Student')
UPDATE OrnekViewPersoneller SET Adi = 'Ekrem' WHERE Adi = 'Özkan'
DELETE FROM OrnekViewPersoneller WHERE Adi = 'Özkan'


-- == WITH ENCRYPTION  ==

-- Eðer yazdýðýnýz view in kaynak kodlarýný,Object Explorer penceresinde "Views" kategorisine sað týlayarak 
-- Design Modda açýp görüntülemesini istemiyorsak "With Encryption" komutu ile view oluþturmalýyýz
-- Dikkat ! ! !
/*
   "With Encryption" iþleminden sonra view'i oluþturan kiþide dahil göremez. Geri dönüþü yoktur.
   Ancak view'i oluþturan þahsýn komutlarýn yedeðini bulundurmasý gerekmektedir. 
   Ya da "With Encryption" olmaksýzýn view yapýsýný yeniden alterlamalýyýz
*/
-- Dikkat ! ! !
--Bir dikkat edilmesi gereken þey de "With Encryption" ifadesi AS den önce yazýlýr

CREATE VIEW OrnekViewPersoneller
WITH ENCRYPTION 
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

-- Bu iþlem yaptýktan sonra Design Modu kapatýlmýþtýr


-- == WITH SCHEMABINDING  ==
/*
   Eðer view'in kullandýðý esas fiziksel tablolarýn kolon isimleri bir þekilde deðiþtirilir, kolonlarý silinir ya da tablo yapýsý bir
   þekilde deðiþikliðe uðrarsa view'in çalýþmasý artýk mümkün olmayacaktýr
*/
-- View'in kullandýðý tablolar ve kolonlarý bu tarz iþlemler yapabilmesi ihtimaline karþý koruma altýna alýnabilir
-- Bu koruma "WITH SCHEMABINDING" ile yapýlabilir
-- "WITH SCHEMABINDING" ile view Create ya da Alter edilirken, view'in kullandýðý tablo, schema adýyla birlikte verilmelidir.
-- Örneðin, dbo(database owner) bir þema adýdýr. Þemalar C# taki namespaceler gibi düþünülebilir
-- "WITH SCHEMABINDING" komutuda AS den önce yazýlmalýdýr

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
-- View'in içerisindeki sorguda bulunan þarta uygun kayýtlarýn INSERT edilmesine müsade edilip
-- uymayan kayýtlarýn müsaade edilmemesini saðlayan bir komuttur

USE Northwind
CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'

INSERT OrnekView2 VALUES ('Ahmet','Aksu')
INSERT OrnekView2 VALUES ('Mehmet','Aksu')

-- "WITH ENCRYPTION" ve "WITH SCHEMABINDING" komutlarýndan farklý olarak AS den sonra Where þartýnýn sonunda yazýlýr

CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'
WITH CHECK OPTION


----------------------------------------------------------- VIEW FINISH ------------------------------------------------------------

-- FUNCTION 

-- SCALAR FUNCTION && INLINE FUNCTION

-- T-SQL'de iki tip fonksiyon vardýr.
-- SCALAR FUNCTION = Geriye istediðimiz bir tipte deðer döndüren fonksiyon
-- INLINE FUNCTION = Geriye tablo döndüren fonksiyon

-- Bu iki fonksiyonda fiziksel olarak VT'de oluþurlar
-- CREATE ile oluþurlar
-- Üzerinde çalýþýlan VT'nin Programmability -> Functions kombinasyonundan oluþturulan fonksiyonlara eriþebiliriz.


-- == 1.Scalar Function ==

-- == Fonksiyon tanýmlama ==
-- Scalar fonksiyonlara tanýmladýktan sonra Programmability -> Function -> Scalar-valued Functions kombinasyonundan eriþilebilir


CREATE FUNCTION Topla(@Sayi1 INT, @Sayi2 INT) RETURNS INT
AS
	BEGIN
		RETURN @Sayi1 + @Sayi2
	END

SELECT dbo.Topla(2,5)
PRINT dbo.Topla(10,10)

-- Örnek
-- Herhangi bir ürünün %18 KDV dahil olmak üzere toplam maliyeti getiren fonksiyonu yazalým

CREATE FUNCTION Maliyet(@BirimFiyati INT, @StokMiktar INT) RETURNS NVARCHAR(MAX)
AS
	BEGIN
		DECLARE @Sonuc INT = (@BirimFiyati * @StokMiktar * 1.18)
		RETURN @Sonuc
	END

SELECT dbo.Maliyet(10,20) AS Maliyet

-- == 2.Inline Function ==
-- Geriye tablo döndüren fonksiyon
/*
   Geriye tablo döndüreceði için bu fonksiyonlar çalýþtýrýlýrken sanki bir tablodan 
   sorgu çalýþtýrýlýr gibi çalýþtýrýlýrlar. Bu yönleriyle viewlara benzerler. View ile
   yapýlan iþlevler Inline Functions'larla yapýlabilirler
*/
-- Genellikle viewle benzer iþlevler için View kullanýlmasý tavsiye edilir

-- == Fonksiyon tanýmlama ==
-- Inline fonksiyonlara tanýmladýktan sonra Programmability -> Function -> Table-valued Functions kombinasyonundan eriþilebilir

--Dikkat ! ! !
--INLINE FUNCTIONS oluþturulurken BEGIN-END yapýsý kullanýlmaz

CREATE FUNCTION tc_Gonder(@Ad NVARCHAR(20),@Soyad NVARCHAR(20)) RETURNS TABLE
AS
	RETURN SELECT Adi,SoyAdi FROM Personeller WHERE Adi = @Ad AND SoyAdi = @Soyad

SELECT * FROM dbo.tc_Gonder('Özkan','Parlakkýlýç')


-- == Fonksiyonlarda WITH ENCRYPTION ==
/*
-- Eðer ki yazmýþ olduðumuz fonksiyonlarýn kodlaýna 2. -3. þahýs engellemek istiyorsak "WITH ENCRYPTION" 
-- komutunu kullanmalýyýz 
*/
/*
   "WITH ENCRYPTION" iþleminden sonra fonksiyonu oluþturan kiþide dahil kimse 
   komutlarý göremez. Geri dönüþü yoktur. Ancak fonk. oluþturan kiþinin komutlarýn yedeðini bulundurmasý gerekmektedir
   Ya da "WITH ENCRYPTION" olmaksýzýn fonksiyonu yeniden alterlamalýyýz.
*/
-- "WITH ENCRYPTION" AS den önce kullanýlmalýdýr

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

-- Herhangi bir kolonda fonk. kullanýlarak otomatik hesaplanabilir kolonlar (Computed Column) oluþturmak mümkündür

-- Örnek 
-- Çýktý olarak "_____ kategorisindeki _____ ürünün toplam fiyatý : _____ 'dýr." þeklinde bir fonksiyon yazalým.

CREATE FUNCTION Rapor(@Kategori NVARCHAR(MAX),@UrunAdi NVARCHAR(MAX),@BirimFiyati INT, @Stok INT)
RETURNS NVARCHAR(MAX)
AS 
	BEGIN
		DECLARE @Rapor NVARCHAR(MAX) = @Kategori + ' kategorisindeki ' + @UrunAdi + ' ürünün toplam fiyatý ' + 
		CAST(@BirimFiyati * @Stok AS NVARCHAR(MAX)) + ' dýr. ' 
		RETURN @Rapor
	END

SELECT dbo.Rapor(K.KategoriAdi,U.UrunAdi,U.BirimFiyati,U.HedefStokDuzeyi) AS RAPOR
FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID = K.KategoriID

------------------------------------ FUNCTION FINISH ---------------------------------------------

-- STORED PRODUCURE (Saklý yordamlar)

-- == Genel Özellikleri ==

/* 
   Normal sorgulardan daha hýzlý çalýþýrlar
   Çünkü normal sorgular Execute edilirken "Execute Plan" iþlemi yapýlýr. Bu iþlem
   sýrasýnda hangi tablodan veri çekilecek, hangi kolonlar gelecek, býnlar nerede v.s gibi iþlemler yapýlýr
   Bir sorgu her çalýþtýrýldýðýnda bu iþlemler aynen tekrar tekrar yapýlýr.
   Fakat sorgu Stored Procudure olarak çalýþtýrýlýrsa bu iþlem sadece bir kere yapýlýr ve o da ilk çalýþma esnasýndadýr.
   Diðer çalýþtýrmalarda ise bu iþlemler yapýlmaz .
   Bundan dolayý hýz ve performansta artýþ saðlanýr
*/
-- Ýçerisinde SELECT, DELETE,UPDATE ve INSERT iþlemleri yapýlabilir.
-- Ýç içe kullanýlabilir
-- Ýçlerinde fonksiyon oluþturulabilir
/* 
   Sorgularýmýzýn dýþardan alacaðý deðerler parametre olarak Stored Procudure'lere
   geçirebildiðinizden dolayý , sorgularýmýzýn "SQL Injection" yemelerinide önlemiþ oluruz
   Bu yönleriyle de daha güvenildirler
*/

-- SP fiziksel bir VT nesnesidir. Haliyle CREATE komutu ile oluþturulur.
-- Fiziksel olarak ilgili VT'nin Programmability -> Stored Procudure kombinasyonundan eriþilebilir

-- == Geriye deðer döndüren SP yapýsý ==

CREATE PROC UrunGetir
(
	@Fiyat Money
)AS
SELECT * FROM Urunler WHERE BirimFiyati > @Fiyat
RETURN @@ROWCOUNT

EXEC UrunGetir 70
-- Bu þekilde geriye dönülen deðeri elde etmeksizin kullanýlabilir.

DECLARE @Sonuc INT
EXEC @Sonuc = UrunGetir 70
PRINT CAST(@Sonuc AS NVARCHAR(MAX)) + ' adet ürün bu iþlemden etkilenmiþtir'


-- == Output ile deðer döndüren  ==

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


-- == Genel Örnek ==

/*
   Dýþarýdan aldýðý isim,soyisim ve þehir bilgilerini Personeller tablosunda ilgili kolonlara
   ekleyen SP yi yazýnýz
*/

CREATE PROC sp_PersonelEkle
(
	@Adi NVARCHAR(MAX),
	@SoyAdi NVARCHAR(MAX),
	@Sehir NVARCHAR(MAX)
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle 'Ekrem', 'Parlakkýlýç','Sakarya'
SELECT * FROM Personeller

-- == Parametrelere Varsayýlan Deðer ==

CREATE PROC sp_PersonelEkle2
(
	@Adi NVARCHAR(MAX) = 'Ýsimsiz',
	@SoyAdi NVARCHAR(MAX) = 'Soyadsýz',
	@Sehir NVARCHAR(MAX) = 'Þehir girilmemiþ'
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle2 'Ekrem', 'Parlakkýlýç','Sakarya'
-- Burada varsayýlan deðerler devreye girmemektedir
SELECT * FROM Personeller

EXEC sp_PersonelEkle2 
/*
   Normalde bu þekilde parametrelere deðer göndermeksizin çalýþmamasý lazým
   ama varsayýlan deðerler tanýmda belirtildiði için devreye girmektedir
*/

EXEC sp_PersonelEkle2 'Ýbrahim'

-- @Adi parametresi 'Ýbrahim' deðerini alacaktýr.Diðer parametreler ise varsayýlan deðerleri alacaktýr

-- EXEC komutu

EXEC('SELECT * FROM Personeller')
SELECT * FROM Personeller

-- Yanlýþ kullaným 
-- 2 EXEC komutu birbirinden baðýmsýz çalýþýr ve print ekrena sayac deðerini basamaz deðiþken tanýmlanmamýþtýr
EXEC ('DECLARE @Sayac INT = 0')
EXEC ('PRINT @Sayac')

-- Doðru kullaným 

EXEC ('DECLARE @Sayac INT = 0 PRINT @Sayac')

-- == SP içerisinde nesne oluþturma

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
   Bir tabloda INSERT,UPDATE ve DELETE iþlemleri gerçekleþtirildiðinde devreye giren yapýlardýr.
   Bu iþlem sonucunda veya sürecinde devreye girerler
*/

-- *INSERTED TABLE
/*
   Eðer bir tabloda Insert iþlemi yapýlýyorsa arka planda iþlemler ilk önce RAM'de oluþturulan 
   inserted isimli bir tablo üzerinde yapýlýr.Eðer iþlemde bir problem yoksa inserted tablosundaki 
   veriler fiziksel tabloya insert edilir. Ýþlem bittiðinde RAM'de oluþturulan bu inserted tablosu
   silinir.
*/

-- *DELETED TABLE
/*
   Eðer bir tabloda Delete iþlemi yapýlýyorsa arka planda iþlemler ilk önce RAM'de oluþturulan 
   deleted isimli bir tablo üzerinde yapýlýr.Eðer iþlemde bir problem yoksa deleted tablosundaki 
   veriler fiziksel tablodan silinir. Ýþlem bittiðinde RAM'den bu deleted tablosuda
   silinir.
*/

-- Eðer bir tabloda Update iþlemi yapýlýyorsa RAM'de uptadet isimli bir tablo OLUÞTURULMAZ ! ! ! 
-- SQL Server'da ki Update mantýðý önce silme, sonra eklemedir.
/*
   Eðer bir tabloda update iþlemi yapýlýyorsa arka planda RAM'de hem deleted hem de inserted tablolarý
   oluþturulur ve bunlar üzerinde iþlemler yapýlýr
*/
/*
   NOT : Update yaparken güncellenen kaydýn orjinali deleted tablosunda , güncellendikten sonraki hali ise
   inserted tablosunda bulunmaktadýr. Çünkü güncelleme demek kaydý önce silmek sonra eklemek demektir.
*/

/*
   Deleted ve inserted tablolarý, ilgili sorgu sonucu oluþtuklarý için o sorgunun kullandýðý
   kolonlara da sahþp olur. Böylece deleted ve inserted tablolarýnda select sorgusu yapmak mümkündür.
*/

-- DÝKKAT ! ! !
-- Tanýmlanan Triggerlara ilgili tablonun içerisindeki Triggers sekmesi altýndan eriþebilir.

CREATE TRIGGER OrnekTrigger
ON Personeller
AFTER INSERT 
AS 
SELECT * FROM Personeller

INSERT Personeller(Adi,SoyAdi) VALUES('Özkan','Parlakkýlýç')


-- Örnek 1 
-- Tedarikçiler tablosundan bir veri silindiðinde tüm ürünlerin fiyatý 10 artsýn

CREATE TRIGGER TriggerTedarikciler
ON Tedarikciler
AFTER DELETE 
AS 
UPDATE Urunler SET BirimFiyati = BirimFiyati + 10
SELECT * FROM Urunler

DELETE FROM Tedarikciler WHERE TedarikciID = 30

-- Örnek 2 
-- Tedarikçiler tablosundan bir veri güncellendiðinde,kategoriler tablosunda "Meyve kokteyli" adýnda bir kategori oluþsun

CREATE TRIGGER TrgTedarikciUpdate
ON Tedarikciler
AFTER UPDATE 
AS 
INSERT Kategoriler(KategoriAdi) VALUES('Meyve kokteyli')
SELECT * FROM Kategoriler

UPDATE Tedarikciler SET MusteriAdi = 'Ekrem' WHERE MusteriAdi = 'Owner'

-- Örnek 3
/*
   Personeller tablosundan bir kayýt silindiðinde silinen kaydýn adý, soyadý, kim tarafýndan ve
   hangi tarihte silindiði baþka bir tabloya kayýt edilsin. Bir nevi log tablosu gibi
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
INSERT LogTablosu VALUES ('Adý ve Soyadý' + @Adi + ' ' + @SoyAdi + ' olan personel ' + SUSER_NAME()
						  + ' tarafýndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde silinmiþtir.')


DELETE FROM Personeller WHERE PersonelID = 11

-- Örnek 4
/*
   Personeller tablosunda update gerçekleþtiði anda devreye giren ve bir log tablosuna "Adý ..."
   olan personel ... yeni adýyla deðiþtirilerek ... kullanýcý tarafýndan ... tarihinde güncellendi.
   Kalýbýnda bir rapor yazan trg yazalým
*/


CREATE TRIGGER TrgPersonelUpdate
ON Personeller
AFTER UPDATE 
AS 
DECLARE @EskiAdi NVARCHAR(MAX),@YeniAdi NVARCHAR(MAX)
SELECT @EskiAdi = Adi from deleted
SELECT @YeniAdi = Adi from inserted
INSERT LogTablosu VALUES ('Adý ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni adýyla deðiþtirilerek ' + SUSER_NAME()
						  + ' kullanýcý tarafýndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmiþtir.')


UPDATE Personeller SET Adi = 'Ekrem' WHERE Adi = 'Özkan'

-- === Multiple Actions Trigger ===

CREATE TRIGGER MultiTrigger
ON Personeller
AFTER DELETE,INSERT 
AS 
PRINT 'Hello'

INSERT Personeller(Adi,SoyAdi) VALUES('Özkan','Parlakkýlýç')
DELETE FROM Personeller WHERE PersonelId = 30

-- === Instead Of Triggers ===

/*
   Þu ana kadar Insert,Update ve Delete iþlemleri yapýlýrken þu þu iþlemi yap 
   mantýðýyla çalýþtýk.(Yanýnda þunu yap)
*/ 
/*
   Instead Of Triggerlar ise Insert,Update ve Delete iþlemleri yerine þu þu iþlemi yap 
   mantýðýyla çalýþmaktadýrlar.(Yerine þunu yap)
*/

-- Örnek 5
/*
   Personeller tablosunda update gerçekleþtiði anda yapýcalak güncelleþtirme yerine bir log tablosuna
   "Adý ..." olan personel ... yeni adýyla deðiþtirilerek ... kullanýcý tarafýndan ... tarihinde güncellenmek istendi.
   Kalýbýnda bir rapor yazan trg yazalým.
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
		INSERT LogTablosu VALUES ('Adý ' + @EskiAdi + ' olan personel ' + SUSER_NAME()
								  + ' kullanýcý tarafýndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmek istendi.')
	END
ELSE
	BEGIN
		INSERT LogTablosu VALUES ('Adý ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni adýyla deðiþtirilerek ' + SUSER_NAME()
								  + ' kullanýcý tarafýndan ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmek istendi.')
	END

UPDATE Personeller SET Adi = 'Özkan' WHERE Adi = 'Ekrem'

-- Örnek 6 
-- Personeller tablosunda adý "Andrew" olan kaydýn silinmesini engelleyen ama diðerlerine izin veren triggerý yazalým

CREATE TRIGGER AndrewTrigger
ON Personeller
AFTER DELETE 
AS 
DECLARE @Adi NVARCHAR(MAX)
SELECT @Adi = Adi from deleted

IF @Adi = 'Andrew'
	BEGIN
		PRINT 'Bu kaydý silemezsin'
		ROLLBACK -- Yapýlan tüm iþlemleri geri alýr
	END

DELETE FROM Personeller WHERE PersonelID = 10

-- == DDL TRIGGER

-- CREATE, ALTER ve DROP iþlemleri sonucunda veya sürecinde devreye girecek olan yapýlardýr. 

CREATE TRIGGER DDL_Trigger
ON DATABASE
FOR drop_table,alter_table,create_function,create_procudure,drop_procudure -- v.s
AS 
PRINT 'Bu iþlem gerçekleþtirilemez'
ROLLBACK

DROP TABLE LogTablosu

-- DÝKKAT ! ! !
-- DDL Triggerlara ilgili veritabanýnýn Programmability -> Database Triggers sekmesi altýndan eriþilir

-- === Trigger'ý Devre Dýþý Býrakma ===
DISABLE TRIGGER TrgPersonelRaporInstead ON Personeller
-- === Trigger'ý Aktifleþtirme ===
ENABLE TRIGGER TrgPersonelRaporInstead ON Personeller


------------------------------------------- TRIGGER FINISH -----------------------------------------

-- TRANSACTION

/*
   Birden çok iþlemin bir arada yapýldýðý durumlarda eðer parçayý oluþturan iþlemlerden herhangi birinde 
   sorun olursa tüm iþlemi iptal ettirmeye yarar
*/
/*
   Örneðin; kredi kartý ile alýþveriþ iþlemlerinde transaction iþlemi vardýr. Siz marketten ürün alýrken
   sizin hesabýnýzdan para düþülecek, marketin hesabýna para aktarýlacaktýr. Bu iþlemde hata olmamasý
   gerekir ve bundan dolayý bu iþlem transaction bloðunda gerçekleþtirilmelidir. Bu esnada herhangi bir sorun olursa 
   bütün iþlemler transaction tarafýndan iptal edilir.
*/

-- Begin Tran veya Begin Transaction : Transaction iþlemini baþlatýr.

-- Commit Tran : Transaction iþlemini baþarýyla sona erdirir. Ýþlem(ler)i gerçekleþtirir
-- Rollback Tran: Transaction iþlemini iptal eder. Ýþlem(ler)i geri alýr.

-- Commit Tran yerine Commit yazýlabilir.
-- Rollback Tran yerine Rollback yazýlabilir.

/*
   Normalde default olarak her þey Begin Tran ile baþlayýp, Commit Tran ile biter. !!!
   Biz bu yapýlarý kullanmasak bile !!!
*/

INSERT Bolge VALUES(5,'Sakarya') -- Varsayýlan olarak Tran kontrolünde bir iþlemdir.Sonuç olarak da Commit ile biter.

BEGIN TRAN Kontrol
INSERT Bolge VALUES(5,'Sakarya') 
COMMIT

-- Transaction'a isim vermek zorunda deðiliz.

BEGIN TRAN
INSERT Bolge VALUES(5,'Sakarya') 
COMMIT

-- Örnek

BEGIN TRAN Kontrol
DECLARE @i INT
DELETE FROM Personeller WHERE PersonelID > 20
SET @i = @@ROWCOUNT
IF @i = 1
	BEGIN
		PRINT 'Kayýt silindi.'
		COMMIT
	END
ELSE
	BEGIN
		PRINT 'Ýþlem baþarýsýz.'
		ROLLBACK
	END


-- == Banka uygulamasý ==

-- Örnek
/*
   Ýki adet banka tablosu oluþturalým. Bankalar arasý havale iþlemi gerçekleþtirelim. Ve bu iþlemleri
   yaparken tran kullanalým
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
				PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta gönderilmek istenenden az para mevcuttur.'
				ROLLBACK
			END
		ELSE
			BEGIN
				IF @BankaKime = 'BBanka'
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' deðerinde para havale edilmiþtir.'
						PRINT 'Son deðerler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
						+ CAST(@AlanBakiye AS NVARCHAR(MAX))
						COMMIT
					 END
			     ELSE
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' deðerinde para havale edilmiþtir.'
						PRINT 'Son deðerler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
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
					PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta gönderilmek istenenden az para mevcuttur.'
					ROLLBACK
				END
			ELSE
				BEGIN
					IF @BankaKime = 'ABanka'
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' deðerinde para havale edilmiþtir.'
							PRINT 'Son deðerler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
							+ CAST(@AlanBakiye AS NVARCHAR(MAX))
							COMMIT
						END
					ELSE
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' deðerinde para havale edilmiþtir.'
							PRINT 'Son deðerler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' sýndaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralý hesapta kalan bakiye :'
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
		  INSERT ABankaRaporTablosu VALUES ('A bankasýndaki ' + @AlanHesapNo + ' nolu hesap '
		                                 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' + @EskiBakiye + ' TL den ' + 
										 + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARÝHÝNDE HESAP GÜNCELLENMÝÞTÝR.')
	END
ELSE
	BEGIN
		PRINT @AlanHesapNo
		INSERT ABankaRaporTablosu VALUES ('A bankasýndaki ' + @GonderenHesapNo + ' nolu hesap ' 
		                                 + @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL göndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARÝHÝNDE HESAP GÜNCELLENMÝÞTÝR.')
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
		INSERT BBankaRaporTablosu VALUES ('B bankasýndaki ' + @AlanHesapNo + ' nolu hesap ' 
										 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' 
										 + @EskiBakiye + ' TL den ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARÝHÝNDE HESAP GÜNCELLENMÝÞTÝR.')
	END
ELSE
	BEGIN
		INSERT BBankaRaporTablosu VALUES ('B bankasýndaki ' + @GonderenHesapNo + ' nolu hesap ' 
										 +  @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL göndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARÝHÝNDE HESAP GÜNCELLENMÝÞTÝR.')
	END



------------------------------------------------ TRANSACTION FINISH ------------------------------------------------

-- SQL SERVER VT yedeði alma ve yükleme

-- 1.YOL
-- Backup ile yedek alma
-- Restore ile yedeði yükleme

-- 2.YOL (Tavsiye edilen yöntem)
-- Generate Scripts