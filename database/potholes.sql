DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS app_user;

CREATE TABLE pothole
(
    pothole_id SERIAL NOT NULL,
    street_name varchar(200) NOT NULL,
    status_code varchar(10) NOT NULL DEFAULT 'reported',
    status_date timestamp NOT NULL DEFAULT now(),
    severity int NOT NULL DEFAULT 0,
    latitude decimal(16, 13) NOT NULL,
    longitude decimal(16, 13) NOT NULL,
    report_date timestamp NOT NULL DEFAULT now(),

    CONSTRAINT pk_pothole_id PRIMARY KEY (pothole_id)
);

CREATE TABLE app_user
(
  user_name varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  salt varchar(255),
  is_employee boolean NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_app_user_user_name PRIMARY KEY (user_name)
);

INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Brian Rd', 'reported', '20080203', 4, 39.996564, -83.036832, '20171212');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Katie Dr', 'inspected', '20080204', 3, 39.9928559, -83.0415075, '20170808');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('John Blvd', 'repaired', '20080205', 2, 40.000705, -83.038935, '20170809');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Steve Ave', 'reported', '20080206', 1, 39.998238, -83.043742, '20170810');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Ben Ct', 'reported', '20080203', 5, 39.998895, -83.049836, '20170811');

INSERT INTO app_user (user_name, password) VALUES ('Sally_User', 'sally');
INSERT INTO app_user (user_name, password, is_employee) VALUES ('Not_Sally', 'notsally', true);

INSERT INTO pothole (street_name, status_date, longitude, latitude, report_date) VALUES ('Test St', '20090909', 39.998895, -83.049836, '20090909');

SELECT * FROM app_user