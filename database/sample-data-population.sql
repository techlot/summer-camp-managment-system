INSERT INTO `user` (username, `password`, role_id)
VALUES
	('admin@camp.com',                         '%Y4k52DfTzf@',  1),
	('acc@division.camp.com',                  '%f$P*0fD^YqA',  2),
	('csat@division.camp.com',                 '6gZMklj**TAo',  2),
	('jotp@division.camp.com',                 'tLwAbH#Hk&jC',  2),
	('napw@division.camp.com',                 '$q#B#FrplzAr',  2),
	('nrep@division.camp.com',                 'Ig$ds^z7XymC',  2),
	('ross.do@egl-inc.info',                   'qaMySANy6',     3),
	('hol_gw@progressenergyinc.info',          'WYPe[y*',       3),
	('misha.merriweat@arketmay.com',           'ZYGY5Y%Y',      3),
	('le_wenge@autozone-inc.info',             '_uLaSeGy]U',    3),
	('ta_ch@gmail.com',                        ',YrU)yQepug',   3),    
	('eugeni.cifuente@gmail.com',              '@yJAbuDyjaH',   3),    
	('adelmo.disa@hermet-inc.info',            'reVEHaME,A4u',  3),    
	('de.leva@careful-organics.org',           '/yVUtyLa,YpU',  3),    
	('sher_karim@gmail.com',                   '6e{uneLA&',     3),
	('geraldine_wake@consearch.net',           ')y$y7y[u+U',    3),
	('ir.adcox@gmail.com',                     'vaLAZERa?a-u',  3),    
	('elbert_murr@acusage.net',                'Pe9Y$uhYpU/a',  3),    
	('eyepstein@arvinmeritor.info',            'dUNU@uNU',      3),
	('jar.els@consolaris.net',                 'PUDU8Y`uN',     3),
	('kalzoeller@diaperstack.com',             '(aZUheraJage',  3),    
	('ker-drane@bismaal.net',                  'de9y,UWa7Y',    3),
	('th.hass@gmail.com',                      'MeTe!Y^ezYqa',  3),    
	('ein-burne@gmail.com',                    'vA2ynYzA',      3),
	('phdran@kols.net',                        '8EnaRyMy',      3),
	('jaysukhupchurc@gmail.com',               '5a7y$Y/a=yjE',  3),
	('dya-alli@councilor.camp.com',            'ytygenuSYpUm',  4),
	('bhask.newpor@councilor.camp.com',        'ARE$A[ENus',    4),
	('phoo_newlan@councilor.camp.com',         'UbuRY(e_aXE',   4),
	('alvin_pro@councilor.camp.com',           'ymApE5ajy%',    4),
	('thanos_mc@councilor.camp.com',           'yjyXyNu2a',     4),
	('dar.all@councilor.camp.com',             'U2e4UXY@u',     4),
	('jaiden-syko@councilor.camp.com',         'u*A!u`ETU',     4),
	('hibern.wor@councilor.camp.com',          'y@EnEbES',      4),
	('eili-profit@councilor.camp.com',         'ynA.A*AMaSA',   4),
	('jami_ead@councilor.camp.com',            'e=y5u_Ejy',     4);
    
DELETE FROM division;
ALTER TABLE division auto_increment=1;
INSERT INTO division (`name`, username, `status`)
VALUES
	('Division of Natural Resources and Environment Protection',    'nrep@division.camp.com',	'Active'),   
	('Division of Computer Sciences and Technologies',              'csat@division.camp.com',	'Active'),  
	('Division of Nursery and Physical Wellness',                   'napw@division.camp.com',	'Active'), 
	('Division of Arts and Culture',                                'acc@division.camp.com',	'Active'),  
	('Division of Junior Officer Training and Preparation',         'jotp@division.camp.com',	'Active');  
    

INSERT INTO `session` (session_name, application_period_start, application_period_end, session_start, session_end) VALUES ('Summer 2018', '2018-02-01', '2018-06-15', '2018-06-24', '2018-09-27');
INSERT INTO `session` (session_name, application_period_start, application_period_end, session_start, session_end) VALUES ('Summer 2019', '2019-02-01', '2019-06-15', '2019-06-24', '2019-09-27');
INSERT INTO `session` (session_name, application_period_start, application_period_end, session_start, session_end) VALUES ('Summer 2020', '2020-02-01', '2020-06-15', '2020-06-24', '2020-09-27');
INSERT INTO `session` (session_name, application_period_start, application_period_end, session_start, session_end) VALUES ('Summer 2021', '2021-02-01', '2021-06-15', '2021-06-24', '2021-09-27');
INSERT INTO `session` (session_name, application_period_start, application_period_end, session_start, session_end) VALUES ('Winter 2021/2022', '2021-11-01', '2022-06-15', '2022-06-24', '2022-09-27');
    
INSERT INTO program (`name`, `description`, start_date, end_date, visibility, division_id, session_id)
VALUES
	('Above the Earth. Atmosphere & Outer Space Studies',               'Program dedicated to...',      '2022-06-25',   '2022-09-05',   'Public',   1,1),
	('National Geographic, Explorer Classroom',                         'Program dedicated to...',      '2022-07-01',   '2022-09-15',   'Public',   1,4),
	('The Encyclopedia of Life',                                         NULL,                          '2022-07-01',   '2022-09-15',   'Public',   1,5),
	('The Living Planet at School',                                      NULL,                          '2022-06-25',   '2022-09-05',   'Public',   1,4),
	('Computer Me! Game building',                                       NULL,                          '2022-06-25',   '2022-09-05',   'Public',   2,5),
	('WireWe. Buttons & Lights',                                        'Program dedicated to...',      '2022-06-25',   '2022-09-05',   'Public',   2,3),
	('Junior Robotics',                                                 'Program dedicated to...',      '2022-06-25',   '2022-09-05',   'Public',   2,1),
	('Code Minecraft modes for kids',                                   'Program dedicated to...',      '2022-06-25',   '2022-09-05',   'Public',   2,5),
	('Heart, Lungs, Digestion & More!',                                  NULL,                          '2022-06-30',   '2022-09-10',   'Public',   3,3),
	('First Aid, Brain, Spine & More!',                                 'Program dedicated to...',      '2022-07-01',   '2022-09-15',   'Public',   3,1),
	('Eye, Ears, CPR & More!',                                          'Program dedicated to...',      '2022-07-01',   '2022-09-15',   'Public',   3,3),
	('The ABC’s of Dog Care!',                                          'Program dedicated to...',      '2022-07-01',   '2022-09-15',   'Public',   3,2),
	('Stracuture and layout',                                           'Program dedicated to...',      '2022-06-28',   '2022-09-07',   'Public',   4,4),
	('The visual elements',                                              NULL,                          '2022-06-28',   '2022-09-07',   'Public',   4,1),
	('Art Appreciation',                                                'Program dedicated to...',      '2022-06-28',   '2022-09-07',   'Public',   4,3),
	('Ancient Art',                                                     'Program dedicated to...',      '2022-06-28',   '2022-09-07',   'Public',   4,5),
	('Teamwork and Leadership',                                         'Program dedicated to...',      '2022-07-03',   '2022-09-21',   'Public',   5,4),
	('Developing Physical Fitness',                                      NULL,                          '2022-07-03',   '2022-09-21',   'Public',   5,1),
	('Map Reading and Navigation',                                      'Program dedicated to...',      '2022-07-03',   '2022-09-21',   'Public',   5,2),
	('Self Defence and Adventure Training',                             'Program dedicated to...',      '2022-07-03',   '2022-09-21',   'Public',   5,5);

INSERT INTO activity (`name`, `description`, `date`, requirements, location, num_of_places, division_id, session_id)
VALUES
	('Go for a Hike',           'The simplest way to get outside...',      '2022-07-05 15:00:00',      'Suitable outfit',     'Meet at the gate...',         30,    3, 5),
	('Scavenger Hunt',          'A good old-fashioned scavenger...',       '2022-07-11 11:00:00',       NULL,                 'Near the building...',        15,    2, 5),
	('Outdoor Twister',          NULL,                                     '2022-06-29 11:30:00',       NULL,                 'Playground on the...',        10,    1, 5),
	('Stargazing',              'What better way to cap off a da...',      '2022-07-21 13:00:00',      'Good mood',           'Entrance of building...',     20,    1, 4),
	('Rope climbing',            NULL,                                     '2022-07-03 09:45:00',      'Suitable outfit',     'The main departments...',     12,    5, 4),
	('Canoeing',                 NULL,                                     '2022-08-01 11:00:00',      'Hat is obligatory',   'Riverside',                   20,    4, 5),
	('Water Balloon Dodgebal',  'Water balloons are a kid-frie...',        '2022-07-23 12:55:00',      'Clothes to change',   'Main camp\'s pool',           21,    4, 4),
	('Kayaking',                'Kayaking is a great summertim...',        '2022-08-06 10:15:00',      'Hat is obligatory',   'Riverside',                   15,    2, 3),
	('Mega Slip-N-Slide',        NULL,                                     '2022-07-19 14:30:00',       NULL,                 'Behind A1 building',          10,    3, 3);

INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,117,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,118,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,119,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,120,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,121,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,122,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,123,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,124,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,125,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,126,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,127,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,128,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,129,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,130,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,131,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('5A','48','Straße der Pariser Kommune','48161',27620);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('1','76','Leipziger Strasse','32423',24053);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'44','Alter Wall','97320',23536);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('99/1','88','Pappelallee','61137',29117);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'88','Link Road','7256',7408);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('3ABC','87','Moores Drive','5731',149145);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('2','83','Quoin Road','7264',4724);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('34','96','Worthy Lane','TR12 5ZX',50987);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('9001','31','Azad Bhavan Madjid Bunder Mandvi','400003',147658);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'729','Swastik Chambers S.t Road Chembur (east)','400071',57751);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('49','445/49','polstrd sahakarajar b-92 Sahakarnagar','560058',57684);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('014','549/3','Hanuman Market Sadar Bazar','110006',131679);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('15','1018','Zawiszy Czarnego','52-241',88604);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'105','Jachtowa','15-587',86718);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('99','157','Mała','40-757',85782);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('1','128','Krasickiego Ignacego','81-867',86310);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('144','134','Kontuszowa','01-345',86724);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'2489','Ste. Catherine Ouest','H3C 3X6',16442);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('9','2309','Lynden Road','L0N 1E0',16637);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,'2353','Kinchant St','V2V 4H9',16912);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('0','1779','rue Levy','H3C 5K4',17217);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('34','20','Lew St','V2V 4H9',16910);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES ('1','2','Pobade','H2F 5K4',17200);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,41,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,42,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,43,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,50,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,46,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,77,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,91,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,33,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,90,'Zielona','50-004',88728);
INSERT INTO address(apartment_no,street_number,street_name,postal_code,city_id) VALUES (NULL,66,'Zielona','50-004',88728);

INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('Gym OAO',1,'9',39);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('Library of medicine',3,'11',40);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('Study zone CS',2,'12',41);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('Canteen',3,'14',42);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('Garden cinema',5,'18',43);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('First aid point',1,15,44);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('First aid point',2,15,45);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('First aid point',3,15,46);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('First aid point',4,15,47);
INSERT INTO amenity(name,division_id,type_id,address_id) VALUES ('First aid point',5,15,48);

INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:00:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:30:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:00:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:30:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',1);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:00:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:30:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:00:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:30:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',2);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',3);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',3);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:00:00','16:00:00',3);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:30:00','16:00:00',3);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:00:00','16:00:00',3);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:30:00','16:00:00',4);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',4);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('10:00:00','16:00:00',5);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',5);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('07:30:00','16:00:00',5);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:00:00','16:00:00',6);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('08:30:00','16:00:00',6);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:00:00','16:00:00',7);
INSERT INTO opening_hours(open_at,closed_at,day_of_week) VALUES ('09:30:00','16:00:00',7);

INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (1,1);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (2,2);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (3,3);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (4,4);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (5,5);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (6,6);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (7,7);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (8,8);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (9,9);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (10,10);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (1,15);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (2,16);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (3,17);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (4,18);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (5,19);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (6,20);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (7,13);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (8,23);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (9,22);
INSERT INTO amenity_opening_hours(amenity_id,opening_hours_id) VALUES (10,20);

INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('A1', 1, 1, 1);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('A2', 1, 1, 2);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('A3', 1, 1, 3);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('B1', 2, 1, 4);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('B2', 2, 1, 5);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('B3', 2, 1, 6);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('C1', 3, 1, 7);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('C2', 3, 1, 8);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('C3', 3, 1, 9);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('D1', 4, 1, 10);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('D2', 4, 1, 11);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('D3', 4, 1, 12);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('E1', 5, 1, 13);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('E2', 5, 1, 14);
INSERT INTO building (building_name, division_id, type_id, address_id) VALUES ('E3', 5, 1, 15);

INSERT INTO room(door_number,capacity,building_name) VALUES (1,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (2,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (3,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (4,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (5,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (6,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (7,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (8,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (9,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (10,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (11,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (12,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (13,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (14,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (15,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (16,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (17,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (18,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (19,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (20,8,'A1');
INSERT INTO room(door_number,capacity,building_name) VALUES (1,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (2,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (3,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (4,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (5,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (6,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (7,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (8,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (9,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (10,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (11,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (12,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (13,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (14,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (15,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (16,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (17,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (18,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (19,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (20,8,'A2');
INSERT INTO room(door_number,capacity,building_name) VALUES (1,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (2,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (3,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (4,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (5,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (6,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (7,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (8,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (9,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (10,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (11,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (12,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (13,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (14,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (15,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (16,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (17,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (18,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (19,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (20,8,'B1');
INSERT INTO room(door_number,capacity,building_name) VALUES (1,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (2,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (3,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (4,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (5,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (6,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (7,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (8,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (9,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (10,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (11,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (12,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (13,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (14,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (15,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (16,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (17,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (18,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (19,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (20,8,'B3');
INSERT INTO room(door_number,capacity,building_name) VALUES (1,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (2,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (3,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (4,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (5,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (6,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (7,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (8,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (9,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (10,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (11,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (12,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (13,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (14,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (15,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (16,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (17,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (18,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (19,8,'E2');
INSERT INTO room(door_number,capacity,building_name) VALUES (20,8,'E2');

INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Hollie',NULL,'Gwin','F','2005-06-11',				5,1,17,'hol_gw@progressenergyinc.info', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Misha','Nancey','Merriweather','M','2006-06-26',		6,1,18,'misha.merriweat@arketmay.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('LeBeau','Jaida','Wenger','F','2005-09-03',			22,1,19,'le_wenge@autozone-inc.info', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Tashi','Lorren','Cheek','F','2005-09-29',			30,1,20,'ta_ch@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Eugenia',NULL,'Cifuentes','F','2006-10-13',			1,1,21,'eugeni.cifuente@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Adelmo',NULL,'Disanto','M','2005-01-01',				2,1,22,'adelmo.disa@hermet-inc.info', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Denis','Kayleen','Levan','M','2005-09-16',			5,0,23,'de.leva@careful-organics.org', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Sherwood','Lynley','Karim','F','2006-08-15',			6,1,24,'sher_karim@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Geraldine',NULL,'Wakeman','F','2006-10-10',			6,1,25,'geraldine_wake@consearch.net', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Irving','Paulson','Adcox','M','2006-05-09',			NULL,1,26,'ir.adcox@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Elbert','Kinsie','Murry','M','2005-04-01',			25,1,27,'elbert_murr@acusage.net', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Eyota',NULL,'Epstein','F','2006-03-30',				25,1,28,'eyepstein@arvinmeritor.info', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Jarman','Burr','Elson','M','2005-12-13',				27,0,29,'jar.els@consolaris.net', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Kaleb',NULL,'Zoeller','M','2005-12-04',				NULL,1,30,'kalzoeller@diaperstack.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Kermit','Edelynn','Drane','M','2005-11-26',			44,1,31,'ker-drane@bismaal.net', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Thalassa','Kristin','Hass','F','2006-04-19',			45,1,32,'th.hass@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Einar','Scot','Burnes','M','2005-09-19',				45,1,33,'ein-burne@gmail.com', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Phyliss','Whittney','Drane','F','2006-02-02',		45,1,34,'phdran@kols.net', 'Active');
INSERT INTO camper(first_name,middle_name,last_name,gender,date_of_birth,room_id,adr_same_as_guard,address_id,username, status) VALUES ('Jaysukh','Kadyn','Upchurch','M','2005-09-16',		47,0,35,'jaysukhupchurc@gmail.com', 'Active');

INSERT INTO camper_activity (camper_id,activity_id,sign_up_date) VALUES (1,	1,	'2022-06-28');
INSERT INTO camper_activity (camper_id,activity_id,sign_up_date) VALUES (1,	2,	'2022-06-29');
INSERT INTO camper_activity (camper_id,activity_id,sign_up_date) VALUES (7,	3,	'2022-06-30');
INSERT INTO camper_activity (camper_id,activity_id,sign_up_date) VALUES (7,	5,	'2022-07-01');

INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Lawrence','Derby','Merriweather','239-824-2617','LawrenceMGentry@armyspy.com',17,'F',2);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Aaron','S.','Wenger','803-469-8779','AaronSWhiteman@jourrapide.com',18,'M',1);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Eward',NULL,'Johnson','303-301-6784', 'EdwardEJohnson@dayrep.com',19,'F',5);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Hugo','Bentlea','Disanto','+34 960 42 1930','lazaro.paula@hernandez.com',20,'M',1);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Mariano',NULL,'Prieto','987 80 8283','margarita.jimenez@franco.es',21,'M',3);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Esther','Edsel','Karim','900 276792','andres.nazario@moran.com',22,'F',2);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Josep','Darlyne','Carmona','+34 903-93-4831','hernadez.nicolas@hispavista.com',23,'M',7);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('David','Morey','Fransson','+46 (0)798 415 679','anna52@sundstrom.com',25,'M',3);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Georg',NULL,'Murry','090-363 091','uno.andersson@martinsson.com',26,'F',1);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Lovisa',NULL,'Henriksson','08-75 13 46','gmagnusson@gmail.com',27,'F',2);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Emilia','Landry','Isaksson','+46 (0)44803965','roy21@holmgren.com',28,'F',4);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Johnny','Madison','Nordström','18483513','natalia.hansson@gmail.com',30,'M',2);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Vân','Perry','Bảo','061-239-2664','bich48@vo.edu.vn',31,'F',7);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Nhung',NULL,'An','84-61-917-2397','thac28@hotmail.com',32,'F',6);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Danh','Perry','Nam','84-70-109-1513','la.huu@bach.com',33,'M',7);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Katherine',NULL,'Davies','6860411','sgray@yahoo.co.uk',34,'F',2);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Emily','Tuesday','Jackson','+44(0)4078 118410','nking@yahoo.co.uk',35,'F',6);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Noah','Shanika','Robinson','01318 183731','carter.muhammad@gmail.com',37,'M',1);
INSERT INTO guardian(first_name,middle_name,last_name,phone_number,email_address,address_id,gender,relation_id) VALUES ('Gregory',NULL,'Williams','00244 97829','linda16@gmail.com',38,'M',1);

INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (1, 1);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (1, 2);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (2, 1);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (2, 2);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (3, 3);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (4, 4);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (5, 5);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (6, 6);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (7, 7);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (8, 8);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (9, 9);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (9, 10);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (10, 9);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (10, 10);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (11, 11);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (12, 12);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (13, 13);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (14, 14);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (15, 15);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (16, 16);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (17, 17);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (18, 18);
INSERT INTO camper_guardian (camper_id, guardian_id) VALUES (19, 19);

INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Dyanne', 'Garner',	'Allie','F',1,1,'dya-alli@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Bhaskar',NULL,'Newport','F',3,1,'bhask.newpor@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Phoolan','Ram','Newland','M',1,2,'phoo_newlan@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Alvin','Lillian','Profitt','M',4,2,'alvin_pro@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Thanos','Orelia','McFalls','M',2,3,'thanos_mc@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Dartagnan','Laci','Allie','M',3,3,'dar.all@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Jaiden',NULL,'Sykora','M',1,4,'jaiden-syko@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Hibernia',NULL,'Worcester','F',3,4,'hibern.wor@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Eilis','Kami','Profitt','F',1,5,'eili-profit@councilor.camp.com', 'Active');
INSERT INTO councilor(first_name,middle_name,last_name,gender,position_id,division_id,username, status) VALUES ('Jamilah','Dejon','Eads','F',2,5,'jami_ead@councilor.camp.com', 'Active');

INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Dirt Doesn''t Hurt','Playground "SUN"',1,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Fun with Flowers','Riverside',1,2);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Bubble Fun','Courtside',2,2);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Beautful Branches','Near the fountain',2,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Splish & Splash','Meet at pool',2,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Into the Trees','Exit gate 3',3,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Winter Nature','Hall of building O9',3,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Frog Friends','Meet at gates',3,2);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Fishy Fun','Meet at gates',4,2);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Teriffic Turtles','Meet at gates',4,2);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Birds on the Wing','Near the fountain',4,1);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Introduction to CS I','Building H13 room 12',5,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Scratch I','Building H13 room 12',5,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Developing your ideas','Building H13 room 12',5,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Buttons & Switches','Building H13 room 15',6,3);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Logical gates','Building H13 room 15',6,3);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Lights everywhere','Building H13 room 15',6,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Intro to Robotics','Building H13 room 5',7,3);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Wiring session','Building H13 room 5',7,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Sounds & Movements','Building H13 room 5',7,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Python programming I','Building H13 room 5',8,3);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Minecraft game specifics','Building H13 room 5',8,3);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Implementation of your ideas','Building H13 room 12',8,4);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('First Aid Techniques','Building H1 room 1',9,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Diseases of heart & lungs','Building H1 room 1',9,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Maintaining healthy body','Building H1 room 1',9,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Advanced First Aid Techniques','Building H1 room 1',10,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('How brain works','Building H1 room 2',10,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Mindfullness','Building H1 room 2',10,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Human sensors','Building H1 room 2',11,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Human vision','Building H1 room 3',11,5);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Human & sounds','Building H1 room 3',11,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Dog science','Building H1 room 3',12,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Dog care','Building H1 room 3',12,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Dogs are fun','Building H1 room 3',12,6);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Layouts I','Building H1 room 4',13,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Sculptures','Building H1 room 5',13,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Structuring the elements','Building H1 room 6',13,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Shapes & Surfaces','Building H1 room 7',14,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Lines techniques','Building H1 room 8',14,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Drawing I','Building H1 room 9',14,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('What is art','Building H1 room 10',15,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Art as a whole','Building H1 room 11',15,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('World famous arts','Building H1 room 12',15,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Egyptian art','Building H1 room 13',16,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Art of 15th century','Building H1 room 14',16,8);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Old techniques','Building H1 room 15',16,7);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Leadership I','Mini court 3',17,10);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Teamwork','Mini court 4',17,9);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Communication and Networking','Mini court 5',17,10);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Fitness I','Mini court 6',18,9);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Bodybuilding','Mini court 7',18,9);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Rope climbing','Mini court 8',18,9);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Self-defence I','Mini court 9',20,10);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Armor and their usage','Mini court 10',20,10);
INSERT INTO class(name,location,program_id,councilor_id) VALUES ('Navigation','Mini court 11',20,10);

INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (1,1,1);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (1,2,2);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (2,28,2);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (2,29,1);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (6,7,4);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (16,12,1);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (16,13,2);
INSERT INTO camper_class(camper_id,class_id,grade_id) VALUES (16,14,2);

INSERT INTO class_schedule(class_id,schedule_id) VALUES (1,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (2,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (3,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (4,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (5,3);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (6,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (7,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (8,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (9,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (10,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (11,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (12,6);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (13,3);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (14,3);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (15,3);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (16,4);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (17,5);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (18,6);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (19,7);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (20,8);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (21,9);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (22,10);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (23,11);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (24,12);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (25,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (26,14);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (27,15);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (28,16);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (29,17);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (30,18);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (31,19);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (32,20);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (33,21);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (34,22);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (35,23);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (36,24);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (37,25);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (38,26);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (39,27);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (40,28);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (41,1);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (42,3);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (43,5);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (44,7);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (45,23);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (46,22);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (47,21);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (48,19);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (49,8);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (50,7);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (51,4);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (52,5);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (53,2);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (54,12);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (55,15);
INSERT INTO class_schedule(class_id,schedule_id) VALUES (56,1);

INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-05-06',NULL,1,3,3);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-06-04',NULL,1,5,4);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-03-01','2022-06-11',2,20,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2018-04-29','2022-06-11',2,10,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2021-05-06','2021-05-11',3,4,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2021-06-04','2021-05-14',4,17,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2018-03-01','2022-06-11',5,7,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2021-04-29','2021-05-09',6,5,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-05-06',NULL,6,8,3);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-06-04','2022-06-11',7,20,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2018-03-01','2022-06-11',7,18,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2021-04-29','2021-05-01',8,2,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-05-06','2022-06-11',9,8,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-06-04',NULL,10,5,3);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2018-03-01','2018-04-05',10,10,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2018-04-29','2018-05-01',10,1,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2020-05-06','2020-06-01',11,15,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2021-06-04','2022-06-11',12,4,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-03-01',NULL,13,3,4);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-04-29','2022-06-11',14,5,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-05-06','2022-06-11',15,5,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2022-06-04','2022-06-11',16,5,1);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2020-03-01','2022-06-11',17,6,2);
INSERT INTO application(date,date_of_decision,camper_id,program_id,status_id) VALUES ('2020-04-29','2020-05-01',17,9,1);

INSERT INTO event(name,description,date,location,division_id, session_id) VALUES ('Late Night Show','Get the most…','7/3/22 19:00','Main stage',1,5);
INSERT INTO event(name,description,date,location,division_id, session_id) VALUES ('BackNWhite Party','Take a part…','7/10/22 21:00','Hall of B1',3,4);
INSERT INTO event(name,description,date,location,division_id, session_id) VALUES ('All you can eat is dumplings','Taste the most..','7/6/22 14:00','Canteen',2,3);
INSERT INTO event(name,description,date,location,division_id, session_id) VALUES ('Jazz Music Lovers','Enjoy the old evening…','7/11/22 18:30','Main stage',5,2);