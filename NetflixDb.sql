-- SQLite

DROP TABLE User;
DROP TABLE Subscription;
DROP TABLE Movies;
DROP TABLE Shows;
DROP TABLE viewHistory;
DROP TABLE Watchlist;
DROP TABLE Directors;
DROP TABLE Actors;
DROP TABLE MovieActors;
DROP TABLE ShowActors;
DROP TABLE Studios;

--Following Creates Tables
CREATE TABLE User (
    u_name CHAR(50) NOT NULL,
    u_username CHAR(50) PRIMARY KEY,
    u_age INTEGER,
    u_plan CHAR(50) NOT NULL
);

-- CREATE TABLE Subscription (
--     sub_plan CHAR(50) NOT NULL,
--     sub_price FLOAT,
--     sub_maxviewers INTEGER,
--     sub_resolution CHAR(50) NOT NULL,
--     sub_username CHAR(50) PRIMARY KEY
-- );

-- Don't think we need username for subscrption
CREATE TABLE Subscription (
    sub_plan CHAR(50) NOT NULL,
    sub_price FLOAT,
    sub_maxviewers INTEGER,
    sub_resolution CHAR(50) NOT NULL,
);

CREATE TABLE viewHistory (
    vh_username CHAR(50) PRIMARY KEY
    vh_movieid INTEGER,
    vh_showid INTEGER
);

CREATE TABLE Watchlist (
    w_username CHAR(50) PRIMARY KEY
    w_movieid INTEGER,
    w_showid INTEGER
);

CREATE TABLE Movies (
    m_title CHAR(50) NOT NULL,
    m_genre CHAR(50) NOT NULL,
    m_releaseDate DATE,
    m_studio CHAR(50) NOT NULL,
    --m_actor CHAR(50) NOT NULL, more than one actor will be needed
    m_director CHAR(50) NOT NULL,
    m_movieid INTEGER
);

CREATE TABLE MovieActors (
    ma_movieid INTEGER,
    ma_actorid INTEGER
);

CREATE TABLE ShowActors (
    sa_showid INTEGER,
    sa_actorid INTEGER
);

CREATE TABLE Shows (
    s_title CHAR(50) NOT NULL,
    s_genre CHAR(50) NOT NULL,
    s_releaseDate DATE,
    s_studio CHAR(50) NOT NULL,
    s_actor CHAR(50) NOT NULL,
    s_director CHAR(50) NOT NULL,
    s_showid INTEGER
);

CREATE TABLE Directors (
    d_director CHAR(50) NOT NULL,
    d_age INTEGER
);

CREATE TABLE Directors (
    d_directorname CHAR(50) NOT NULL,
    d_directorid INTEGER
);

CREATE TABLE Actors (
    a_actorname CHAR(50) NOT NULL,
    a_actorid INTEGER
);

CREATE TABLE Studios (
    s_studio CHAR(50) NOT NULL,
    s_address CHAR(50) NOT NULL
);

--Following Will Populate Tables
--INSERT INTO User VALUES('Name', 'Username', Age, 'Plan');
INSERT INTO User VALUES('Omar', 'Kidy101', 24, 'Premium');
INSERT INTO User VALUES('David', 'DYang', 24, 'Premium');
INSERT INTO User VALUES('Jose', 'pumagod', 23, 'Standard');
INSERT INTO User VALUES('Taylor', 'Hetrotan', 23, 'Standard');
INSERT INTO User VALUES('Omar', 'ohhmar', 23, 'Premium');
INSERT INTO User VALUES('Erick', 'Rocketbummy', 22, 'Premium');
INSERT INTO User VALUES('Damian', 'savagecat', 23, 'Basic');
INSERT INTO User VALUES('Margret', 'marg711', 66, 'Basic');
INSERT INTO User VALUES('Samantha', 'Sammy7', 33, 'Premium');
INSERT INTO User VALUES('Esmerelda', 'Esme101', 24, 'Premium');

INSERT INTO Subscription VALUES('Basic With Ads', 6.99, 1, 'HD');
INSERT INTO Subscription VALUES('Basic', 9.99, 1, 'HD');
INSERT INTO Subscription VALUES('Standard', 15.49, 2, 'Full HD');
INSERT INTO Subscription VALUES('Premium', 19.99, 4, 'Ultra HD');

--INSERT INTO Movies VALUES('Title', 'Genre', ReleaseDate, Studio, director, movieid)
INSERT INTO Movies VALUES('Forrest Gump', 'Drama/Romance', '1996-07-06', 'Paramount', 'Robert Zemeckis', 1);
INSERT INTO Movies VALUES('Shrek 2', 'Comedy/Fantasy', '2004-05-19', 'Dreamworks', 'Andrew Adamson', 2);
INSERT INTO Movies VALUES('Toy Story', 'Comedy/Family', '1995-11-19', 'Pixar', 'John Lasseter', 3);


--INSERT INTO Actors VALUES(AcrorName, Actorid)
INSERT INTO Actors VALUES('Tom Hanks', 1);--Forset Gump
INSERT INTO Actors VALUES('Robert Wright', 2);
INSERT INTO Actors VALUES('Gary Sinise', 3);
INSERT INTO Actors VALUES('Mykelti Williamson', 4);
INSERT INTO Actors VALUES('Sally Field', 5);
INSERT INTO Actors VALUES('Mike Myers', 6);--Shrek 2
INSERT INTO Actors VALUES('Eddie Murphy', 7);
INSERT INTO Actors VALUES('Cameron Diaz', 8);
INSERT INTO Actors VALUES('Julie Andrews', 9);
INSERT INTO Actors VALUES('Antonio Banderas', 10);
INSERT INTO Actors VALUES('John Cleese', 11);
INSERT INTO Actors VALUES('Rupert Everett', 12);
INSERT INTO Actors VALUES('Jennifer Saunders', 13);
--INSERT INTO Actors VALUES('Tom Hanks', 1);--Toy Story
INSERT INTO Actors VALUES('Tim Allen', 14);
INSERT INTO Actors VALUES('Don Rickles', 15);
INSERT INTO Actors VALUES('Jim Varney', 16);
INSERT INTO Actors VALUES('Wallace Shawn', 17);
INSERT INTO Actors VALUES('John Ratzenberger', 18);
INSERT INTO Actors VALUES('Annie Potts', 19);
INSERT INTO Actors VALUES('John Morris', 20);
INSERT INTO Actors VALUES('Erik von Detten', 21);


--INSERT INTO MovieActors VALUES(movieid, actorName, actorid)
INSERT INTO MovieActors VALUES(1, 1);--Forrest Gump
INSERT INTO MovieActors VALUES(1, 2);
INSERT INTO MovieActors VALUES(1, 3);
INSERT INTO MovieActors VALUES(1, 4);
INSERT INTO MovieActors VALUES(1, 5);
INSERT INTO MovieActors VALUES(2, 6);--Shrek 2
INSERT INTO MovieActors VALUES(2, 7);
INSERT INTO MovieActors VALUES(2, 8);
INSERT INTO MovieActors VALUES(2, 9);
INSERT INTO MovieActors VALUES(2, 10);
INSERT INTO MovieActors VALUES(2, 11);
INSERT INTO MovieActors VALUES(2, 12);
INSERT INTO MovieActors VALUES(2, 13);
INSERT INTO MovieActors VALUES(3, 1);--Toy Story
INSERT INTO MovieActors VALUES(3, 14);
INSERT INTO MovieActors VALUES(3, 15);
INSERT INTO MovieActors VALUES(3, 16);
INSERT INTO MovieActors VALUES(3, 17);
INSERT INTO MovieActors VALUES(3, 18);
INSERT INTO MovieActors VALUES(3, 19);
INSERT INTO MovieActors VALUES(3, 20);
INSERT INTO MovieActors VALUES(3, 21);



--SQL Statements

--What Movies are comedies
Select m_title
From Movies
Where m_genre LIKE '%Comedy%';

--What Actors are in Shrek 2
Select a_actorname
FROM Actors, MovieActors, Movies
WHERE a_actorid = ma_actorid
AND m_movieid = ma_movieid
AND m_movieid = 2;