BEGIN;
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE SCHEMA public_api;
CREATE SCHEMA private_api;
CREATE TYPE gender AS ENUM ('Female', 'Male');
CREATE TYPE order_status AS ENUM ('Submitted', 'Confirmed', 'Delivered');
CREATE TABLE public_api.activity (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT CHECK (CHAR_LENGTH(name) < 50),
  date DATE
);
CREATE TABLE public_api.profile (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL CHECK (CHAR_LENGTH(first_name) < 80),
  last_name TEXT NOT NULL CHECK (CHAR_LENGTH(last_name) < 80),
  mobile_phone TEXT NOT NULL CHECK (CHAR_LENGTH(mobile_phone) < 20),
  badge_number TEXT NOT NULL CHECK (CHAR_LENGTH(badge_number) < 20),
  gender gender,
  vegetarian boolean,
  height INTEGER,
  weight INTEGER,
  shoe_size INTEGER,
  activity UUID REFERENCES public_api.activity(id)
);
CREATE TABLE public_api.university (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_person UUID REFERENCES public_api.profile(id),
  address TEXT CHECK (CHAR_LENGTH(address) < 100),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 100)
);
CREATE TABLE public_api.accommodation (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  address TEXT NOT NULL CHECK (CHAR_LENGTH(address) < 50),
  host_id UUID REFERENCES public_api.profile(id)
);
CREATE TABLE public_api.address (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  street TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 80),
  zip_code TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 10),
  city TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 30),
  country TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 15)
);
CREATE TABLE public_api.order (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  total INTEGER,
  status order_status
);
CREATE TABLE public_api.merchandising (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 20),
  description TEXT NOT NULL CHECK (CHAR_LENGTH(description) < 100),
  available TEXT NOT NULL CHECK (CHAR_LENGTH(available) < 30),
  price INTEGER
);
CREATE TABLE public_api.order_merch (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES public_api.order(id),
  item_id UUID REFERENCES public_api.merchandising(id),
  quantity INTEGER
);
CREATE TABLE private_api.user (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES public_api.profile(id),
  email TEXT NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
  password TEXT NOT NULL CHECK (CHAR_LENGTH(password) < 80)
);
ALTER TABLE public_api.profile
ADD
  CONSTRAINT university_id FOREIGN KEY (id) REFERENCES public_api.university(id),
ADD
  CONSTRAINT accommodation_id FOREIGN KEY (id) REFERENCES public_api.accommodation(id),
ADD
  CONSTRAINT order_id FOREIGN KEY (id) REFERENCES public_api.order(id);
COMMIT;