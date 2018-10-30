create table team(
    teamID NUMBER(38),
    name varchar(255),
    city varchar(255),
    coach varchar(255),
  --  captain number(10),
  --  player number(10),
    primary key (teamID)
);

create table player(
    playerID NUMBER(38),
    name varchar(255),
    team NUMBER(38),
    position varchar(255),
    skill_level number(1),
    PRIMARY KEY (playerID),
    foreign key (team) REFERENCES team(teamID)
);

create table captain(
    cap_team number(38),
    cap_player number(38),
    foreign key (cap_team) REFERENCES team(teamID),
    foreign key (cap_player) REFERENCES player(playerID)
);

create table injury_record(
    recordID number(38),
    player number(38),
    record_desc varchar(255),
    primary key (recordID)
);

create table game(
    gameID number(38),
    game_date date,
    host_team number(38),
    guest_team number(38),
    host_score number(38),
    guest_score number(38),
    primary key (gameID),
    foreign key (host_team) REFERENCES team(teamID),
    foreign key (guest_team) REFERENCES team(teamID)
);   
    
insert into team values (01, 'a', 'nyc', 'ab');
insert into player values (12, 'ab', 01, 'quarterback', 1);
insert into captain values (01, 12);

select a.*, b.name from team a, player b, captain c where a.teamid = c.cap_team and b.playerid = c.cap_player;