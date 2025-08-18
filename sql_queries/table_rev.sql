SET search_path TO "Inventory";

SHOW search_path; 

SELECT *
FROM srtinv;

ALTER TABLE endinv
ALTER COLUMN "endDate" TYPE DATE USING "endDate" ::DATE;

ALTER TABLE endinv
ALTER COLUMN "endDate" TYPE DATE USING "endDate" ::DATE;

ALTER TABLE purchases
ALTER COLUMN "PODate" TYPE DATE USING "PODate" ::DATE,
ALTER COLUMN "ReceivingDate" TYPE DATE USING "ReceivingDate" ::DATE,
ALTER COLUMN "InvoiceDate" TYPE DATE USING "InvoiceDate" ::DATE,
ALTER COLUMN "PayDate" TYPE DATE USING "PayDate" ::DATE;

ALTER TABLE srtinv
ALTER COLUMN "startDate" TYPE DATE USING "startDate" ::DATE;