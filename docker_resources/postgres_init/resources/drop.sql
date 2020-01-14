BEGIN;

DROP SCHEMA public_api CASCADE;
DROP SCHEMA private_api CASCADE;
DROP TYPE gender;
DROP TYPE order_status;
DROP TYPE experience_level;
DROP TYPE activity_type;

DROP ROLE postgraphile_api, anonymous_user, participant_user, contact_person, sport_staff, ca_staff, mainco_staff, it_staff;

COMMIT;