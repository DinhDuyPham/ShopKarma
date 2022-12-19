/*create database shop
USE master
use shop 
go
DROP DATABASE SHOP*/
--1: tạo table login chứ thông tin của admin -----------------------------------
create table LOGIN(
	ACCOUNT				varchar(100) primary key,
	PASSWORD			varchar(100) not null,
	FULLNAME			nvarchar(100) NULL,
	DATE_OF_BIRTH		datetime ,
	SEX					bit default 1,
	PHONE_NUMBER		nvarchar(20),
	EMAIL				nvarchar(50),
	ADDRESS				nvarchar(250),
	STATUS				bit default 0,
	NOTE				ntext
)

-- 2: Tạo Table [Customers] chứa Thông tin khách hàng  ---------------------------------------
create table CUSTOMERS
(
	CUSTOMER_CODE		varchar(10) primary key not null,
	CUSTOMER_NAME		nvarchar(50) not null,
	PHONE_NUMBER		varchar(20) ,
	EMAIL				varchar(50),
	ADDRESS				nvarchar(250),
	DATE_OF_BIRTH		datetime ,
	SEX					bit default 1,
	NOTE				ntext
)
go

-- 3: Tạo Table [Articles] chứa thông tin về các bài viết phục vụ cho quảng bá sản phẩm, ------
create table ARTICLES 
(
	ARTICLES_CODE		varchar(10) primary key not null,
	ARTICLES_NAME		nvarchar(250) not null,
	IMAGES				varchar(max),
	SUMMARY_CONTENT		nvarchar(2000),
	DATE_SUBMITTED		datetime ,
	TYPE_OF_NEWS		nvarchar(30),
	CONTENT				nvarchar(4000),
	ACCOUNT				varchar(100) not null ,
	APPROVED			bit default 0,
						foreign key (ACCOUNT) references LOGIN(ACCOUNT) on update cascade 
)

-- 4: Tạo Table [LOAI SAN PHAM] chứa thông tin loại sản phẩm, ngành hàng -----------------------------

CREATE TABLE TYPE_OF_PRODUCTS(
	TYPE_CODE		int				primary key not null,
	TYPE_NAME		nvarchar(88)	not null,
	NOTE			ntext			default ''
)

--5: Tạo Table [Products] chứa thông tin của sản phẩm mà shop kinh doanh online --------------

create table PRODUCTS
(
	PRODUCTS_CODE		varchar(10)			primary key	not null,
	PRODUCTS_NAME		nvarchar(500)		not NULL,
	IMAGES				varchar(max)		DEFAULT '',
	SUMMARY_CONTENT		nvarchar(2000)		DEFAULT '',
	DATE_SUBMITTED		DATETIME			DEFAULT	CURRENT_TIMESTAMP,
	TYPE_CODE			int		not null	FOREIGN KEY references	TYPE_OF_PRODUCTS(TYPE_CODE),
	CONTENT				nvarchar(4000)		DEFAULT '',
	ACCOUNT				varchar(100)		not null foreign key references LOGIN(ACCOUNT) on update cascade,
	dvt					nvarchar(32)		default N'Cái',
	APPROVED			bit					default 0,
	PRICE				INTEGER				DEFAULT 0,
	SALE				INTEGER				DEFAULT 0 CHECK (SALE>=0 AND SALE<=100),
	PRODUCER			nvarchar(168)		default ''
)
go

-- 6: Tạo Table [Orders] chứa danh sách đơn hàng mà khách đã đặt mua thông qua web ------------
create table ORDERS
(
	ORDERS_NUMBER		varchar(10)				primary key not null ,
	CUSTOMER_CODE		varchar(10) not null	foreign key references CUSTOMERS(CUSTOMER_CODE),
	ACCOUNT				varchar(100) not null	foreign key references LOGIN(ACCOUNT) on update cascade ,
	ORDER_DATE			datetime,
	ACTIVATED			bit default 1,
	DELIVERY_DATE		datetime,
	SHIPPING_ADDRESS	nvarchar(250),
	NOTE				ntext
)
go	

-- 7: Tạo Table [OrderDetails] chứa thông tin chi tiết của các đơn hàng ---

create table ORDERDETAILS
(
	ORDERS_NUMBER varchar(10) not null foreign key references ORDERS(ORDERS_NUMBER),
	PRODUCTS_CODE varchar(10) not null foreign key references PRODUCTS(PRODUCTS_CODE),
	QUANTUM int,
	PRICE bigint,
	SALE BIGINT,
	PRIMARY KEY (ORDERS_NUMBER, PRODUCTS_CODE)
)
go

create table BRANDS(
	BRAND_ID VARCHAR(10) PRIMARY KEY NOT NULL,
	BRAND_NAME VARCHAR(500) ,
	TYPE_CODE INT NOT NULL REFERENCES TYPE_OF_PRODUCTS(TYPE_CODE)
)
------------------------ NHẬP DỮ LIỆU CHO LOGIN -----------------------

insert into LOGIN(ACCOUNT, PASSWORD, FULLNAME, DATE_OF_BIRTH, SEX, PHONE_NUMBER, EMAIL, ADDRESS, STATUS, NOTE)
values('ADMIN','234',N'Lỗ Thành Văn',06/12/1996,1,0935694223,'ltvan@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')

INSERT INTO LOGIN(ACCOUNT, PASSWORD, FULLNAME, DATE_OF_BIRTH, SEX, PHONE_NUMBER, EMAIL, ADDRESS, STATUS, NOTE)
VALUES('DUY','234',N'Phạm Đình Duy',16/2/2003,0,0935693045,'pdduy@gamil.com','472 CMT8, P.11,Q3, TP.HCM',1,'')
GO
update LOGIN
set ACCOUNT = N'duy'
from LOGIN
where ACCOUNT = N'DUY'

update LOGIN
set ACCOUNT = N'admin'
from LOGIN
where ACCOUNT = N'ADMIN'

select * from LOGIN

INSERT INTO TYPE_OF_PRODUCTS(TYPE_CODE,TYPE_NAME) VALUES(1,'SPORT CLOTHES')
INSERT INTO TYPE_OF_PRODUCTS(TYPE_CODE,TYPE_NAME) VALUES(2,'FURNITURE')
INSERT INTO TYPE_OF_PRODUCTS(TYPE_CODE,TYPE_NAME) VALUES(3,'COSMETIC')
INSERT INTO TYPE_OF_PRODUCTS(TYPE_CODE,TYPE_NAME) VALUES(4,'KITCHEN TOOLS')
INSERT INTO TYPE_OF_PRODUCTS(TYPE_CODE,TYPE_NAME) VALUES(5,'TECHNOLOGY EQUIPMENT')

-- NHẬP THÔNG TIN SẢN PHẨM-------------------

------------------SPORT CLOTHES-----------------------------------------------------
--------------SHIRT------------------------------

INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('YS9496MBA','URBAN Bopu Cycling jersey','/Content/img/product/sport/shirt/T-SHIRT-1.jpg',
					'This jersey design concept uses Popular Art. Black and white stripes and simply using black and white as a direct contrast.
					This collection is mostly popular with cyclists who are looking for a quality performing jersey but affordable. 
					Snug Fit, low-cut collar. Italian MARC Waist Band keep it stay while riding. The sleeves and front hem has 
					bonded elastic for a smooth & seamless look.',
					'ADMIN',300000,1,'Monton','PCS')
					go

INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('YS9640M','URBAN Traveler Max Deep Blue Cycling Jersey','/Content/img/product/sport/shirt/T-SHIRT-2.jpg',
					'Traveler Max is the fourth generation of the best sales Traveler series known for clean 
					and minimalism look. The low neck lining and the seamless arms are really nice details, as 
					well as the Monton logo on the arm. Breathable, comfortable and high quality fabric for summer 
					riding. High functionality & exceptional comfort.',
					'ADMIN',350000,1,'Monton','PCS')
					go 

INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('YS9470MC','Custom Cycling Jerseys','/Content/img/product/sport/shirt/T-SHIRT-3.jpg',
					'+ Low cut collar
					+ Classic set-in sleeves articulated for perfect fit on the bike
					+ Italian MARC Waist Band
					+ YKK vislon zipper with MONTON icon puller
					+ Reinforced 3 back pockets with a bonus zippered security pocket
					+ Reflective trim adds visibility in low light conditions',
					'ADMIN',900000,1,'Monton','PCS')
					go 

INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('YS9601MD','Short Sleeve Cycling Jersey','/Content/img/product/sport/shirt/T-SHIRT-4.jpg',
					'+ Seamless sleeve hems
					+ Raglan sleeves easy to move
					+ Italian MARC gripper Waist Band
					+ YKK zipper with MONTON icon puller
					+ Reinforced 3 back pockets with a bonus zippered security pocket 18°-32°C / 65°-90°F
					+ DSquare: 62% polyester /38% Elastane, 160GSM
					+ Italian MITI Grecale: 92% polyester /8% Elastane, 110GSM',
					'ADMIN',599000,1,'Monton','PCS')
					go

INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('YS9634M','Private label cycling tops','/Content/img/product/sport/shirt/T-SHIRT-5.jpg',
					'Extremely tight fit race-cut design to custom mold to your shape, offering world-class 
					 aerodynamics and the true sense for speed.
					 Combining the high-performance, moisture-wicking Italian MITI Grecale provides the on-bike 
					 performance you need to stay dry andcomfortable. Italian MARC Waist Band keep it stay on pedaling.',
					'ADMIN',659000,1,'OEM','PCS')
					go

-------------------SHORT--------------------------------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('FJ-DK-11','Nylon Fitness Gym Workout Sports Cargo Running Short','/Content/img/product/sport/short/short-1.jpg',
					'+ Article number: FJ-DK-11
					 + Fabric category: polyester/spandex
					 + Composition ratio: 95%/5%
					 + Can I customize it:Sure,please connect us
					 + Applicable scenarios:Sports, fitness, running, rope skipping, exercise, outdoor
					 + Error range: 1-3cm',
					'ADMIN',150000,1,'OEM','PCS'),
-------
				('K-86','Mesh Hole Inner Tights Premium Exercise Training Workout Shorts','/Content/img/product/sport/short/short-2.jpg',
					'+ Article number: Fk-11
					+ Fabric category: polyester/spandex
					+ Composition ratio: 95%/5%
					+ Can I customize it:Sure,please connect us
					+ Applicable scenarios:Sports, fitness, running, rope skipping, exercise, outdoor
					+ Error range: 1-3cm',
					'ADMIN',139000,1,'OEM','PCS'),
-------
				('CS-001','basketball Men Mesh Shorts with Rib','/Content/img/product/sport/short/short-3.jpg',
					'+ Article number: KH-CS-001
					+ Color: Any color is available according to Pantone Card (or Our company color)
					+ Fabric: Moisture wicking fabric ,100% polyester or spandex
					+ Logo & Badge: Applique Embroidery Sublimation 3D print Other
					+ Picture & Label Policy: We can offer free pictures with your logo if you have shopping 
					experience in our store, also printed label, woven label and other special label are available',
					'ADMIN',240000,1,'Men Summer Shorts','PCS'),
-------
				('Ncs-001','Quick Dry Breathable Plain Black Basketball Shorts','/Content/img/product/sport/short/short-4.jpg',
					'Material: polyester,customized fabric
					+ Fabric Type: Mesh
					+ Technics: Sublimated/Embriodery/Silk Printing/Tackle Twill
					+ Feature: Absorption Moisture,Quick Dry,Never Fade,Never to shrink
					+ Size: All size are available
					+ Color: Custom color',
					'ADMIN',260000,1,'Men Summer Shorts','PCS'),
---------
				('HOT-001','Quick Dry Breathable Plain Black Basketball Shorts','/Content/img/product/sport/short/short-5.jpg',
					'Material: polyester,customized fabric
					+ Fabric Type: Moisture wicking fabric ,100% polyester or spandex
					+ Technics: Sublimated/Embriodery/Silk Printing/Tackle Twill
					+ Feature: Absorption Moisture,Quick Dry,Never Fade,Never to shrink
					+ Size: All size are available
					+ Color: Any color is available according to Pantone Card (or Our company color)',
					'ADMIN',140000,1,'Men Summer Shorts','PCS')

--------------------------SHOES-----------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('LRN09','adidas Men"s Lite Racer Adapt 4.0 ','/Content/img/product/sport/shoes/shoes-1.jpg',
					'Easy, comfortable style. These men"s adidas running-inspired shoes have a slip-on build secured
					by an elastic top strap. A Cloudfoam midsole cushions every single step.',
					'ADMIN',900000,1,'Adidas','PCS'),
---------
					('HRM75','PUMA Men"s Cell Surin 2 Sneaker','/Content/img/product/sport/shoes/shoes-2.jpg',
					'The cell surin matte offers a fresh look within the 10cell family. This casual athletic running 
					style offers a lighter, sleeker and modern feel while continuing with the successful heritage look 
					on visible technology. Perfect to wear before, during, and after a workout.',
					'ADMIN',2500000,1,'Puma','PCS'),
----------
					('P1321','PUMA Men"s Softride Rift Slip on Running Shoe','/Content/img/product/sport/shoes/shoes-3.jpg',
					'The SOFTRIDE Rift is PUMA’s first introduction into the SOFTRIDE franchise. With full length SOFTRIDE
					in the midsole, this style keeps you light on your feet for an all day cushioned feel. This upper 
					features a true slip on bootie construction and is highlighted by a Bold PUMA lateral branding,.? ? 
					The SOFTRIDE Rift provide extreme cushioning and all-day comfort without sacrificing the casual look 
					that you crave. Look Good Feel Good. ? ? ?',
					'ADMIN',970000,1,'Puma','PCS'),
---------
					('FL462','Fila Men"s Memory Workshift-m Shoes','/Content/img/product/sport/shoes/shoes-4.jpg',
					'SOLID PERFORMANCE: Durable leather and synthetic overlays to meet your occupational needs
					SUPERIOR TRACTION: Solid rubber slip resistant outsole - tested in accordance with the applicable industry 
					standards, including: ASTM F2913-11; though designed to help prevent slips, you should always exercise 
					caution on slick surfaces',
					'ADMIN',650000,1,'Fila','PCS'),
---------
					('FL731','Fila Men"s Memory Mike Mid Sr Walking Shoes','/Content/img/product/sport/shoes/shoes-5.jpg',
					'+ 75% Synthetic Leather, 25% Nylon Mesh
					+ Imported
					+ Rubber sole
					+ Upper made of leather provides lateral support
					+ Midsole contains EVA for cushioning and absorbs roadshock
					+ Memory Foam insole for comfort and cushioning
					+ Slip resistant outsole made of rubber for traction and durability',
					'ADMIN',840000,1,'Fila','PCS')

SELECT * FROM PRODUCTS
------------------FURNITURE--------------------------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('LHC41GY','VASAGLE Adjustable Shelf Floor Storage Bathroom Cabinet Furniture','/Content/img/product/fur/FUR-1.JPG',
					'Material: Particle Board, MDF
					Color: White/ Black/ Wood
					Application: Living room
					Certification: BV/ TUV / SGS / Intertek
					Service: Dropshipping / Customized deisgn',
					'ADMIN',595000,2,'Cabinet','PCS'),
------------
				('LHC5137','NS FURNITURE Furniture Set Sofas','/Content/img/product/fur/FUR-2.JPG',
				'size: W240*D96*H76cm
				Packing method: Carton
				OEM/ODM: Acceptable',
				'ADMIN',11288000,2,'Cabinet','PCS'),
------------
				('DE2A','Linsy School Bunk Bed Child ','/Content/img/product/fur/FUR-3.JPG',
				'Custom thick hard corner protector to protect corner.Scratch-resistant high-quality EPE to avoid collision.
				We use very professional package which could stand rain & wind so our customers could sell our sofas directly.
				Our package with shipping marks & information of the product on it.',
				'ADMIN',5706000,2,'Cabinet','PCS'),
-----------
				('ASW086','bamboo patio rattan wicker egg swing clear chair','/Content/img/product/fur/FUR-4.JPG',
				'This is a high-end leisure rattan furniture, The whole body is made of high-strength steel pipe, high-quality PE rattan,
				Hand-woven, craftsman spirit. This egg chair is suitable for indoor and outdoor leisure life and entertainment, etc.
				You can sit on it and read a book, read a magazine, ipad, and enjoy your free time, You can also rest and sleep in the egg chair,',
				'ADMIN',905000,2,'Cabinet','PCS'),
----------
				('VA00025',' mirrored dresser vanity desk for makeup','/Content/img/product/fur/FUR-5.JPG',
				'makeup vanity table wholesale Packed with a plastic bag first , and then fix by poly foam, last put in carton box 
				( and we also make packing as your require)',
				'ADMIN',2905000,2,'Cabinet','PCS'),
---------
				('HZ9020','classic shampoo chair','/Content/img/product/fur/FUR-6.JPG',
				'makeup vanity table wholesale Packed with a plastic bag first , and then fix by poly foam, last put in carton box 
				( and we also make packing as your require),The whole body is made of high-strength steel pipe',
				'ADMIN',3050000,2,'Cabinet','PCS')

-----------------------COSMETIC---------------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('p10-06','Japan basic cosmetic moisturizing lotion 150ml face care product','/Content/img/product/cos/COS-1.JPG',
					'About Hita Tenryosui Water: Three major features, Natural active hydrogen water
					Characteristics: Weakly alkaline with PH about 8.3, Silica Approximately 90mg / L  
					Evidence: Academic journal Animal Cell Technology (Holand), Biophysics specialty published in the magazine BBRC (USA) 　',
					'ADMIN',595000,3,'Aqua Venus','PCS'),
----------
					('p22-2','Super white Mask brightening and moisturizing beauty','/Content/img/product/cos/COS-2.JPG',
					'Aqua Venus series = Say goodbye to all skin problems ! The new bio-cellulose mask contains plenty of 
					high-concentration beauty essence that concentrates only luxurious ingredients that are unparalleled in the world.',
					'ADMIN',421000,3,'Aqua Venus','PCS'),
----------
					('p12-3','Aqua Venus Sun cut cream Japanese high quality lotion sunscreen tube','/Content/img/product/cos/COS-3.JPG',
					'Aqua Venus series = Say goodbye to all skin problems ! The new bio-cellulose mask contains plenty of 
					high-concentration beauty essence that concentrates only luxurious ingredients that are unparalleled in the world.',
					'ADMIN',471000,3,'Aqua Venus','PCS'),
----------
					('p18-6','Aqua Venus Sensitive Gel popular face skin care','/Content/img/product/cos/COS-4.JPG',
					'Aqua Venus series = Say goodbye to all skin problems ! 100% active ingredients 
					NO Synthetic Surfactant,Preservatives (Parabens),Antioxidants,Disinfectants...Hold the most number of cases and results!!',
					'ADMIN',595000,3,'Aqua Venus','PCS'),	
---------
					('p21-7','Super white EX whitening cream face products skin care set new','/Content/img/product/cos/COS-5.JPG',
					'Aqua Venus series = Say goodbye to all skin problems ! 100% active ingredients 
					NO Synthetic Surfactant,Preservatives (Parabens),Antioxidants,Disinfectants...Hold the most number of cases and results!!\
					An essence which leads to translucency, a feeling of tension, bright and glowing skin with ingredients of attention combining  
					anti aging care such as Fullerene, Giga white, and Pycnogenol luxuriously.',
					'ADMIN',645000,3,'Aqua Venus','PCS'),
----------
					('p19-1','Aqua Venus Excellent Veil Japan complex facial moisturizing cream','/Content/img/product/cos/COS-6.JPG',
					'Aqua Venus series = Say goodbye to all skin problems !It combines three kinds of ceramide which forms barrier function.
					It protects the skin which has decreased resistance with activation of the cell, grape resveratrol, and shea butter with 
					high qualitymoisturizing ingredients to raise the reproduction function.',
					'ADMIN',645000,3,'Aqua Venus','PCS')

-----------------------KITCHEN TOOLS---------------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('K18-09',' aluminum cooking pots and pans set ','/Content/img/product/kit/KIT-1.JPG',
					'Always a pre-production sample before mass production; Always final Inspection before shipment;
					Complete production line and QC system 3 OEM and ODM acceptable
					Accepted Delivery Terms: FOB,CIF,EXW；Accepted Payment Currency:USD;',
					'ADMIN',2200000,4,'KALA','PCS'),
--------
					('KALA-020','Hot selling kitchen cookware set non stick casseroles pot cooking pots and pans set','/Content/img/product/kit/KIT-2.JPG',
					'Always a pre-production sample before mass production; Always final Inspection before shipment;
					Complete production line and QC system 3 OEM and ODM acceptable
					Accepted Delivery Terms: FOB,CIF,EXW；Accepted Payment Currency:USD;',
					'ADMIN',173000,4,'KALA','PCS'),
---------
					('KALA-022','Good selling kitchen supplies non stick frying pan aluminum ','/Content/img/product/kit/KIT-3.JPG',
					'Always a pre-production sample before mass production; Always final Inspection before shipment;
					Complete production line and QC system 3 OEM and ODM acceptable
					Accepted Delivery Terms: FOB,CIF,EXW；Accepted Payment Currency:USD;',
					'ADMIN',496000,4,'KALA','PCS'),
---------
					('KALA-673','Stainless Steel Cooking kitchen Utensil set accessories Kitchen','/Content/img/product/kit/KIT-4.JPG',
					'Always a pre-production sample before mass production; Always final Inspection before shipment;
					Complete production line and QC system 3 OEM and ODM acceptable
					Accepted Delivery Terms: FOB,CIF,EXW；Accepted Payment Currency:USD;',
					'ADMIN',56000,4,'XXMJ','PCS'),
--------
					('KALA-33','Vegetable kitchen tools USB Portable Electric Garlic Chopper','/Content/img/product/kit/KIT-5.JPG',
					'Color: Green,Pink,White
					Material: ABS+Stainless Steel
					Charging Mode: USB Charging，1200mah,Rechargeable (lithium battery)
					Power: 30W
					Voltage: 5V
					Capacity: 100/250ml
					Blade: 2 blades（100ml）;3 blades（250ml）',
					'ADMIN',206000,4,'XXMJ','PCS'),
---------
					('FC004-A','Cutter Slicer Vegetable Chopper','/Content/img/product/kit/KIT-6.JPG',
					'Material: Plastic Body+403 Stainless Steel Blade
					Keyword: vegetable cutter/vegetable chopper
					Color: Red/Gray
					Blade: Stainless Steel Chopping Blade',
					'ADMIN',123000,4,'XXMJ','PCS')
GO
-----------------------TECHNOLOGY EQUIPMENT---------------------------------------------------
INSERT INTO PRODUCTS(PRODUCTS_CODE, PRODUCTS_NAME,IMAGES, SUMMARY_CONTENT,ACCOUNT,PRICE, TYPE_CODE,PRODUCER,dvt)
			VALUES('AP-164','Apple Watch Series 7 ','/Content/img/product/tech/TEC-1.JPG',
					'With cellular data, Apple Watch Series 7 helps you stay connected with the people and things 
					you care about, even when you don"t have your phone with you. Receive calls and respond to messages. 
					Listen to your favorite music and podcasts online. Get quick help from SOS Emergency and 
					international emergency calls.;',
					'ADMIN',19990000,5,'APPLE','PCS'),
------------
					('AP-160','Apple Watch SE 2022 Nhôm GPS + Cellular 44mm','/Content/img/product/tech/TEC-2.JPG',
					'Sims & Calls: Via eSIM (independent calling without phone)
					Special add-ons: Listen to music, Fall detection, Bluetooth connection with headphones, Water Resistant / Water Resistant:
					Water resistant 5 ATM – ISO 22810:2010 (Bathing, swimming in shallow water)
					Health tracking: Training mode, Sleep tracking, Calculate calories consumed, Calculate running distance, Measure heartbeat
					Other utilities: Water resistant, Listen to calls on the watch, Alarm, Call, Line,..',
					'ADMIN',7990000,5,'APPLE','PCS'),
------------
					('SS-064','Samsung Galaxy Watch5 LTE 44mm Đen','/Content/img/product/tech/TEC-3.JPG',
					'The Galaxy Watch5 has a familiar round face designed for a seamless feel with a durable aluminum alloy frame. The familiar
					tempered glass material in the Galaxy Watch series has been upgraded to a high-class Sapphire glass to help increase the 
					hardness of the screen, reducing scratches and cracks during use. The silicone strap on Galaxy Watch products is always 
					appreciated for its smoothness and comfort for the wrist when doing a lot of activity or wearing it while sleeping.',
					'ADMIN',7990000,5,'SAMSUNG','PCS'),
-----------
					('SS-015',' Samsung Galaxy Watch5 44mm ','/Content/img/product/tech/TEC-4.JPG',
					'Samsung Galaxy Watch5 has the familiar round face shape that we often see in its smart watches. The 44 mm version offers
					a rather masculine color palette but still helps the wearer exude a trendy, youthful look.The strap is finished from 
					silicone material with a high-quality aluminum alloy frame and Sapphire glass. This is a harmonious combination of 
					aesthetics and durability, keeping the watch in the latest state as well as limiting scratches when accidentally bumped lightly.',
					'ADMIN',6990000,5,'SAMSUNG','PCS'),
----------
					('SS-115','Galaxy Watch 4 LTE Classic 46mm','/Content/img/product/tech/TEC-5.JPG',
					'Samsung Galaxy Watch 4 LTE Classic 46mm brings luxury and modernity with a sturdy stainless steel frame, SUPER AMOLED screen is 
					covered by durable, good-strength Gorrilla Glass Dx+. Soft silicone strap, high elasticity, waterproof, perforated design for 
					users to breathe when wearing.Galaxy Watch4 Series is the first Galaxy Watch series to use the Exynos W920 processor with 5 nm 
					process with 20% faster CPU, 50% more RAM and 10 times faster GPU than the Exynos 9110 chip of the Galaxy Watch 3 series. This 
					gives users smooth scrolling and surfing, giving you interesting experiences.',
					'ADMIN',4990000,5,'SAMSUNG','PCS'),
-----------
					('HA-155','Amazfit GTR 4 46mm','/Content/img/product/tech/TEC-6.JPG',
					'The Amazfit GTR 4 series inherits the typical design of the Amazfit GTR 3, which is a circular watch face with a luxurious, 
					durable aluminum alloy frame. Although it has a face size of 46 mm, it does not feel heavy when worn with a weight of only 34 
					grams. When practicing sports or daily activities, this product does not cause any problems for me. As I see it, Amazfit smart 
					watch has a minimalist design style, suitable for both male and female users. Amazfit launched 3 versions: leather strap, silicone 
					strap and nylon strap, each type of watch strap will have its own advantages and disadvantages, depending on your preferences and 
					needs, you can choose accordingly or you You can also buy many separate strings to change like me, to add a variety of styles.',
					'ADMIN',4990000,5,'Huami Amazfit','PCS')

SELECT * FROM PRODUCTS  
INSERT INTO BRANDS(BRAND_ID, BRAND_NAME, TYPE_CODE)
VALUES	('A01','Monton',1),
		('A02','OEM',1),
		('A03','Men Summer Shorts',1),
		('A04','Adidas', 1),
		('A05','Puma', 1),
		('A06','Fila',1),

		('B01','Cabinet', 2),

		('C01','Aqua Venus',3),

		('D01','KALA',4),
		('D02','XXMJ',4),

		('E01','APPLE',5),
		('E02','SAMSUNG',5),
		('E03','Huami Amazfit',5)
GO
SELECT * FROM BRANDS
