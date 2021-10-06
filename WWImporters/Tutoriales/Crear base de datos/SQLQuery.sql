CREATE TABLE  employee(
    employee VARCHAR(255),
    employee_key INT NOT NULL, 
    is_salesperson BIT,
    preferred_name VARCHAR(255),
    PRIMARY KEY (employee_key)
);

CREATE TABLE city(
    city VARCHAR(255),
    city_key INT NOT NULL,
    continent VARCHAR(255),
    country VARCHAR(255),
    latest_recorded_population INT,
    region VARCHAR(255),
    sales_territory VARCHAR(255),
    state_province VARCHAR(255),
    subregion VARCHAR(255),
    PRIMARY KEY(city_key)
)

CREATE TABLE stockitem (
    brand VARCHAR(255),
    buying_package VARCHAR(255),
    color VARCHAR(255),
    is_chiller_stock BIT, 
    lead_time_days INT,
    quantity_per_outer INT,
    recommended_retail_price INT,
    selling_package VARCHAR(255),
    size_val VARCHAR(255),
    stock_item VARCHAR(255),
    stock_item_key INT NOT NULL,
    PRIMARY KEY(stock_item_key)
)

CREATE TABLE package (
    package_key INT NOT NULL,
    package VARCHAR(255),
    PRIMARY KEY(package_key)
)

CREATE TABLE date_table (
    date VARCHAR(255) NOT NULL,
    day_number INT,
    day INT,
    month VARCHAR(255),
    short_month VARCHAR(255),
    calendar_month_number INT,
    calendar_month_label VARCHAR(255),
    calendar_year INT,
    calendar_year_label VARCHAR(255),
    fiscal_month_number INT,
    fiscal_month_label VARCHAR(255),
    fiscal_year INT,
    fiscal_year_label VARCHAR(255),
    iso_week_number INT,
    PRIMARY KEY(date)
)

CREATE TABLE customer (
    bill_to_customer VARCHAR(255),
    buying_group VARCHAR(255),
    category VARCHAR(255),
    customer VARCHAR(255),
    customer_key INT NOT NULL,
    postal_code VARCHAR(255),
    primary_contact VARCHAR(255),
    PRIMARY KEY(customer_key)
)

CREATE TABLE fact_order (
    city_key INT, 
    customer_key INT,
    order_date_key VARCHAR(255),
    order_key INT NOT NULL,
    package_key INT,
    package_date_key VARCHAR(255),
    picker_key INT,
    quantity INT,
    salesperson_key INT,
    stock_item_key INT,
    tax_amount FLOAT,
    PRIMARY KEY (order_key),
    FOREIGN KEY (city_key) REFERENCES city(city_key),
    FOREIGN KEY (customer_key) REFERENCES customer(customer_key),
    FOREIGN KEY (order_date_key) REFERENCES date_table(date),
    FOREIGN KEY (package_key) REFERENCES package(package_key),
    FOREIGN KEY (picker_key) REFERENCES employee(employee_key),
    FOREIGN KEY (salesperson_key) REFERENCES employee(employee_key),
    FOREIGN KEY (stock_item_key) REFERENCES stockitem(stock_item_key)
)