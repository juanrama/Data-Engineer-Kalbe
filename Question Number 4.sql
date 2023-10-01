create database KALBE

-- Create Table Inventory
create table Inventory(
	Item_code int not null,
	Item_name varchar(50) not null,
	Item_price int not null,
	Item_total int not null,
	constraint PK_Inventory primary key (Item_code)
)

-- Insert Value to Table Inventory
insert into Inventory (Item_code, Item_name, Item_price, Item_total)
values (2341, 'Promag Tablet', 3000, 100),
	   (2342, 'Hydro Coco 250ML', 7000, 10),
	   (2343, 'Nutrive Benecol 100ML', 20000, 30),
	   (2344, 'Blackmores Vit C 500Mg', 95000, 45),
	   (2345, 'Entrasol Gold 370G', 90000, 120)
	   
-- Show Item_name that has the highest number in Item_total
select Item_name
from Inventory
where Item_total = (select max(Item_total) from inventory)

--  Update the Item_price of the output of question bullet
update Inventory
set Item_price = 8000
where Item_name = 'Entrasol Gold 370G'

-- What will happen if we insert another Item_name with Item_code of 2343 into the table? 
insert into Inventory (Item_code, Item_name, Item_price, Item_total)
values (2343, 'test', 1000, 1)


-- Delete the Item_name that has the lowest number of Item_total
DELETE FROM Inventory WHERE Item_total=(SELECT MIN(Item_total) FROM Inventory)
