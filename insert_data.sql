-- =====================================================
-- Travel Booking System - Sample Data Insertion
-- =====================================================

-- =====================================================
-- INSERT INTO USERS
-- =====================================================
INSERT INTO Users (name, email, phone) VALUES
('Riya Sharma', 'riya@gmail.com', '9876543210'),
('Aman Verma', 'aman@gmail.com', '9123456780'),
('Sneha Kapoor', 'sneha@gmail.com', '9988776655'),
('Rahul Mehta', 'rahul@gmail.com', '9090909090'),
('Priya Singh', 'priya@gmail.com', '9871234567');

-- =====================================================
-- INSERT INTO FLIGHTS
-- =====================================================
INSERT INTO Flights (airline, source, destination, departure_time, arrival_time, price) VALUES
('IndiGo', 'Delhi', 'Mumbai', '2026-04-10 10:00:00', '2026-04-10 12:00:00', 5000),
('Air India', 'Delhi', 'Bangalore', '2026-04-11 09:00:00', '2026-04-11 13:00:00', 7000),
('SpiceJet', 'Mumbai', 'Goa', '2026-04-12 08:00:00', '2026-04-12 09:30:00', 3000),
('Vistara', 'Delhi', 'Chennai', '2026-04-13 06:00:00', '2026-04-13 10:00:00', 6500),
('IndiGo', 'Bangalore', 'Hyderabad', '2026-04-14 14:00:00', '2026-04-14 15:30:00', 2500);

-- =====================================================
-- INSERT INTO HOTELS
-- =====================================================
INSERT INTO Hotels (name, location, rating, price_per_night) VALUES
('Taj Hotel', 'Mumbai', 4.5, 8000),
('Oberoi', 'Bangalore', 4.7, 9000),
('Leela Palace', 'Chennai', 4.6, 8500),
('Marriott', 'Goa', 4.4, 7500),
('Hyatt', 'Hyderabad', 4.3, 7000);

-- =====================================================
-- INSERT INTO BOOKING
-- =====================================================
INSERT INTO Booking (user_id, booking_date, total_amount) VALUES
(1, '2026-04-01', 13000),
(2, '2026-04-02', 16000),
(3, '2026-04-03', 11000),
(4, '2026-04-04', 14000),
(5, '2026-04-05', 9500);

-- =====================================================
-- INSERT INTO FLIGHT_BOOKING
-- =====================================================
INSERT INTO Flight_Booking (booking_id, flight_id, seat_number) VALUES
(1, 1, 'A1'),
(2, 2, 'B2'),
(3, 3, 'C3'),
(4, 4, 'D4'),
(5, 5, 'E5');

-- =====================================================
-- INSERT INTO HOTEL_BOOKING
-- =====================================================
INSERT INTO Hotel_Booking (booking_id, hotel_id, check_in, check_out) VALUES
(1, 1, '2026-04-10', '2026-04-12'),
(2, 2, '2026-04-11', '2026-04-13'),
(3, 3, '2026-04-12', '2026-04-14'),
(4, 4, '2026-04-13', '2026-04-15'),
(5, 5, '2026-04-14', '2026-04-16');
