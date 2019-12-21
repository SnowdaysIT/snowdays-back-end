create extension if not exists "uuid-ossp";

CREATE TYPE gender AS ENUM ('Female','Male');

CREATE TABLE activity (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    name TEXT CHECK (CHAR_LENGTH(name)<50),
    date DATE
);
-- molti a molti

CREATE TABLE profile (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    first_name TEXT NOT NULL CHECK (CHAR_LENGTH(first_name) < 80),
    last_name TEXT NOT NULL CHECK (CHAR_LENGTH(last_name) < 80),
    mobile_phone TEXT NOT NULL CHECK (CHAR_LENGTH(mobile_phone)<20),
    badge_number TEXT NOT NULL CHECK (CHAR_LENGTH(badge_number)<20),
    gender gender,
    food_allergies TEXT CHECK (CHAR_LENGTH(food_allergies)<200),
    height INTEGER,
    weight INTEGER,
    shoe_size INTEGER,
    activity INTEGER REFERENCES activity(id)
);

CREATE TABLE university (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    contact_person INTEGER REFERENCES profile(id),
    address TEXT CHECK (CHAR_LENGTH(address)<100),
    name TEXT NOT NULL CHECK (CHAR_LENGTH(name)<100)
);

CREATE TABLE accommodation (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    address TEXT NOT NULL CHECK (CHAR_LENGTH(address)<50),
    host_id INTEGER REFERENCES profile(id)
);

CREATE TABLE users (
  id uuid PRIMARY KEY uuid_generate_v1mc(),
  profile_id INTEGER REFERENCES profile(id),
  email TEXT NOT NULL CHECK (CHAR_LENGTH(email) < 80),
  password TEXT NOT NULL CHECK (CHAR_LENGTH(password) < 80)
);

CREATE TABLE address (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    street  TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 80),
    zip_code TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 10), 
    city TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 30),
    country TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 15)
);

CREATE TABLE order (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    total INTEGER,
    status TEXT CHECK (CHAR_LENGTH(status)<15)
);

CREATE TABLE merchandising (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 20),
    description  TEXT NOT NULL CHECK (CHAR_LENGTH(description) < 100),
    available TEXT NOT NULL CHECK (CHAR_LENGTH(available) < 30),
    price INTEGER
);

CREATE TABLE order_merch (
    id uuid PRIMARY KEY uuid_generate_v1mc(),
    order_id INTEGER REFERENCES order(id),
    item INTEGER REFERENCES merchandising(id),
    quantity INTEGER
);

ALTER TABLE profile 
ADD CONSTRAINT university_id FOREIGN KEY (id) REFERENCES university(id),
ADD CONSTRAINT accommodation_id FOREIGN KEY (id) REFERENCES accommodation(id),
ADD CONSTRAINT order_id FOREIGN KEY (id) REFERENCES order(id);

