DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_sessions;


CREATE TABLE members
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT4
);

CREATE TABLE gym_sessions
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  gym_session_id INT8 references gym_sessions(id),
  member_id INT8 references members(id)
);
