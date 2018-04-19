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

INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Brian Rd', 'reported', '20180220', 0, 39.996564, -83.036832, '20180220');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Katie Dr', 'inspected', '20180204', 3, 39.9928559, -83.0415075, '20170808');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('John Blvd', 'repaired', '20180216', 2, 40.000705, -83.038935, '20170809');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Steve Ave', 'reported', '20180206', 0, 39.998238, -83.043742, '20180206');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Ben Ct', 'reported', '20180210', 0, 39.998895, -83.049836, '20180210');

INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('E Hoster St', 'inspected', '20180330', 3, 39.951228, -82.997171, '20171029');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Sullivant Ave', 'inspected', '20180410', 1, 39.953117, -83.022286, '20170920');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('E Main St', 'reported', '20180130', 0, 39.957543, -82.987622, '20180130');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Parsons Ave', 'repaired', '20180225', 5, 39.949293, -82.982577, '20171009');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Mt Vernon Ave', 'repaired', '20180116', 3, 39.971825, -82.974938, '20171108');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Cleveland Ave', 'inspected', '20180117', 2, 39.975836, -82.989873, '20170720');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('McKinley Ave', 'repaired', '20180303', 1, 39.963645, -83.040908, '20170918');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Thurman Ave', 'inspected', '20180408', 4, 39.938354, -82.964493, '20171201');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Lundy St', 'inspected', '20180128', 5, 39.977893, -83.006808, '20171011');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('St Clair Ave', 'reported', '20171223', 0, 39.985793, -82.979741, '20171223');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Northwest Blvd', 'inspected', '20180327', 4, 39.979084, -83.031154, '20170917');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('King Ave', 'repaired', '20180123', 1, 39.990216, -83.007065, '20171107');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('W Long St', 'repaired', '20180201', 3, 39.964613, -83.003502, '20171003');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Oak St', 'inspected', '20180326', 4, 39.962967, -82.976015, '20171201');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('E Livingston Ave', 'inspected', '20180419', 1, 39.949248, -82.961810, '20180113');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('N High St', 'reported', '20180222', 0, 40.002273, -83.008581, '20180222');
INSERT INTO pothole (street_name, status_code, status_date, severity, latitude, longitude, report_date) VALUES ('Hunter Ave', 'repaired', '20180118', 1, 39.982361, -83.009868, '20170820');

INSERT INTO app_user (user_name, password) VALUES ('Sally_User', 'sally');
INSERT INTO app_user (user_name, password, is_employee) VALUES ('Not_Sally', 'notsally', true);



SELECT * FROM app_user