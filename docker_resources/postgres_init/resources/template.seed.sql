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
	('Via Dante', '39100', 'Bolzano', 'Italy'),
	('Piazza Università 1', '39100', 'Bolzano', 'Italy'),
	('Via Università 40', '09124', 'Cagliari', 'Italy'),
	('Via Zamboni 33', '40126', 'Bologna', 'Italy'),
	('Via Savonarola 9', '44121', 'Ferrara', 'Italy'),
	('Via Calepina 14', '38122', 'Trento','Italy'),
 	('Lungarno Antonio Pacinotti 43', '56126', 'Pisa', 'Italy'),
	('Mülheimer Str. 38', '53604', 'Bad Honnef', 'Germany'),
	('Du-Pont-Straße 4', '61352', 'Bad Homburg vor der Höhe', 'Germany'),
	('Bibliothekstraße 1', '28359', 'Bremen', 'Germany'),
	('Hochschulstraße 1', '6850', 'Dornbirn', 'Austria'),
	('Adickesallee 32-34', '60322', 'Frankfurt am Main', 'Germany'),
	('Dufourstrasse 50', '9000', 'St. Gallen', 'Switzerland'),
	('Alter Wall 38', '20457', 'Hamburg', 'Germany'),
	('Geschwister-Scholl-Platz 1', '80539', 'München', 'Germany'),
	('Universitätsallee 1', '21335', 'Lüneburg', 'Germany'),
	('Sandstraße 9 Empfang im Erdgeschoss', '80335', 'München', 'Germany'),
	('Köllner Chaussee 11', '25337', 'Elmshorn', 'Germany'),
	('Arcisstraße 21', '80333', 'München', 'Germany'),
	('Universitätsstraße 2', '86159', 'Augsburg', 'Germany'),
	('Mittelweg 177', '20148', 'Hamburg', 'Germany'),
	('Innstraße 41', '94032', 'Passau', 'Germany'),
	('Burgpl. 2', '56179', 'Vallendar', 'Germany'),
	('Am Seemooser Horn 20', '88045', 'Friedrichshafen', 'Germany'),
	('Rämistrasse 71', '8006', 'Zürich', 'Switzerland'),
	('Spain', '28001', 'Madrid', 'Spain'),
	('Yliopistonkatu 34', '53850', 'Lappeenranta', 'Finland'),
	('Universitätsstraße 15', '6020', 'Innsbruck', 'Austria');

-- INSERT INTO public_api.university (address, "name")
-- VALUES
-- 	('respective address id goes in this column', 'Free University of Bolzano'),
-- 	('', 'Alumni Free University of Bolzano'),
-- 	('', 'Università di Cagliari'),
-- 	('', 'Università di Bologna'),
-- 	('', 'Università di Ferrara'),
-- 	('', 'Università di Trento'),
-- 	('', 'Università di Pisa'),
-- 	('', 'IUBH Bad Honnef'),
-- 	('', 'Bad Homburg University of Applied Science'),
-- 	('', 'University of Bremen'),
-- 	('', 'FHV Vorarlberg'),
-- 	('', 'Frankfurt School of Finance & Management'),
-- 	('', 'HSG - University of St.Gallen'),
-- 	('', 'HSBA - Hamburg School of Business Administration'),
-- 	('', 'LMU Munich'),
-- 	('', 'Leuphana University Lüneburg'),
-- 	('', 'Macromedia University of Applied Sciences'),
-- 	('', 'Nordakademie'),
-- 	('', 'TUM Munich'),
-- 	('', 'University of Augsburg'),
-- 	('', 'University of Hamburg'),
-- 	('', 'University of Passau'),
-- 	('', 'WHU - Otto Beisheim School of Management'),
-- 	('', 'Zeppelin University'),
-- 	('', 'Zurigo'),
-- 	('', 'España'),
-- 	('', 'Lappeenranta University of Technology'),
-- 	('', 'Management Center Innsbruck');


COMMIT;
