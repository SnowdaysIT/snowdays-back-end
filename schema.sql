CREATE TYPE gen AS ENUM(
    "Female",
    "Male"
    );

CREATE TABLE user_profile (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL CHECK (CHAR_LENGTH(first_name) < 80),
    last_name TEXT NOT NULL CHECK (CHAR_LENGTH(last_name) < 80),
    university INTEGER REFERENCES university(uni_name),
    mobile_phone TEXT NOT NULL CHECK (CHAR_LENGTH(mobile_phone)<20),
    badge_number TEXT NOT NULL CHECK (CHAR_LENGTH(badge_number)<20),
    gender gen,
    food_allergies TEXT CHECK (CHAR_LENGTH(food_allergies)<200),
    user_height INTEGER,
    user_weight INTEGER,
    shoe_size INTEGER,
    activity INTEGER REFERENCES activity(id),
    accomodation TEXT CHECK (CHART_LENGTH(accomodation)<30)
);

CREATE TABLE activity (
    id SERIAL PRIMARY KEY,
    activity_name TEXT CHECK (CHAR_LENGTH(activity_name)<50),
    activity_date DATE
);

CREATE TABLE accomodation (
    id SERIAL PRIMARY KEY,
    accomodation_address TEXT NOT NULL CHECK (CHAR_LENGTH(accomodation_address)<50),
    host INTEGER REFERENCES user_profile(id),
    host_phone_number TEXT NOT NULL CHECK (CHAR_LENGTH(host_phone_number)<20)
);

CREATE TABLE university (
    id SERIAL PRIMARY KEY,
    contact_person INTEGER REFERENCES user_profile(id),
    uni_address TEXT CHECK (CHAR_LENGTH(uni_address)<100),
    uni_name TEXT NOT NULL CHECK (CHAR_LENGTH(uni_name)<80)
)

CREATE TABLE user {
  id  SERIAL PRiIMARY KEY,
  user_profile INTEGER REFERENCES user_profile(id)
  email TEXT NOT NULL CHECK (CHAR_LENGTH(email) < 80),
  user_password TEXT NOT NULL CHECK (CHAR_LENGTH(user_password) < 80)
}