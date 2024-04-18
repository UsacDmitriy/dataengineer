create table d_specialisation
(
    id             serial,
    specialisation varchar(100),
    unique (specialisation),
    primary key (id)
);

create table d_doctors
(
    id                serial,
    name              varchar(50),
    family_name       varchar(4000),
    id_specialisation int,
    begin_date        date default now(),
    end_date          date default '2050-01-01'::date::timestamp,
    sex               bool,
    work_begin_date   date,
    primary key (id, begin_date)
);

create table d_patient
(
    id              serial,
    name            varchar(50),
    family_name     varchar(4000),
    passport_number varchar(50),
    sex             bool,
    birth_day       date,
    SNILS           varchar(50),
    begin_date      date default now(),
    end_date        date default '2050-01-01'::date::timestamp,
    primary key (id, begin_date)
);

create table f_appointment
(
    id                 serial,
    create_date        date,
    id_doctor          int not null references d_doctors (id),
    id_patient         int not null references d_patient (id),
    diagnoz            varchar(4000),
    naznachenie        varchar(4000),
    cabinet_number     varchar(10),
    priem_time_minutes int default 15,
    primary key (id)
);