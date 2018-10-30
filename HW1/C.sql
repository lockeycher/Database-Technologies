--Student Name: Lavinia Wang
--Student ID: 1473704

SELECT * FROM trips;
SELECT * FROM bycar;
SELECT * FROM bytrain;
SELECT * FROM byplane;


-- 1.   List car rental companies which have a mileage of at least 27 miles/gallon.  
SELECT rentalcompany
FROM bycar
WHERE mileage >= 27;

-- 2.   List trip IDs taken on train costing strictly more than $150.
SELECT tid
FROM trips
WHERE (travelmode = 'Train') AND fare > 150;

-- 3.   Find trip IDs and their fare that are not taken in the US i.e., `Non-US` trips. 
SELECT tid, tripstate, fare
FROM trips
WHERE tripstate = 'Non-US';

-- 4.	Find the business class plane trip IDs that are greater than $1000.  
SELECT bp.tid, bp.class, t.travelmode, t.fare
FROM (byplane bp INNER JOIN trips t ON bp.tid = t.tid)
WHERE (bp.class = 'Business') AND (t.travelmode = 'Plane') AND (t.fare > 1000);

-- 5.	Find any car trip more expensive than a trip taken on a train. 
SELECT tid, travelmode, fare
FROM trips
WHERE travelmode = 'Car' AND fare > ANY(SELECT fare FROM trips WHERE travelmode = 'Train');
 
-- 6.	List a pair of distinct trips that have exactly the same value of mileage.  
SELECT t1.tid AS trip1, t2.tid AS trip2, t1.mileage
FROM bycar t1, bycar t2
WHERE t1.mileage = t2.mileage AND t1.tid < t2.tid
ORDER BY t1.mileage;

-- 7.	List a pair of distinct train trips that do not have the same speed.  
SELECT t1.tid AS tid1, t1.trainspeed AS trainspeed1, t2.tid AS tid2, t2.trainspeed AS trainspeed2
FROM bytrain t1, bytrain t2  
WHERE t1.trainspeed != t2.trainspeed AND t1.tid < t2.tid
ORDER BY t1.trainspeed;

-- 8.	Find those pair of trips in the same state with the same mode of travel. List such pairs only once.  
SELECT t1.tid AS trip1, t2.tid AS trip2, t1.tripstate, t1.travelmode
FROM trips t1, trips t2
WHERE t1.tripstate = t2.tripstate AND t1.tripstate NOT IN ('Non-US') AND t1.travelmode = t2.travelmode AND t1.tid < t2.tid
ORDER BY t1.tripstate;

-- 9.	Find a state in which trips have been taken by all three modes of transportation:  train, plane, and car.  
(SELECT tripstate
FROM trips 
WHERE travelmode = 'Car')
INTERSECT
(SELECT tripstate
FROM trips 
WHERE travelmode = 'Train')
INTERSECT
(SELECT tripstate
FROM trips 
WHERE travelmode = 'Plane');

-- 10.	 Find the details of a) the most costly trip, b) the cheapest trip taken by either the air, rail, or car. Write two separate queries. 
SELECT tid, fare
FROM trips
WHERE fare = (SELECT MAX(fare) from trips);

SELECT tid, fare
FROM trips
WHERE fare = (SELECT MIN(fare) from trips)


