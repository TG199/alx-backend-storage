-- Create a trigger to update the quantity in 'items' after a new order is inserted
DELIMETER $$

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the quantity of the item in the 'items' table
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id
END;

$$

DELIMETER ;
