-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

CREATE TABLE hcinstitution
(
    hemail  VARCHAR(75) NOT NULL
    ,name  VARCHAR(50) NOT NULL
    ,addr VARCHAR(200) NOT NULL
    ,phone VARCHAR(15) NOT NULL
    ,website VARCHAR(150)
    ,PRIMARY KEY (hemail)
);

CREATE TABLE commclinic
(
    hemail  VARCHAR(75) NOT NULL PRIMARY KEY
    ,FOREIGN KEY (hemail) REFERENCES hcinstitution(hemail)
);

CREATE TABLE birthcenter
(
    hemail  VARCHAR(75) NOT NULL PRIMARY KEY
    ,FOREIGN KEY (hemail) REFERENCES hcinstitution(hemail)
);

CREATE TABLE midwife
(
    pracid INTEGER NOT NULL
    ,email  VARCHAR(75) NOT NULL UNIQUE
    ,name  VARCHAR(50) NOT NULL
    ,phone VARCHAR(15) NOT NULL
    ,hemail  VARCHAR(75) NOT NULL
    ,FOREIGN KEY (hemail) REFERENCES hcinstitution(hemail)
    ,PRIMARY KEY (pracid)
);

CREATE TABLE mother
(
    hcardid INTEGER NOT NULL
    ,email  VARCHAR(75) NOT NULL UNIQUE
    ,name  VARCHAR(50) NOT NULL
    ,addr VARCHAR(200) NOT NULL
    ,phone VARCHAR(15) NOT NULL
    ,profession VARCHAR(100) NOT NULL
    ,bloodtype CHAR(3)
    ,dateofbirth DATE NOT NULL
    ,PRIMARY KEY (hcardid)
);

CREATE TABLE father
(
    fatherid INTEGER NOT NULL
    ,email  VARCHAR(75)
    ,name  VARCHAR(50) NOT NULL
    ,addr VARCHAR(200)
    ,phone VARCHAR(15) NOT NULL
    ,profession VARCHAR(100) NOT NULL
    ,bloodtype CHAR(3)
    ,dateofbirth DATE NOT NULL
    ,hcardid INTEGER
    ,PRIMARY KEY (fatherid)
);

CREATE TABLE couple
(
    coupleid INTEGER NOT NULL
    ,hcardid INTEGER NOT NULL
    ,fatherid INTEGER
    ,FOREIGN KEY(hcardid) REFERENCES mother(hcardid)
    ,FOREIGN KEY(fatherid) REFERENCES father(fatherid)
    ,PRIMARY KEY (coupleid)
);

CREATE TABLE pregnancy
(
    coupleid INTEGER NOT NULL
    ,pregnum INTEGER NOT NULL CHECK (pregnum > 0)
    ,expbirthtf DATE NOT NULL
    ,lmpdued DATE
    ,usounddued DATE
    ,estdued DATE
    ,hemail  VARCHAR(75)
    ,ppracid INTEGER
    ,bpracid INTEGER
    ,FOREIGN KEY (coupleid) REFERENCES couple(coupleid)
    ,FOREIGN KEY (hemail) REFERENCES hcinstitution(hemail)
    ,FOREIGN KEY (ppracid) REFERENCES midwife(pracid)
    ,FOREIGN KEY (bpracid) REFERENCES midwife(pracid)
    ,PRIMARY KEY (coupleid, pregnum)
);

CREATE TABLE baby
(
    babyid INTEGER NOT NULL
    ,name  VARCHAR(50)
    ,dateofbirth DATE
    ,gender CHAR(1) CHECK (gender IN ('M', 'F', 'O'))
    ,bloodtype CHAR(3)
    ,coupleid INTEGER NOT NULL
    ,pregnum INTEGER NOT NULL
    ,FOREIGN KEY (coupleid, pregnum) REFERENCES pregnancy(coupleid, pregnum)
    ,PRIMARY KEY (babyid)
);

CREATE TABLE infosession
(
    sessionid INTEGER NOT NULL
    ,date DATE NOT NULL
    ,time TIME NOT NULL
    ,language VARCHAR(20) NOT NULL
    ,pracid INTEGER NOT NULL
    ,FOREIGN KEY (pracid) REFERENCES midwife(pracid)
    ,PRIMARY KEY (sessionid)
);

CREATE TABLE appointment
(
    appmid INTEGER NOT NULL
    ,date DATE NOT NULL
    ,time TIME NOT NULL
    ,pracid INTEGER NOT NULL
    ,coupleid INTEGER NOT NULL
    ,pregnum INTEGER NOT NULL
    ,FOREIGN KEY (pracid) REFERENCES midwife(pracid)
    ,FOREIGN KEY (coupleid, pregnum) REFERENCES pregnancy(coupleid, pregnum)
    ,PRIMARY KEY (appmid)
);

CREATE TABLE notes
(
    noteid INTEGER NOT NULL
    ,timestamp TIMESTAMP NOT NULL
    ,content VARCHAR(200)
    ,appmid INTEGER NOT NULL
    ,FOREIGN KEY (appmid) REFERENCES appointment(appmid)
    ,PRIMARY KEY (noteid)
);

CREATE TABLE technician
(
    id INTEGER NOT NULL
    ,name  VARCHAR(50) NOT NULL
    ,phone VARCHAR(15) NOT NULL
    ,PRIMARY KEY (id)
);

CREATE TABLE tests
(
    testid INTEGER NOT NULL
    ,type VARCHAR(50) NOT NULL
    ,result VARCHAR(200)
    ,sampledate DATE
    ,pracid INTEGER NOT NULL
    ,prescdate DATE NOT NULL
    ,coupleid INTEGER NOT NULL
    ,pregnum INTEGER NOT NULL
    ,babyid INTEGER
    ,id INTEGER
    ,labdate DATE
    ,lab VARCHAR(50)
    ,FOREIGN KEY (pracid) REFERENCES midwife(pracid)
    ,FOREIGN KEY (coupleid, pregnum) REFERENCES pregnancy(coupleid, pregnum)
    ,FOREIGN KEY (babyid) REFERENCES baby(babyid)
    ,FOREIGN KEY (id) REFERENCES technician(id)
    ,PRIMARY KEY (testid)
);

CREATE TABLE invitation
(
    hemail  VARCHAR(75) NOT NULL
    ,sessionid INTEGER NOT NULL
    ,coupleid INTEGER NOT NULL
    ,registered BOOLEAN
    ,attended BOOLEAN
    ,interested BOOLEAN
    ,FOREIGN KEY (hemail) REFERENCES hcinstitution(hemail)
    ,FOREIGN KEY (sessionid) REFERENCES infosession(sessionid)
    ,FOREIGN KEY (coupleid) REFERENCES couple(coupleid)
    ,PRIMARY KEY (hemail, sessionid, coupleid)
);
