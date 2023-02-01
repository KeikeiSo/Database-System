-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

INSERT INTO hcinstitution (hemail, name, addr, phone, website) VALUES
('rbourgaize0@dyndns.org', 'Photofeed', '7667 Truax Road', '876-272-8862', 'https://wordpress.org')
,('msaywood1@howstuffworks.com', 'Quamba', '2 Upham Parkway', '128-355-3236', 'http://cmu.edu/porttitor')
,('zkimbley2@examiner.com', 'Eazzy', '28215 Derek Center', '473-143-2886', 'https://xrea.com')
,('bspilsburie3@dedecms.com', 'Edgepulse', '916 Hanson Alley', '272-853-1215', '')
,('dlamasna4@columbia.edu', 'Shufflester', '46365 Fisk Junction', '592-814-4367', '')
,('epigott5@indiatimes.com', 'Lac-Saint-Louis', '18 Ludington Center', '515-312-8309', 'http://indiatimes.com')
,('nbragger6@mediafire.com', 'Birth House Jeanne Mance', '55 Bonner Crossing', '562-148-4436', 'http://indiegogo.com')
,('echarteris7@mtv.com', 'Shufflebeat', '1221 Barby Crossing', '633-801-4665', 'http://chronoengine.com')
,('omitchall8@feedburner.com', 'Snaptags', '147 Havey Court', '691-993-2075', '')
,('rrevie9@telegraph.co.uk', 'Eimbee', '639 Brickson Park Court', '737-978-3507', '')
,('sbabonau0@engadget.com', 'Trudoo', '652 Annamark Junction', '704-750-8204', '')
,('edanbrook5@about.com', 'Wordpedia', '79508 Victoria Street', '561-183-3975', '')
,('jlesek6@addthis.com', 'Reallinks', '916 Veith Place', '513-147-0460', '')
,('abrenard7@cisco.com', 'Brainverse', '9 Dixon Alley', '597-554-4909', '')
,('wramsby8@ed.gov', 'Wikivu', '40 Vermont Plaza', '529-855-3723', '')
,('jlaing9@angelfire.com', 'Jabberbean', '39 Karstens Alley', '130-278-4058', '')
;

INSERT INTO commclinic(hemail) VALUES
('jlesek6@addthis.com')
,('abrenard7@cisco.com')
,('wramsby8@ed.gov')
,('jlaing9@angelfire.com')
,('rbourgaize0@dyndns.org')
,('msaywood1@howstuffworks.com')
;

INSERT INTO birthcenter(hemail) VALUES
('zkimbley2@examiner.com')
,('bspilsburie3@dedecms.com')
,('dlamasna4@columbia.edu')
,('epigott5@indiatimes.com')
,('nbragger6@mediafire.com')
,('echarteris7@mtv.com')
,('omitchall8@feedburner.com')
,('rrevie9@telegraph.co.uk')
,('sbabonau0@engadget.com')
,('edanbrook5@about.com')
;

INSERT INTO midwife (pracid, name, email, phone, hemail) VALUES
(3001, 'Lanna Bolle', 'lbolle0@bing.com', '262-301-8632', 'epigott5@indiatimes.com')
,(3002, 'Keely Beaten', 'kbeaten1@miitbeian.gov.cn', '458-605-4170', 'rbourgaize0@dyndns.org')
,(3003, 'Rosabel Adhams', 'radhams2@hud.gov', '913-179-1347', 'msaywood1@howstuffworks.com')
,(3004, 'Anne Cleal', 'acleal3@springer.com', '836-291-1150', 'zkimbley2@examiner.com')
,(3005, 'Francesco Perton', 'fperton4@nature.com', '197-848-9078', 'bspilsburie3@dedecms.com')
,(3006, 'Gwynne Clewes', 'gclewes5@behance.net', '257-476-8204', 'dlamasna4@columbia.edu')
,(3007, 'Brendis Rentoul', 'brentoul6@topsy.com', '645-403-2147', 'epigott5@indiatimes.com')
,(3008, 'Marion Girard', 'marionG@gmail.com', '410-205-2576', 'nbragger6@mediafire.com')
,(3009, 'Arlie McRobbie', 'amcrobbie8@devhub.com', '858-142-2931', 'echarteris7@mtv.com')
,(3010, 'Glynis Kigelman', 'gkigelman9@bbb.org', '566-247-8218', 'omitchall8@feedburner.com')
,(3011, 'Reinald Cundey', 'rcundeya@weibo.com', '447-472-3267', 'rrevie9@telegraph.co.uk')
,(3012, 'Delaney Manterfield', 'dmanterfieldb@sakura.ne.jp', '913-766-4808', 'edanbrook5@about.com')
,(3013, 'Neel Sanchez', 'nsanchezc@youtube.com', '329-140-6651', 'epigott5@indiatimes.com')
,(3014, 'Avram Fermer', 'afermerd@spiegel.de', '158-798-9856', 'sbabonau0@engadget.com')
,(3015, 'Sloane Greatham', 'sgreathame@sourceforge.net', '901-667-0163', 'jlesek6@addthis.com')
,(3016, 'Margalo Thraves', 'mthravesf@so-net.ne.jp', '712-101-7144', 'epigott5@indiatimes.com')
,(3017, 'Abigale Broy', 'abroyg@accuweather.com', '692-817-1409', 'abrenard7@cisco.com')
,(3018, 'Darius Caffin', 'dcaffinh@yellowbook.com', '408-819-6029', 'wramsby8@ed.gov')
,(3019, 'Clarabelle Longmire', 'clongmirei@cdc.gov', '579-806-4931', 'jlaing9@angelfire.com')
,(3020, 'Pietra Stampe', 'pstampej@house.gov', '923-634-0016', 'nbragger6@mediafire.com')
;

INSERT INTO mother (hcardid, email, name, addr, phone, profession, dateofbirth) VALUES
(1001, 'rsture0@jiathis.com', 'Renard Sture', '9 Schlimgen Circle', '569-739-8535', 'Assistant Media Planner', '2000-09-27')
,(1002, 'rlongland1@biblegateway.com', 'Robenia Longland', '2 Muir Parkway', '964-539-7022', 'Research Nurse', '2002-03-29')
,(1003, 'gglacken2@wix.com', 'Gerick Glacken', '2 Sauthoff Parkway', '414-849-3478', 'Occupational Therapist', '1994-12-28')
,(1004, 'cbundy3@smugmug.com', 'Clarie Bundy', '75 Spaight Place', '188-666-7028', 'Staff Accountant IV', '1994-02-12')
,(1005, 'jpioli4@princeton.edu', 'Jo-anne Pioli', '03619 Sunbrook Center', '187-734-6706', 'Senior Quality Engineer', '1987-03-24')
,(1006, 'aconti5@studiopress.com', 'Arther Conti', '63 Erie Avenue', '730-174-2732', 'Senior Sales Associate', '1992-05-04')
,(1007, 'gfairhall6@samsung.com', 'Victoria Gutierrez', '262 Elgar Place', '426-426-2599', 'Project Manager', '1997-09-12')
,(1008, 'aalbarez7@skype.com', 'Archibaldo Albarez', '513 Express Center', '415-436-6906', 'Quality Engineer', '1985-03-13')
,(1009, 'hchiddy8@unesco.org', 'Harrie Chiddy', '205 Moland Center', '647-119-3410', 'VP Product Management', '1987-11-30')
,(1010, 'slafranconi9@japanpost.jp', 'Scottie Lafranconi', '3163 Roth Place', '925-932-1666', 'Data Coordiator', '1999-09-09')
;

INSERT INTO father (fatherid, name, phone, profession, dateofbirth) VALUES
(4001, 'Even Thormann', '459-809-9385', 'Programmer Analyst IV', '1985-10-11')
,(4002, 'Shelia Nuton', '471-758-3325', 'Financial Advisor', '1993-04-07')
,(4003, 'Desdemona Callendar', '624-457-9098', 'Electrical Engineer', '2001-11-16')
,(4004, ',osetta Poulston', '958-351-5250', 'Senior Sales Associate', '1996-11-11')
,(4005, 'Brandy Wadelin', '828-779-9385', 'Help Desk Technician', '1990-09-02')
;

INSERT INTO couple(coupleid, hcardid) VALUES
(1, 1001)
,(2, 1002)
,(3, 1003)
,(4, 1004)
,(5, 1005)
;
INSERT INTO couple(coupleid, hcardid, fatherid) VALUES
(6, 1006, 4003)
,(7, 1007, 4004)
,(8, 1008, 4002)
,(9, 1009, 4005)
,(10, 1010,4001)
;

INSERT INTO pregnancy (coupleid, pregnum, expbirthtf, estdued, ppracid, bpracid) VALUES
(2, 1, '2022-04-12', '2022-04-10', 3007, 3009)
,(5, 1, '2022-03-23', '2022-04-01', 3005, 3013)
;
INSERT INTO pregnancy (coupleid, pregnum, expbirthtf, estdued, ppracid) VALUES
(3, 2, '2022-06-18', '2022-07-01', 3008)
,(4, 2, '2022-06-28', '2022-07-02', 3003)
,(7, 2, '2022-07-12', '2022-07-12', 3010)
;
INSERT INTO pregnancy (coupleid, pregnum, expbirthtf, ppracid) VALUES
(8, 2, '2022-07-14', 3008);
INSERT INTO pregnancy (coupleid, pregnum, expbirthtf) VALUES
(1, 2, '2022-10-30')
,(6, 2, '2022-11-01')
,(9, 2, '2022-11-28')
,(10, 2, '2022-12-23')
;
INSERT INTO pregnancy (coupleid, pregnum, expbirthtf, lmpdued, usounddued, estdued, hemail, ppracid, bpracid) VALUES
(1, 1, '2019-11-06', '2019-04-01', '2020-01-31', '2019-05-01', 'zkimbley2@examiner.com', 3001, 3010)
,(3, 1, '2019-09-10', '2019-06-06', '2019-04-13', '2019-03-23', 'epigott5@indiatimes.com', 3017, 3007)
,(4, 1, '2020-01-24', '2019-12-03', '2019-09-16', '2020-02-02', 'nbragger6@mediafire.com', 3006, 3005)
,(6, 1, '2019-05-05', '2019-07-21', '2019-10-16', '2019-04-01', 'edanbrook5@about.com', 3005, 3006)
,(7, 1, '2019-08-23', '2019-09-11', '2019-10-03', '2019-07-05', 'sbabonau0@engadget.com', 3011, 3003)
,(8, 1, '2019-06-07', '2019-10-25', '2019-12-22', '2019-03-08', 'omitchall8@feedburner.com', 3019, 3011)
,(9, 1, '2019-05-09', '2019-08-17', '2019-12-14', '2019-12-21', 'bspilsburie3@dedecms.com', 3007, 3007)
,(10, 1, '2019-05-06', '2019-05-15', '2019-09-20', '2019-08-31', 'omitchall8@feedburner.com', 3006, 3010)
;

INSERT INTO baby (babyid, gender, dateofbirth, name, coupleid, pregnum) VALUES
(1, 'F', '2019-03-07', 'Angel', 3, 1)
,(2, 'F', '2020-01-24', 'Beatrice', 9, 1)
,(3, 'F', '2019-06-12', 'Arlen', 10, 1)
,(4, 'M', '2019-12-29', 'Ulick', 6, 1)
,(5, 'F', '2019-08-07', 'Irina', 1, 1)
,(6, 'M', '2019-08-15', 'Aylmer', 7, 1)
,(7, 'F', '2019-08-07', 'Ashley', 8, 1)
,(8, 'F', '2019-12-16', 'Sadie', 2, 1)
,(9, 'M', '2019-05-17', 'Roscoe', 6, 1)
,(10, 'F', '2019-04-23', 'Mariann', 5, 1)
,(11, 'F', '2019-03-02', 'Cassandry', 1, 1)
,(12, 'M', '2019-07-29', 'Dani', 4, 1)
;
INSERT INTO baby (babyid, gender, name, coupleid, pregnum) VALUES
(13, 'F', 'Babita', 1, 2)
,(14, 'F', 'Rona', 3, 2)
,(15, 'M', 'Hersch', 4, 2);
INSERT INTO baby (babyid, gender, coupleid, pregnum) VALUES
(16, 'M', 7, 2)
,(18, 'F', 8, 2);
INSERT INTO baby (babyid, coupleid, pregnum) VALUES
(17, 6, 2)
,(19, 9, 2)
,(20, 10, 2);

INSERT INTO infosession (sessionid, date, time, language, pracid) VALUES
(1, '2022-03-24', '13:00:00', 'English', 3001)
,(2, '2022-03-01', '12:30:00', 'English', 3007)
,(3, '2022-03-14', '14:30:00', 'French', 3014)
,(4, '2022-03-13', '9:45:00', 'French', 3013)
,(5, '2022-02-23', '10:05:00', 'French', 3001)
;

INSERT INTO appointment (appmid, date, time, pracid, coupleid, pregnum) VALUES
(1, '2022-03-02', '14:30:00', 3008, 3, 2)
,(2, '2022-03-23', '9:05:00', 3008, 3, 2)
,(3, '2022-02-27', '9:15:00', 3008, 8, 2)
,(4, '2022-03-14', '10:15:00', 3008, 8, 2)
,(5, '2022-03-14', '18:58:00', 3003, 4, 2)
,(6, '2022-03-09', '10:10:00', 3007, 2, 1)
,(7, '2022-03-13', '11:55:00', 3005, 5, 1)
,(8, '2022-03-01', '16:12:00', 3007, 2, 1)
,(9, '2022-03-06', '13:25:00', 3010, 7, 2)
,(10, '2022-03-01', '12:59:00', 3005, 5, 1)
;

-- for project3 query

INSERT INTO appointment (appmid, date, time, pracid, coupleid, pregnum) VALUES
(11, '2022-03-03', '14:30:00', 3006, 4, 1)
,(12, '2022-03-03', '11:20:00', 3006, 6, 1)
,(13, '2022-03-03', '9:15:00', 3006, 10, 1)
;

INSERT INTO appointment (appmid, date, time, pracid, coupleid, pregnum) VALUES
(14, '2022-03-03', '13:30:00', 3008, 3, 2)
,(15, '2022-03-03', '10:20:00', 3008, 8, 2)
;

INSERT INTO pregnancy (coupleid, pregnum, expbirthtf, estdued, ppracid, bpracid) VALUES
(2, 2, '2022-04-12', '2022-04-10', 3007, 3008)
,(5, 2, '2022-03-23', '2022-04-01', 3005, 3008)
;

INSERT INTO appointment (appmid, date, time, pracid, coupleid, pregnum) VALUES
    (16, '2022-03-02', '14:30:00', 3008, 2, 2)
    ,(17, '2022-03-02', '16:10:00', 3008, 5, 2);

INSERT INTO baby (babyid, gender, dateofbirth, name, coupleid, pregnum) VALUES
(21, 'F', '2021-03-07', 'aaerg', 3, 2)
,(22, 'F', '2021-03-24', 'aregf', 9, 2)
,(23, 'F', '2021-12-12', 'ergtre', 10, 2)
,(24, 'M', '2021-12-29', 'gtrhytr', 6, 2)
,(25, 'F', '2021-08-07', 'Irrthina', 1, 2)
,(26, 'M', '2021-08-15', 'rth', 7, 2)
,(27, 'F', '2021-08-07', 'rtshr', 8, 2)
,(28, 'F', '2021-12-16', 'sth', 2, 2)
,(29, 'M', '2021-08-17', 'opmpmp', 6, 2)
,(30, 'F', '2021-12-23', 'njiuuo', 5, 2)
,(31, 'F', '2021-03-02', 'jpiojpo', 1, 2)
,(32, 'M', '2021-08-29', 'oinpi', 4, 2)
;

INSERT INTO notes (noteid, timestamp, content, appmid) VALUES
(1, '2022-03-05 07:54:13', 'erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam', 7)
,(2, '2022-03-04 08:06:04', 'duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget', 9)
,(3, '2022-03-02 20:16:53', 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat', 5)
,(4, '2022-03-14 04:06:21', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 1)
,(5, '2022-03-24 10:47:48', 'lectus pellentesque at nulla suspendisse potenti cras in purus eu', 6)
,(6, '2022-03-16 04:44:32', 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 5)
,(7, '2022-03-19 13:40:33', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis', 3)
,(8, '2022-03-17 23:36:56', 'proin leo odio porttitor id consequat in consequat ut nulla', 7)
,(9, '2022-03-23 17:04:58', 'molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', 4)
,(10, '2022-03-14 04:17:25', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus', 2)
,(11, '2022-03-06 00:19:29', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 10)
,(12, '2022-03-07 16:07:45', 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget', 3)
,(13, '2022-03-04 13:14:01', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', 3)
,(14, '2022-03-23 08:51:22', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 8)
,(15, '2022-03-24 11:01:08', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', 8)
;

INSERT INTO technician (id, name, phone) VALUES
(1, 'Antoni Flinders', '863-130-4194')
,(2, 'Theodora Maybury', '252-989-4555')
,(3, 'Antonius Benham', '785-267-9855')
,(4, 'Almeria Amyes', '367-697-4756')
,(5, 'Martita Catanheira', '776-370-1149')
;

INSERT INTO tests (testid, type, result, sampledate, pracid, prescdate, coupleid, pregnum, id, labdate, lab) VALUES
(1, 'blood iron', 'Fx unsp phalanx of l little finger, subs for fx w nonunion', '2022-02-20', 3008, '2022-02-01', 10, 2, 1, '2022-02-24', 'Omba')
,(2, 'blood iron', 'Unspecified juvenile rheumatoid arthritis, unspecified hand', '2022-02-20', 3004, '2022-02-09', 6, 2, 2, '2022-02-21', 'Katz')
,(3, 'ultrasound', 'Burns of oth parts of left eye and adnexa, init encntr', '2022-02-20', 3008, '2022-02-02', 1, 2, 3, '2022-02-21', 'Tagchat')
,(5, 'ultrasound', 'Traumatic compartment syndrome of unsp lower extremity', '2022-02-20', 3007, '2022-02-02', 5, 1, 4, '2022-02-23', 'Plambee')
,(7, 'blood iron', 'Fall on same level due to ice and snow, sequela', '2022-02-21', 3010, '2022-01-25', 2, 1, 5, '2022-02-24', 'Realcube')
,(9, 'AFP', 'Disp fx of distal phalanx of oth finger, init for clos fx', '2022-02-21', 3006, '2022-01-29', 3, 2, 1, '2022-02-21', 'Meedoo')
,(6, 'AFP', 'Other spondylosis, occipito-atlanto-axial region', '2022-02-20', 3010, '2022-02-04', 7, 2, 2, '2022-02-24', 'Tazz')
,(4, 'blood iron', 'Pneumonitis due to inhalation of other solids and liquids', '2022-02-21', 3010, '2022-02-12', 7, 2, 3, '2022-02-24', 'Realcube')
,(8, 'blood iron', 'Unsp injury of femor vein at hip and thi lev, unsp leg, init', '2022-02-21', 3010, '2022-02-09', 7, 2, 4, '2022-02-24', 'Topdrive')
,(10, 'blood iron', 'Unsp injury of musc/fasc/tend prt biceps, left arm, sequela', '2022-02-21', 3010, '2022-01-31', 7, 2, 5, '2022-02-24', 'Topicstorm')
;

INSERT INTO invitation (hemail, sessionid, coupleid, registered, attended, interested) VALUES
('zkimbley2@examiner.com', 5, 7, false, true, true)
,('bspilsburie3@dedecms.com', 4, 1, false, false, false)
,('dlamasna4@columbia.edu', 3, 1, true, true, true)
,('epigott5@indiatimes.com', 2, 6, false, false, true)
,('nbragger6@mediafire.com', 2, 5, false, true, false)
;
