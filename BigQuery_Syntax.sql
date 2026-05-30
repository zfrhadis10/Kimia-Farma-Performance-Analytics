CREATE OR REPLACE TABLE `kimia-farma-internship-497611.dataset_kimia_farma.tabel_analisa` AS
SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  c.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,
  
  -- 1. Menghitung persentase gross laba berdasarkan ketentuan harga
  CASE 
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- 2. Menghitung nett_sales (harga setelah dipotong diskon)
  (t.price * (1 - (t.discount_percentage / 100))) AS nett_sales,

  -- 3. Menghitung nett_profit (nett_sales dikali persentase laba)
  ((t.price * (1 - (t.discount_percentage / 100))) * CASE 
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
    END
  ) AS nett_profit,

  t.rating AS rating_transaksi

FROM 
  `kimia-farma-internship-497611.dataset_kimia_farma.final_transaction` t
LEFT JOIN 
  `kimia-farma-internship-497611.dataset_kimia_farma.kantor_cabang` c 
  ON t.branch_id = c.branch_id
LEFT JOIN 
  `kimia-farma-internship-497611.dataset_kimia_farma.product` p 
  ON t.product_id = p.product_id;
