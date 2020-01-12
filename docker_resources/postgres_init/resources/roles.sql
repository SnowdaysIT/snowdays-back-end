BEGIN;

CREATE ROLE :postgraphile_api_user BYPASSRLS LOGIN PASSWORD :postgraphile_api_pass;
CREATE ROLE anonymous_user;
CREATE ROLE participant_user;
CREATE ROLE contact_person;
CREATE ROLE sport_staff;
CREATE ROLE ca_staff;
CREATE ROLE mainco_staff;
CREATE ROLE it_staff BYPASSRLS;

GRANT it_staff TO :postgraphile_api_user;

GRANT anonymous_user TO participant_user;

GRANT participant_user TO contact_person;
GRANT participant_user TO sport_staff;
GRANT participant_user TO mainco_staff;

GRANT contact_person TO ca_staff;

GRANT sport_staff TO it_staff;
GRANT ca_staff TO it_staff;
GRANT mainco_staff TO it_staff;

GRANT SELECT ON ALL TABLES IN SCHEMA public_api TO participant_user;
GRANT INSERT ON public_api.accommodation, public_api.address, public_api.profile, public_api.profile_activity, public_api.purchase, public_api.purchase_item, public_api.rental, public_api.rental_material TO participant_user;
GRANT UPDATE ON public_api.accommodation, public_api.address, public_api.profile, public_api.profile_activity, public_api.purchase, public_api.purchase_item, public_api.rental TO participant_user;
GRANT INSERT, UPDATE ON public_api.university TO contact_person;

GRANT INSERT, UPDATE, DELETE ON public_api.material, public_api.activity TO sport_staff;

GRANT INSERT, UPDATE, DELETE ON public_api.activity, public_api.item TO ca_staff;
GRANT DELETE ON public_api.accommodation, public_api.address, public_api.university, public_api.profile, public_api.profile_activity TO ca_staff;

GRANT INSERT, UPDATE, DELETE ON public_api.activity, public_api.item TO mainco_staff;

GRANT ALL ON ALL TABLES IN SCHEMA private_api, public_api TO it_staff;
GRANT ALL ON ALL TABLES IN SCHEMA private_api, public_api TO :postgraphile_api_user;

GRANT USAGE ON SCHEMA private_api, public_api TO :postgraphile_api_user;
GRANT USAGE ON SCHEMA private_api, public_api TO it_staff;
GRANT USAGE ON SCHEMA public_api TO participant_user;

GRANT EXECUTE on function private_api.current_account, public_api.current_profile_id to :postgraphile_api_user;

ALTER TABLE public_api.accommodation ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.address ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.profile ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.profile_activity ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.purchase ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.purchase_item ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.rental ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.rental_material ENABLE ROW LEVEL SECURITY;
ALTER TABLE public_api.university ENABLE ROW LEVEL SECURITY;


CREATE POLICY host_accommodation ON public_api.accommodation TO participant_user USING ( host_id = public_api.current_profile_id());

CREATE POLICY host_address ON public_api.address TO participant_user USING ( id <= (SELECT address FROM public_api.accommodation WHERE host_id = public_api.current_profile_id()));


CREATE POLICY participant_profile ON public_api.profile TO participant_user USING ( id = public_api.current_profile_id());
CREATE POLICY participant_profile_activity ON public_api.profile_activity TO participant_user USING ( profile_id = public_api.current_profile_id());

CREATE POLICY  participant_purchase ON public_api.purchase TO participant_user USING ( id <= (SELECT purchase_id FROM public_api.profile WHERE id = public_api.current_profile_id()));
CREATE POLICY participant_purchase_item ON public_api.purchase_item TO participant_user USING ( purchase_id <= (SELECT purchase_id FROM public_api.profile WHERE id = public_api.current_profile_id()));

CREATE POLICY  participant_rental ON public_api.rental TO participant_user USING (id <= (SELECT rental_id FROM public_api.profile WHERE id = public_api.current_profile_id()));
CREATE POLICY  participant_rental_material ON public_api.rental_material TO participant_user USING (rental_id <= (SELECT rental_id FROM public_api.profile WHERE id = public_api.current_profile_id())); 

COMMIT;
