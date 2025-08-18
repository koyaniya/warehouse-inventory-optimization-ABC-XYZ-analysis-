SET search_path TO "Inventory";

SELECT *
FROM purchases;

SELECT DISTINCT("ReceivingDate")
FROM purchases;

SELECT "Brand", date_trunc('month', "ReceivingDate") as Month, SUM("Quantity")
FROM purchases
WHERE "Store" = 76
GROUP BY Month, "Brand";

SELECT "Brand", EXTRACT(month from "ReceivingDate") as Month, SUM("Quantity")
FROM purchases
WHERE "Store" = 76
GROUP BY Month, "Brand";