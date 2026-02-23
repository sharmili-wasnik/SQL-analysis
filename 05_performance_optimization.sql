-- Create Indexes
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- Use CTE for better readability
WITH revenue_cte AS (
    SELECT 
        p.product_id,
        SUM(p.price * oi.quantity) AS total_revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_id
)
SELECT *
FROM revenue_cte
WHERE total_revenue > 10000;
