-- Copyright 2016 Christopher F. Moran on behalf of PERRINN Limited.
--
-- Please refer to the file LICENSE in this repository

CREATE TABLE perrapp.city
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	country			INTEGER	NOT NULL ,
	region			INTEGER	NOT NULL ,
	city_name		VARCHAR(255) NOT NULL
);

CREATE TABLE perrapp.country
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	country_code	CHAR(5) NOT NULL ,
	country_name	VARCHAR(255) NOT NULL ,
	has_division	SMALLINT NOT NULL ,
	division_name	VARCHAR(255)
);

CREATE TABLE perrapp.location
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	location_name	VARCHAR(255) NOT NULL ,
);

CREATE TABLE perrapp.member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE perrapp.message
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	sender 			INTEGER NOT NULL ,
	receiver 		INTEGER NOT NULL ,
	send_stamp		DATETIME NOT NULL ,
	received		SMALLINT NOT NULL ,
	msg_body		BLOB
);

CREATE TABLE perrapp.org
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	org_name		VARCHAR(255) NOT NULL,
	org_descr		BLOB,
	org_owner		INTEGER NOT NULL
);

CREATE TABLE perrapp.org_team
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	org 			INTEGER NOT NULL,
	team 			INTEGER	NOT NULL
);

CREATE TABLE perrapp.project
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	project_name	VARCHAR(255) NOT NULL ,
	project_owner	INTEGER NOT NULL
);

CREATE TABLE perrapp.project_member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	project 		INTEGER NOT NULL ,
	member 			INTEGER NOT NULL
);

CREATE TABLE perrapp.project_org
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	project 		INTEGER NOT NULL ,
	org 			INTEGER NOT NULL
);


CREATE TABLE perrapp.region
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	country 		INTEGER NOT NULL ,
	region_name		VARCHAR(255) NOT NULL,
	region_code		CHAR(5)
);

CREATE TABLE perrapp.task
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
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
	task			INTEGER NOT NULL ,
	sequence		INTEGER NOT NULL ,
	comment			TEXT
);

CREATE TABLE perrapp.team
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	team_name		VARCHAR(255) NOT NULL ,
	team_owner		INTEGER NOT NULL
);

CREATE TABLE perrapp.team_member
(
	id				INTEGER PRIMARY KEY AUTO_INCREMENT ,
	team			INTEGER NOT NULL ,
	member 			INTEGER NOT NULL
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

ALTER TABLE perrapp.project_org ADD CONSTRAINT fk_project_org_001 FOREIGN KEY ( project ) REFERENCES perrapp.project( id );

ALTER TABLE perrapp.project_org ADD CONSTRAINT fk_project_org_002 FOREIGN KEY ( org ) REFERENCES perrapp.org( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_001 FOREIGN KEY ( project ) REFERENCES perrapp.project( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_002 FOREIGN KEY ( task_owner ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.task ADD CONSTRAINT fk_task_003 FOREIGN KEY ( assignee ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.task_segment ADD CONSTRAINT fk_task_segment_001 FOREIGN KEY ( task ) REFERENCES perrapp.task( id );

ALTER TABLE perrapp.team ADD CONSTRAINT fk_team_001 FOREIGN KEY ( team_owner ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.team_member ADD CONSTRAINT fk_team_member_001 FOREIGN KEY ( team ) REFERENCES perrapp.team( id );

ALTER TABLE perrapp.team_member ADD CONSTRAINT fk_team_member_002 FOREIGN KEY ( member ) REFERENCES perrapp.member( id );

ALTER TABLE perrapp.team_org_team ADD CONSTRAINT fk_org_team_001 FOREIGN KEY ( org ) REFERENCES perrapp.org( id );

ALTER TABLE perrapp.team_org_team ADD CONSTRAINT fk_org_team_002 FOREIGN KEY ( team ) REFERENCES perrapp.team( id );
