CREATE DATABASE potholes

DROP TABLE pothole;

CREATE TABLE pothole
(
    pothole_id SERIAL NOT NULL,
    street_name varchar(200) NOT NULL,
    status_code varchar(10) NOT NULL,
    status_date timestamp NOT NULL,
    severity int NOT NULL,
    longitude decimal(3, 13) NOT NULL,
    langitude decimal(3, 13) NOT NULL,
    report_date timestamp NOT NULL,

    CONSTRAINT pk_pothole_id PRIMARY KEY (pothole_id)
);