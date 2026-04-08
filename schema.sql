-- =====================================================
-- Travel Booking System (Flight + Hotel) 
-- Schema Definition
-- =====================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS travel_booking;
USE travel_booking;

-- =====================================================
-- USERS TABLE
-- Stores user details
-- =====================================================
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE
);

-- =====================================================
-- FLIGHTS TABLE
-- Stores flight information
-- =====================================================
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    airline VARCHAR(100) NOT NULL,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);

-- =====================================================
-- HOTELS TABLE
-- Stores hotel details
-- =====================================================
CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
    price_per_night DECIMAL(10,2) NOT NULL CHECK (price_per_night > 0)
);

-- =====================================================
-- BOOKING TABLE
-- Main booking table (connects user with services)
-- =====================================================
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    booking_date DATE NOT NULL,
    total_amount DECIMAL(10,2) DEFAULT 0 CHECK (total_amount >= 0),

    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- =====================================================
-- FLIGHT_BOOKING TABLE
-- Links booking with flights
-- =====================================================
CREATE TABLE Flight_Booking (
    fb_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    seat_number VARCHAR(10),

    FOREIGN KEY (booking_id)
    REFERENCES Booking(booking_id)
    ON DELETE CASCADE,

    FOREIGN KEY (flight_id)
    REFERENCES Flights(flight_id)
    ON DELETE CASCADE
);

-- =====================================================
-- HOTEL_BOOKING TABLE
-- Links booking with hotels
-- =====================================================
CREATE TABLE Hotel_Booking (
    hb_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    hotel_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,

    FOREIGN KEY (booking_id)
    REFERENCES Booking(booking_id)
    ON DELETE CASCADE,

    FOREIGN KEY (hotel_id)
    REFERENCES Hotels(hotel_id)
    ON DELETE CASCADE,

    CHECK (check_out > check_in)
);

-- =====================================================
-- INDEXES (for performance optimization)
-- =====================================================
CREATE INDEX idx_user_booking ON Booking(user_id);
CREATE INDEX idx_flight_booking ON Flight_Booking(flight_id);
CREATE INDEX idx_hotel_booking ON Hotel_Booking(hotel_id);
