CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE lab6georgenp;

CREATE TABLE RoseEmployees
(
	fname:STRING,
	lname:STRING,
	speciality:STRING,
	dept:STRING,
	employeeNumber:INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/allEmployees.txt' overwrite INTO table RoseEmployees;
--LOAD DATA INPATH '{hiveconf:allEmployeesLocation}' overwrite INTO table RoseEmployees;

CREATE TABLE RoseStaticEmployees
(
	fname:STRING,
	lname:STRING,
	speciality:STRING,
	employeeNumber:INT
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/csseEmployees.txt' INTO Table RoseStaticEmployees Partition(dept = 'csse');
LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/eceEmployees.txt' INTO Table RoseStaticEmployees Partition(dept = 'ece');
LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/adminEmployees.txt' INTO Table RoseStaticEmployees Partition(dept = 'admin');
--LOAD DATA INPATH '{hiveconf:csseEmployeesLocation}' INTO Table RoseStaticEmployees Partition(dept = 'csse');

CREATE TABLE RoseDynamicEmployees
(
	fname:STRING,
	lname:STRING,
	speciality:STRING,
	employeeNumber:INT
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

Set hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE RoseDynamicEmployees Partition(dept) SELECT fname,lname,speciality,employeeNumber FROM RoseStaticEmployees;

Set hive.exec.dynamic.partition.mode=strict;

CREATE TABLE RoseStaticEmployeesORC
(
	fname:STRING,
	lname:STRING,
	speciality:STRING,
	employeeNumber:INT
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

INSERT INTO TABLE RoseStaticEmployeesORC Partition(dept='csse') SELECT fname,lname,speciality,employeeNumber WHERE dept='csse';
INSERT INTO TABLE RoseStaticEmployeesORC Partition(dept='ece') SELECT fname,lname,speciality,employeeNumber WHERE dept='ece';
INSERT INTO TABLE RoseStaticEmployeesORC Partition(dept='admin') SELECT fname,lname,speciality,employeeNumber WHERE dept='admin';

SHOW Partitions RoseStaticEmployees;
SELECT * FROM RoseStaticEmployees;

SHOW Partitions RoseDynamicEmployees;
SELECT * FROM RoseDynamicEmployees;

SHOW Partitions RoseStaticEmployeesORC;
SELECT * FROM RoseStaticEmployeesORC;