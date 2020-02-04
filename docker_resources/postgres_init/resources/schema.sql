BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE SCHEMA public_api;
CREATE SCHEMA private_api;

CREATE TYPE gender AS ENUM ('Female', 'Male');
CREATE TYPE order_status AS ENUM ('Submitted', 'Confirmed', 'Delivered');
CREATE TYPE experience_level AS ENUM('Beginner', 'Intermediate');
CREATE TYPE activity_type AS ENUM('Lunch', 'Dinner', 'Sport', 'Party', 'Other');
create type public_api.jwt_token as (
  role text,
  account_id UUID
);
CREATE TABLE public_api.activity (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 50),
  type activity_type NOT NULL
);
CREATE TABLE public_api.time_slot (
  activity_id UUID REFERENCES public_api.activity(id) ON DELETE CASCADE,
	start TIMESTAMP WITH TIME ZONE NOT NULL,
	"end" TIMESTAMP WITH TIME ZONE NOT NULL
);
CREATE TABLE public_api.helper (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type TEXT NOT NULL UNIQUE,
  available_no NUMERIC(4, 0) NOT NULL
);
CREATE TABLE public_api.profile (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL CHECK (CHAR_LENGTH(first_name) < 80),
  last_name TEXT NOT NULL CHECK (CHAR_LENGTH(last_name) < 80),
  mobile_phone TEXT NOT NULL CHECK (CHAR_LENGTH(mobile_phone) < 20),
  badge_number TEXT NOT NULL CHECK (CHAR_LENGTH(badge_number) < 20),
  gender gender NOT NULL,
  is_vegetarian BOOLEAN NOT NULL,
  helper UUID REFERENCES public_api.helper(id),
  id_number TEXT NOT NULL,
  badge_front_id TEXT,
  badge_back_id TEXT,
  rental_id UUID,
  university_id UUID,
  needs_accommodation BOOLEAN,
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
  zip_code TEXT NOT NULL CHECK (CHAR_LENGTH(zip_code) < 10),
  city TEXT NOT NULL CHECK (CHAR_LENGTH(city) < 30),
  country TEXT NOT NULL CHECK (CHAR_LENGTH(country) < 15)
);
CREATE TABLE public_api.university (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_person UUID REFERENCES public_api.profile(id),
  address UUID NOT NULL REFERENCES public_api.address(id),
  name TEXT NOT NULL CHECK (CHAR_LENGTH(name) < 100)
);
CREATE TABLE public_api.accommodation (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  description TEXT,
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
  price NUMERIC(6, 2) NOT NULL,
  item_image TEXT
);
CREATE TABLE public_api.size (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL
);
CREATE TABLE public_api.purchase_item (
  purchase_id UUID REFERENCES public_api.purchase(id) ON DELETE CASCADE,
  item_id UUID REFERENCES public_api.item(id) ON DELETE RESTRICT,
  available_no NUMERIC(4, 0) NOT NULL,
  PRIMARY KEY (purchase_id, item_id)
);
CREATE TABLE public_api.item_size (
  item_id UUID REFERENCES public_api.item(id) ON DELETE CASCADE,
  size_id UUID REFERENCES public_api.size(id) ON DELETE RESTRICT,
  available_no NUMERIC(4, 0) NOT NULL,
  PRIMARY KEY (item_id, size_id)
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

CREATE INDEX ON public_api.accommodation(address);
CREATE INDEX ON public_api.accommodation(host_id);
CREATE INDEX ON public_api.profile(accommodation_id);
CREATE INDEX ON public_api.profile_activity(activity_id);
CREATE INDEX ON public_api.university(address);
CREATE INDEX ON public_api.purchase_item(item_id);
CREATE INDEX ON public_api.rental_material(material_id);
CREATE INDEX ON public_api.profile(rental_id);
CREATE INDEX ON public_api.profile(university_id);
CREATE INDEX ON public_api.profile(purchase_id);
CREATE INDEX ON public_api.university(contact_person);
CREATE INDEX ON private_api.account(profile_id);
CREATE INDEX ON public_api.profile(helper);
CREATE INDEX ON public_api.item_size(size_id);
CREATE INDEX ON public_api.time_slot(activity_id);

CREATE FUNCTION private_api.insert_dummy_profile() returns UUID as $$
insert into public_api.profile (first_name, last_name, mobile_phone, badge_number, gender, is_vegetarian, id_number) values
    ('dummyName','dummyLastName','123', '123', 'Female', false, '123') RETURNING id
$$ LANGUAGE SQL STRICT SECURITY DEFINER;

CREATE FUNCTION public_api.signup_account( 
  email text,
  password text
) returns void AS $$ 
  insert into private_api.account (email, password, role_name, profile_id) values
    (email, crypt(password, gen_salt('bf')), 'participant_user', private_api.insert_dummy_profile());
   $$ LANGUAGE SQL STRICT SECURITY DEFINER;

CREATE FUNCTION private_api.link_profile_account( 
  profile uuid,
  account_id uuid
) returns void AS $$ 
  update private_api.account set profile_id = profile WHERE id = account_id;
   $$ LANGUAGE SQL STRICT SECURITY DEFINER;

CREATE FUNCTION public_api.authenticate(
  email text,
  password text
) RETURNS public_api.jwt_token AS $$
  select (role_name, id)::public_api.jwt_token
    from private_api.account
    where 
      private_api.account.email = $1 
      and private_api.account.password = crypt($2, private_api.account.password);
$$ LANGUAGE SQL STRICT SECURITY DEFINER;

CREATE FUNCTION private_api.current_account_id() RETURNS uuid AS $$
  select nullif(current_setting('jwt.claims.account_id', true), '')::uuid
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION public_api.current_profile_id() RETURNS UUID AS $$
  select profile_id
  from private_api.account
  where id = current_setting('jwt.claims.account_id', true)::uuid
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION public_api.available_item_sizes(item_id UUID) RETURNS setof text AS $$
	select name from public_api.size inner join public_api.item_size i_s on id = i_s.size_id and i_s.item_id = item_id;
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION public_api.timeslots_by_activity_type(type activity_type) RETURNS table(start time, "end" time) AS $$
  select start::time, "end"::time from public_api.time_slot inner join public_api.activity a on a.type = type
$$ LANGUAGE SQL STABLE;

COMMIT;
