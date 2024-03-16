-- queries for supplier information needs, based on the UML diagram

-- 1) Find all stores that have deliveries scheduled on a given day of the week.
-- selecting for deliveries on Mondays
SELECT sc.store
FROM SupplierContractProduct scprod, SupplierContract sc
WHERE scprod.supplier_contract = sc.id
    AND DAYOFWEEK(scprod.delivery_time) = 2 

-- 2) For each store, find the supplier from which the store buys the most products. 
with a as (
    SELECT sc.store as st, sc.supplier as sup, COUNT(scprod.id) as num_prods
    FROM store s, SupplierContract sc, SupplierContractProduct scprod
    WHERE sc.store = s.id AND scprod.supplier_contract = sc.id
    GROUP BY sc.store, sc.supplier
)
SELECT sc.store, sc.supplier, COUNT(scprod.id)
FROM store s, SupplierContract sc, SupplierContractProduct scprod, a
WHERE sc.store = s.id AND scprod.supplier_contract = sc.id
    AND COUNT(scprod.id) = MAX(a.num_prods)
GROUP BY sc.store, sc.supplier

-- 3) Find the product on which the supplier makes the greatest revenue across all contracts. 
with a as (
    SELECT scprod.product_id as pid, sc.supplier as supp, SUM(scprod.price) as revenue 
    FROM SupplierContract sc, SupplierContractProduct scprod
    WHERE scprod.supplier_contract = sc.id
    GROUP BY scprod.product_id, sc.supplier
)
SELECT scprod.product_id, sc.supplier, SUM(scprod.price)
FROM a, SupplierContract sc, SupplierContractProduct scprod
WHERE scprod.product_id = a.pid, sc.supplier = a.supp, SUM(scprod.price) = MAX(a.revenue)
    AND scprod.supplier_contract = sc.id
GROUP BY scprod.product_id, sc.supplier

-- 4) For each product, find which store spends the most money on the product. 
with a as (
    SELECT scprod.product_id as pid, sc.store as st, SUM(scprod.price) as cost
    FROM SupplierContract sc, SupplierContract scprod
    WHERE scprod.supplier_contract = sc.id 
    GROUP BY scprod.product_id, sc.store
)
SELECT scprod.product_id, sc.store, SUM(scprod.price)
FROM a, SupplierContract sc, SupplierContractProduct scprod
WHERE scprod.supplier_contract = sc.id
    AND scprod.product_id = a.pid, sc.store = a.st, SUM(scprod.price) = MAX(a.cost)
GROUP BY scprod.product_id, sc.store