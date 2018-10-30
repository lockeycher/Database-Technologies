--------------------------------------------------------
--  DDL for Table TRIPS
--------------------------------------------------------


--drop table bycar;
--drop table byplane;
--drop table bytrain;
--drop table trips

  CREATE TABLE TRIPS 
   (	"TID" INTEGER, 
	"TRIPSTATE" VARCHAR2(10 BYTE), 
	"TRAVELMODE" VARCHAR2(6 BYTE), 
	"FARE" FLOAT(12),
   Primary key(TID)
   ); 
   
   CREATE TABLE ByCar 
   (	TID INTEGER, 
	RentalCompany VARCHAR2(50 BYTE), 
	Mileage Number(4,2),
  Foreign Key (TID) REFERENCES TRIPS(TID)
   );
   
   CREATE TABLE ByTrain
   (	TID INTEGER,
	Type VARCHAR2(50 BYTE), 
  Coach VARCHAR2(30 BYTE),
  TrainSpeed VARCHAR2(10 BYTE),
	NumberofStops NUMBER(12,0),
  Foreign Key (TID) REFERENCES TRIPS(TID)
   );
   
    CREATE TABLE ByPlane
   (	TID INTEGER, 
	Airline VARCHAR2(40 BYTE), 
  Class VARCHAR2(30 BYTE),
  LayoverTime FLOAT(10),
  Foreign Key (TID) REFERENCES TRIPS(TID)
   ); 
   


INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (1,'IL','Car',100);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (2,'CA','Plane',1020);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (3,'MD','Plane',1300);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (4,'MD','Train',568);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (5,'Non-US','Plane',2300);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (6,'IL','Train',256);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (7,'Non-US','Plane',5000);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (8,'NM','Train',13);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (9,'IN','Car',400);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (10,'Non-US','Train',229);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (11,'Non-US','Plane',4500);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (12,'Non-US','Train',258);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (13,'IL','Plane',640);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (14,'Non-US','Train',138);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (15,'IL','Car',380);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (16,'IL','Car',59);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (17,'Non-US','Plane',3700);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (18,'IN','Car',88);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (19,'MD','Plane',600);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (20,'IL','Car',75);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (21,'IL','Car',156);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (22,'Non-US','Train',40);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (23,'IL','Plane',900);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (24,'MD','Train',650);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (25,'CA','Car',114);

INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (1,'Budget',19.75);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (9,'Enterprise',19.75);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (15,'Almo',22.5);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (16,'Personal',30);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (18,'Enterprise',22.5);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (20,'Personal',29);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (21,'Personal',27);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (25,'Enterprise',19.75);


INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (4,'Union Pacific Liner/Express','Chair car',50,4);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (6,'Amtrak/Express','Sleeper',30,3);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (8,'New Mexico Liner /Express','Chair car',50,2);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (10,'Japanese Nippon/SuperExpress','Chair car',70,5);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (12,'Indian Railways/Bullet','Chair car',25,18);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (14,'German Transit System/SuperFast','Sleeper',70,8);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (22,'Indian Railways/SuperFast','Sleeper',5,14);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (24,'Amtrak/Regular','Sleeper',20,2);

INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (2,'SouthWest','Premium',4);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (3,'American Airlines','Business',3);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (5,'Emirates','Economy',5);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (7,'Lufthansa','Economy',6);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (11,'Swiss Air','Economy',10);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (13,'SouthWest','Premium',2);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (17,'Korean Air','Economy',3);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (19,'American Airlines','Economy',1);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (23,'Alaska Airlines','Economy',2.5);
