-- Copyright 2016 Christopher F. Moran on behalf of PERRINN Limited.
--
-- Please refer to the file LICENSE in this repository

CREATE TABLE perrapp.activity
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	content			VARCHAR(255) NOT NULL,
	author_id		INTEGER NOT NULL,
	team_id			INTEGER NOT NULL
);

CREATE TABLE perrapp.activity_journal
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	content			VARCHAR(255) NOT NULL,
	author_id		INTEGER NOT NULL,
	team_id			InTEGER NOT NULL
);

CREATE TABLE perrapp.city
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	country			INTEGER	NOT NULL ,
	region			INTEGER	NOT NULL ,
	city_name		VARCHAR(255) NOT NULL
);

CREATE TABLE perrapp.country
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	country_code	CHAR(5) NOT NULL ,
	country_name	VARCHAR(255) NOT NULL ,
	has_division	SMALLINT NOT NULL ,
	division_name	VARCHAR(255)
);

CREATE TABLE perrapp.devicetype
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	evt_start		DATETIME NOT NULL,
	evt_end			DATETIME NOT NULL,
	description		VARCHAR(255)
);

CREATE TABLE perrapp.event
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	description		VARCHAR(255) NOT NULL
);

CREATE TABLE perrapp.image
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	member_id		INTEGER NOT NULL ,
	team_id			INTEGER NOT NULL ,
	is_private		BOOLEAN NOT NULL ,
	is_team_only	BOOLEAN NOT NULL ,
	is_public		BOOLEAN NOT NULL ,
	image_content	BLOB NOT NULL ,
	image_stamp		DATETIME ,
	image_name		VARCHAR(255) ,
	x_size			INTEGER ,
	y_size			INTEGER ,
);

CREATE TABLE perrapp.key
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	devicetype		VARCHAR(255) NOT NULL ,
	mac_address		VARCHAR(255) ,
	device_name		VARCHAR(255) ,
	device_type		INTEGER ,
	member_id		INTEGER ,
);

CREATE TABLE perrapp.location
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	location_name	VARCHAR(255) NOT NULL ,
);

CREATE TABLE perrapp.member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
);

CREATE TABLE perrapp.message
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	sender 			INTEGER NOT NULL ,
	receiver 		INTEGER NOT NULL ,
	send_stamp		DATETIME NOT NULL ,
	received		SMALLINT NOT NULL ,
	msg_body		BLOB
);

CREATE TABLE perrapp.profile
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	member_id		INTEGER NOT NULL ,
	home_country	INTEGER ,
	home_region		INTEGER ,
	home_city		INTEGER ,
	home_lat		DOUBLE ,
	home_long		DOUBLE ,
	home_tz			INTEGER ,
	curr_country	INTEGER ,
	curr_region		INTEGER ,
	curr_city		INTEGER ,
	curr_lat		DOUBLE ,
	curr_tz			INTEGER
	curr_long		DOUBLE ,
);

CREATE TABLE perrapp.project
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	project_name	VARCHAR(255) NOT NULL ,
	project_owner	INTEGER NOT NULL
);

CREATE TABLE perrapp.project_member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	project 		INTEGER NOT NULL ,
	member 			INTEGER NOT NULL
);

CREATE TABLE perrapp.project_team
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	project 		INTEGER NOT NULL ,
	team 			INTEGER NOT NULL
);


CREATE TABLE perrapp.region
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	country 		INTEGER NOT NULL ,
	region_name		VARCHAR(255) NOT NULL
);

CREATE TABLE perrapp.task
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	project			INTEGER NOT NULL ,
	task_name		VARCHAR(255) NOT NULL ,
	task_owner		INTEGER NOT NULL ,
	assignee		INTEGER NOT NULL ,
	assign_date		DATETIME NOT NULL ,
	due_date		DATETIME ,
	comment			TEXT
);

CREATE TABLE perapp.task_segment
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	task			INTEGER NOT NULL ,
	sequence		INTEGER NOT NULL ,
	comment			TEXT
);

CREATE TABLE perrapp.team
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	team_name		VARCHAR(255) NOT NULL ,
	team_owner		INTEGER NOT NULL ,
	team_url		VARCHAR(255)
);

CREATE TABLE perrapp.team_member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	team			INTEGER NOT NULL ,
	member 			INTEGER NOT NULL
);

CREATE TABLE perrapp.timezone
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	create_date		DATETIME NOT NULL ,
	create_id		INTEGER ,
	change_date		DATETIME ,
	change_id		INTEGER ,
	active			BOOLEAN NOT NULL ,
	timezone		VARCHAR(255) NOT NULL,
	tz_offset		INTEGER NOT NULL DEFAULT 0,
	has_dst			BOOLEAN ,
	dst_start		DATETIME ,
	dst_end			DATETIME ,
	dst_offset		INTEGER 
);

CREATE INDEX perrapp.ix_city_001 ON perrapp.city
(
	city_name ASC
);

CREATE UNIQUE INDEX perrapp.ix_country_001 ON perrapp.country
(
	country_code ASC
);

CREATE INDEX perrapp.ix_country_002 ON perrapp.country
(
	country_name ASC
);

CREATE INDEX perrapp.ix_location_001 ON perrapp.location
(
	location_name ASC
);

CREATE INDEX perrapp.ix_project_001 ON perrapp.project
(
	project_name ASC
);

CREATE INDEX perrapp.ix_region_001 ON perrapp.region
(
	region_name ASC
);

CREATE INDEX perrapp.ix_team_001 ON perrapp.team
(
	team_name ASC
);

ALTER TABLE perrapp.city ADD CONSTRAINT fk_city_001 FOREIGN KEY ( country ) REFERENCES perrapp.country( id );

ALTER TABLE perrapp.city ADD CONSTRAINT fk_city_002 FOREIGN KEY ( region ) REFERENCES perrapp.region( id );

ALTER TABLE perrapp.message ADD CONSTRAINT fk_message_001 FOREIGN KEY ( sender ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.message ADD CONSTRAINT fk_message_001 FOREIGN KEY ( receiver ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.project ADD CONSTRAINT fk_project_001 FOREIGN KEY ( project_owner ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.project_member ADD CONSTRAINT fk_project_member_001 FOREIGN KEY ( project ) REFERENCES perrapp.project( id );

ALTER TABLE perrapp.project_member ADD CONSTRAINT fk_project_member_002 FOREIGN KEY ( member ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_001 FOREIGN KEY ( project ) REFERENCES perrapp.project( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_002 FOREIGN KEY ( task_owner ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_003 FOREIGN KEY ( assignee ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.task_segment ADD CONSTRAINT fk_task_segment_001 FOREIGN KEY ( task ) REFERENCES perrapp.task( id );

ALTER TABLE perrapp.team ADD CONSTRAINT fk_team_001 FOREIGN KEY ( team_owner ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.team_member ADD CONSTRAINT fk_team_member_001 FOREIGN KEY ( team ) REFERENCES perrapp.team( id );

ALTER TABLE perrapp.team_member ADD CONSTRAINT fk_team_member_002 FOREIGN KEY ( member ) REFERENCES perrapp.member( id );

