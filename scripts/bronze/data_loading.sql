-- Enclose in within a procedure
Create or replace procedure bronze.load_data() 
language plpgsql 
as $$
declare 
	begin_time timestamp := now();
	end_time timestamp;
BEGIN	
	-- Truncating tables at first to make sure no data point is there at the start
	truncate table bronze.crm_cust_info;
	truncate table bronze.crm_prd_info;
	truncate table bronze.crm_sales_details;
	truncate table bronze.erp_custaz12;
	truncate table bronze.erp_loc_a101;
	truncate table bronze.erp_px_cat_g1v2;
	
	-- For every csv file we are doing a bulk copy of it and adding it to respective table 
    COPY bronze.crm_cust_info (cst_id, cst_key, cst_first_name, cst_last_name, cst_martial_status, cst_gndr, cst_create_date) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_crm\cust_info.csv'
             WITH (FORMAT csv, HEADER true);

    COPY bronze.crm_prd_info (prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_date, prd_end_date) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_crm\prd_info.csv'
             WITH (FORMAT csv, HEADER true);

    COPY bronze.crm_sales_details (sls_ord_num, sls_pred_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_crm\sales_details.csv'
             WITH (FORMAT csv, HEADER true);

    COPY bronze.erp_custaz12 (CID, BDATE, GEN) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_erp\CUST_AZ12.csv'
             WITH (FORMAT csv, HEADER true);

    COPY bronze.erp_loc_a101 (CID, CNTRY) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_erp\LOC_A101.csv'
             WITH (FORMAT csv, HEADER true);

    COPY bronze.erp_px_cat_g1v2 (ID, CAT, SUBCAT, MAINTENANCE) 
             FROM 'D:\Program Files\Projects\Data Warehouse\DW_Project\datasets\source_erp\PX_CAT_G1V2.csv'
             WITH (FORMAT csv, HEADER true);
	end_time := now();

	Raise notice 'Total Time %', end_time-begin_time;
END;
$$;


-- Calling the function and showing the result
call bronze.load_data();

select * from bronze.crm_cust_info;