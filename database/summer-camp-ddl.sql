CREATE SCHEMA summer_camp;
USE summer_camp;

CREATE TABLE `role` (
  role_id int NOT NULL AUTO_INCREMENT, 
  `role` varchar(10) NOT NULL, 
  PRIMARY KEY (role_id)
);

CREATE TABLE `user` (
  username varchar(100) NOT NULL, 
  `password` varchar(100) NOT NULL, 
  role_id int NOT NULL, 			
  FOREIGN KEY (role_id) REFERENCES `role` (role_id) ON UPDATE RESTRICT ON DELETE CASCADE, 
  PRIMARY KEY (username)
);

CREATE TABLE division (
  division_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  username varchar(100), 
  `status` enum('Active', 'Inactive') NOT NULL,
  FOREIGN KEY (username) REFERENCES `user` (username) ON UPDATE CASCADE ON DELETE SET NULL, 
  UNIQUE (username),
  PRIMARY KEY (division_id)
);

CREATE TABLE `session` (
	session_id int NOT NULL AUTO_INCREMENT,
    session_name varchar(100) NOT NULL,
    application_period_start datetime NOT NULL,
    application_period_end datetime NOT NULL,
    session_start datetime NOT NULL,
    session_end datetime NOT NULL,
    UNIQUE (session_name),
    PRIMARY KEY (session_id)
);

CREATE TABLE program (
  program_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  `description` varchar(255), 		
  start_date date NOT NULL, 
  end_date date NOT NULL, 
  visibility enum('Private', 'Public') NOT NULL,
  division_id int NOT NULL, 
  session_id int NOT NULL,
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (session_id) REFERENCES session (session_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (program_id)
);

CREATE TABLE activity (
  activity_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  `description` varchar(255), 		
  `date` datetime NOT NULL,
  requirements varchar(255), 	
  location varchar(255) NOT NULL, 
  num_of_places int NOT NULL, 
  division_id int NOT NULL, 
  session_id int NOT NULL,
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (session_id) REFERENCES session (session_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (activity_id)
);

CREATE TABLE country (
  country_id int UNSIGNED NOT NULL AUTO_INCREMENT, 
  country_name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (country_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE city (
  city_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  city_name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (city_id),
  FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE address (
  address_id int NOT NULL AUTO_INCREMENT, 
  apartment_no varchar(30), 
  street_number varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  street_name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, 
  postal_code varchar(50), 		
  city_id int UNSIGNED NOT NULL, 
  FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (address_id)
)DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE amenity_type (
  type_id int NOT NULL AUTO_INCREMENT, 
  type_name varchar(50) NOT NULL, 
  PRIMARY KEY (type_id)
);

CREATE TABLE amenity (
  amenity_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(20) NOT NULL, 
  division_id int NOT NULL, 
  type_id int NOT NULL, 
  address_id int, 
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (type_id) REFERENCES amenity_type (type_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE SET NULL ON UPDATE CASCADE, 
  PRIMARY KEY (amenity_id)
);

CREATE TABLE opening_hours (
  opening_hours_id int NOT NULL AUTO_INCREMENT, 
  open_at time NOT NULL, 
  closed_at time NOT NULL, 
  day_of_week int NOT NULL, 	# 1 - Mon, 2 - Tue, 3 - Wed ..., 7 - Sun.
  PRIMARY KEY (opening_hours_id)
);

CREATE TABLE amenity_opening_hours (
  amenity_id int NOT NULL, 
  opening_hours_id int NOT NULL, 
  FOREIGN KEY (amenity_id) REFERENCES amenity (amenity_id) ON DELETE CASCADE ON UPDATE RESTRICT, 
  FOREIGN KEY (opening_hours_id) REFERENCES opening_hours (opening_hours_id) ON DELETE CASCADE ON UPDATE RESTRICT, 
  PRIMARY KEY (amenity_id, opening_hours_id)
);

CREATE TABLE building_type (
  type_id int NOT NULL AUTO_INCREMENT, 
  type_name varchar(50) NOT NULL, 
  PRIMARY KEY (type_id)
);

CREATE TABLE building (
  building_name char(2) NOT NULL, 
  division_id int NOT NULL, 
  type_id int NOT NULL, 
  address_id int, 
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (type_id) REFERENCES building_type (type_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE SET NULL ON UPDATE CASCADE, 
  PRIMARY KEY (building_name)
);

CREATE TABLE room (
  room_id int NOT NULL AUTO_INCREMENT, 
  door_number int NOT NULL, 
  capacity int, 
  building_name char(2) NOT NULL, 
  FOREIGN KEY (building_name) REFERENCES building (building_name) ON DELETE CASCADE ON UPDATE CASCADE, 
  PRIMARY KEY (room_id)
);

CREATE TABLE camper (
  camper_id int NOT NULL AUTO_INCREMENT, 
  first_name varchar(50) NOT NULL, 
  middle_name varchar(50), 			# might be null, person might not have it.
  last_name varchar(50) NOT NULL, 
  gender enum('M', 'F') NOT NULL, 
  date_of_birth date NOT NULL, 
  room_id int, 			# might be null
  adr_same_as_guard TINYINT, 	# if address is same as guardian - 0, no - 1.
  address_id int, 					# null if previous attribute is - 0.
  `status` enum('Active', 'Inactive') NOT NULL,
  username varchar(100), 
  FOREIGN KEY (room_id) REFERENCES room (room_id) ON DELETE SET NULL ON UPDATE RESTRICT, 
  FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE SET NULL ON UPDATE RESTRICT, 
  FOREIGN KEY (username) REFERENCES `user` (username) ON UPDATE CASCADE ON DELETE SET NULL, 
  UNIQUE (username),
  PRIMARY KEY (camper_id)
);

CREATE INDEX idx_camper_pname
ON camper (first_name, middle_name, last_name);


CREATE TABLE camper_activity (
  camper_id int NOT NULL, 
  activity_id int NOT NULL, 
  sign_up_date date NOT NULL, 		
  FOREIGN KEY (camper_id) REFERENCES camper (camper_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (activity_id) REFERENCES activity (activity_id) ON DELETE CASCADE ON UPDATE RESTRICT, 
  PRIMARY KEY (camper_id, activity_id)
);

CREATE TABLE relation (
  relation_id int NOT NULL AUTO_INCREMENT, 
  relation_name varchar(20) NOT NULL, 
  PRIMARY KEY (relation_id)
);

CREATE TABLE guardian (
  guardian_id int NOT NULL AUTO_INCREMENT, 
  first_name varchar(50) NOT NULL, 
  middle_name varchar(50), 			# might be null, person might not have it.
  last_name varchar(50) NOT NULL, 
  phone_number varchar(255) NOT NULL, 
  email_address varchar(255) NOT NULL, 
  address_id int, 
  gender enum('M', 'F') NOT NULL, 
  relation_id int NOT NULL, 
  FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE SET NULL ON UPDATE RESTRICT, 
  FOREIGN KEY (relation_id) REFERENCES relation (relation_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (guardian_id)
);

CREATE TABLE camper_guardian (
  camper_id int NOT NULL, 
  guardian_id int NOT NULL, 
  FOREIGN KEY (camper_id) REFERENCES camper (camper_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (guardian_id) REFERENCES guardian (guardian_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (camper_id, guardian_id)
);

CREATE TABLE position (
  position_id int NOT NULL AUTO_INCREMENT, 
  position_name varchar(45) NOT NULL, 
  PRIMARY KEY (position_id)
);

CREATE TABLE councilor (
  councilor_id int NOT NULL AUTO_INCREMENT, 
  first_name varchar(50) NOT NULL, 
  middle_name varchar(50), 			# might be null, person might not have it.
  last_name varchar(50) NOT NULL, 
  gender enum('M', 'F') NOT NULL, 
  position_id int NOT NULL, 
  division_id int NOT NULL, 
  `status` enum('Active', 'Inactive') NOT NULL,
  username varchar(100), 
  FOREIGN KEY (position_id) REFERENCES position (position_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (username) REFERENCES `user` (username) ON UPDATE CASCADE ON DELETE SET NULL, 
  UNIQUE (username),
  PRIMARY KEY (councilor_id)
);

CREATE TABLE class (
  class_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  location varchar(255) NOT NULL, 
  program_id int NOT NULL, 
  councilor_id int, 
  FOREIGN KEY (program_id) REFERENCES program (program_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (councilor_id) REFERENCES councilor (councilor_id) ON DELETE SET NULL ON UPDATE RESTRICT, 
  PRIMARY KEY (class_id)
);


CREATE TABLE grade (
  grade_id int NOT NULL AUTO_INCREMENT, 
  grade varchar(2) NOT NULL, 
  `description` varchar(255) NOT NULL, 
  PRIMARY KEY(grade_id)
);

CREATE TABLE camper_class (
  camper_id int NOT NULL, 
  class_id int NOT NULL, 
  grade_id int, 
  FOREIGN KEY (camper_id) REFERENCES camper (camper_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (grade_id) REFERENCES grade (grade_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (camper_id, class_id)
);

CREATE TABLE `schedule` (
  schedule_id int NOT NULL AUTO_INCREMENT, 
  start_at time NOT NULL, 
  end_at time NOT NULL, 
  day_of_week int NOT NULL, 
  PRIMARY KEY (schedule_id)
);

CREATE TABLE class_schedule (
  class_id int NOT NULL, 
  schedule_id int NOT NULL, 
  FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE CASCADE ON UPDATE RESTRICT, 
  FOREIGN KEY (schedule_id) REFERENCES `schedule` (schedule_id) ON DELETE CASCADE ON UPDATE RESTRICT, 
  PRIMARY KEY (class_id, schedule_id)
);

CREATE TABLE `status` (
  status_id int NOT NULL AUTO_INCREMENT, 
  status_name varchar(20) NOT NULL, 
  PRIMARY KEY (status_id)
);

CREATE TABLE application (
  application_id int NOT NULL AUTO_INCREMENT, 
  `date` date NOT NULL, 
  date_of_decision date, 		# is null until application is reviewed.
  camper_id int NOT NULL, 
  program_id int NOT NULL, 
  status_id int NOT NULL, 
  FOREIGN KEY (camper_id) REFERENCES camper (camper_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (status_id) REFERENCES `status` (status_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (program_id) REFERENCES program (program_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  UNIQUE (camper_id, program_id),
  PRIMARY KEY (application_id)
);

CREATE TABLE `event` (
  event_id int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  `description` varchar(255),		# might be null, description is not obligatory.
  `date` datetime NOT NULL, 
  location varchar(255) NOT NULL, 
  division_id int NOT NULL, 
  session_id int NOT NULL,
  FOREIGN KEY (session_id) REFERENCES session (session_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY (division_id) REFERENCES division (division_id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (event_id)
);