CREATE TABLE mapping
(
    id        BIGSERIAL PRIMARY KEY,
    place     varchar(64),
    type      varchar(64),
    comment   varchar(256),
    exgauster integer,
    active    integer
);

CREATE TABLE exgauster_moment
(
    id         BIGSERIAL PRIMARY KEY,
    key        varchar(64),
    mapping_id bigint references mapping (id),
    value      numeric,
    exgauster  integer,
    moment     timestamp
);

CREATE TABLE statistic_value
(
    id         BIGSERIAL PRIMARY KEY,
    mapping_id bigint references mapping (id),
    max_value  numeric default 0,
    min_value  numeric default 0,
    curr_value numeric default 0,
    max_delta_value numeric default 0,
    min_delta_value numeric default 0,
    all_summed_value varchar default '0.0',
    count_of_all bigint default 0,
    create_date date default now(),
    update_date date default now()
);

CREATE TABLE warning
(
    id         BIGSERIAL PRIMARY KEY,
    mapping_id bigint references mapping (id),
    reason  varchar,
    warning_type  varchar,
    create_date date default now(),
    update_date date default now()
);

INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:0]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:1]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:2]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:3]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:4]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:5]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:6]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:7]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:8]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:9]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:10]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:11]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:12]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:13]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:14]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:15]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:16]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:17]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:18]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:19]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:20]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:21]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:22]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:23]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:24]', 'analog', 'Температура перед эксгаустером №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:25]', 'analog', 'Температура перед эксгаустером №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:27]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:28]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:29]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера). Эксгаустер №3', 3,
        1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:30]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:31]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:32]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:33]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:34]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:35]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №3)', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:36]', 'analog', 'Температура воды до охладителя. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:37]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:38]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №3', 3, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:39]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №3', 3, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:40]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №3', 3, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:41]', 'analog', 'Температура масла до охладителя. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:42]', 'analog', 'Температура масла после охладителя. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:43]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:44]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:45]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:46]', 'analog', 'Температура нагрева статора №1. Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:47]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:48]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:49]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:50]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:51]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:52]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №4)', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:53]', 'analog', 'Температура воды до охладителя. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:54]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:55]', 'analog', 'Температура нагрева статора №1. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:56]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:57]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:58]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:59]', 'analog', 'Температура масла до охладителя. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:60]', 'analog', 'Температура масла после охладителя. Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:61]', 'analog', 'Разрежение перед эксгаустером №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:62]', 'analog', 'Разрежение перед эксгаустером №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:63]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:64]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:65]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:66]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:67]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:68]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:69]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:70]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:71]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:72]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:73]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:74]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:75]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:76]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:77]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:78]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:79]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:80]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:81]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:82]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:83]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:84]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:85]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:86]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:87]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:88]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:89]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:90]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:91]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:92]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:93]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:94]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:95]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:96]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:97]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:98]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:99]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:100]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:101]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:102]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:103]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:104]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:105]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:106]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:107]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:108]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:109]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:110]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:111]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:112]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:113]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:114]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:115]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:116]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:117]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:118]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:119]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:120]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:121]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:122]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:123]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:124]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:125]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:126]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:127]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:128]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:129]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:130]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:131]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:132]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:133]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:134]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:135]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:136]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:137]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:138]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:139]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:140]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:141]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:142]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:143]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:144]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:145]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:146]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:147]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:148]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:149]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:150]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:151]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:152]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:153]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:154]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:155]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:156]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:157]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:158]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:159]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:160]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:161]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:162]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:163]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:164]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:165]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:166]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:167]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:168]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:169]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:170]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:171]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:172]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:173]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:174]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:175]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:176]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:177]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:178]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:179]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:180]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:181]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:182]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:183]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:184]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:185]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:186]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:187]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:188]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:189]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:190]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:191]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:192]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:193]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:194]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:195]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:196]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:197]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:198]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:199]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:200]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:201]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:202]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:203]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:204]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:205]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:206]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:207]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:208]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:209]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:210]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:211]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:212]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:213]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:214]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:215]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:216]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:217]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:218]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:219]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:220]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:221]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:222]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:223]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:224]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:225]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:226]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:227]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:228]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:229]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0:230]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0.0]', 'digital', '46 Работа Эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[0.1]', 'digital', '62 Работа Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:0]', 'analog', 'Уровень масла в маслосистеме эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:1]', 'analog', 'Давление масла в маслосистеме эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:2]', 'analog', 'Ток ротора эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:3]', 'analog', 'Ток статора эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:4]', 'analog', 'Напряжение ротора эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:5]', 'analog', 'Напряжение статора эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:6]', 'analog', 'Положение задвижки газ Эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:7]', 'analog', 'Уровень масла в маслосистеме Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:8]', 'analog', 'Давление масла в маслосистеме Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:9]', 'analog', 'Ток ротора Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:10]', 'analog', 'Ток статора Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:11]', 'analog', 'Напряжение ротора Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:12]', 'analog', 'Напряжение статора Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1:13]', 'analog', 'Положение задвижки газ Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.0]', 'digital', 'Эксгаустер №3 в работе', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.1]', 'digital', 'ЗАКРЫТО задвижка газ Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.2]', 'digital', 'ОТКРЫТО задвижка газ Эксгаустер №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.3]', 'digital', 'Запущен пусковой маслонасос Эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.4]', 'digital', 'Запущен аварийный маслонасос Эксгаустера №3', 3, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.5]', 'digital', 'Эксгаустер №4 в работе', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.6]', 'digital', 'ЗАКРЫТО задвижка газ Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.7]', 'digital', 'ОТКРЫТО задвижка газ Эксгаустер №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.8]', 'digital', 'Запущен пусковой маслонасос Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[1.9]', 'digital', 'Запущен аварийный маслонасос Эксгаустера №4', 4, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:0]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:1]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:2]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:3]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:4]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:5]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:6]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:7]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:8]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:9]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:10]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:11]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:12]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:13]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:14]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:15]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:16]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:17]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:18]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:19]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:20]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:21]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:22]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:23]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:24]', 'analog', 'Температура перед эксгаустером №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:25]', 'analog', 'Температура перед эксгаустером №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:27]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:28]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:29]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера). Эксгаустер №1', 1,
        1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:30]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:31]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:32]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:33]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:34]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:35]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №1)', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:36]', 'analog', 'Температура воды до охладителя. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:37]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:38]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:39]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:40]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:41]', 'analog', 'Температура масла до охладителя. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:42]', 'analog', 'Температура масла после охладителя. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:43]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:44]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:45]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:46]', 'analog', 'Температура нагрева статора №1. Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:47]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:48]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:49]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:50]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:51]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:52]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №2)', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:53]', 'analog', 'Температура воды до охладителя. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:54]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:55]', 'analog', 'Температура нагрева статора №1. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:56]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:57]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:58]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:59]', 'analog', 'Температура масла до охладителя. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:60]', 'analog', 'Температура масла после охладителя. Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:61]', 'analog', 'Разрежение перед эксгаустером №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:62]', 'analog', 'Разрежение перед эксгаустером №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:63]', 'analog', 'Давление воды Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:64]', 'analog', 'Давление воды Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:65]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:66]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:67]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:68]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:69]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:70]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:71]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:72]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:73]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:74]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:75]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:76]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:77]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:78]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:79]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:80]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:81]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:82]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:83]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:84]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:85]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:86]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:87]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:88]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:89]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:90]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:91]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:92]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:93]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:94]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:95]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:96]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:97]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:98]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:99]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:100]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:101]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:102]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:103]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:104]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:105]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:106]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:107]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:108]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:109]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:110]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:111]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:112]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:113]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:114]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:115]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:116]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:117]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:118]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:119]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:120]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:121]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:122]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:123]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:124]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:125]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:126]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:127]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:128]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:129]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:130]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:131]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:132]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:133]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:134]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:135]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:136]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:137]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:138]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:139]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:140]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:141]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:142]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:143]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:144]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:145]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:146]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:147]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:148]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:149]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:150]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:151]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:152]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:153]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:154]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:155]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:156]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:157]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:158]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:159]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:160]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:161]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:162]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:163]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:164]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:165]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:166]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:167]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:168]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:169]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:170]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:171]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:172]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:173]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:174]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:175]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:176]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:177]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:178]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:179]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:180]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:181]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:182]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:183]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:184]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:185]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:186]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:187]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:188]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:189]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:190]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:191]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:192]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:193]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:194]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:195]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:196]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:197]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:198]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:199]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:200]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:201]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:202]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:203]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:204]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:205]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:206]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:207]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:208]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:209]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:210]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:211]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:212]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:213]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:214]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:215]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:216]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:217]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:218]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:219]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:220]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:221]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:222]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:223]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:224]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:225]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:226]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:227]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:228]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:229]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:230]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:231]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2:232]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2.0]', 'digital', '46 Работа эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[2.1]', 'digital', '62 Работа эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:0]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:1]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:2]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:3]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:4]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:5]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:6]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:7]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:8]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:9]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:10]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:11]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:12]', 'analog', 'Горизонтал вибрация подшипника №1. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:13]', 'analog', 'Вертикал вибрация подшипника №1. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:14]', 'analog', 'Осевая вибрация подшипника №1. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:15]', 'analog', 'Горизонтал вибрация подшипника №2. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:16]', 'analog', 'Вертикал вибрация подшипника №2. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:17]', 'analog', 'Осевая вибрация подшипника №2. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:18]', 'analog', 'Горизонтал вибрация подшипника №7. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:19]', 'analog', 'Вертикал вибрация подшипника №7. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:20]', 'analog', 'Осевая вибрация подшипника №7. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:21]', 'analog', 'Горизонтал вибрация подшипника №8. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:22]', 'analog', 'Вертикал вибрация подшипника №8. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:23]', 'analog', 'Осевая вибрация подшипника №8. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:24]', 'analog', 'Температура перед эксгаустером №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:25]', 'analog', 'Температура перед эксгаустером №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:27]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:28]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:29]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера). Эксгаустер №5', 5,
        1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:30]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:31]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:32]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:33]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:34]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:35]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №5)', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:36]', 'analog', 'Температура воды до охладителя. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:37]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:38]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №5', 5, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:39]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №5', 5, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:40]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №5', 5, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:41]', 'analog', 'Температура масла до охладителя. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:42]', 'analog', 'Температура масла после охладителя. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:43]', 'analog', 'Температура нагрева подшипника №1 (ротора привода эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:44]', 'analog', 'Температура нагрева подшипника №2 (ротора привода эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:45]', 'analog', 'Температура нагрева подшипника №3 (редуктор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:46]', 'analog', 'Температура нагрева статора №1. Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:47]', 'analog', 'Температура нагрева подшипника №4 (редуктор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:48]', 'analog', 'Температура нагрева подшипника №5 (редуктор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:49]', 'analog', 'Температура нагрева подшипника №6 (редуктор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:50]', 'analog', 'Температура нагрева подшипника №7 (ротор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:51]', 'analog', 'Температура нагрева подшипника №8 (ротор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:52]', 'analog', 'Температура нагрева подшипника №9 (ротор эксгаустера №6)', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:53]', 'analog', 'Температура воды до охладителя. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:54]', 'analog', 'Температура воды на выходе охладителя. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:55]', 'analog', 'Температура нагрева статора №1. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:56]', 'analog', 'Температура воздуха двигателя т1. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:57]', 'analog', 'Температура воздуха двигателя т2. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:58]', 'analog', 'Температура воздуха двигателя т3. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:59]', 'analog', 'Температура масла до охладителя. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:60]', 'analog', 'Температура масла после охладителя. Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:61]', 'analog', 'Разрежение перед эксгаустером №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:62]', 'analog', 'Разрежение перед эксгаустером №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:63]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:64]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:65]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:66]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:67]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:68]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:69]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:70]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:71]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:72]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:73]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:74]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:75]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:76]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:77]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:78]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:79]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:80]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:81]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:82]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:83]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:84]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:85]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:86]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:87]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:88]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:89]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:90]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:91]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:92]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:93]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:94]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:95]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:96]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:97]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:98]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:99]', 'analog', 'Уставка аварийная max ТП т1 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:100]', 'analog', 'Уставка аварийная max ТП т2 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:101]', 'analog', 'Уставка аварийная max ТП т3 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:102]', 'analog', 'Уставка аварийная max ТП т4 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:103]', 'analog', 'Уставка аварийная max ТП т5 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:104]', 'analog', 'Уставка аварийная max ТП т6 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:105]', 'analog', 'Уставка аварийная max ТП т7 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:106]', 'analog', 'Уставка аварийная max ТП т8 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:107]', 'analog', 'Уставка аварийная max ТП т9 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:108]', 'analog', 'Уставка аварийная min ТП т1 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:109]', 'analog', 'Уставка аварийная min ТП т2 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:110]', 'analog', 'Уставка аварийная min ТП т3 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:111]', 'analog', 'Уставка аварийная min ТП т4 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:112]', 'analog', 'Уставка аварийная min ТП т5 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:113]', 'analog', 'Уставка аварийная min ТП т6 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:114]', 'analog', 'Уставка аварийная min ТП т7 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:115]', 'analog', 'Уставка аварийная min ТП т8 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:116]', 'analog', 'Уставка аварийная min ТП т9 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:117]', 'analog', 'Уставка предупредительная max ТП т1 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:118]', 'analog', 'Уставка предупредительная max ТП т2 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:119]', 'analog', 'Уставка предупредительная max ТП т3 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:120]', 'analog', 'Уставка предупредительная max ТП т4 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:121]', 'analog', 'Уставка предупредительная max ТП т5 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:122]', 'analog', 'Уставка предупредительная max ТП т6 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:123]', 'analog', 'Уставка предупредительная max ТП т7 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:124]', 'analog', 'Уставка предупредительная max ТП т8 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:125]', 'analog', 'Уставка предупредительная max ТП т9 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:126]', 'analog', 'Уставка предупредительная min ТП т1 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:127]', 'analog', 'Уставка предупредительная min ТП т2 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:128]', 'analog', 'Уставка предупредительная min ТП т3 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:129]', 'analog', 'Уставка предупредительная min ТП т4 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:130]', 'analog', 'Уставка предупредительная min ТП т5 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:131]', 'analog', 'Уставка предупредительная min ТП т6 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:132]', 'analog', 'Уставка предупредительная min ТП т7 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:133]', 'analog', 'Уставка предупредительная min ТП т8 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:134]', 'analog', 'Уставка предупредительная min ТП т9 Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:135]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:136]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:137]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:138]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:139]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:140]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:141]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:142]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:143]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:144]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:145]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:146]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:147]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:148]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:149]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:150]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:151]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:152]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:153]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:154]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:155]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:156]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:157]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:158]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:159]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:160]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:161]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:162]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:163]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:164]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:165]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:166]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:167]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:168]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:169]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:170]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:171]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:172]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:173]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:174]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:175]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:176]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:177]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:178]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:179]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:180]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:181]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:182]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:183]', 'analog', 'Уставка аварийная max ГВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:184]', 'analog', 'Уставка аварийная max ВВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:185]', 'analog', 'Уставка аварийная max ОВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:186]', 'analog', 'Уставка аварийная max ГВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:187]', 'analog', 'Уставка аварийная max ВВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:188]', 'analog', 'Уставка аварийная max ОВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:189]', 'analog', 'Уставка аварийная max ГВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:190]', 'analog', 'Уставка аварийная max ВВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:191]', 'analog', 'Уставка аварийная max ОВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:192]', 'analog', 'Уставка аварийная max ГВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:193]', 'analog', 'Уставка аварийная max ВВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:194]', 'analog', 'Уставка аварийная max ОВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:195]', 'analog', 'Уставка аварийная min ГВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:196]', 'analog', 'Уставка аварийная min ВВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:197]', 'analog', 'Уставка аварийная min ОВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:198]', 'analog', 'Уставка аварийная min ГВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:199]', 'analog', 'Уставка аварийная min ВВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:200]', 'analog', 'Уставка аварийная min ОВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:201]', 'analog', 'Уставка аварийная min ГВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:202]', 'analog', 'Уставка аварийная min ВВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:203]', 'analog', 'Уставка аварийная min ОВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:204]', 'analog', 'Уставка аварийная min ГВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:205]', 'analog', 'Уставка аварийная min ВВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:206]', 'analog', 'Уставка аварийная min ОВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:207]', 'analog', 'Уставка предупредительная max ГВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:208]', 'analog', 'Уставка предупредительная max ВВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:209]', 'analog', 'Уставка предупредительная max ОВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:210]', 'analog', 'Уставка предупредительная max ГВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:211]', 'analog', 'Уставка предупредительная max ВВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:212]', 'analog', 'Уставка предупредительная max ОВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:213]', 'analog', 'Уставка предупредительная max ГВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:214]', 'analog', 'Уставка предупредительная max ВВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:215]', 'analog', 'Уставка предупредительная max ОВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:216]', 'analog', 'Уставка предупредительная max ГВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:217]', 'analog', 'Уставка предупредительная max ВВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:218]', 'analog', 'Уставка предупредительная max ОВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:219]', 'analog', 'Уставка предупредительная min ГВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:220]', 'analog', 'Уставка предупредительная min ВВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:221]', 'analog', 'Уставка предупредительная min ОВ 1т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:222]', 'analog', 'Уставка предупредительная min ГВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:223]', 'analog', 'Уставка предупредительная min ВВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:224]', 'analog', 'Уставка предупредительная min ОВ 2т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:225]', 'analog', 'Уставка предупредительная min ГВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:226]', 'analog', 'Уставка предупредительная min ВВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:227]', 'analog', 'Уставка предупредительная min ОВ 7т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:228]', 'analog', 'Уставка предупредительная min ГВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:229]', 'analog', 'Уставка предупредительная min ВВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3:230]', 'analog', 'Уставка предупредительная min ОВ 8т Эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3.0]', 'digital', '46 Работа эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[3.1]', 'digital', '62 Работа эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:0]', 'analog', 'Уровень масла в маслосистеме эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:1]', 'analog', 'Давление масла в маслосистеме эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:2]', 'analog', 'Ток ротора эксгаустера №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:3]', 'analog', 'Ток статора эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:4]', 'analog', 'Напряжение ротора эксгаустера №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:5]', 'analog', 'Напряжение статора эксгаустера №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:6]', 'analog', 'Положение задвижки газ эксгаустера №1', 1, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:7]', 'analog', 'Уровень масла в маслосистеме эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:8]', 'analog', 'Давление масла в маслосистеме эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:9]', 'analog', 'Ток ротора эксгаустера №2', 2, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:10]', 'analog', 'Ток статора эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:11]', 'analog', 'Напряжение ротора эксгаустера №2', 2, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:12]', 'analog', 'Напряжение статораэксгаустера №2', 2, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4:13]', 'analog', 'Положение задвижки газ эксгаустера №2', 2, 0);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.0]', 'digital', 'эксгаустер №1 в работе', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.1]', 'digital', 'ЗАКРЫТО задвижка газ эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.2]', 'digital', 'ОТКРЫТО задвижка газ эксгаустер №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.3]', 'digital', 'Запущен пусковой маслонасос эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.4]', 'digital', 'Запущен аварийный маслонасос эксгаустера №1', 1, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.5]', 'digital', 'эксгаустер №2 в работе', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.6]', 'digital', 'ЗАКРЫТО задвижка газ эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.7]', 'digital', 'ОТКРЫТО задвижка газ эксгаустер №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.8]', 'digital', 'Запущен пусковой маслонасос эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[4.9]', 'digital', 'Запущен аварийный маслонасос эксгаустера №2', 2, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:0]', 'analog', 'Уровень масла в маслосистеме эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:1]', 'analog', 'Давление масла в маслосистеме эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:2]', 'analog', 'Ток ротора эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:3]', 'analog', 'Ток статора эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:4]', 'analog', 'Напряжение ротора эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:5]', 'analog', 'Напряжение статораэксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:6]', 'analog', 'Положение задвижки газ эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:7]', 'analog', 'Уровень масла в маслосистеме эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:8]', 'analog', 'Давление масла в маслосистеме эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:9]', 'analog', 'Ток ротора эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:10]', 'analog', 'Ток статора эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:11]', 'analog', 'Напряжение ротора эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:12]', 'analog', 'Напряжение статораэксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5:13]', 'analog', 'Положение задвижки газ эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.0]', 'digital', 'эксгаустер №5 в работе', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.1]', 'digital', 'ЗАКРЫТО задвижка газ эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.2]', 'digital', 'ОТКРЫТО задвижка газ эксгаустер №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.3]', 'digital', 'Запущен пусковой маслонасос эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.4]', 'digital', 'Запущен аварийный маслонасос эксгаустера №5', 5, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.5]', 'digital', 'эксгаустер №6 в работе', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.6]', 'digital', 'ЗАКРЫТО задвижка газ эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.7]', 'digital', 'ОТКРЫТО задвижка газ эксгаустер №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.8]', 'digital', 'Запущен пусковой маслонасос эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[5.9]', 'digital', 'Запущен аварийный маслонасос эксгаустера №6', 6, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[6:0]', 'analog', 'Разрежение в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[6:1]', 'analog', 'Температура в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[6:2]', 'analog', 'Скорость агломашины', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[6.0]', 'digital', 'Работа агломашины №1', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[7:0]', 'analog', 'Разрежение в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[7:1]', 'analog', 'Температура в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[7:2]', 'analog', 'Скорость агломашины', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[7.0]', 'digital', 'Работа агломашины №2', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[8:0]', 'analog', 'Разрежение в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[8:1]', 'analog', 'Температура в общем коллекторе', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[8:2]', 'analog', 'Скорость агломашины', 0, 1);
INSERT INTO mapping (place, type, comment, exgauster, active)
VALUES ('SM_Exgauster\[8.0]', 'digital', 'Работа агломашины №3', 0, 1);
