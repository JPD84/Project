DROP TABLE bookings;
DROP TABLE members;
DROP TABLE classes;


CREATE TABLE members;
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT4
);

CREATE TABLE classes;
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE bookings;
(
  id SERIAL8 primary key,
  gym_class_id INT8 references gym_class(id)
  member_id INT8 references member(id)
);
