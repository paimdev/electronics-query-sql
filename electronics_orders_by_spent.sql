SELECT 
    users.name, 
    users.email, 
    SUM(products.price * orders.quantity) AS total_amount_spent
FROM 
    users
JOIN 
    orders ON users.id = orders.user_id
JOIN 
    products ON orders.product_id = products.id
WHERE 
    products.category = 'Electronics'
GROUP BY 
    users.id, users.name, users.email
HAVING 
    COUNT(orders.id) >= 3 
    AND SUM(products.price * orders.quantity) > 1000
ORDER BY 
    total_amount_spent DESC;
