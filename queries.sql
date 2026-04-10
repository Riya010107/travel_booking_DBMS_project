-- =====================================================
-- Travel Booking System - Basic Queries
-- =====================================================

-- =====================================================
-- 1. VIEW ALL DATA (SELECT)
-- =====================================================
SELECT * FROM Users;
SELECT * FROM Flights;
SELECT * FROM Hotels;
SELECT * FROM Booking;

-- =====================================================
-- 2. FILTER DATA (WHERE)
-- =====================================================
-- Users with specific name
SELECT * FROM Users
WHERE name = 'Riya Sharma';

-- Flights from Delhi
SELECT * FROM Flights
WHERE source = 'Delhi';

-- Hotels with rating above 4.5
SELECT * FROM Hotels
WHERE rating > 4.5;

-- =====================================================
-- 3. SORT DATA (ORDER BY)
-- =====================================================
-- Flights sorted by price (low to high)
SELECT * FROM Flights
ORDER BY price ASC;

-- Hotels sorted by rating (high to low)
SELECT * FROM Hotels
ORDER BY rating DESC;

-- =====================================================
-- 4. JOIN QUERIES (VERY IMPORTANT)
-- =====================================================

-- Get booking details with user names
SELECT u.name, b.booking_id, b.total_amount
FROM Booking b
JOIN Users u ON b.user_id = u.user_id;

-- Get flight details for each booking
SELECT b.booking_id, f.airline, f.source, f.destination
FROM Booking b
JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
JOIN Flights f ON fb.flight_id = f.flight_id;

-- Get hotel details for each booking
SELECT b.booking_id, h.name AS hotel_name, h.location
FROM Booking b
JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
JOIN Hotels h ON hb.hotel_id = h.hotel_id;

-- FULL COMBINED QUERY (MOST IMPORTANT)
SELECT u.name, f.airline, f.source, f.destination,
       h.name AS hotel_name, h.location,
       b.total_amount
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
LEFT JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
LEFT JOIN Flights f ON fb.flight_id = f.flight_id
LEFT JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
LEFT JOIN Hotels h ON hb.hotel_id = h.hotel_id;

-- =====================================================
-- 5. AGGREGATE FUNCTIONS
-- =====================================================

-- Average flight price
SELECT AVG(price) AS avg_flight_price FROM Flights;

-- Total booking amount
SELECT SUM(total_amount) AS total_revenue FROM Booking;

-- Count total users
SELECT COUNT(*) AS total_users FROM Users;

-- =====================================================
-- 6. GROUP BY
-- =====================================================

-- Number of bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Hotels grouped by location
SELECT location, COUNT(*) AS total_hotels
FROM Hotels
GROUP BY location;

-- =====================================================
-- 7. GROUP BY with HAVING
-- =====================================================

-- Users with total booking amount greater than 12000
SELECT user_id, SUM(total_amount) AS total_spent
FROM Booking
GROUP BY user_id
HAVING total_spent > 12000;

-- =====================================================
-- 8. DISTINCT
-- =====================================================

-- Unique flight sources
SELECT DISTINCT source FROM Flights;

-- Unique hotel locations
SELECT DISTINCT location FROM Hotels;
