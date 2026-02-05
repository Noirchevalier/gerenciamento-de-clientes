-- +goose Up
INSERT INTO customers (id, name, email, created_at) VALUES 
(gen_random_uuid(), 'Manel', 'manel@email.com', NOW()),
(gen_random_uuid(), 'Miguel', 'miguel@email.com', NOW()),
(gen_random_uuid(), 'Will', 'will@email.com', NOW()),
(gen_random_uuid(), 'Lucieldo', 'lucieldo@email.com', NOW());

-- +goose Down
DELETE FROM customers WHERE name IN ('Manel', 'Miguel', 'Will', 'Lucieldo');