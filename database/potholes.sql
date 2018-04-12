DROP TABLE IF EXISTS pothole;

CREATE TABLE pothole
(
    pothole_id SERIAL NOT NULL,
    street_name varchar(200) NOT NULL,
    status_code varchar(10) NOT NULL,
    status_date timestamp NOT NULL,
    severity int NOT NULL,
    longitude decimal(16, 13) NOT NULL,
    latitude decimal(16, 13) NOT NULL,
    report_date timestamp NOT NULL,

    CONSTRAINT pk_pothole_id PRIMARY KEY (pothole_id)
);

INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Brian Rd', 'reported', '20080203', 4, 16.81712, 40.912132999999, '20171212');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Katie Dr', 'inspected', '20080204', 3, 39.9928559, -83.0415075, '20170808');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('John Blvd', 'repaired', '20080205', 2, 123.1235891345, 534.9999999999999, '20170809');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Steve Ave', 'reported', '20080206', 1, 51.9937101, 27.0398601, '20170810');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Ben Ct', 'reported', '20080203', 5, 873.1235867345, 456.9912345999999, '20170811');

SELECT * FROM pothole ORDER BY street_name asc;
SELECT * FROM pothole ORDER BY status_code DESC;
SELECT * FROM pothole ORDER BY severity DESC;
SELECT * FROM pothole ORDER BY report_date DESC;