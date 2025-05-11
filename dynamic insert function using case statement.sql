select * from orders

select distinct cusine, dish from orders



CREATE or replace FUNCTION Cusine_category(
    ID INT, CUST_ID INT, CHIEF INT, WAITER INT, TABLENO INT, DISH VARCHAR, QTY INT, RESTAURANTID INT
) 
RETURNS VARCHAR AS $$ 
DECLARE result VARCHAR;
BEGIN
    CASE 
        WHEN DISH = 'Biryani' THEN result := 'Indian';
        WHEN DISH = 'Tacos' THEN result := 'Mexican';
        WHEN DISH = 'Butter Chicken' THEN result := 'Indian';
        WHEN DISH = 'Fried Rice' THEN result := 'Chinese';
        WHEN DISH = 'Chocolate Cake' THEN result := 'Dessert';
        WHEN DISH = 'Paneer Tikka' THEN result := 'Indian';
        WHEN DISH = 'Lobster' THEN result := 'Seafood';
        WHEN DISH = 'BBQ Ribs' THEN result := 'Barbecue';
        WHEN DISH = 'Manchurian' THEN result := 'Chinese';
        WHEN DISH = 'Green Curry' THEN result := 'Thai';
        WHEN DISH = 'Grilled Salmon' THEN result := 'Seafood';
        WHEN DISH = 'Spring Rolls' THEN result := 'Chinese';
        WHEN DISH = 'Nachos' THEN result := 'Mexican';
        WHEN DISH = 'Kofta Curry' THEN result := 'Indian';
        WHEN DISH = 'Ice Cream' THEN result := 'Dessert';
        WHEN DISH = 'Dal Makhani' THEN result := 'Indian';
        WHEN DISH = 'Pizza' THEN result := 'Italian';
        WHEN DISH = 'Grilled Chicken' THEN result := 'Barbecue';
        WHEN DISH = 'Pasta' THEN result := 'Italian';
        ELSE result := 'INVALID INPUT';
    END CASE;

    INSERT INTO ORDERS (ID, CUST_ID, CHIEF, WAITER, TABLENO,DISH, QTY, RESTAURANTID,CUSINE)
    VALUES (ID, CUST_ID, CHIEF, WAITER, TABLENO, DISH, QTY, RESTAURANTID,RESULT);

    RETURN result;
END;
$$ LANGUAGE plpgsql;



SELECT * from ORDERS



SELECT Cusine_category(86, 1, 5, 3, 12, 'Pasta', 2, 10);