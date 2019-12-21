BEGIN;

INSERT INTO private_api.account (email, password) values
    ('testmail@snowdays.it', 'strong-hash-psw');

INSERT INTO public_api.profile (first_name, last_name, mobile_phone, badge_number, gender, vegetarian) values
    ('Yeti', 'The Mascott Master', '0000000000', '12345A', 'Male', false);

COMMIT;