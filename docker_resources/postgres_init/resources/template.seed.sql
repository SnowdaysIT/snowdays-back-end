BEGIN;

INSERT INTO public_api.helper(type, available_no)
VALUES ('catering', 35),
	('sports', 30),
	('spirit', 6),
	('logistics', 5),
	('party', 35),
	('contacts', 6);

INSERT INTO public_api.activity(name, "type")
values
	('Second day lunch', 'Lunch'),
	('Second day dinner', 'Dinner'),
	('Third day lunch', 'Lunch'),
	('Third day dinner', 'Dinner'),
	('Second day ski', 'Sport'),
	('Second day ski course', 'Sport'),
	('Second day snowboard course', 'Sport'),
	('Snowvolley', 'Sport'),
	('Human table football', 'Sport'),
	('Snowwalking', 'Sport'),
	('Third day ski', 'Sport'),
	('Third day ski course', 'Sport'),
	('Third day snowboard course', 'Sport'),
	('Ski race', 'Sport'),
	('Snowboard race', 'Sport'),
	('Beer pong', 'Other'),
	('Line dragging', 'Other'),
	('Twister', 'Other'),
	('Slackline', 'Other'),
	('Flunkyball', 'Other'),
	('Mechanical bull', 'Other'),
	('Sponsor activities', 'Other');

INSERT INTO public_api.item("name", description, price, item_image)
values
	('Hoodie','S',20,''),
	('Hoodie','M',20,''),
	('Hoodie','L',20,''),
	('Hoodie','XL',20,''),
	('T-Shirt','S',0,''),
	('T-Shirt','M',0,''),
	('T-Shirt','L',0,''),
	('T-Shirt','XL',0,'');


INSERT INTO public_api.material ("name")
VALUES
	('Second ski and skiboots'),
	('Second premium ski and skiboots'),
	('Second snowboard and snowboots'),
	('Third ski and skiboots'),
	('Third premium ski and skiboots'),
	('Third snowboard and snowboots');

INSERT INTO public_api."size"("name")
values
	('S'),
	('M'),
	('L'),
	('XL');

INSERT INTO public_api.address(street, zip_code, city, country)
VALUES
    ('Via Weggenstein 14', '39100', 'Bolzano', 'Italy'),
	('Viale Druso 299/B', '39100', 'Bolzano', 'Italy'),
	('Via Dante', '39100', 'Bolzano', 'Italy');

SELECT public_api.insert_new_university('Free University of Bolzano', 'Piazza Università 1', '39100', 'Bolzano', 'Italy');
SELECT public_api.insert_new_university('Alumni Free University of Bolzano', 'Piazza Università 1', '39100', 'Bolzano', 'Italy');
SELECT public_api.insert_new_university('Università di Cagliari', 'Via Università 40', '09124', 'Cagliari', 'Italy');
SELECT public_api.insert_new_university('Università di Bologna', 'Via Zamboni 33', '40126', 'Bologna', 'Italy');
SELECT public_api.insert_new_university('Università di Ferrara', 'Via Savonarola 9', '44121', 'Ferrara', 'Italy');
SELECT public_api.insert_new_university('Università di Trento', 'Via Calepina 14', '38122', 'Trento','Italy');
SELECT public_api.insert_new_university('Università di Pisa', 'Lungarno Antonio Pacinotti 43', '56126', 'Pisa', 'Italy');
SELECT public_api.insert_new_university('IUBH Bad Honnef', 'Mülheimer Str. 38', '53604', 'Bad Honnef', 'Germany');
SELECT public_api.insert_new_university('Bad Homburg University of Applied Science', 'Du-Pont-Straße 4', '61352', 'Bad Homburg vor der Höhe', 'Germany');
SELECT public_api.insert_new_university('University of Bremen', 'Bibliothekstraße 1', '28359', 'Bremen', 'Germany');
SELECT public_api.insert_new_university('FHV Vorarlberg', 'Hochschulstraße 1', '6850', 'Dornbirn', 'Austria');
SELECT public_api.insert_new_university('Frankfurt School of Finance & Management', 'Adickesallee 32-34', '60322', 'Frankfurt am Main', 'Germany');
SELECT public_api.insert_new_university('HSG - University of St.Gallen', 'Dufourstrasse 50', '9000', 'St. Gallen', 'Switzerland');
SELECT public_api.insert_new_university('HSBA - Hamburg School of Business Administration', 'Alter Wall 38', '20457', 'Hamburg', 'Germany');
SELECT public_api.insert_new_university('LMU Munich', 'Geschwister-Scholl-Platz 1', '80539', 'München', 'Germany');
SELECT public_api.insert_new_university('Leuphana University Lüneburg', 'Universitätsallee 1', '21335', 'Lüneburg', 'Germany');
SELECT public_api.insert_new_university('Macromedia University of Applied Sciences', 'Sandstraße 9 Empfang im Erdgeschoss', '80335', 'München', 'Germany');
SELECT public_api.insert_new_university('Nordakademie', 'Köllner Chaussee 11', '25337', 'Elmshorn', 'Germany');
SELECT public_api.insert_new_university('TUM Munich', 'Arcisstraße 21', '80333', 'München', 'Germany');
SELECT public_api.insert_new_university('University of Augsburg', 'Universitätsstraße 2', '86159', 'Augsburg', 'Germany');
SELECT public_api.insert_new_university('University of Hamburg', 'Mittelweg 177', '20148', 'Hamburg', 'Germany');
SELECT public_api.insert_new_university('University of Passau', 'Innstraße 41', '94032', 'Passau', 'Germany');
SELECT public_api.insert_new_university('WHU - Otto Beisheim School of Management', 'Burgpl. 2', '56179', 'Vallendar', 'Germany');
SELECT public_api.insert_new_university('Zeppelin University', 'Am Seemooser Horn 20', '88045', 'Friedrichshafen', 'Germany');
SELECT public_api.insert_new_university('Zurigo', 'Rämistrasse 71', '8006', 'Zürich', 'Switzerland');
SELECT public_api.insert_new_university('España', 'Spain', '28001', 'Madrid', 'Spain');
SELECT public_api.insert_new_university('Lappeenranta University of Technology', 'Yliopistonkatu 34', '53850', 'Lappeenranta', 'Finland');
SELECT public_api.insert_new_university('Management Center Innsbruck', 'Universitätsstraße 15', '6020', 'Innsbruck', 'Austria');

COMMIT;
