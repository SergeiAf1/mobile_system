use javaschool;

INSERT INTO `javaschool`.`options`
(`name`,
`price`,
`connection_price`)
VALUES
('call_hold',50,50),
('redirection',50,0),
('unlimited_inet',300,100),
('unlimited_sms',100,0),
('unlimited_calls',300,50),
('sms_cheque',50,0),
('dark_list',100,100),
('100_sms',100,0),
('400_minut',200,0),
('ad_blocking',100,100);

INSERT INTO `javaschool`.`tariff`
(`name`,
`price`)
VALUES
('XS',100),
('S',200),
('L',300),
('XL',400),
('XXL',500),
('zero',0);

INSERT INTO `javaschool`.`tariff`
(`name`,
`price`,
`enabled`)
VALUES
('First',100,0),
('Second',150,0);

INSERT INTO `javaschool`.`tariff_options`
(`tariff_id`,
`option_id`)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,10),
(2,1),
(2,4),
(2,10),
(2,3),
(3,1),
(3,4),
(3,10),
(3,2),
(3,3),
(5,1),
(5,2),
(5,7),
(5,6),
(6,8),
(6,4),
(6,5),
(6,6),
(6,7),
(6,9),
(6,10),
(6,1),
(6,3),
(6,2),
(4,1),
(4,3),
(4,10),
(7,1),
(7,2),
(7,4),
(7,5);

INSERT INTO `javaschool`.`users`
(`name`,
`surname`,
`email`,
`password`,
`authority`)
VALUES
('admin','','admin@admin','admin','ROLE_ADMIN');

INSERT INTO `javaschool`.`users`
(`name`,
`surname`,
`passport`,
`email`,
`birth_date`,
`address`,
`password`)
VALUES
('Oleg','Ivanov',2006415897,'ol@mail.ru','1980.12.12','Voronezh, Lizukova 14, 56','user'),
('Masha','Ivanova',2006415887,'ma@mail.ru','1990.04.04','Voronezh, Lizukova 14, 57','user'),
('Igor','Petrov',2008548796,'ig@mail.ru','1995.05.01','Voronezh, Lizukova 14, 23','user'),
('Ivan','Sidorov',2009568963,'iv@mail.ru','2001.07.07','Voronezh, Lizukova 12, 56','user'),
('Lena','Nogina',2003569874,'le@mail.ru','2000.08.08','Voronezh, Lizukova 03, 44','user'),
('Oleg','Gorov',2006525897,'olk@mail.ru','1980.05.12','Voronezh, Lenina 55, 44','user'),
('Masha','Putina',2004215887,'mau@mail.ru','1990.04.04','Voronezh, Lenina 88, 56','user'),
('Igor','Maheev',2008658796,'igi@mail.ru','1995.05.01','Voronezh, Lenina 77, 24','user'),
('Ivan','Lotov',2009788963,'ive@mail.ru','2001.07.07','Voronezh, Kirova 44, 12','user'),
('Irina','Putina',2056215887,'ipy@mail.ru','1990.05.04','Voronezh, Lenina 10, 56','user'),
('Igor','Nulov',2008651116,'inu@mail.ru','1990.07.05','Voronezh, Kirova 66, 22','user'),
('Ivan','Kononov',2009788111,'ikon@mail.ru','2005.05.08','Voronezh, Lenina 11, 12','user'),
('Oleg','Onegin',2008205889,'oneg@mail.ru','1990-05-09','Lipetsk, Kirova 50, 12', 'user')
;


INSERT INTO `javaschool`.`contract`
(`tariff_id`,
`user_id`,
`phone_number`)
VALUES
(1,2,9201000000),
(1,5,9201000001),
(2,9,9201000002),
(3,3,9201000003),
(4,4,9201000004),
(4,3,9201000005),
(5,8,9201000006),
(6,6,9201000007),
(6,14,9201000008),
(7,14,9201000009),
(3,7,9201000010);

INSERT INTO `javaschool`.`dependent_options`
(`option_id`,
`dependent_option_id`)
VALUES
(3,10),
(6,7);

INSERT INTO `javaschool`.`incompatible_options`
(`option_id`,
`incompatible_option_id`)
VALUES
(8,4),
(9,5);

INSERT INTO `javaschool`.`contract`
(`tariff_id`,
`user_id`,
`phone_number`,
`enabled`)
VALUES
(1,14,9201000011,0);

INSERT INTO `javaschool`.`contract`
(`tariff_id`,
`phone_number`,
`enabled`)
VALUES
(1,9201000012,0),
(6,9201000013,0),
(6,9201000014,0);





