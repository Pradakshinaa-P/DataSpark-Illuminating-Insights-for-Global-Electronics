use electronics;
show tables;
select count(*) from merge_table;
select*from sales_store;

create table sales_overtime as select `Order Number`,sum(`Unit Price USD`* Quantity) as Total_sales
from merge_table group by `Order Number` order by `Order Number`;

create table sales_by_store as select `StoreKey`,sum(`Unit Price USD`* Quantity) as Total_sales
from merge_table group by `StoreKey` order by Total_sales DESC;

create table sales_by_Product as select `Product Name`, sum(`Unit Price USD`* Quantity) as Total_sales
from merge_table group by `Product Name` Order by `Total_sales` Desc limit 5;
create table sales_by_Productpop as select `Product Name`, sum(`Unit Price USD`* Quantity) as Total_sales
from merge_table group by `Product Name` Order by `Total_sales` asc limit 5;

create table sales_by_Quantity as select `Product Name`, Quantity from merge_table;

create table Sales_by_gender as select `Gender`, sum(`Unit Price USD`* Quantity) 
as Total_sales from merge_table group by `Gender` order by Total_sales Desc;

create table Sales_by_Currency as select `Currency Code`,sum(`Unit Price USD`* Quantity) 
as Total_sales from merge_table group by `Currency Code` order by Total_sales Desc;

create table sales_by_customer as select Name,sum(`Unit Price USD`* Quantity)
as Total_sales from merge_table group by Name order by Total_sales;

create table sales_by_Brand as select Brand,sum(`Unit Price USD`* Quantity)
as Total_sales from merge_table group by Brand order by Total_sales DESC LIMIT 5;

create table sales_by_category as select Category,sum(`Unit Price USD`* Quantity)
as Total_sales from merge_table group by Category order by Total_sales DESC LIMIT 5;

create table sales_by_subcategory as select Subcategory,sum(`Unit Price USD`* Quantity)
as Total_sales from merge_table group by Subcategory order by Total_sales DESC LIMIT 5;

create table avg_order as select avg(`Unit Price USD`* Quantity) as Avg_order
from merge_table;

create table sales_by_age as select Name, year(curdate())-Birthday as Age 
from merge_table;
select *from sales_by_age;

drop table sales_by_state;
create table sales_by_state as select State , sum(`Unit Price USD`* Quantity) as total_sales
from merge_table group by State order by total_sales desc limit 10;

create table sales_by_country as select Country,sum(`Unit Price USD`* Quantity) as total_sales
from merge_table group by Country order by total_sales;

create table profit_margin as 
select distinct `Product Name`, 
((`Unit Price USD`-`Unit Cost USD`)/`Unit Price USD`)*100 as Profit_mar from merge_table;
drop table  profit_margin; 

create table total_sales as select sum(`Order Number`) as `Total Sales`, 
sum(`Quantity`) as 	`Total Quantity`,
sum(`Unit Price USD`* Quantity) as `Revenue` from merge_table;

create table sales as select StoreKey,sum(`Order Number`)from sales_store group by StoreKey;
create table sto_ana as select distinct StoreKey,`Square Meters`from sales_store;

create table Sto_sale_ana as select sum(`Unit Price USD`* Quantity) as sales , Storekey from merge_table
group by Storekey;
create table Store_qua as select sum(Quantity) as `quantity sold`, Storekey from merge_table
group by Storekey;

create table store_sal as select Storekey,year(curdate())-`Open Date` as Age from sales_store;

create table Store_loca as select distinct StoreKey,Country from sales_store;
create table Store_state as select distinct StoreKey,State from sales_store;
