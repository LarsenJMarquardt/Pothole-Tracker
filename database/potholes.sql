DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS app_user;

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

CREATE TABLE app_user
(
  username varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  salt varchar(255),
  is_employee boolean NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_app_user_username PRIMARY KEY (username)
);

INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Brian Rd', 'reported', '20080203', 4, 16.81712, 40.912132999999, '20171212');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Katie Dr', 'inspected', '20080204', 3, 39.9928559, -83.0415075, '20170808');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('John Blvd', 'repaired', '20080205', 2, 123.1235891345, 534.9999999999999, '20170809');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Steve Ave', 'reported', '20080206', 1, 51.9937101, 27.0398601, '20170810');
INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) VALUES ('Ben Ct', 'reported', '20080203', 5, 873.1235867345, 456.9912345999999, '20170811');

SELECT * FROM app_user

INSERT INTO app_user (username, password) VALUES ('Sally_User', 'sally');