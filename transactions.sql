-- =====================================================
-- Travel Booking System - Transactions
-- =====================================================

-- =====================================================
-- 1. SUCCESSFUL BOOKING TRANSACTION
-- =====================================================
START TRANSACTION;

-- Insert booking
INSERT INTO Booking (user_id, booking_date, total_amount)
VALUES (1, CURDATE(), 12000);

-- Get last inserted booking id
SET @last_booking_id = LAST_INSERT_ID();

-- Insert flight booking
INSERT INTO Flight_Booking (booking_id, flight_id, seat_number)
VALUES (@last_booking_id, 1, 'F1');

-- Insert hotel booking
INSERT INTO Hotel_Booking (booking_id, hotel_id, check_in, check_out)
VALUES (@last_booking_id, 1, '2026-04-20', '2026-04-22');

COMMIT;

-- =====================================================
-- 2. FAILED TRANSACTION (ROLLBACK)
-- =====================================================
START TRANSACTION;

-- Insert booking
INSERT INTO Booking (user_id, booking_date, total_amount)
VALUES (2, CURDATE(), 15000);

SET @last_booking_id = LAST_INSERT_ID();

-- Insert invalid hotel booking (wrong dates)
INSERT INTO Hotel_Booking (booking_id, hotel_id, check_in, check_out)
VALUES (@last_booking_id, 2, '2026-04-25', '2026-04-24');

-- Rollback due to error
ROLLBACK;
