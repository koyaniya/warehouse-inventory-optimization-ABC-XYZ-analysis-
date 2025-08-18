SET search_path TO "Inventory";

SELECT "PONumber",
	"PODate",
	COUNT(DISTINCT "Store") as Store,
	COUNT (DISTINCT "Brand") as Brand,
	SUM("Quantity") as Products
FROM purchases
GROUP BY "PONumber",
		"PODate"

CREATE TABLE inventory_flow_store AS
SELECT 
	p.Month,
	p."Brand",
	p."Store",
	p.PurchasedQuantity,
	s.SoldQuantity
FROM (
	SELECT
		"Brand",
		"Store",
		EXTRACT(MONTH FROM "ReceivingDate") as Month,
		SUM("Quantity") as PurchasedQuantity
	FROM purchases 
	GROUP BY
		"Brand",
		"Store",
		Month) p
JOIN(
	SELECT
		"Brand",
		"Store",
		EXTRACT( MONTH FROM "SalesMonth") as Month,
		SUM("SalesQuantity") as SoldQuantity
	FROM sales 
	GROUP BY 
		"Brand",
		"Store",
		Month) s
	ON p."Brand" = s."Brand" AND p.Month = s.Month AND p."Store" = s."Store";


-- CREATE TABLE inventory_flow_final AS 
-- SELECT f."month", f."Brand",p."Description", f."Store", f."purchasedquantity", f."soldquantity"
-- FROM productprice p
-- JOIN inventory_flow_store f
-- ON p."Brand" = f."Brand";

DROP TABLE inventory_flow_final;


--Brand table 
CREATE TABLE brands AS
SELECT DISTINCT COALESCE(s."Brand", p."Brand") AS Brand, COALESCE (s."Description",p."Description") AS Description
FROM srtinv s
FULL OUTER JOIN purchases p ON s."Brand" = p."Brand"
ORDER BY brand;

SELECT *
FROM brands 
WHERE brand = 1044;


CREATE TABLE inventory_flow_final AS
SELECT b."brand" AS Brand,
	b."description" AS Decription,
	COALESCE(f."month",1) AS Month,
	f."Store" AS store,
	COALESCE(f."purchasedquantity", 0) AS Purchased_QTY,
	COALESCE(f."soldquantity",0) AS Sold_QTY
FROM brands b
LEFT JOIN inventory_flow_store f
ON b."brand" = f."Brand";

SELECT * 
FROM inventory_flow_final;


SELECT *
FROM brands
WHERE brand = 4912;

SELECT *
FROM inventory_flow_final
WHERE "Store" IS NULL;

SELECT COUNT(DISTINCT "Brand")
FROM srtinv;

SELECT COUNT(DISTINCT "Brand")
FROM purchases;


-- Product withough sales 
SELECT DISTINCT si."Brand", si."Description", si.Stock
FROM(SELECT "Brand", "Description", SUM("onHand") as Stock
FROM srtinv
GROUP BY "Brand", "Description") si
LEFT JOIN sales s On si."Brand" = s."Brand"
WHERE s."Brand" IS NULL;

SELECT DISTINCT si."Brand", si."Description", si."Store", si.Stock
FROM (SELECT "Brand", "Description", "Store", SUM("onHand") as Stock
FROM srtinv
GROUP BY "Brand", "Description", "Store"
ORDER BY "Brand") si
LEFT JOIN sales s ON si."Brand" = s."Brand"
WHERE s."Brand" IS NULL;

SELECT *
FROM srtinv
WHERE "onHand" = 0;

-- One Brand for one description
SELECT "Brand", COUNT(DISTINCT "Description") as counts
FROM srtinv
GROUP BY "Brand"
HAVING COUNT(DISTINCT "Description") > 1;

SELECT "Brand", "onHand"
FROM srtinv
WHERE "onHand" = 0





SELECT "Brand"
FROM sales;

SELECT "Brand"
FROM purchases;



SELECT * 
FROM purchases
WHERE "Brand" = 5609;

SELECT *
FROM endinv
WHERE "onHand" = (SELECT MAX("onHand")
FROM endinv
GROUP BY "Brand")

SELECT *
FROM inventory_flow