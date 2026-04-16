-- =====================================================
-- Travel Booking System - Views
-- =====================================================

-- =====================================================
-- 1. VIEW: USER BOOKING SUMMARY
-- =====================================================
CREATE VIEW User_Booking_Summary AS
SELECT u.user_id, u.name, b.booking_id, b.total_amount
FROM Users u
JOIN Booking b ON u.user_id = b.user_id;

-- =====================================================
-- 2. VIEW: FLIGHT DETAILS WITH USER
-- =====================================================
CREATE VIEW Flight_Booking_Details AS
SELECT u.name, f.airline, f.source, f.destination
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
JOIN Flights f ON fb.flight_id = f.flight_id;

-- =====================================================
-- 3. VIEW: HOTEL DETAILS WITH USER
-- =====================================================
CREATE VIEW Hotel_Booking_Details AS
SELECT u.name, h.name AS hotel_name, h.location
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
JOIN Hotels h ON hb.hotel_id = h.hotel_id;

-- =====================================================
-- 4. VIEW: COMPLETE BOOKING DETAILS
-- =====================================================
CREATE VIEW Complete_Booking_View AS
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
-- 5. VIEW: HIGH VALUE BOOKINGS
-- =====================================================
CREATE VIEW High_Value_Bookings AS
SELECT * FROM Booking
WHERE total_amount > 12000;
