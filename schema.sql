BEGIN;
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE SCHEMA public_api;
CREATE SCHEMA private_api;
CREATE TYPE gender AS ENUM ('Female', 'Male');
CREATE TYPE order_status AS ENUM ('Submitted', 'Confirmed', 'Delivered');
CREATE TYPE experience_level AS ENUM('Beginner', 'Intermediate');
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
  is_vegetarian BOOLEAN NOT NULL,
  is_helper BOOLEAN NOT NULL,
  id_card TEXT NOT NULL,
  rental_id UUID,
  university_id UUID,
  accommodation_id UUID,
  purchase_id UUID
);
CREATE TABLE public_api.profile_activity (
  profile_id UUID REFERENCES public_api.profile(id) ON DELETE CASCADE,
  activity_id UUID REFERENCES public_api.activity(id) ON DELETE RESTRICT,
  PRIMARY KEY (profile_id, activity_id)
);
CREATE TABLE public_api.material(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT
);
CREATE TABLE public_api.rental (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  height INTEGER,
  weight INTEGER,
  shoe_size INTEGER,
  experience experience_level NOT NULL
);
CREATE TABLE public_api.rental_material (
  rental_id UUID REFERENCES public_api.rental(id) ON DELETE CASCADE,
  material_id UUID REFERENCES public_api.material(id) ON DELETE RESTRICT,
  PRIMARY KEY (rental_id, material_id)
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
  is_dormroom BOOLEAN NOT NULL,
  places NUMERIC(4, 0) NOT NULL,
  host_id UUID REFERENCES public_api.profile(id)
);
CREATE TABLE public_api.purchase (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  status order_status NOT NULL
);
CREATE TABLE public_api.item (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 20),
  description TEXT NOT NULL CHECK (CHAR_LENGTH(description) < 100),
  available NUMERIC(4, 0) NOT NULL,
  price NUMERIC(6, 2) NOT NULL,
  item_image TEXT
);
CREATE TABLE public_api.purchase_item (
  purchase_id UUID REFERENCES public_api.purchase(id) ON DELETE CASCADE,
  item_id UUID REFERENCES public_api.item(id) ON DELETE RESTRICT,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (purchase_id, item_id)
);
CREATE TABLE private_api.account (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES public_api.profile(id),
  email TEXT NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
  password TEXT NOT NULL,
  role_name TEXT NOT NULL
);
ALTER TABLE public_api.profile
ADD
  FOREIGN KEY (university_id) REFERENCES public_api.university(id),
ADD
  FOREIGN KEY (accommodation_id) REFERENCES public_api.accommodation(id),
ADD
  FOREIGN KEY (purchase_id) REFERENCES public_api.purchase(id),
ADD 
  FOREIGN KEY (rental_id) REFERENCES public_api.rental(id);
COMMIT;