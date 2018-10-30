-- Student Name: Lavinia Wang
-- Studnet ID: 1473704

SELECT * FROM restaurant;
SELECT * FROM reviewer;
SELECT * FROM rating;

-- 1. Find the name of all restaurants offering Indian cuisine
SELECT name 
FROM restaurant
WHERE cuisine = 'Indian';

-- 2. Find restaurant names that received a rating of 4 or 5, sort them in increasing order. 
SELECT DISTINCT r1.name
FROM restaurant r1, (SELECT rid, stars FROM rating WHERE stars = 4 OR stars = 5)r2
WHERE r1.rid = r2.rid
ORDER BY r1.name ASC;

-- 3. Find the names of all restaurants that have no rating.
SELECT DISTINCT r1.name
FROM restaurant r1
WHERE r1.rid NOT IN (SELECT rid FROM rating);

-- 4. Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.
SELECT name
FROM reviewer r1, rating r2
WHERE r1.vid = r2.vid AND r2.ratingdate IS NULL;

-- 5. For all cases where the same reviewer rated the same restaurant twice and gave it a higher rating the second time, return the reviewer's name and the name of the restaurant.
SELECT rest.name, rev.name
FROM restaurant rest, reviewer rev,
    (SELECT r2.rid, r2.vid, r2.stars
    FROM rating r1, rating r2
    WHERE r1.rid = r2.rid AND r1.vid = r2.vid AND r2.stars > r1.stars AND r2.ratingdate > r1.ratingdate) t
WHERE t.rid = rest.rid AND t.vid = rev.vid;

-- 6. For each restaurant that has at least one rating, find the highest number of stars that a restaurant received. Return the restaurant name and number of stars. Sort by restaurant name. 
SELECT DISTINCT rest.name, rat1.stars
FROM restaurant rest,rating rat1
WHERE rest.rid = rat1.rid AND rat1.stars IN(SELECT MAX(stars) FROM rating rat2 WHERE rat1.rid = rat2.rid)
ORDER BY rest.name;

-- 7. For each restaurant, return the name and the 'rating spread', that is, the difference between highest and lowest ratings given to that restaurant. Sort by rating spread from highest to lowest, then by restaurant name. 
WITH difference AS
(SELECT rest.rid, MAX(stars)- MIN(stars) AS diff
FROM restaurant rest, rating rat 
WHERE rest.rid = rat.rid
GROUP BY rest.rid)
SELECT rest1.name, difference.diff AS rating_spread
FROM restaurant rest1, difference
WHERE rest1.rid = difference.rid
ORDER BY rating_spread DESC, rest1.name ASC;

-- 8. Find the difference between the average rating of Indian restaurants and the average rating of Chinese restaurants. (Make sure to calculate the average rating for each restaurant, then the average of those averages for Indian and Chinese restaurants. Don't just calculate the overall average rating for Indian and Chinese restaurants.) 
WITH indiavg AS
(SELECT rest.rid, avg(rat.stars) AS rating 
FROM restaurant rest, rating rat 
WHERE rest.rid = rat.rid
GROUP BY rest.rid) 
SELECT (inavg.Indian - cnavg.Chinese) AS difference 
FROM 
    (SELECT avg(indiavg.rating) AS Indian 
    FROM restaurant rest1, indiavg 
    WHERE rest1.rid = indiavg.rid AND rest1.cuisine = 'Indian' 
    GROUP BY rest1.cuisine) inavg, 
    (SELECT avg(indiavg.rating) AS Chinese 
    FROM restaurant rest1, indiavg 
    WHERE rest1.rid = indiavg.rid AND rest1.cuisine = 'Chinese' 
    GROUP BY rest1.cuisine) cnavg;