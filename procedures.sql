-- =====================================================
-- Travel Booking System - Stored Procedures
-- =====================================================

DELIMITER //

-- =====================================================
-- 1. GET BOOKINGS BY USER ID
-- =====================================================
CREATE PROCEDURE GetUserBookings(IN uid INT)
BEGIN
    SELECT * FROM Booking
    WHERE user_id = uid;
END //

-- =====================================================
-- 2. GET COMPLETE BOOKING DETAILS BY BOOKING ID
-- =====================================================
CREATE PROCEDURE GetBookingDetails(IN bid INT)
BEGIN
    SELECT u.name, f.airline, f.source, f.destination,
           h.name AS hotel_name, h.location,
           b.total_amount
    FROM Booking b
    JOIN Users u ON b.user_id = u.user_id
    LEFT JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
    LEFT JOIN Flights f ON fb.flight_id = f.flight_id
    LEFT JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
    LEFT JOIN Hotels h ON hb.hotel_id = h.hotel_id
    WHERE b.booking_id = bid;
END //

-- =====================================================
-- 3. GET TOTAL SPENDING OF A USER
-- =====================================================
CREATE PROCEDURE GetUserTotalSpending(IN uid INT)
BEGIN
    SELECT u.name, SUM(b.total_amount) AS total_spent
    FROM Users u
    JOIN Booking b ON u.user_id = b.user_id
    WHERE u.user_id = uid
    GROUP BY u.name;
END //

-- =====================================================
-- 4. GET BOOKINGS ABOVE CERTAIN AMOUNT
-- =====================================================
CREATE PROCEDURE GetHighValueBookings(IN amount DECIMAL(10,2))
BEGIN
    SELECT * FROM Booking
    WHERE total_amount > amount;
END //

DELIMITER ;
