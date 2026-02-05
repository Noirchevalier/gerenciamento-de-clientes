-- +goose Up
INSERT INTO customers (id, name, email, document, created_at , updated_at) VALUES 
(gen_random_uuid(), 'Manel', 'manel@email.com','123456789', NOW(), NOW()),
(gen_random_uuid(), 'Miguel', 'miguel@email.com','123456789' ,NOW(), NOW()),
(gen_random_uuid(), 'Will', 'will@email.com', '123456789', NOW(), NOW()),
(gen_random_uuid(), 'Lucieldo', 'lucieldo@email.com','123456789', NOW(),NOW());

-- +goose Down
DELETE FROM customers WHERE name IN ('Manel', 'Miguel', 'Will', 'Lucieldo');