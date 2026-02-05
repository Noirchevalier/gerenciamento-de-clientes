-- name: CreateCustomer :one
INSERT INTO customers (id, name, email, document, created_at, updated_at)
VALUES (@id, @name, @email, @document, @created_at, @updated_at)
RETURNING id;

-- name: GetCustomer :one
SELECT * FROM customers
WHERE id = @id
LIMIT 1;

-- name: ListCustomers :many
SELECT * FROM customers
ORDER BY name;