USE Northwind

--Select Sorgularında (Where) Şartı Yazmak

SELECT * FROM Personeller

--Personeller tablosunda şehri London olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London'

--Personeller tablosunda bağlı .alıştığı kişi sayısı 5 ten küçük olanları listeleyelim.
SELECT * FROM Personeller WHERE BagliCalistigiKisi < 5

--Personeller tablosunda şehri London ve ülkesi UK olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' AND Ulke = 'UK'

--Personeller tablosunda UnvanEki Mr. olan veya şehri Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'Seattle' OR UnvanEki = 'Mr.'

--Personeller tablosunda Adi Robert. olan ve King Seattle olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Adi = 'Robert' AND SoyAdi = 'King'

--PersonelID'si 5'ten küçük olanları getir
SELECT * FROM Personeller WHERE PersonelID = 5

--PersonelID'si 5'ten büyük ve eşit olan tüm personelleri getir
SELECT * FROM Personeller WHERE PersonelID >= 5

--1993 yılında işe başlayanları getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) = 1993

--1992 yılından sonra işe başlayanları getir
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi) > 1992

--Doğum tarihi ayın 29'u olmayanları başlayanları getir
SELECT * FROM Personeller WHERE Day(DogumTarihi) <> 29

--Doğum yılı 1950-1960 yılları arasındakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) > 1950 AND YEAR(DogumTarihi) < 1960

--Personeller tablosunda yaşadığı şehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir = 'London' OR Sehir = 'Tacoma' OR Sehir = 'Kirkland'

---------------------------------------WHERE FINISH---------------------------------------------

--BETWEEN 

--Doğum yılı 1950-1960 yılları (dahil) arasındakileri olan personelleri getir 
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) BETWEEN  1950 AND 1960

--IN 
--Personeller tablosunda yaşadığı şehir London,Tacoma veya Kirkland olan verileri listeleyelim.
SELECT * FROM Personeller WHERE Sehir IN('London','Tacoma','Kirkland')


----------------------------------------BETWEEN AND IN FINISH---------------------------------------


--LIKE 

--% (NOT IMPORTANT GENERAL) OPERATOR

--İsminin baş harfi j olan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'j%'

--İsminin son harfi y ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%y'

--İsminin  son 3 harfi ert ile biten personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%ert'

--İsminin  baş harfi r olan ve son harfi t ile biten personeller, getir
--Gereksiz Kullanım
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%' AND Adi LIKE '%t'
--Daha iyi çözüm
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'r%t'


--İsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--İsminin baş harfi n ve içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'n%an%'

--İsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'

--İsminin içinde an geçen personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '%an%'


-- _(NOT IMPORTANT SPECIAL) OPERATOR

--İsmini ilk harfi a ikinci harfi farketmez ve üçüncü harfi d olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'a_d%'

--İsmini ilk harfi m ikinci-üçüncü-dördüncü harfi farketmez beşinci harfi a olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE 'm___a%'

--[] (or) OPERATOR
--İsmini ilk harfi n ya da m ya da r olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[nmr]%'

--İsminin içerisinde a ya da i olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '%[ai]%'

--[*-*] (Alfabetik Arasında) OPERATOR

--İsminin baş harfi a ile k arasında alfabetik sıraya göre herhangi bir harf olan personeli getir
SELECT * FROM Personeller WHERE Adi LIKE '[a-k]%'

-- [^*] (NOT) OPERATOR

--İsminin baş harfi a olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^a]%'


--İsminin baş harfi an olmayan personeller, getir
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE '[^an]%'

--Excape(Kaçış) Karakterleri
/*
  Like sorgularında kullandığımız %, _, [] gibi özel ifadeler eğer ki verilerimiz içerisinde geçiyorsa 
  sorgulama esnasında hata ile karşılaşabiliriz.Böyle durumlarda bu ifadelerin özel ifade olup 
  olmadığını escape ila belirleyebiliriz
*/

--Two Method

--[] Operatörü ile
--Escape Komutu ile

/*
  Alt çizgi ile başlayan isimler getirilmek istendiğinde sisteme bunu belirtmeliyiz 
  aşağıdaki kullanım yannlış kullanımdır.(Sistem tüm kayıtları döndürür) 
*/
--Select * from Personeller WHERE Adi LIKE '_%'

--Alt çizgi ile başlayan isimleri getir
--Doğru Kullanımlar 
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

--LEFT : Soldan(baştan) belirtilen karakter sayısını getirir
SELECT LEFT(Adi,2) FROM Personeller

--RIGHT : Sağdan(sondan) belirtilen karakter sayısını getirir
SELECT RIGHT(Adi,3) FROM Personeller

--UPPER : Büyük harfe çevirir
SELECT UPPER(Adi) FROM Personeller

--LOWER : Küçük harfe çevirir
SELECT LOWER(Adi) FROM Personeller

--LEN : String uzunluğunu verir
SELECT LEN(Adi) as LENGTH From Personeller

--SUBSTRING : Belirtilen indexten itibaren belirli sayıda karakter getirir
SELECT SUBSTRING(Adi,3,2) FROM Personeller

--LTRIM : Soldan boşlukları kırar
SELECT '          Özkan'
SELECT LTRIM('          Özkan')

--RTRIM : Sağdan boşlukları kırar
SELECT 'Özkan             '
SELECT RTRIM('Özkan          ')

--REVERSE : Tersine çevirir
SELECT REVERSE(Adi) FROM Personeller

--REPLACE : Belirtilen ifadeyi , belirtilen ifade ile değiştir
SELECT REPLACE('MY NAME IS Özkan','Özkan','Ekrem')

--STRING_SPLIT : Birinci parametrede verilen metni ikinci parametrede verilen karaktere göre ayrıştırır. 
--Geriye value adında kolon barındıran ve satırlarında karaktere göre ayrıştırma sonucunu tutan bir tablo döner.
SELECT * FROM  STRING_SPLIT('Bu metin boşluk karakterine göre ayrıştırılacak',' ')

--PATINDEX : İlk parametrede aldığı paterni ikinci parametrede verilen strin içerisinde arar 
--ve bulduğu ilk indeki döndürür. Bulamazsa 0 döner.
SELECT PATINDEX('%R_A%', 'SAİT ORHAN')

--CHARINDEX : Belirtilen karakterin veri içinde index numarasını verir
SELECT CHARINDEX('r',Adi) FROM Personeller
SELECT MusteriAdi, CHARINDEX(' ',MusteriAdi) AS INDEX_NO FROM Musteriler

--CHARINDEX EXAMPLE
--Müşteriler tablosunun MusteriAdi kolonundan sadece adları çekelim
Select MusteriAdi from Musteriler
Select SUBSTRING(MusteriAdi,0,CHARINDEX(' ',MusteriAdi)) from Musteriler
--Müşteriler tablosunun MusteriAdi kolonundan sadece soyadları çekelim
Select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi),LEN(MusteriAdi)-CHARINDEX(' ',MusteriAdi)-1) AS SOYAD from Musteriler


----------------------------------------------------STRING FUNCTION FINISH----------------------------------------------------- 

--NUMERICAL TRANSACTIONS(SAYISAL ISLEMLER)

SELECT 3+2
SELECT 3*3
SELECT 4/2
SELECT 9-7

--PI : Pi sayısını verir
SELECT PI()

--SIN : Sinüs Alır
SELECT SIN(PI())

--POWER : Üs alır
SELECT POWER(2,3)

--ABS: Mutlak alır
SELECT ABS(-12)

--RAND : 0-1 arası Random sayı atar
SELECT RAND()

--FLOOR : Yuvarlama yapar
--0-100 arası sayı üretir
SELECT FLOOR(RAND()*100)


-----------------------------------NUMERICAL TRANSACTIONS-----------------------------------


--DATE FUNCTION 

--GETDATE : Bu günün tarihini verir
SELECT GETDATE()

--DATEADD : Verilen tarihe gün ay yıl ekler
SELECT DATEADD(DAY,999,GETDATE())
SELECT DATEADD(MONTH,999,GETDATE())
SELECT DATEADD(YEAR,999,GETDATE())

--DATEDIFF : İki tarih arası farkı hesaplar 
SELECT DATEDIFF(DAY,'09-07-1999',GETDATE())
SELECT DATEDIFF(MONTH,'09-07-1999',GETDATE())
SELECT DATEDIFF(YEAR,'09-07-1999',GETDATE())

--DATEPART : Verilen tarihin haftanın,ayın yahut yılın kaçıncı günü olduğunu hesaplar
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

--Her bir kategoriden kaç tane var sırayla getir
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID

--Her bir kategoriden tedarikçiye göre kaç tane var sırayla getir
SELECT KategoriID,TedarikciID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
GROUP BY KategoriID,TedarikciID

--Her bir personel toplam ne kadar nakliyet ücretine sahip ve toplam kaç tane satışı var
SELECT PersonelID,SUM(NakliyeUcreti) AS TOTAL_GAIN,COUNT(*) AS COUNT_TOTAL 
FROM Satislar 
GROUP BY PersonelID

--GROUP BY -> WHERE 
SELECT * FROM Urunler

--Her bir kategoriden kaç tane var Id si 5 den büyükleri sırayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 


--GROUP BY , HAVING

SELECT * FROM Urunler

--Her bir kategoriden kaç tane var Id si 5 den büyükleri sırayla getir 
SELECT KategoriID,COUNT(*) AS COUNT_TOTAL 
FROM Urunler 
WHERE KategoriID >= 5 
GROUP BY KategoriID 
HAVING COUNT(*) > 6

-----------------------------------------GROUP BY FINISH------------------------------------------

--Merge Tables Side by Side(Tabloları Yan yana birleştirme)
--İlkel yöntem(NOT JOIN)
SELECT * FROM Personeller
SELECT * FROM Satislar
SELECT * FROM Personeller,Satislar
SELECT  P.PersonelID, S.MusteriID FROM Personeller P,Satislar S WHERE P.PersonelID = S.PersonelID


------------------------------------Merge Tables Side by Side Finish----------------------------------

--INNER JOIN

--Genel Mantık
--SELECT * FROM Tablo1 Inner Joın Tablo2 on Tablo1.İlişkiliKolon=Tablo2.İlişkiliKolon

--Tablolara Alias tanımlanabilir
--SELECT * FROM Tablo1 t1 Inner Joın Tablo2 t2 on t1.İlişkiliKolon=t2.İlişkiliKolon

--İki tabloyu ilişkisel birleştirme

--Hangi personel hangi satışalrı yapmıştır(Personeller,Satislar)
SELECT * FROM Personeller P INNER JOIN Satislar S ON P.PersonelID = S.PersonelID


--Hangi ürün hangi kategory de
SELECT U.UrunAdi,K.KategoriAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID

--Where Kullanımı
--Beverages kategorisindeki ürünlerim (Urunler,Kategory)
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages'

--Beverages kategorisindeki ürünlerimin sayısı kaçtır (Urunler,Kategory)
SELECT COUNT(U.UrunAdi) 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Beverages' 

--Seafood kategorisindeki ürünlerin listesi
SELECT U.UrunAdi 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID
WHERE K.KategoriAdi = 'Seafood'

--Hangi satışı hangi eleman yapmış(Satislar,Personeller)
SELECT S.SatisID,P.Adi + ' ' + P.SoyAdi AS Personel 
FROM Satislar S INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 

--Faks numarası "null" olmayan tedarikçilerin alınmış ürünler nelerdir(Urunler,Tedarikçiler)
SELECT T.Faks,U.UrunAdi 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID = T.TedarikciID 
WHERE T.Faks IS NOT NULL --<> 'NULL'

--İkiden fazla tabloyu ilişkisel birleştirme

--1997 yılından sonra Nancy nin satış yaptığı firma isimleri(Musteriler,Satislar,Personeller)
SELECT P.Adi,M.SirketAdi 
FROM Musteriler M INNER JOIN Satislar S 
ON M.MusteriID = S.MusteriID INNER JOIN Personeller P 
ON S.PersonelID = P.PersonelID 
WHERE P.Adi = 'Nancy' AND YEAR(S.SatisTarihi) > 1997

--Limited olan tedarikçilerden alınmış seafood kategorisindeki ürünlerimin toplam satış tutarı(Urunler,Tedarikçiler,Kategoriler)
SELECT SUM(U.HedefStokDuzeyi*U.BirimFiyati) AS TOTAL 
FROM Urunler U INNER JOIN Tedarikciler T 
ON U.TedarikciID=T.TedarikciID INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi = 'Seafood' AND T.SirketAdi LIKE '%Ltd.%'

--Aynı tabloyu ilişkisel olarak birleştirme

--Personellerimin bağlı olarak çalıştığı kişileri listele? (Personeller,Personeller)
SELECT P1.Adi,P2.Adi AS BGK 
FROM Personeller P1 INNER JOIN Personeller P2 
ON P1.BagliCalistigiKisi=P2.PersonelID

--INNER JOIN DE GROUP BY

/*
  Hangi personelin(adı ve soyadı birlikte), toplam kaç adetlik satış yapmış.Satış adedi 100 den fazla olanlar 
  ve personelin adının baş harfi M olan kayıtlar gelsin(Personeller,Satislar)
*/

SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID
WHERE P.Adi LIKE 'M%'
GROUP BY P.Adi + ' ' + P.SoyAdi 
HAVING COUNT(S.SatisID) > 100 

--Seafood Kategorisindeki ürünlerin sayısı(Urunler,Kategoriler)
SELECT K.KategoriAdi,COUNT(U.KategoriID) AS TOTAL 
FROM Urunler U INNER JOIN Kategoriler K 
ON U.KategoriID = K.KategoriID 
WHERE K.KategoriAdi='Seafood'
GROUP BY K.KategoriAdi

--Hangi personelim toplam kaç adet satış yapmış(Personeller,Satislar)
SELECT P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_ADET 
FROM Personeller P INNER JOIN Satislar S
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi 

--En çok Satış Yapan personelim
SELECT Top 1 P.Adi + ' ' + P.SoyAdi AS AD,COUNT(S.SatisID) AS TOTAL_SALE 
FROM Personeller P INNER JOIN Satislar S 
ON S.PersonelID=P.PersonelID 
GROUP BY P.Adi + ' ' + P.SoyAdi
ORDER BY COUNT(S.SatisID) DESC

/*
  Adında a harfi olan personellerin satış id si 10500 den büyük olan satışların toplam tutarını (miktar*birimfiyat) 
  en yüksek toplam tutardan en alçak tutara sıralanacak şekilde 
  ve bu satışların hangi tarihte gerçekleştiğini listele(Personeller,SatisDetayları,Satislar)
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

--Inner join'de eşleşen veriler getiriliyordu. Outer join'de ise eşleşmeyenler getirilir.

--LEFT JOIN

--Join ifadesinin solundaki tablodan tüm kayıtları getirir.Sağındaki tablodan eşleşenleri yan yana eşleşmeyenleri null olarak getirir
USE OrnekVT
SELECT * FROM Oyuncular O LEFT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O LEFT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F LEFT JOIN Oyuncular O ON O.FilmId=F.FilmId

--RIGHT JOIN

--Join ifadesinin sağındaki tablodan tüm kayıtları getirir.Solundaki tablodan eşleşenleri yan yana eşleşmeyenleri null olarak getirir
SELECT * FROM Oyuncular O RIGHT OUTER JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT OUTER JOIN Oyuncular O ON O.FilmId=F.FilmId

--veya
SELECT * FROM Oyuncular O RIGHT JOIN Filmler F ON O.FilmId=F.FilmId
SELECT * FROM Filmler F RIGHT JOIN Oyuncular O ON O.FilmId=F.FilmId

--FULL JOIN

--Joinin iki tarafındaki tablolardan eşleşen eşleşmeyen hepsini getirir
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
INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç')

--[Dikkat edilmesi gerekenler!!!]
--INTO komudu ile yazılır

INSERT INTO Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç')
--Kolonun kabul ettiği veri tipi ve karakter uzunluğunda kayıt yapılabilir
--Not Null olan kolonlara boş bırakılamayacaklarından dolayı mutlaka değer gönderilmelidir

INSERT INTO Personeller(Adi,SoyAdi,Unvan,UnvanEki) VALUES ('','','a','b')
--Otomatik artan kolonlara değer gönderilmez
--Tablodaki seçilen yahut bütün kolonlara gönderileceğini belirtip , göndermezsek hata verir

--Hatalı Yazım
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem')


--[Pratik Kullanım]
INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç')
INSERT Personeller(Adi,SoyAdi) VALUES ('Ekrem','Parlakkılıç')
INSERT Personeller(Adi,SoyAdi) VALUES ('Cavit','Parlakkılıç')

INSERT Personeller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç'),
									  ('Ekrem','Parlakkılıç'),
									  ('Cavit','Parlakkılıç')


--[INSERT Komutu ile Select sorgusu sonucunu farklı tabloya kaydetme]
INSERT OrnekPersoneller SELECT P.Adi,P.SoyAdi FROM Personeller P
SELECT * FROM OrnekPersoneller

--[Select sorgusu sonucunu gelen verileri tablo oluşturarak kaydetme]
SELECT P.Adi,P.SoyAdi,p.Ulke INTO OrnekPersoneller2 FROM Personeller P
SELECT * FROM OrnekPersoneller2

--Bu yöntemle primary key foreign key oluşturulamaz sonradan eklenmek isterse eklenebilir manuel olarak.


--UPDATE

--[DİKKAT UPDATE komutu tehlikelidir genellikle where şartı ile kullanılır]
UPDATE OrnekPersoneller SET Adi='Mehmet'

--[Where şartı ile yazmak]
UPDATE OrnekPersoneller SET Adi='Mehmet' WHERE Adi='Nancy'

--[Update Sorgusunda Join yapıları kullanılarak Birden fazla Tabloda güncelleme yapmak]
UPDATE Urunler SET UrunAdi = K.KategoriAdi FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID

--[UPDATE Sorgusunda Subquery ile güncelleme yapmak]
UPDATE Urunler SET UrunAdi = (SELECT Adi FROM Personeller WHERE PersonelID = 3)

--[UPDATE Sorgusunda Top Keywordü ile Güncelleme yapmak]
UPDATE Top(30) Urunler SET UrunAdi = 'x'

--DELETE

DELETE FROM Urunler

--[DİKKAT DELETE komutu tehlikelidir genellikle where şartı ile kullanılır]

DELETE FROM Urunler WHERE KategoriID = 3
--Delete sorgusuyla tablo içerisindeki tüm verileri silmeniz identity kolonunu sıfırlamayacaktır.
--Silme işleminden sonra ilk eklenen veride kalındığı yerden id değeri verecektir


------------------------------------------- DML FINISH-----------------------------------------------------



--UNION | UNION ALL

--UNION
--Birden fazla select sorgusunun sonucunu tek seferde alt alta göstermemizi sağlar 

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

--Joinler tabloları yan yana , Union alt alta birleştirir.Joinlerde belirli (ilişkisel) bir kolon üzerinden birleştirme yapılırken,
--Union da böyle bir durum yoktur

--Dikkat etmemiz gerekenler
--Union sorgusunun sonucunda oluşan tablolnun kolon isimleri,en üstteki sorgunun kolon isimlerinden oluşur
--En üstteki sorgudan kaç kolon çekilmişse alttaki sorgudan da o kadar kolon çekilmek zorundadır
--En üstteki sorgudan çekilen kolonların tipleriyle,alttaki sorgudan çekilen kolonların tipleri aynı olmak zorundadır
--Union tekrarlı kayıtları getirmez

/*
  Union'da Kullanılan tablolara kolon eklenebilir, Dikkat etmemiz gereken nokta , yukarıdaki kurallar çerçevesinde aşağıyad yukarıyada
  aynı sayıda kolon eklenmesi gerekmektedir
*/

SELECT P.Adi,P.SoyAdi,'Personel' AS POSITION FROM Personeller P
UNION
SELECT M.MusteriAdi,M.MusteriUnvani,'Musteri' FROM Musteriler M

--UNION ALL

--UNION Tekrarlı kayıtları getirmezken UNION ALL getirir


SELECT P.Adi,P.SoyAdi FROM Personeller P
UNION ALL
SELECT P.Adi,P.SoyAdi FROM Personeller P

----------------------------------UNION AND UNION ALL FINISH-------------------------------------

--WITH ROLLUP

--GROUP BY ile gruplanmış veri kümesinde ara toplam alınmasını sağlar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH ROLLUP

--[Having şartıyla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH ROLLUP HAVING SUM(Miktar) > 100

----------------------------------------WITH ROLLUP FINISH----------------------------------------

--WITH CUBE
--GROUP BY ile gruplanmış veri kümesinde teker teker toplam alınmasını sağlar

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE


SELECT KategoriID,UrunID,SUM(TedarikciID) AS TOTAL FROM Urunler 
GROUP BY KategoriID,UrunID WITH CUBE

--[Having şartıyla beraber with rollup]

SELECT SatisID,UrunID,SUM(Miktar) AS TOTAL FROM SatisDetaylari 
GROUP BY SatisID,UrunID WITH CUBE HAVING SUM(Miktar) > 100

----------------------------------------WITH CUBE FINISH----------------------------------------

--CASE - WHEN - ELSE -END

----Personellerin isim ve soyisimlerinin yanında; UnvanEki 'Mr.' ise 'Erkek','Mrs.' ise 'Kadın' yazsın

SELECT Adi,SoyAdi,UnvanEki FROM Personeller

SELECT Adi,SoyAdi,
CASE
WHEN UnvanEki = 'Mrs.' OR UnvanEki = 'Ms.' THEN 'Kadın'
WHEN UnvanEki = 'Mr.' THEN 'Erkek'
ELSE UnvanEki 
END
FROM Personeller

/*
  Eğer ürünün birim fiyatı 0 - 50 arası ise 'Çin Malı', 50 - 100 arası ise 'Ucuz', 
  100 - 200 arası ise 'Normal' , 200'den büyük ise 'Pahalı' yazsın 
*/

SELECT UrunID,BirimFiyati FROM Urunler

SELECT UrunID,
CASE
WHEN BirimFiyati BETWEEN 0 AND 50 THEN 'Çin Malı' 
WHEN BirimFiyati BETWEEN 50 AND 100 THEN 'Ucuz'
WHEN BirimFiyati BETWEEN 100 AND 200 THEN 'Normal'
WHEN BirimFiyati > 200 THEN 'Pahalı'
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

 --Adı nancy olan personelin satışlarını tarihleriyle birlikte getir
 SELECT SatisID,SatisTarihi 
 FROM Satislar 
 WHERE PersonelID = (SELECT PersonelID FROM Personeller WHERE Adi = 'Nancy')

 --Unvan eki Dr olan Personellerin ismini getir
 SELECT Adi FROM Personeller WHERE Adi = (SELECT Adi FROM Personeller WHERE UnvanEki = 'Dr.')

 --[Dikkat!!!]
 --Sub olan sorgunun dçnüş değeri bir olmalıdır birden fazla kayıt getiriyorsa alt sorgu olamaz


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

 --Kisiler Tablosu temizlenir , id 0 lanır ve tablonun iskeleti silinmez
 TRUNCATE TABLE Kisiler

------------------------------------- TRUNCATE TABLE FINISH ---------------------------------


-- @@IDENTITY 
--En son insert yapılan tablodaki verinin id sini yazdırır
INSERT Kategoriler(KategoriAdi,Tanimi) VALUES('X','X Kategorisi')
SELECT @@IDENTITY 

------------------------------------- @@IDENTITY FINISH ---------------------------------

--@@ROWCOUNT 
--Sorgudan kaç satır etkilenmiştir onun bilgisini verir
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
--Fonksiyona verilen kolon, ikinci parametre verilen değere eşitse o kolonu Null olarak getirir

SELECT NULLIF(0,0)
SELECT NULLIF(0,2)

SELECT HedefStokDuzeyi FROM Urunler
SELECT AVG(HedefStokDuzeyi) FROM Urunler

--Hedef stok düzeyi 0 olmayan ürünlerin ortalaması nedir ? 
SELECT AVG(HedefStokDuzeyi) FROM Urunler WHERE HedefStokDuzeyi <> 0
SELECT AVG(NULLIF(HedefStokDuzeyi,0)) FROM Urunler

--------------------------------------------------NULLIF FINISH------------------------------------------------


--T-SQL ile VT deki tabloları listeleme

SELECT * FROM sys.tables
-- ya da
SELECT * FROM sysobjects WHERE xtype = 'U'


--------------------------------------------------------------------------------------------------------------

--T-SQL ile PK olup olmadığını kontrol etme

SELECT OBJECTPROPERTY(OBJECT_ID('Personeller'),'TableHasPrimaryKey')

--------------------------------------------------------------------------------------------------------------

-- DDL (Data Definition Language)
/*
  T-SQL'de VT nesnelerini yaratmamızı sağlayan ve bu nesnelerin üzerinde değişiklik yapmamızı
  ve silmemizi sağlayan yapılar bu başlık altında simgelenmektedir
*/

--CREATE , ALTER, DROP

-- ===CREATE=== 
--VT nesnesi oluşturmamızı sağlar. (Database,Table,View,Trigger,StoredProc v.s)

--CREATE ile VT oluşturma

CREATE DATABASE OrnekVT2

CREATE DATABASE OrnekVT2
ON
(
	NAME = 'GG',
	FILENAME = 'D:\ides\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\GG.mdf',
	SIZE = 5,
	FILEGROWTH = 3
)

--NAME : Oluşturulacak VT nin fiziksel ismini belirliyoruz.
--FILENAME : Oluşturulacak VT dosyasının fiziksel dizinini belirtiyoruz.
--SIZE : VT nin başlangıç boyutunu mb cinsinden ayarlıyoruz.
--FILEGROWTH : VT boyutunu,başlangıç boyutunu geçtiği durumda boyutun ne kadar artması gerektiğini mb cinsinden belirtiyoruz

--LOG dosyasını oluşturma
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

--CREATE ile tablo oluşturma
USE OrnekVT2
CREATE TABLE OrnekTablo
(
	Kolon1 INT,
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

--Eğer kolon isminde boşluk varsa köşeli parantezle yaz exp = [KOLON 1]

-- =Kolona Primary Key ve İdentity özelliği kazandırma
CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

-- ===ALTER=== 
--  VT nesnesi üzerinde değişiklik yapmamızı sağlar. 

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
ADD CONSTRAINT OrnekConstraint DEFAULT 'Boş' FOR Kolon2

-- ALTER ile tablodaki constrainti silme

ALTER TABLE OrnekTablo
DROP CONSTRAINT OrnekConstraint 

-- SP_RENAME ile Tablo adı güncelleme
SP_RENAME 'OrnekTablo','OrnekTabloYeni'

-- SP_RENAME ile Kolon güncelleme
SP_RENAME 'OrnekTablo.Kolon1','Kolon12','COLUMN'

-- ===DROP===

-- VT yi silmemizi sağlar. 

DROP TABLE OrnekTablo2
DROP DATABASE OrnekVT2


-------------------------------------------------------DDL FINISH------------------------------------------------

--CONSTRAITS (KISITLAYICILAR)

--Constraintler sayesinde tablolar üzerinde istediğimiz şartlar ve durumlara göre kısıtlama yapabiliyoruz.

--1.DEFAULT CONSTRAINT
--2.CHECK CONSTRAINT
--3.PRIMARY KEY CONSTRAINT
--4.UNIQUE CONSTRAINT
--5.FOREIGN KEY CONSTRAINT


-- === DEFAULT CONSTRAINT ===
--Default Constraintler sayesinde kolona bir değer girilmediği takdirde varsayılan olarak ne girilmesi gerektiğini belirtebiliyoruz

CREATE TABLE OrnekTablo2
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Kolon2 NVARCHAR(MAX),
	Kolon3 MONEY
)

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon1Constraint DEFAULT 'Boş' FOR Kolon1

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Constraint DEFAULT -1 FOR Kolon2


-- === CHECK CONSTRAINT ===
--Bir kolona girilecek olan verinin belirli bir şarta uymasını zorunlu tutar.

ALTER TABLE OrnekTablo
ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- DİKKAT!!!!
/*
  Check constraint oluşturulmadan önce ilgili tabloda şarta aykırı değerler varsa constraint oluşturulmayacaktır ! ! !
  Ancak önceki kayıtları görmezden gelip genede Check constraint uygulamak istiyorsak "With Nocheck komutu kullanılır
*/

ALTER TABLE OrnekTablo
WITH NOCHECK ADD CONSTRAINT Kolon2Kontrol CHECK ((Kolon2 * 5) % 2 = 0)

-- === PRIMARY KEY CONSTRAINT ===
-- Primary Key Constraint ile; o kolona eklenen primary key ile, başka tablolarda 
-- Foreign Key oluşturarak ilişki kurmamız mümkün olur.
-- Bunun yanında o kolonun taşıdığı verinin tekil olacağı da garanti edilmiş olur. 
-- Primary Key constraint ile ayrıca CLUSTERED index oluşturulmuşta olur,

-- DİKKAT!!!
-- PK Constraint Kullanılan kolon PK özelliğine sahip olmamalıdır

ALTER TABLE OrnekTablo
ADD CONSTRAINT PrimaryId PRIMARY KEY (ID)

-- === UNIQUE CONSTRAINT ===
--Unique constraintlerin tek amacı,Belirttiğimiz değerlerin tekil olmasıdır

ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekTabloUnique UNIQUE (Kolon2)

--"Kolon2" kolonuna unique constraint verilerek tekil hale getirilmiştir.Bundan sonra iki tane aynı veriden kayıt yapılamaz


-- === FOREIGN KEY CONSTRAINT===
/*
  Tabloların birbiri arasında ilişki kurmasını sağlar.Bu ilişki neticesinde; foreign key olan kolondaki karşılığının boşa 
  düşmemesi için primary key kolonu olan tablodan veri silinmesi, güncellenmesini engeller
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

--Şu durumda,delete ve update işlemlerinden kolondaki veriler etkilenmez
--Davranışını değiştirmek için aşağıdaki komutlar kullanılır

-- == Cascade 
-- Ana tablodaki kayıt silindiğinde ya da güncellediğinde, ilişkili kolondaki karşılığında otomatik olarak silinir ya da güncellenir 

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE CASCADE
ON UPDATE CASCADE

-- == Set Null 
-- Ana tablodaki kayıt silindiğinde ya da güncellediğinde, ilişkili kolondaki karşılığında "Null" değer basılır

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET NULL
ON UPDATE SET NULL

-- == Set Default 
/*
   Ana tablodaki kayıt silindiğinde ya da güncellediğinde, ilişkili kolondaki karşılığında o kolonun default değer basılır
   Bu default değer dediğimiz default tipte bir constrainttir.Bunu kendimiz oluşturabiliriz.
*/

ALTER TABLE Ogrenciler
ADD CONSTRAINT DefaultOgrenciler DEFAULT -1 FOR DersId

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers FOREIGN KEY(DersId) REFERENCES Dersler(DersId)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT

--Bu ayarlar verildiği takdirde "no action" özelliği geçerlidir 

--------------------------------------------CONSTRAINT FINISH-------------------------------------------

--VARIABLES(Değişkenler)

--DECLARE Keywördü ile tanımlanırlar

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


-- Değişken değeri okuma

DECLARE @y INT
SET @y = 3
PRINT @y
SELECT @Y

-- Sorgu sonucu gelen verileri değişkenle elde etme

USE Northwind
DECLARE @Adi NVARCHAR(MAX),@SoyAdi NVARCHAR(MAX)
SELECT  @Adi=Adi,@SoyAdi=SoyAdi FROM Personeller WHERE PersonelId = 1
SELECT  @Adi,@SoyAdi

--1.Sorgu sonucu gelen satır sayısı 1 adet olmalıdır
--2.Kolonlardaki verilerin tipleri ne ise o verileri temsil edecek değişkenlerin tipleride benzer olmalıdır

-----------------------------------------------VARIABLES FINISH--------------------------------------------

--Batch Kavramı Go

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

-- If Yapısı 

-- = : Eşitse
-- <> : Eşit değilse
-- < : Küçükse
-- > : Büyükse

--Tek satırlık çalışma

DECLARE @Isim NVARCHAR(50)
SET @Isim = 'Ozkan'

IF @Isim = 'Ozkan'
   PRINT 'Evet'
ELSE
   PRINT 'Hayır'


-- BEGIN END yapısı(SCOPE)

DECLARE @sayi1 INT = 3
DECLARE @sayi2 INT = 5

IF @sayi1 < @sayi2
   BEGIN
		PRINT 'Evet sayi1 sayi2 den küçüktür'
		SELECT @sayi1 [Sayı 1],@sayi2 [Sayı 2]
   END
ELSE
    BEGIN
		PRINT 'Hayır sayi1 sayi2 den küçük değildir'
		SELECT @sayi1 [Sayı 1],@sayi2 [Sayı 2]
    END


--Örnek 1 
--Müşteriler tablosunda Amerikalı(USA) müşteri var mı?

USE Northwind

SELECT * FROM Musteriler WHERE Ulke = 'USA'

IF @@ROWCOUNT > 0
   PRINT 'Evet'
ELSE
   PRINT 'Hayır'

--Örnek 2
--Adı 'Özkan' SoyAdı 'Parlakkılıç'olan personel var mı ? Varsa evet var desin. Yoksa Kaydetsin.

DECLARE @Adi NVARCHAR(MAX) = 'Özkan',@SoyAdi NVARCHAR(MAX) = 'Parlakkılıç'
SELECT * FROM Personeller WHERE Adi = @Adi AND SoyAdi = @SoyAdi

IF @@ROWCOUNT > 0
	PRINT 'Evet var'
ELSE
	BEGIN 
		PRINT 'Hayır yok'
		INSERT Personeller(Adi,SoyAdi) VALUES (@Adi,@SoyAdi) 
	END



-- IF - ELSE IF - ELSE Yapısı

DECLARE @Yas INT = 25

IF @Yas>25
	PRINT 'Yaşınız 25 den büyük'
ELSE IF @Yas BETWEEN 15 AND 25
	PRINT 'Yaşınız 15 - 20 arasında'
ELSE IF @Yas BETWEEN 5 AND 15
	PRINT 'Yaşınız 5 - 15 arasında'
ELSE
	PRINT 'Yaşınız 5 den küçük'


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
   Genellikle bir SQL Server üzerinde farklı lokasyonlarda birden fazla kişi çalıştığı durumlarda ya da verilerin test amaçlı geçici bir yerlerde
   tutulması, işlenmesi amacıyla kullanılan yapılardır.
*/

-- Bilinen tablo yapısının aynısını sağlarlar. Tek farkları fiziksel olarak oluşmazlar. Sadece bellekte geçici oluşurlar.

-- Select, Update vs. Yapılabilir. İlişki kurulabilir

-- Sunucu kapatıldığında ya da oturum sahibi oturumu kapattığında bellekten silinirler

-- #Bir tabloyu fiziksel olarak kopyalama

SELECT * INTO GeciciPersoneller from Personeller
-- Bu şekildeki bir kullanımda sadece PK ve FK constraintler oluşturulmazlar.
-- Geri kalan her şey fiziksel olarak oluşturulur.

-- #Bir tabloyu # ifadesi ile belleğe geçici olarak kopyalama
SELECT * INTO #GeciciPersoneller from Personeller

SELECT * FROM #GeciciPersoneller
INSERT #GeciciPersoneller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç')
UPDATE #GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM #GeciciPersoneller  WHERE PersonelID = 11

-- Geçici tablo üzerinde her türlü işlemi yapabiliyoruz.
-- # ile oluşturulan tablolar, o an SQL Serverda oturum açmış kişinin sunucu belleğinde oluşur.
-- Sadece oturum açan şahıs kullanılabilir
-- Eğer oturum açan şahıs SQL Server dan disconnect olursa bu tablo bellekten silinir

-- #Bir tabloyu ## ifadesi ile belleğe geçici olarak kopyalama
SELECT * INTO ##GeciciPersoneller from Personeller

SELECT * FROM ##GeciciPersoneller
INSERT ##GeciciPersoneller(Adi,SoyAdi) VALUES ('Özkan','Parlakkılıç')
UPDATE ##GeciciPersoneller SET Adi='Hilmi', SoyAdi='Celayir' WHERE PersonelID = 5
DELETE FROM ##GeciciPersoneller  WHERE PersonelID = 11


-- ## ile oluşturulan tablolar, o an SQL Serverda oturum açmış kişinin sunucu belleğinde oluşur.
-- Bu tabloyu oturum açan şahıs ve onun SQL Serverında dışardan ulşan 3.şahıslar kullanabilir
-- Eğer oturum açan şahıs SQL Server dan disconnect olursa bu tablo bellekten silinir
-- Diğer bütün özellikleri # ile oluşturulan tablolarla aynıdır


--------------------------------------- Temporary Tables Finish ----------------------------------------


-- Uniqueidentifier Veri tipi

-- int, varchar vs. gibi bir veri tipidir
-- Aldığı değer, rakamlar ve harflerden oluşan çok büyük bir sayıdır
-- Bundan dolayı bu kolona aynı değerin birden fazla gelmesi neredeyse imkansızdır
-- O yüzden tekil veri oluşturmak için kullanılır 

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

-- === Kullanım Amacı

-- Genellikle karmaşık sorguların tek bir sorgu üzerinden çalıştırılabilmesidir
-- Bu amaçla raporlama işlemlerinde kullanılabilir
/*
   Aynı zamanda güvenlik ihtiyacı olduğu durumlarda herhangi bir sorgunun 2. - 3. şahıslardan
   gizlenmesi amacıylada kullanılırlar
*/

-- === Genel özellikleri ===

-- Herhangi bir sorgunun sonucu tablo olarak ele alıp, ondan sorgu çekilebilmesini sağlarlar
-- INSERT , UPDATE ve DELETE yapabilirler. Bu işlemleri fiziksel tabloya yansıtırlar. ***Önemli
-- VIEW yapıları fiziksel olarak oluşturulan sorgulardır
-- VIEW yapıları fiziksel sorgulardan daha yavaş çalışırlar

-- Dikkat ! ! !
-- VT elemanları CREATE komutuyla oluşturuyorduk. VIEW yapısıda bir VT yapısı olduğu için oda CREATE komutuyla oluşturulur

CREATE VIEW vw_Gotur
AS

SELECT P.Adi + ' ' + P.SoyAdi [Adı Soyadı] , K.KategoriAdi [Kategori Adı],COUNT(S.SatisID) [Toplam Satış]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi

SELECT * FROM vw_Gotur
SELECT * FROM vw_Gotur WHERE [Adı Soyadı] LIKE '%Robert%'

-- View oluşturulurken kolonlara verilen aliaslar View den sorgu çekilirken kullanılır.
-- Bir yandan da view'ın kullandığı gerçek tabloların kolon isimleri, view içinde alias tanımlanarak gizlenilmiş olur
-- View içinde "order by" kullanılmaz
-- "Order by" View içinde değil , view çalışırken sorgu esnasında kullanılmalıdır

SELECT * FROM vw_Gotur ORDER BY [Toplam Satış] DESC

-- yok eğer illa view içinde "order by" kullanıcam diyorsan top komutunu kullanmalısın


-- Çok tavsiye edilmez performans açısından

ALTER VIEW vw_Gotur
AS

SELECT TOP 100 P.Adi + ' ' + P.SoyAdi [Adı Soyadı] , K.KategoriAdi [Kategori Adı],COUNT(S.SatisID) [Toplam Satış]
FROM Personeller P INNER JOIN Satislar S
ON P.PersonelID = S.PersonelID INNER JOIN SatisDetaylari SD 
ON S.SatisID = SD.SatisID INNER JOIN Urunler U 
ON SD.UrunID = U.UrunID INNER JOIN Kategoriler K
ON U.KategoriID = K.KategoriID

GROUP BY P.Adi + ' ' + P.SoyAdi, K.KategoriAdi 
ORDER BY [Toplam Satış] DESC

SELECT * FROM vw_Gotur

-- INSERT , UPDATE ve DELETE yapabilirler. Bu işlemleri fiziksel tabloya yansıtırlar. ***Önemli

CREATE VIEW OrnekViewPersoneller
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

INSERT OrnekViewPersoneller VALUES('Özkan','Parlakkılıç','Student')
UPDATE OrnekViewPersoneller SET Adi = 'Ekrem' WHERE Adi = 'Özkan'
DELETE FROM OrnekViewPersoneller WHERE Adi = 'Özkan'


-- == WITH ENCRYPTION  ==

-- Eğer yazdığınız view in kaynak kodlarını,Object Explorer penceresinde "Views" kategorisine sağ tılayarak 
-- Design Modda açıp görüntülemesini istemiyorsak "With Encryption" komutu ile view oluşturmalıyız
-- Dikkat ! ! !
/*
   "With Encryption" işleminden sonra view'i oluşturan kişide dahil göremez. Geri dönüşü yoktur.
   Ancak view'i oluşturan şahsın komutların yedeğini bulundurması gerekmektedir. 
   Ya da "With Encryption" olmaksızın view yapısını yeniden alterlamalıyız
*/
-- Dikkat ! ! !
--Bir dikkat edilmesi gereken şey de "With Encryption" ifadesi AS den önce yazılır

CREATE VIEW OrnekViewPersoneller
WITH ENCRYPTION 
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

-- Bu işlem yaptıktan sonra Design Modu kapatılmıştır


-- == WITH SCHEMABINDING  ==
/*
   Eğer view'in kullandığı esas fiziksel tabloların kolon isimleri bir şekilde değiştirilir, kolonları silinir ya da tablo yapısı bir
   şekilde değişikliğe uğrarsa view'in çalışması artık mümkün olmayacaktır
*/
-- View'in kullandığı tablolar ve kolonları bu tarz işlemler yapabilmesi ihtimaline karşı koruma altına alınabilir
-- Bu koruma "WITH SCHEMABINDING" ile yapılabilir
-- "WITH SCHEMABINDING" ile view Create ya da Alter edilirken, view'in kullandığı tablo, schema adıyla birlikte verilmelidir.
-- Örneğin, dbo(database owner) bir şema adıdır. Şemalar C# taki namespaceler gibi düşünülebilir
-- "WITH SCHEMABINDING" komutuda AS den önce yazılmalıdır

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
-- View'in içerisindeki sorguda bulunan şarta uygun kayıtların INSERT edilmesine müsade edilip
-- uymayan kayıtların müsaade edilmemesini sağlayan bir komuttur

USE Northwind
CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'

INSERT OrnekView2 VALUES ('Ahmet','Aksu')
INSERT OrnekView2 VALUES ('Mehmet','Aksu')

-- "WITH ENCRYPTION" ve "WITH SCHEMABINDING" komutlarından farklı olarak AS den sonra Where şartının sonunda yazılır

CREATE VIEW OrnekView2
AS
SELECT Adi,SoyAdi FROM Personeller WHERE Adi LIKE 'a%'
WITH CHECK OPTION


----------------------------------------------------------- VIEW FINISH ------------------------------------------------------------

-- FUNCTION 

-- SCALAR FUNCTION && INLINE FUNCTION

-- T-SQL'de iki tip fonksiyon vardır.
-- SCALAR FUNCTION = Geriye istediğimiz bir tipte değer döndüren fonksiyon
-- INLINE FUNCTION = Geriye tablo döndüren fonksiyon

-- Bu iki fonksiyonda fiziksel olarak VT'de oluşurlar
-- CREATE ile oluşurlar
-- Üzerinde çalışılan VT'nin Programmability -> Functions kombinasyonundan oluşturulan fonksiyonlara erişebiliriz.


-- == 1.Scalar Function ==

-- == Fonksiyon tanımlama ==
-- Scalar fonksiyonlara tanımladıktan sonra Programmability -> Function -> Scalar-valued Functions kombinasyonundan erişilebilir


CREATE FUNCTION Topla(@Sayi1 INT, @Sayi2 INT) RETURNS INT
AS
	BEGIN
		RETURN @Sayi1 + @Sayi2
	END

SELECT dbo.Topla(2,5)
PRINT dbo.Topla(10,10)

-- Örnek
-- Herhangi bir ürünün %18 KDV dahil olmak üzere toplam maliyeti getiren fonksiyonu yazalım

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
   Geriye tablo döndüreceği için bu fonksiyonlar çalıştırılırken sanki bir tablodan 
   sorgu çalıştırılır gibi çalıştırılırlar. Bu yönleriyle viewlara benzerler. View ile
   yapılan işlevler Inline Functions'larla yapılabilirler
*/
-- Genellikle viewle benzer işlevler için View kullanılması tavsiye edilir

-- == Fonksiyon tanımlama ==
-- Inline fonksiyonlara tanımladıktan sonra Programmability -> Function -> Table-valued Functions kombinasyonundan erişilebilir

--Dikkat ! ! !
--INLINE FUNCTIONS oluşturulurken BEGIN-END yapısı kullanılmaz

CREATE FUNCTION tc_Gonder(@Ad NVARCHAR(20),@Soyad NVARCHAR(20)) RETURNS TABLE
AS
	RETURN SELECT Adi,SoyAdi FROM Personeller WHERE Adi = @Ad AND SoyAdi = @Soyad

SELECT * FROM dbo.tc_Gonder('Özkan','Parlakkılıç')


-- == Fonksiyonlarda WITH ENCRYPTION ==
/*
-- Eğer ki yazmış olduğumuz fonksiyonların kodlaına 2. -3. şahıs engellemek istiyorsak "WITH ENCRYPTION" 
-- komutunu kullanmalıyız 
*/
/*
   "WITH ENCRYPTION" işleminden sonra fonksiyonu oluşturan kişide dahil kimse 
   komutları göremez. Geri dönüşü yoktur. Ancak fonk. oluşturan kişinin komutların yedeğini bulundurması gerekmektedir
   Ya da "WITH ENCRYPTION" olmaksızın fonksiyonu yeniden alterlamalıyız.
*/
-- "WITH ENCRYPTION" AS den önce kullanılmalıdır

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

-- Herhangi bir kolonda fonk. kullanılarak otomatik hesaplanabilir kolonlar (Computed Column) oluşturmak mümkündür

-- Örnek 
-- Çıktı olarak "_____ kategorisindeki _____ ürünün toplam fiyatı : _____ 'dır." şeklinde bir fonksiyon yazalım.

CREATE FUNCTION Rapor(@Kategori NVARCHAR(MAX),@UrunAdi NVARCHAR(MAX),@BirimFiyati INT, @Stok INT)
RETURNS NVARCHAR(MAX)
AS 
	BEGIN
		DECLARE @Rapor NVARCHAR(MAX) = @Kategori + ' kategorisindeki ' + @UrunAdi + ' ürünün toplam fiyatı ' + 
		CAST(@BirimFiyati * @Stok AS NVARCHAR(MAX)) + ' dır. ' 
		RETURN @Rapor
	END

SELECT dbo.Rapor(K.KategoriAdi,U.UrunAdi,U.BirimFiyati,U.HedefStokDuzeyi) AS RAPOR
FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID = K.KategoriID

------------------------------------ FUNCTION FINISH ---------------------------------------------

-- STORED PRODUCURE (Saklı yordamlar)

-- == Genel Özellikleri ==

/* 
   Normal sorgulardan daha hızlı çalışırlar
   Çünkü normal sorgular Execute edilirken "Execute Plan" işlemi yapılır. Bu işlem
   sırasında hangi tablodan veri çekilecek, hangi kolonlar gelecek, bınlar nerede v.s gibi işlemler yapılır
   Bir sorgu her çalıştırıldığında bu işlemler aynen tekrar tekrar yapılır.
   Fakat sorgu Stored Procudure olarak çalıştırılırsa bu işlem sadece bir kere yapılır ve o da ilk çalışma esnasındadır.
   Diğer çalıştırmalarda ise bu işlemler yapılmaz .
   Bundan dolayı hız ve performansta artış sağlanır
*/
-- İçerisinde SELECT, DELETE,UPDATE ve INSERT işlemleri yapılabilir.
-- İç içe kullanılabilir
-- İçlerinde fonksiyon oluşturulabilir
/* 
   Sorgularımızın dışardan alacağı değerler parametre olarak Stored Procudure'lere
   geçirebildiğinizden dolayı , sorgularımızın "SQL Injection" yemelerinide önlemiş oluruz
   Bu yönleriyle de daha güvenildirler
*/

-- SP fiziksel bir VT nesnesidir. Haliyle CREATE komutu ile oluşturulur.
-- Fiziksel olarak ilgili VT'nin Programmability -> Stored Procudure kombinasyonundan erişilebilir

-- == Geriye değer döndüren SP yapısı ==

CREATE PROC UrunGetir
(
	@Fiyat Money
)AS
SELECT * FROM Urunler WHERE BirimFiyati > @Fiyat
RETURN @@ROWCOUNT

EXEC UrunGetir 70
-- Bu şekilde geriye dönülen değeri elde etmeksizin kullanılabilir.

DECLARE @Sonuc INT
EXEC @Sonuc = UrunGetir 70
PRINT CAST(@Sonuc AS NVARCHAR(MAX)) + ' adet ürün bu işlemden etkilenmiştir'


-- == Output ile değer döndüren  ==

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
   Dışarıdan aldığı isim,soyisim ve şehir bilgilerini Personeller tablosunda ilgili kolonlara
   ekleyen SP yi yazınız
*/

CREATE PROC sp_PersonelEkle
(
	@Adi NVARCHAR(MAX),
	@SoyAdi NVARCHAR(MAX),
	@Sehir NVARCHAR(MAX)
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle 'Ekrem', 'Parlakkılıç','Sakarya'
SELECT * FROM Personeller

-- == Parametrelere Varsayılan Değer ==

CREATE PROC sp_PersonelEkle2
(
	@Adi NVARCHAR(MAX) = 'İsimsiz',
	@SoyAdi NVARCHAR(MAX) = 'Soyadsız',
	@Sehir NVARCHAR(MAX) = 'Şehir girilmemiş'
)AS
INSERT Personeller(Adi,SoyAdi,Sehir) VALUES (@Adi,@SoyAdi,@Sehir)

EXEC sp_PersonelEkle2 'Ekrem', 'Parlakkılıç','Sakarya'
-- Burada varsayılan değerler devreye girmemektedir
SELECT * FROM Personeller

EXEC sp_PersonelEkle2 
/*
   Normalde bu şekilde parametrelere değer göndermeksizin çalışmaması lazım
   ama varsayılan değerler tanımda belirtildiği için devreye girmektedir
*/

EXEC sp_PersonelEkle2 'İbrahim'

-- @Adi parametresi 'İbrahim' değerini alacaktır.Diğer parametreler ise varsayılan değerleri alacaktır

-- EXEC komutu

EXEC('SELECT * FROM Personeller')
SELECT * FROM Personeller

-- Yanlış kullanım 
-- 2 EXEC komutu birbirinden bağımsız çalışır ve print ekrena sayac değerini basamaz değişken tanımlanmamıştır
EXEC ('DECLARE @Sayac INT = 0')
EXEC ('PRINT @Sayac')

-- Doğru kullanım 

EXEC ('DECLARE @Sayac INT = 0 PRINT @Sayac')

-- == SP içerisinde nesne oluşturma

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
   Bir tabloda INSERT,UPDATE ve DELETE işlemleri gerçekleştirildiğinde devreye giren yapılardır.
   Bu işlem sonucunda veya sürecinde devreye girerler
*/

-- *INSERTED TABLE
/*
   Eğer bir tabloda Insert işlemi yapılıyorsa arka planda işlemler ilk önce RAM'de oluşturulan 
   inserted isimli bir tablo üzerinde yapılır.Eğer işlemde bir problem yoksa inserted tablosundaki 
   veriler fiziksel tabloya insert edilir. İşlem bittiğinde RAM'de oluşturulan bu inserted tablosu
   silinir.
*/

-- *DELETED TABLE
/*
   Eğer bir tabloda Delete işlemi yapılıyorsa arka planda işlemler ilk önce RAM'de oluşturulan 
   deleted isimli bir tablo üzerinde yapılır.Eğer işlemde bir problem yoksa deleted tablosundaki 
   veriler fiziksel tablodan silinir. İşlem bittiğinde RAM'den bu deleted tablosuda
   silinir.
*/

-- Eğer bir tabloda Update işlemi yapılıyorsa RAM'de uptadet isimli bir tablo OLUŞTURULMAZ ! ! ! 
-- SQL Server'da ki Update mantığı önce silme, sonra eklemedir.
/*
   Eğer bir tabloda update işlemi yapılıyorsa arka planda RAM'de hem deleted hem de inserted tabloları
   oluşturulur ve bunlar üzerinde işlemler yapılır
*/
/*
   NOT : Update yaparken güncellenen kaydın orjinali deleted tablosunda , güncellendikten sonraki hali ise
   inserted tablosunda bulunmaktadır. Çünkü güncelleme demek kaydı önce silmek sonra eklemek demektir.
*/

/*
   Deleted ve inserted tabloları, ilgili sorgu sonucu oluştukları için o sorgunun kullandığı
   kolonlara da sahşp olur. Böylece deleted ve inserted tablolarında select sorgusu yapmak mümkündür.
*/

-- DİKKAT ! ! !
-- Tanımlanan Triggerlara ilgili tablonun içerisindeki Triggers sekmesi altından erişebilir.

CREATE TRIGGER OrnekTrigger
ON Personeller
AFTER INSERT 
AS 
SELECT * FROM Personeller

INSERT Personeller(Adi,SoyAdi) VALUES('Özkan','Parlakkılıç')


-- Örnek 1 
-- Tedarikçiler tablosundan bir veri silindiğinde tüm ürünlerin fiyatı 10 artsın

CREATE TRIGGER TriggerTedarikciler
ON Tedarikciler
AFTER DELETE 
AS 
UPDATE Urunler SET BirimFiyati = BirimFiyati + 10
SELECT * FROM Urunler

DELETE FROM Tedarikciler WHERE TedarikciID = 30

-- Örnek 2 
-- Tedarikçiler tablosundan bir veri güncellendiğinde,kategoriler tablosunda "Meyve kokteyli" adında bir kategori oluşsun

CREATE TRIGGER TrgTedarikciUpdate
ON Tedarikciler
AFTER UPDATE 
AS 
INSERT Kategoriler(KategoriAdi) VALUES('Meyve kokteyli')
SELECT * FROM Kategoriler

UPDATE Tedarikciler SET MusteriAdi = 'Ekrem' WHERE MusteriAdi = 'Owner'

-- Örnek 3
/*
   Personeller tablosundan bir kayıt silindiğinde silinen kaydın adı, soyadı, kim tarafından ve
   hangi tarihte silindiği başka bir tabloya kayıt edilsin. Bir nevi log tablosu gibi
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
INSERT LogTablosu VALUES ('Adı ve Soyadı' + @Adi + ' ' + @SoyAdi + ' olan personel ' + SUSER_NAME()
						  + ' tarafından ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde silinmiştir.')


DELETE FROM Personeller WHERE PersonelID = 11

-- Örnek 4
/*
   Personeller tablosunda update gerçekleştiği anda devreye giren ve bir log tablosuna "Adı ..."
   olan personel ... yeni adıyla değiştirilerek ... kullanıcı tarafından ... tarihinde güncellendi.
   Kalıbında bir rapor yazan trg yazalım
*/


CREATE TRIGGER TrgPersonelUpdate
ON Personeller
AFTER UPDATE 
AS 
DECLARE @EskiAdi NVARCHAR(MAX),@YeniAdi NVARCHAR(MAX)
SELECT @EskiAdi = Adi from deleted
SELECT @YeniAdi = Adi from inserted
INSERT LogTablosu VALUES ('Adı ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni adıyla değiştirilerek ' + SUSER_NAME()
						  + ' kullanıcı tarafından ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmiştir.')


UPDATE Personeller SET Adi = 'Ekrem' WHERE Adi = 'Özkan'

-- === Multiple Actions Trigger ===

CREATE TRIGGER MultiTrigger
ON Personeller
AFTER DELETE,INSERT 
AS 
PRINT 'Hello'

INSERT Personeller(Adi,SoyAdi) VALUES('Özkan','Parlakkılıç')
DELETE FROM Personeller WHERE PersonelId = 30

-- === Instead Of Triggers ===

/*
   Şu ana kadar Insert,Update ve Delete işlemleri yapılırken şu şu işlemi yap 
   mantığıyla çalıştık.(Yanında şunu yap)
*/ 
/*
   Instead Of Triggerlar ise Insert,Update ve Delete işlemleri yerine şu şu işlemi yap 
   mantığıyla çalışmaktadırlar.(Yerine şunu yap)
*/

-- Örnek 5
/*
   Personeller tablosunda update gerçekleştiği anda yapıcalak güncelleştirme yerine bir log tablosuna
   "Adı ..." olan personel ... yeni adıyla değiştirilerek ... kullanıcı tarafından ... tarihinde güncellenmek istendi.
   Kalıbında bir rapor yazan trg yazalım.
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
		INSERT LogTablosu VALUES ('Adı ' + @EskiAdi + ' olan personel ' + SUSER_NAME()
								  + ' kullanıcı tarafından ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmek istendi.')
	END
ELSE
	BEGIN
		INSERT LogTablosu VALUES ('Adı ' + @EskiAdi + ' olan personel ' + @YeniAdi + ' yeni adıyla değiştirilerek ' + SUSER_NAME()
								  + ' kullanıcı tarafından ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' tarihinde güncellenmek istendi.')
	END

UPDATE Personeller SET Adi = 'Özkan' WHERE Adi = 'Ekrem'

-- Örnek 6 
-- Personeller tablosunda adı "Andrew" olan kaydın silinmesini engelleyen ama diğerlerine izin veren triggerı yazalım

CREATE TRIGGER AndrewTrigger
ON Personeller
AFTER DELETE 
AS 
DECLARE @Adi NVARCHAR(MAX)
SELECT @Adi = Adi from deleted

IF @Adi = 'Andrew'
	BEGIN
		PRINT 'Bu kaydı silemezsin'
		ROLLBACK -- Yapılan tüm işlemleri geri alır
	END

DELETE FROM Personeller WHERE PersonelID = 10

-- == DDL TRIGGER

-- CREATE, ALTER ve DROP işlemleri sonucunda veya sürecinde devreye girecek olan yapılardır. 

CREATE TRIGGER DDL_Trigger
ON DATABASE
FOR drop_table,alter_table,create_function,create_procudure,drop_procudure -- v.s
AS 
PRINT 'Bu işlem gerçekleştirilemez'
ROLLBACK

DROP TABLE LogTablosu

-- DİKKAT ! ! !
-- DDL Triggerlara ilgili veritabanının Programmability -> Database Triggers sekmesi altından erişilir

-- === Trigger'ı Devre Dışı Bırakma ===
DISABLE TRIGGER TrgPersonelRaporInstead ON Personeller
-- === Trigger'ı Aktifleştirme ===
ENABLE TRIGGER TrgPersonelRaporInstead ON Personeller


------------------------------------------- TRIGGER FINISH -----------------------------------------

-- TRANSACTION

/*
   Birden çok işlemin bir arada yapıldığı durumlarda eğer parçayı oluşturan işlemlerden herhangi birinde 
   sorun olursa tüm işlemi iptal ettirmeye yarar
*/
/*
   Örneğin; kredi kartı ile alışveriş işlemlerinde transaction işlemi vardır. Siz marketten ürün alırken
   sizin hesabınızdan para düşülecek, marketin hesabına para aktarılacaktır. Bu işlemde hata olmaması
   gerekir ve bundan dolayı bu işlem transaction bloğunda gerçekleştirilmelidir. Bu esnada herhangi bir sorun olursa 
   bütün işlemler transaction tarafından iptal edilir.
*/

-- Begin Tran veya Begin Transaction : Transaction işlemini başlatır.

-- Commit Tran : Transaction işlemini başarıyla sona erdirir. İşlem(ler)i gerçekleştirir
-- Rollback Tran: Transaction işlemini iptal eder. İşlem(ler)i geri alır.

-- Commit Tran yerine Commit yazılabilir.
-- Rollback Tran yerine Rollback yazılabilir.

/*
   Normalde default olarak her şey Begin Tran ile başlayıp, Commit Tran ile biter. !!!
   Biz bu yapıları kullanmasak bile !!!
*/

INSERT Bolge VALUES(5,'Sakarya') -- Varsayılan olarak Tran kontrolünde bir işlemdir.Sonuç olarak da Commit ile biter.

BEGIN TRAN Kontrol
INSERT Bolge VALUES(5,'Sakarya') 
COMMIT

-- Transaction'a isim vermek zorunda değiliz.

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
		PRINT 'Kayıt silindi.'
		COMMIT
	END
ELSE
	BEGIN
		PRINT 'İşlem başarısız.'
		ROLLBACK
	END


-- == Banka uygulaması ==

-- Örnek
/*
   İki adet banka tablosu oluşturalım. Bankalar arası havale işlemi gerçekleştirelim. Ve bu işlemleri
   yaparken tran kullanalım
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
				PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta gönderilmek istenenden az para mevcuttur.'
				ROLLBACK
			END
		ELSE
			BEGIN
				IF @BankaKime = 'BBanka'
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' değerinde para havale edilmiştir.'
						PRINT 'Son değerler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
						+ CAST(@AlanBakiye AS NVARCHAR(MAX))
						COMMIT
					 END
			     ELSE
					BEGIN
						UPDATE ABanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
						UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
						PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaptan ' + @BankaKime 
						+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
						+ ' değerinde para havale edilmiştir.'
						PRINT 'Son değerler;'

						SELECT @GonderenBakiye = Bakiye FROM ABanka WHERE HesapNo = @GonderenHesapNo
						SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
						PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
						+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
						PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
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
					PRINT CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta gönderilmek istenenden az para mevcuttur.'
					ROLLBACK
				END
			ELSE
				BEGIN
					IF @BankaKime = 'ABanka'
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE ABanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' değerinde para havale edilmiştir.'
							PRINT 'Son değerler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM ABanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
							+ CAST(@AlanBakiye AS NVARCHAR(MAX))
							COMMIT
						END
					ELSE
						BEGIN
							UPDATE BBanka SET Bakiye = Bakiye - @Tutar WHERE HesapNo = @GonderenHesapNo
							UPDATE BBanka SET Bakiye = Bakiye + @Tutar WHERE HesapNo =  @AlanHesapNo
							PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaptan ' + @BankaKime 
							+ ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesaba ' + CAST(@Tutar AS NVARCHAR(MAX)) 
							+ ' değerinde para havale edilmiştir.'
							PRINT 'Son değerler;'

							SELECT @GonderenBakiye = Bakiye FROM BBanka WHERE HesapNo = @GonderenHesapNo
							SELECT @AlanBakiye = Bakiye FROM BBanka WHERE HesapNo = @AlanHesapNo
							PRINT @BankaKimden + ' sındaki ' + CAST(@GonderenHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
							+ CAST(@GonderenBakiye AS NVARCHAR(MAX))
							PRINT @BankaKime + ' ndaki ' + CAST(@AlanHesapNo AS NVARCHAR(MAX)) + ' numaralı hesapta kalan bakiye :'
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
		  INSERT ABankaRaporTablosu VALUES ('A bankasındaki ' + @AlanHesapNo + ' nolu hesap '
		                                 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' + @EskiBakiye + ' TL den ' + 
										 + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARİHİNDE HESAP GÜNCELLENMİŞTİR.')
	END
ELSE
	BEGIN
		PRINT @AlanHesapNo
		INSERT ABankaRaporTablosu VALUES ('A bankasındaki ' + @GonderenHesapNo + ' nolu hesap ' 
		                                 + @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL göndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARİHİNDE HESAP GÜNCELLENMİŞTİR.')
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
		INSERT BBankaRaporTablosu VALUES ('B bankasındaki ' + @AlanHesapNo + ' nolu hesap ' 
										 + CAST(ABS(@Tutar) AS NVARCHAR) +' TL alarak ' 
										 + @EskiBakiye + ' TL den ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARİHİNDE HESAP GÜNCELLENMİŞTİR.')
	END
ELSE
	BEGIN
		INSERT BBankaRaporTablosu VALUES ('B bankasındaki ' + @GonderenHesapNo + ' nolu hesap ' 
										 +  @EskiBakiye + ' TL den ' + CAST(@Tutar AS NVARCHAR)
										 +' TL göndererek ' + @YeniBakiye + ' TL olarak '
										 + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARİHİNDE HESAP GÜNCELLENMİŞTİR.')
	END



------------------------------------------------ TRANSACTION FINISH ------------------------------------------------

-- SQL SERVER VT yedeği alma ve yükleme

-- 1.YOL
-- Backup ile yedek alma
-- Restore ile yedeği yükleme

-- 2.YOL (Tavsiye edilen yöntem)
-- Generate Scripts

(https://www.youtube.com/watch?v=gKvNYxwrlJM)
