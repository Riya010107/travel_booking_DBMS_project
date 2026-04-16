-- =====================================================
-- Travel Booking System - Advanced Queries
-- =====================================================

-- =====================================================
-- 1. MOST FREQUENT USER (MAX BOOKINGS)
-- =====================================================
SELECT u.name, COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.name
ORDER BY total_bookings DESC;

-- =====================================================
-- 2. USER WHO SPENT THE MOST MONEY
-- =====================================================
SELECT u.name, SUM(b.total_amount) AS total_spent
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.name
ORDER BY total_spent DESC;

-- =====================================================
-- 3. BOOKINGS WITH BOTH FLIGHT AND HOTEL DETAILS
-- (Complex Multi JOIN)
-- =====================================================
SELECT u.name, b.booking_id,
       f.airline, f.source, f.destination,
       h.name AS hotel_name, h.location,
       b.total_amount
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
JOIN Flights f ON fb.flight_id = f.flight_id
JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
JOIN Hotels h ON hb.hotel_id = h.hotel_id;

-- =====================================================
-- 4. HOTELS BOOKED MORE THAN ONCE (HAVING)
-- =====================================================
SELECT h.name, COUNT(*) AS total_bookings
FROM Hotels h
JOIN Hotel_Booking hb ON h.hotel_id = hb.hotel_id
GROUP BY h.name
HAVING COUNT(*) > 1;

-- =====================================================
-- 5. USERS WHO SPENT ABOVE AVERAGE (SUBQUERY)
-- =====================================================
SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Booking
    WHERE total_amount > (
        SELECT AVG(total_amount) FROM Booking
    )
);

-- =====================================================
-- 6. MOST EXPENSIVE FLIGHT
-- =====================================================
SELECT * FROM Flights
WHERE price = (SELECT MAX(price) FROM Flights);

-- =====================================================
-- 7. BOOKINGS WITHOUT HOTEL (LEFT JOIN + NULL)
-- =====================================================
SELECT b.booking_id
FROM Booking b
LEFT JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
WHERE hb.hotel_id IS NULL;

-- =====================================================
-- 8. BOOKINGS WITHOUT FLIGHT
-- =====================================================
SELECT b.booking_id
FROM Booking b
LEFT JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
WHERE fb.flight_id IS NULL;

-- =====================================================
-- 9. TOTAL REVENUE PER USER (HAVING)
-- =====================================================
SELECT u.name, SUM(b.total_amount) AS revenue
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.name
HAVING revenue > 10000;

-- =====================================================
-- 10. COUNT BOOKINGS PER CITY (HOTEL LOCATION)
-- =====================================================
SELECT h.location, COUNT(*) AS total_bookings
FROM Hotels h
JOIN Hotel_Booking hb ON h.hotel_id = hb.hotel_id
GROUP BY h.location
ORDER BY total_bookings DESC;
