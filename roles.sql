BEGIN;

CREATE ROLE postgraphile_api BYPASSRLS LOGIN PASSWORD 'apiConnector';
CREATE ROLE anonymous_user;
CREATE ROLE participant_user;
CREATE ROLE contact_person;
CREATE ROLE sport_staff;
CREATE ROLE ca_staff;
CREATE ROLE mainco_staff;
CREATE ROLE it_staff BYPASSRLS;

GRANT anonymous_user TO participant_user;

GRANT participant_user TO contact_person;
GRANT participant_user TO sport_staff;
GRANT participant_user TO ca_staff;
GRANT participant_user TO mainco_staff;
GRANT participant_user TO it_staff;

GRANT contact_person TO ca_staff;

GRANT sport_staff TO it_staff;
GRANT ca_staff TO it_staff;
GRANT mainco_staff TO it_staff;

--grant CHECK if needed column permissions
GRANT SELECT ON ALL TABLES IN SCHEMA public_api TO participant_user;
GRANT INSERT ON public_api.accommodation, public_api.address, public_api.profile, public_api.profile_activity, public_api.purchase, public_api.purchase_item, public_api.rental, public_api.rental_material TO participant_user;
GRANT UPDATE ON public_api.accommodation, public_api.address, public_api.profile, public_api.profile_activity, public_api.purchase, public_api.purchase_item, public_api.rental TO participant_user; --rental items cannot be changed
--GRANT DELETE ON  IN SCHEMA public_api TO participant_user;
GRANT INSERT, UPDATE ON public_api.university TO contact_person;

GRANT INSERT, UPDATE, DELETE ON public_api.material, public_api.activity TO sport_staff;

GRANT INSERT, UPDATE, DELETE ON public_api.activity, public_api.item TO ca_staff;
GRANT DELETE ON public_api.accommodation, public_api.address, public_api.university, public_api.profile, public_api.profile_activity, TO ca_staff;

GRANT INSERT, UPDATE, DELETE ON public_api.activity. public_api.item TO mainco_staff;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA private_api, public_api TO it_staff
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA private_api, public_api TO postgraphile_api

--policy 



COMMIT;