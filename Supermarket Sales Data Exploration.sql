CREATE TABLE SuperMarkerSales (
    Invoice_ID Varchar,
    Branch TEXT,
    City TEXT,
    Customer_type TEXT,
    Gender TEXT,
    Product_line TEXT,
    Unit_price FLOAT,
    Quantity INTEGER,
    Tax_5_percent FLOAT,
    Total FLOAT,
    Date TEXT,
    Time TEXT,
    Payment TEXT,
    cogs FLOAT,
    gross_margin_percentage FLOAT,
    gross_income FLOAT,
    Rating FLOAT
);

select * from SuperMarkerSales;

-- Mencari Total Penjualan Tanpa Pajak Berdasarkan kota
select product_line, city, (quantity * unit_price) as Total_Penjualan from SuperMarkerSales
Group by product_line, city, quantity, unit_price
ORDER BY total_Penjualan DESC;

-- Mencari product_line dengan quantity terbanyak
select product_line, sum(quantity) as total_quantity from SuperMarkerSales
group by product_line 
order by total_quantity DESC;

-- Mencari product_line dengan total penjualan terbanyak berdasarkan cabang
select product_line, branch, sum(total) as total_sales from SuperMarkerSales
group by branch, product_line
order by total_sales DESC;

-- Mencari product_line terlaris berdasarkan gender
select product_line, gender, sum(total) as total_sales from SuperMarkerSales
group by product_line, gender
order by total_sales DESC;

-- Rata Rata penjualan berdasarkan produk
select product_line, AVG(TOTAL) AS Average_Sales From SuperMarkerSales
Group By product_line
order by Average_Sales DESC;

-- Mencari persentase gross income 
SELECT product_line, 
    SUM(unit_price) AS total_unit_price, 
    SUM(gross_income) AS total_gross_income,
    (SUM(gross_income) / SUM(unit_price)) * 100 AS gross_income_percentage
FROM SuperMarkerSales
GROUP BY product_line
ORDER BY gross_income_percentage DESC;





