SELECT 
    i.id AS invoice_id,
    s.username AS seller_name,
    c.username AS customer_name,
    i.created_at AS invoice_date,
    CONCAT(a.building_name, ', ', a.street_name, ', ', a.city_name, ', ', a.province_name, ', ', a.postal_code) AS active_address,
    i.total_price_all_item AS total_item_price,
    i.shipment_fee,
    i.insurance_fee,
    i.total_shopping,
    i.service_fee,
    i.apps_service_fee,
    i.total_bill,
    cr.name AS courier_name,
    i.payment_method AS payment_method
FROM 
    "ecommerce".invoice i
JOIN 
    "ecommerce".seller s ON i.seller_id = s.id
JOIN 
    "ecommerce".customer c ON i.customer_id = c.id
JOIN 
    "ecommerce".active_address aa ON i.active_address_id = aa.id
JOIN 
    "ecommerce".address a ON aa.address_id = a.id
JOIN 
    "ecommerce".courier cr ON i.courier_id = cr.id
ORDER BY 
    i.created_at DESC;
