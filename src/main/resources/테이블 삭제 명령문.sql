SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
SELECT 'DROP SEQUENCE "' || SEQUENCE_NAME || '" CASCADE CONSTRAINTS;' FROM user_SEQUENCEs;
DROP SEQUENCE "ORDERS_SEQ" CASCADE CONSTRAINTS;
DROP SEQUENCE "PRODUCT_SEQ" CASCADE CONSTRAINTS;
DROP SEQUENCE "SHOPPINGBASKET_SEQ" CASCADE CONSTRAINTS;
DROP TABLE "ADMIN" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCT" CASCADE CONSTRAINTS;
DROP TABLE "USERS" CASCADE CONSTRAINTS;
DROP TABLE "SHOPPINGBASKET" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTIMAGE" CASCADE CONSTRAINTS;
DROP TABLE "ORDERS" CASCADE CONSTRAINTS;