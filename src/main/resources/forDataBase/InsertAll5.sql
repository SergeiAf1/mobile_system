use javaschool;

INSERT INTO `javaschool`.`options`
(`name`,
`price`,
`connection_price`)
VALUES
('call_hold',100,50),
('redirection',100,0),
('unlimited_inet',300,100),
('unlimited_sms',100,0),
('unlimited_calls',400,0),
('sms_cheque',50,0),
('dark_list',100,100),
('100_sms',100,0),
('400_minut',400,0),
('ad_blocking',200,100);

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

INSERT INTO `javaschool`.`tariff_options`
(`tariff_id`,
`option_id`)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,10),
(3,1),
(3,4),
(3,10),
(5,1),
(5,2),
(5,7),
(6,7),
(6,8),
(6,9),
(6,10),
(6,1),
(4,1),
(4,2),
(4,10),
(3,7);

INSERT INTO `javaschool`.`users`
(`name`,
`surname`,
`email`,
`password`,
`authority`)
VALUES
('admin','admin','admin@admin','admin','ROLE_ADMIN');

INSERT INTO `javaschool`.`users`
(`name`,
`surname`,
`passport`,
`email`,
`birth_date`,
`address`,
`password`)
VALUES
('Oleg','Ivanov',2006415897,'ol@mail.ru','1980.12.12','Voronezh, Lizukova 14, 56','qwerty'),
('Masha','Ivanova',2006415887,'ma@mail.ru','1990.04.04','Voronezh, Lizukova 14, 57','qwerty1'),
('Igor','Petrov',2008548796,'ig@mail.ru','1995.05.01','Voronezh, Lizukova 14, 23','qwerty2'),
('Ivan','Sidorov',2009568963,'iv@mail.ru','2001.07.07','Voronezh, Lizukova 12, 56','qwerty3'),
('Lena','Nogina',2003569874,'le@mail.ru','2000.08.08','Voronezh, Lizukova 03, 44','qwerty4'),
('Oleg','Gorov',2006525897,'olk@mail.ru','1980.05.12','Voronezh, Lenina 55, 44','qwerty5'),
('Masha','Putina',2004215887,'mau@mail.ru','1990.04.04','Voronezh, Lenina 88, 56','qwerty52'),
('Igor','Maheev',2008658796,'igi@mail.ru','1995.05.01','Voronezh, Lenina 77, 24','qwerty63'),
('Ivan','Lotov',2009788963,'ive@mail.ru','2001.07.07','Voronezh, Lenina 44, 12','qwerty45')
;


INSERT INTO `javaschool`.`contract`
(`tariff_id`,
`user_id`,
`phone_number`)
VALUES
(1,2,9202192080),
(1,1,9202192070),
(2,2,9202192060),
(3,3,9202192050),
(4,4,9202192040),
(4,3,9202192030);

INSERT INTO `javaschool`.`contract_tariff_options`
(`contract_id`,
`tariff_options_id`)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(3,4),
(3,5),
(3,6);





