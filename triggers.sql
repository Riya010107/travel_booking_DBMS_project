-- =====================================================
-- Travel Booking System - Triggers
-- =====================================================

DELIMITER //

-- =====================================================
-- 1. AUTO SET BOOKING DATE
-- =====================================================
CREATE TRIGGER set_booking_date
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    SET NEW.booking_date = CURDATE();
END //

-- =====================================================
-- 2. VALIDATE HOTEL CHECKOUT DATE
-- =====================================================
CREATE TRIGGER validate_dates
BEFORE INSERT ON Hotel_Booking
FOR EACH ROW
BEGIN
    IF NEW.check_out <= NEW.check_in THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Check-out date must be after check-in date';
    END IF;
END //

-- =====================================================
-- 3. PREVENT NEGATIVE BOOKING AMOUNT
-- =====================================================
CREATE TRIGGER prevent_negative_amount
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    IF NEW.total_amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total amount cannot be negative';
    END IF;
END //

DELIMITER ;
