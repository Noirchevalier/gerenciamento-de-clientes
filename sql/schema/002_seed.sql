-- +goose Up
INSERT INTO customers (id, name, email, document, created_at , updated_at) VALUES 
(gen_random_uuid(), 'Manel', 'manel@email.com','486.170.020-50', NOW(), NOW()),
(gen_random_uuid(), 'Miguel', 'miguel@email.com','264.406.410-42' ,NOW(), NOW()),
(gen_random_uuid(), 'Will', 'will@email.com', '019.082.870-63', NOW(), NOW()),
(gen_random_uuid(), 'Lucieldo', 'lucieldo@email.com','698.242.110-47', NOW(),NOW());

-- +goose Down
DELETE FROM customers WHERE name IN ('Manel', 'Miguel', 'Will', 'Lucieldo');