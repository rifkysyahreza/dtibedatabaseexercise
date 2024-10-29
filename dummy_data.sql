-- Insert into customer table
INSERT INTO "ecommerce".customer (id, username, active_address_id, created_at, updated_at, deleted_at) VALUES
(1, 'john_doe', NULL, NOW(), NOW(), NULL),
(2, 'jane_smith', NULL, NOW(), NOW(), NULL);

-- Insert into address table
INSERT INTO "ecommerce".address (id, customer_id, building_name, street_name, building_number, rt_rw_number, village_name, subdistrict_name, city_name, province_name, postal_code, receiver_phone_number, created_at, updated_at, deleted_at) VALUES
(1, 1, 'Doe Building', 'Main St', '101', 'RT01/RW02', 'VillageA', 'SubdistrictA', 'CityA', 'ProvinceA', '12345', '1234567890', NOW(), NOW(), NULL),
(2, 2, 'Smith Tower', 'Second Ave', '202', 'RT03/RW04', 'VillageB', 'SubdistrictB', 'CityB', 'ProvinceB', '67890', '0987654321', NOW(), NOW(), NULL);

-- Update active_address_id in customer table to match address entries
UPDATE "ecommerce".customer SET active_address_id = 1 WHERE id = 1;
UPDATE "ecommerce".customer SET active_address_id = 2 WHERE id = 2;

-- Insert into active_address table
INSERT INTO "ecommerce".active_address (id, address_id, created_at, updated_at, deleted_at) VALUES
(1, 1, NOW(), NOW(), NULL),
(2, 2, NOW(), NOW(), NULL);

-- Insert into seller table
INSERT INTO "ecommerce".seller (id, username, created_at, updated_at, deleted_at) VALUES
(1, 'best_seller', NOW(), NOW(), NULL),
(2, 'great_seller', NOW(), NOW(), NULL);

-- Insert into product table
INSERT INTO "ecommerce".product (id, seller_id, product_name, price, description, weight, quantity, created_at, updated_at, deleted_at) VALUES
(1, 1, 'ProductA', 25.99, 'High-quality product A', 1.5, 100, NOW(), NOW(), NULL),
(2, 2, 'ProductB', 15.50, 'Durable product B', 0.8, 200, NOW(), NOW(), NULL);

-- Insert into courier table
INSERT INTO "ecommerce".courier (id, name, shipment_fee, created_at, updated_at, deleted_at) VALUES
(1, 'FastExpress', 5000, NOW(), NOW(), NULL),
(2, 'ReliableCourier', 3000, NOW(), NOW(), NULL);

-- Insert into insurance_detail table
INSERT INTO "ecommerce".insurance_detail (id, premium_amount, insurance_provider, created_at, updated_at, deleted_at) VALUES
(1, 1000, 'SecureInsure', NOW(), NOW(), NULL),
(2, 2000, 'SafeGuard', NOW(), NOW(), NULL);

-- Insert into invoice table
INSERT INTO "ecommerce".invoice (id, seller_id, customer_id, active_address_id, shipment_address, total_price_all_item, shipment_fee, insurance_fee, total_shopping, service_fee, apps_service_fee, total_bill, courier_id, payment_method, created_at, updated_at, deleted_at) VALUES
('INV001', 1, 1, 1, 'Doe Building, Main St, CityA', 2599, 5000, 1000, 8599, 200, 150, 8949, 1, 'Credit Card', NOW(), NOW(), NULL),
('INV002', 2, 2, 2, 'Smith Tower, Second Ave, CityB', 1550, 3000, 2000, 6550, 200, 150, 6900, 2, 'PayPal', NOW(), NOW(), NULL);

-- Insert into invoice_item table
INSERT INTO "ecommerce".invoice_item (id, invoice_id, insurance_id, product_id, product_price, quantity, product_total_price, created_at, updated_at, deleted_at) VALUES
(1, 'INV001', 1, 1, 2599, 1, 2599, NOW(), NOW(), NULL),
(2, 'INV002', 2, 2, 1550, 1, 1550, NOW(), NOW(), NULL);

-- Insert into payment_method table
INSERT INTO "ecommerce".payment_method (id, invoice_id, name, amount, created_at, updated_at, deleted_at) VALUES
(1, 'INV001', 'Credit Card', 8949, NOW(), NOW(), NULL),
(2, 'INV002', 'PayPal', 6900, NOW(), NOW(), NULL);

-- Insert into promo table
INSERT INTO "ecommerce".promo (id, invoice_id, name, amount, created_at, updated_at, deleted_at) VALUES
(1, 'INV001', 'NewUserPromo', 500.0, NOW(), NOW(), NULL),
(2, 'INV002', 'HolidayDiscount', 300.0, NOW(), NOW(), NULL);
