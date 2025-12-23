-- DDL Table creation statements for all datasets available
-- Each dataset gets its own table

create table bronze.crm_cust_info(
	cst_id int,
	cst_key varchar(50),
	cst_first_name varchar(50),
	cst_last_name varchar(50),
	cst_martial_status varchar(50),
	cst_gndr varchar(50),
	cst_create_date date
);


create table bronze.crm_prd_info(
	prd_id int,
	prd_key varchar(50),
	prd_nm varchar(50),
	prd_cost int,
	prd_line varchar(50),
	prd_start_date date,
	prd_end_date date
);

create table bronze.crm_sales_details(
	sls_ord_num varchar(50),
	sls_pred_key varchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int, 
	sls_due_dt int, 
	sls_sales int,
	sls_quantity int, 
	sls_price int
);

create table bronze.erp_CUSTAZ12(
	cin varchar(50),
	bdate date,
	gen varchar(50)
);

create table bronze.erp_LOC_A101(
	cin varchar(50),
	cntry varchar(50)
);

create table bronze.erp_PX_CAT_G1V2(
	ID varchar(50),
	cat varchar(50),
	subcat varchar(50),
	maintenance varchar(50)

);
