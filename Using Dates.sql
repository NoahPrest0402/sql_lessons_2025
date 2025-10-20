CREATE TABLE saved_dates(
	my_date DATE,
    my_time TIME,
    my_date_time DATETIME
);

SELECT * FROM saved_dates;

-- just a taste of a few built in mysql functions
INSERT INTO saved_dates VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

INSERT INTO saved_dates VALUES (CURRENT_DATE() - INTERVAL 1 DAY, CURRENT_TIME() - INTERVAL 1 HOUR, NOW());