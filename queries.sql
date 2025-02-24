-- write your queries here

-- first query
SELECT *
FROM owners o
FULL OUTER JOIN vehicles v ON o.id = v.owner_id;

-- second query
SELECT 
    first_name,
    last_name,
    COUNT(owner_id)
FROM 
    owners o
JOIN 
    vehicles v on o.id=v.owner_id
GROUP BY 
    (first_name, last_name)
ORDER BY 
    first_name;

-- third query ;The result will display the first_name, last_name, rounded average_price, and vehicle_count for each owner who has more than one vehicle with an average price exceeding 10,000. 
--The rows are sorted by first_name in descending order.
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;
