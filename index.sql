-- =====================================================
-- Travel Booking System - Indexes
-- =====================================================

-- =====================================================
-- 1. INDEX ON USER_ID IN BOOKING
-- =====================================================
CREATE INDEX idx_booking_user
ON Booking(user_id);

-- =====================================================
-- 2. INDEX ON FLIGHT_ID
-- =====================================================
CREATE INDEX idx_flight_id
ON Flight_Booking(flight_id);

-- =====================================================
-- 3. INDEX ON HOTEL_ID
-- =====================================================
CREATE INDEX idx_hotel_id
ON Hotel_Booking(hotel_id);

-- =====================================================
-- 4. INDEX ON FLIGHT SOURCE
-- =====================================================
CREATE INDEX idx_flight_source
ON Flights(source);

-- =====================================================
-- 5. INDEX ON HOTEL LOCATION
-- =====================================================
CREATE INDEX idx_hotel_location
ON Hotels(location);
