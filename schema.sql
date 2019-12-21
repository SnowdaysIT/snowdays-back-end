BEGIN;
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE SCHEMA public_api;
CREATE SCHEMA private_api;
CREATE TYPE gender AS ENUM ('Female', 'Male');
CREATE TYPE order_status AS ENUM ('Submitted', 'Confirmed', 'Delivered');
CREATE TABLE public_api.activity (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 50),
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL
);
CREATE TABLE public_api.profile (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL CHECK (CHAR_LENGTH(first_name) < 80),
  last_name TEXT NOT NULL CHECK (CHAR_LENGTH(last_name) < 80),
  mobile_phone TEXT NOT NULL CHECK (CHAR_LENGTH(mobile_phone) < 20),
  badge_number TEXT NOT NULL CHECK (CHAR_LENGTH(badge_number) < 20),
  gender gender NOT NULL,
  vegetarian BOOLEAN NOT NULL,
  height INTEGER,
  weight INTEGER,
  shoe_size INTEGER
);
CREATE TABLE public_api.profile_activity (
  profile_id UUID REFERENCES public_api.profile(id),
  activity_id UUID REFERENCES public_api.activity(id)
);
CREATE TABLE public_api.address (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  street TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 80),
  zip_code TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 10),
  city TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 30),
  country TEXT NOT NULL CHECK (CHAR_LENGTH(street) < 15)
);
CREATE TABLE public_api.university (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_person UUID REFERENCES public_api.profile(id),
  address UUID NOT NULL REFERENCES public_api.address(id),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 100)
);
CREATE TABLE public_api.accommodation (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  address UUID NOT NULL REFERENCES public_api.address(id),
  host_id UUID REFERENCES public_api.profile(id)
);
CREATE TABLE public_api.purchase (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  total_price INTEGER NOT NULL,
  status order_status NOT NULL
);
CREATE TABLE public_api.item (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 20),
  description TEXT NOT NULL CHECK (CHAR_LENGTH(description) < 100),
  available INTEGER NOT NULL,
  price NUMERIC(6,2) NOT NULL
);
CREATE TABLE public_api.purchase_item (
  purchase_id UUID REFERENCES public_api.purchase(id),
  item_id UUID REFERENCES public_api.item(id),
  quantity INTEGER NOT NULL
);
CREATE TABLE private_api.account (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES public_api.profile(id),
  email TEXT NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
  password TEXT NOT NULL
);
ALTER TABLE public_api.profile
ADD
  CONSTRAINT university_id FOREIGN KEY (id) REFERENCES public_api.university(id),
ADD
  CONSTRAINT accommodation_id FOREIGN KEY (id) REFERENCES public_api.accommodation(id),
ADD
  CONSTRAINT purchase_id FOREIGN KEY (id) REFERENCES public_api.purchase(id);
COMMIT;