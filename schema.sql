-- DROP SCHEMA ecommerce;

CREATE SCHEMA ecommerce AUTHORIZATION myuser;

-- DROP SEQUENCE ecommerce.active_address_id_seq;

CREATE SEQUENCE ecommerce.active_address_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.address_id_seq;

CREATE SEQUENCE ecommerce.address_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.courier_id_seq;

CREATE SEQUENCE ecommerce.courier_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.customer_id_seq;

CREATE SEQUENCE ecommerce.customer_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.insurance_detail_id_seq;

CREATE SEQUENCE ecommerce.insurance_detail_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.invoice_item_id_seq;

CREATE SEQUENCE ecommerce.invoice_item_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.payment_method_id_seq;

CREATE SEQUENCE ecommerce.payment_method_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.product_id_seq;

CREATE SEQUENCE ecommerce.product_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.promo_id_seq;

CREATE SEQUENCE ecommerce.promo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.seller_id_seq;

CREATE SEQUENCE ecommerce.seller_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- ecommerce.courier definition

-- Drop table

-- DROP TABLE ecommerce.courier;

CREATE TABLE ecommerce.courier (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	shipment_fee int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT courier_pkey PRIMARY KEY (id)
);


-- ecommerce.insurance_detail definition

-- Drop table

-- DROP TABLE ecommerce.insurance_detail;

CREATE TABLE ecommerce.insurance_detail (
	id serial4 NOT NULL,
	premium_amount int4 NULL,
	insurance_provider varchar NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT insurance_detail_pkey PRIMARY KEY (id)
);


-- ecommerce.seller definition

-- Drop table

-- DROP TABLE ecommerce.seller;

CREATE TABLE ecommerce.seller (
	id serial4 NOT NULL,
	username varchar NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT seller_pkey PRIMARY KEY (id)
);


-- ecommerce.product definition

-- Drop table

-- DROP TABLE ecommerce.product;

CREATE TABLE ecommerce.product (
	id serial4 NOT NULL,
	seller_id int4 NULL,
	product_name varchar NOT NULL,
	price numeric(10, 2) NULL,
	description varchar NULL,
	weight numeric(10, 2) NULL,
	quantity int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT fk_product_seller FOREIGN KEY (seller_id) REFERENCES ecommerce.seller(id) ON DELETE CASCADE
);


-- ecommerce.active_address definition

-- Drop table

-- DROP TABLE ecommerce.active_address;

CREATE TABLE ecommerce.active_address (
	id serial4 NOT NULL,
	address_id int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT active_address_pkey PRIMARY KEY (id)
);


-- ecommerce.address definition

-- Drop table

-- DROP TABLE ecommerce.address;

CREATE TABLE ecommerce.address (
	id serial4 NOT NULL,
	customer_id int4 NULL,
	building_name varchar NULL,
	street_name varchar NULL,
	building_number varchar NULL,
	rt_rw_number varchar NULL,
	village_name varchar NULL,
	subdistrict_name varchar NULL,
	city_name varchar NULL,
	province_name varchar NULL,
	postal_code varchar NULL,
	receiver_phone_number varchar NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT address_pkey PRIMARY KEY (id)
);


-- ecommerce.customer definition

-- Drop table

-- DROP TABLE ecommerce.customer;

CREATE TABLE ecommerce.customer (
	id serial4 NOT NULL,
	username varchar NOT NULL,
	active_address_id int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id)
);


-- ecommerce.invoice definition

-- Drop table

-- DROP TABLE ecommerce.invoice;

CREATE TABLE ecommerce.invoice (
	id varchar NOT NULL,
	seller_id int4 NULL,
	customer_id int4 NULL,
	active_address_id int4 NULL,
	shipment_address varchar NULL,
	total_price_all_item numeric(10, 2) NULL,
	shipment_fee numeric(10, 2) NULL,
	insurance_fee numeric(10, 2) NULL,
	total_shopping numeric(10, 2) NULL,
	service_fee numeric(10, 2) NULL,
	apps_service_fee numeric(10, 2) NULL,
	total_bill numeric(10, 2) NULL,
	courier_id int4 NULL,
	payment_method varchar NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT invoice_pkey PRIMARY KEY (id)
);


-- ecommerce.invoice_item definition

-- Drop table

-- DROP TABLE ecommerce.invoice_item;

CREATE TABLE ecommerce.invoice_item (
	id serial4 NOT NULL,
	invoice_id varchar NULL,
	insurance_id int4 NULL,
	product_id int4 NULL,
	product_price int4 NULL,
	quantity int4 NULL,
	product_total_price int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT invoice_item_pkey PRIMARY KEY (id)
);


-- ecommerce.payment_method definition

-- Drop table

-- DROP TABLE ecommerce.payment_method;

CREATE TABLE ecommerce.payment_method (
	id serial4 NOT NULL,
	invoice_id varchar NULL,
	"name" varchar NULL,
	amount numeric(10, 2) NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT payment_method_pkey PRIMARY KEY (id)
);


-- ecommerce.promo definition

-- Drop table

-- DROP TABLE ecommerce.promo;

CREATE TABLE ecommerce.promo (
	id serial4 NOT NULL,
	invoice_id varchar NULL,
	"name" varchar NULL,
	amount float8 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT promo_pkey PRIMARY KEY (id)
);


-- ecommerce.active_address foreign keys

ALTER TABLE ecommerce.active_address ADD CONSTRAINT fk_active_address_address FOREIGN KEY (address_id) REFERENCES ecommerce.address(id) ON DELETE CASCADE;


-- ecommerce.address foreign keys

ALTER TABLE ecommerce.address ADD CONSTRAINT fk_address_customer FOREIGN KEY (customer_id) REFERENCES ecommerce.customer(id) ON DELETE CASCADE;


-- ecommerce.customer foreign keys

ALTER TABLE ecommerce.customer ADD CONSTRAINT fk_customer_active_address FOREIGN KEY (active_address_id) REFERENCES ecommerce.active_address(id) ON DELETE SET NULL;


-- ecommerce.invoice foreign keys

ALTER TABLE ecommerce.invoice ADD CONSTRAINT fk_invoice_active_address FOREIGN KEY (active_address_id) REFERENCES ecommerce.active_address(id) ON DELETE SET NULL;
ALTER TABLE ecommerce.invoice ADD CONSTRAINT fk_invoice_courier FOREIGN KEY (courier_id) REFERENCES ecommerce.courier(id) ON DELETE SET NULL;
ALTER TABLE ecommerce.invoice ADD CONSTRAINT fk_invoice_customer FOREIGN KEY (customer_id) REFERENCES ecommerce.customer(id) ON DELETE SET NULL;
ALTER TABLE ecommerce.invoice ADD CONSTRAINT fk_invoice_seller FOREIGN KEY (seller_id) REFERENCES ecommerce.seller(id) ON DELETE SET NULL;


-- ecommerce.invoice_item foreign keys

ALTER TABLE ecommerce.invoice_item ADD CONSTRAINT fk_invoice_item_insurance FOREIGN KEY (insurance_id) REFERENCES ecommerce.insurance_detail(id) ON DELETE SET NULL;
ALTER TABLE ecommerce.invoice_item ADD CONSTRAINT fk_invoice_item_invoice FOREIGN KEY (invoice_id) REFERENCES ecommerce.invoice(id) ON DELETE CASCADE;
ALTER TABLE ecommerce.invoice_item ADD CONSTRAINT fk_invoice_item_product FOREIGN KEY (product_id) REFERENCES ecommerce.product(id) ON DELETE CASCADE;


-- ecommerce.payment_method foreign keys

ALTER TABLE ecommerce.payment_method ADD CONSTRAINT fk_payment_method_invoice FOREIGN KEY (invoice_id) REFERENCES ecommerce.invoice(id) ON DELETE CASCADE;


-- ecommerce.promo foreign keys

ALTER TABLE ecommerce.promo ADD CONSTRAINT fk_promo_invoice FOREIGN KEY (invoice_id) REFERENCES ecommerce.invoice(id) ON DELETE CASCADE;