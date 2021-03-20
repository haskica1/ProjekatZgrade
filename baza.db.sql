BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Municipality" (
	"id"	INTEGER,
	"name"	TEXT,
	"numberBuildings"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "User_Muncipality" (
	"idUser"	INTEGER,
	"idMuncipality"	INTEGER,
	FOREIGN KEY("idUser") REFERENCES "User"("id"),
	FOREIGN KEY("idMuncipality") REFERENCES "Municipality"("id"),
	PRIMARY KEY("idUser","idMuncipality")
);
CREATE TABLE IF NOT EXISTS "Jobs" (
	"id"	INTEGER,
	"name"	TEXT,
	"beginingDate"	TEXT,
	"endDate"	TEXT,
	"contractor"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Building_Jobs" (
	"buildingID"	INTEGER,
	"job_id"	INTEGER,
	PRIMARY KEY("buildingID","job_id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"id"	INTEGER,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"phone_number"	TEXT,
	"email"	TEXT,
	"adress"	TEXT,
	"username"	TEXT,
	"password"	TEXT,
	"type"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Building" (
	"id"	INTEGER,
	"adress"	TEXT,
	"numberOfFlats"	INTEGER,
	"type"	INTEGER,
	"garage"	INTEGER,
	"numberOfElevators"	INTEGER,
	"numberOfFloors"	INTEGER,
	"yearOfBuilt"	INTEGER,
	"guest_id"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Building_Muncipality" (
	"municipalityId"	INTEGER,
	"buildingId"	INTEGER,
	FOREIGN KEY("municipalityId") REFERENCES "Building"("id"),
	FOREIGN KEY("buildingId") REFERENCES "Municipality"("id"),
	PRIMARY KEY("municipalityId","buildingId")
);
INSERT INTO "Municipality" ("id","name","numberBuildings") VALUES (1,'Novo Sarajevo','100');
INSERT INTO "Municipality" ("id","name","numberBuildings") VALUES (2,'Ilidza','50');
INSERT INTO "User" ("id","first_name","last_name","phone_number","email","adress","username","password","type") VALUES (1,'Asim','Haskic','123456789','ahaskic1@gmail.com','Sarajevo 1','ahaskic1','ahaskic1',1);
INSERT INTO "User" ("id","first_name","last_name","phone_number","email","adress","username","password","type") VALUES (2,'Guest 1','Dr.S.R.24b','112233','guestDRSR24B@gmail.com','Sarajevo 2','guest1','guest1',3);
INSERT INTO "User" ("id","first_name","last_name","phone_number","email","adress","username","password","type") VALUES (3,'Guest 2','P.R.51.H','1122334455','guestPR51H@gmail.com','Sarajevo 3','guest2','guest2',3);
INSERT INTO "Building" ("id","adress","numberOfFlats","type","garage","numberOfElevators","numberOfFloors","yearOfBuilt","guest_id") VALUES (1,'Dr Silve Rizvanbegovic 24.b',100,1,20,2,10,2015,2);
INSERT INTO "Building" ("id","adress","numberOfFlats","type","garage","numberOfElevators","numberOfFloors","yearOfBuilt","guest_id") VALUES (2,'Porodice Ribara 51 Hrasno',50,2,0,1,7,1980,3);
INSERT INTO "Building_Muncipality" ("municipalityId","buildingId") VALUES (1,2);
INSERT INTO "Building_Muncipality" ("municipalityId","buildingId") VALUES (2,1);
COMMIT;
