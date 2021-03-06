/* Организация */
INSERT INTO Organization (id, version, address, name, full_name, inn, kpp, is_active)
VALUES (1, 0, 'Россия, г. Новосибирск, ул. Почтовая, 6', 'АО НПП Позитрон', 'Акционерное общество НПП Позитрон', '2983185638', '937461004', true);
INSERT INTO Organization (id, version, address, name, full_name, inn, kpp, is_active)
VALUES (2, 0, 'Россия, г. Москва, ул. Заречная, 1', 'АО Развитие', 'Акционерное общество Развитие', '7700441507', '772225140', true);
INSERT INTO Organization (id, version, address, name, full_name, inn, kpp, is_active)
VALUES (3, 0, 'Россия, г. Москва, проспект Вернадского, 86', 'АО ТТ', 'Акционерное общество Тонкие технологии', '7782439282', '770984285', true);

/* Офис */
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (1, 0, 1, 'Россия, г. Новосибирск, ул. Почтовая, 6', 'Научный центр', true);
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (2, 0, 1, 'Россия, г. Владивосток, ул. Приморская, 5', 'Производственный центр', true);
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (3, 0, 2, 'Россия, г. Москва, ул. Заречная, 1', 'Штаб-квартира', true);
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (4, 0, 2, 'Китай, г. Шанхай, ул. Пиньинь, 8', 'Филиал г. Шанхай', true);
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (5, 0, 3, 'Россия, г. Москва, проспект Вернадского, 86', 'Филиал 1', true);
INSERT INTO Office (id, version, org_id, address, name, is_active)
VALUES (6, 0, 3, 'Россия, г. Москва, ул. Малая Пироговская, 1', 'Филиал 2', true);

/* Классификатор документов */
INSERT INTO Document_Type (id, code, name)
VALUES (4, '10', 'Паспорт иностранного гражданина');
INSERT INTO Document_Type (id, code, name)
VALUES (10, '21', 'Паспорт гражданина Российской Федерации');

/* Классификатор стран */
INSERT INTO Country (id, code, name)
VALUES (34, '112', 'Республика Беларусь');
INSERT INTO Country (id, code, name)
VALUES (44, '156', 'Китайская народная республика');
INSERT INTO Country (id, code, name)
VALUES (185, '643', 'Российская Федерация');
INSERT INTO Country (id, code, name)
VALUES (199, '688', 'Республика Сербия');

/* Пользователь */
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (1, 0, 1, 185, 'Федор', 'Николаевич', 'Прокофьев', 'Генеральный директор');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (2, 0, 1, 185, 'Дмитрий', 'Игоревич', 'Иванов', 'Технический директор');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (3, 0, 1, 185, 'Вера', 'Александровна', 'Кузнецова', 'Разработчик');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (4, 0, 1, 199, 'Владислав', 'Владиславович', 'Стоянович', 'Научный сотрудник');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (5, 0, 1, 34, 'Владимир', 'Константинович', 'Константиновский', 'Программист');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (6, 0, 2, 185, 'Никита', 'Алексеевич', 'Дмитриев', 'Главный инженер');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (7, 0, 2, 185, 'Илья', 'Кузьмич', 'Федоров', 'Слесарь');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (8, 0, 2, 185, 'Мария', 'Ивановна', 'Сидоренко', 'Заведующая складом');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (9, 0, 3, 185, 'Иван', 'Петрович', 'Сидоров', 'Генеральный директор');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (10, 0, 3, 185, 'Ирина', 'Владимировна', 'Карандашева', 'Секретарь');
INSERT INTO User (id, version, office_id, country_id, first_name, middle_name, second_name, position)
VALUES (11, 0, 3, 185, 'Михал', 'Павлович', 'Крылов', 'Менеджер');
INSERT INTO User (id, version, office_id, country_id, first_name, second_name, position)
VALUES (12, 0, 4, 44, 'Цзиньхуа', 'Ху', 'Технолог');
INSERT INTO User (id, version, office_id, country_id, first_name, second_name, position)
VALUES (13, 0, 4, 44, 'Вэйдун', 'Ли', 'Инженер');
INSERT INTO User (id, version, office_id, country_id, first_name, second_name, position)
VALUES (14, 0, 4, 44, 'Цзиньсун', 'Чжан', 'Механик');
INSERT INTO User (id, version, office_id, first_name, second_name, position)
VALUES (15, 0, 5, 'Джон', 'Смит', 'бухгалтер');

/* Документ */
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (1, 0, 10, '422898333', '2010-01-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (2, 0, 10, '94738934', '2003-01-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (3, 0, 10, '2802154125', '2009-01-30', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (4, 0, 4, '2424242154', '2005-01-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (5, 0, 4, '235354366', '2009-01-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (6, 0, 10, '122354777836', '2014-05-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (7, 0, 10, '25625736526', '2009-01-20', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (8, 0, 10, '242245621', '2010-05-25', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (9, 0, 10, '475465553', '2000-08-17', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (10, 0, 10, '54091759475', '2002-02-22', true);
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date, is_identified)
VALUES (11, 0, 10, '290759076', '2004-11-09', true);

/* Телефон */
INSERT INTO Phone (id, version, phone)
VALUES (1, 0, '77903332211');
INSERT INTO Phone (id, version, phone)
VALUES (2, 0, '79343330001');
INSERT INTO Phone (id, version, phone)
VALUES (3, 0, '72223777711');
INSERT INTO Phone (id, version, phone)
VALUES (4, 0, '78492371111');
INSERT INTO Phone (id, version, phone)
VALUES (5, 0, '78444442662');
INSERT INTO Phone (id, version, phone)
VALUES (6, 0, '78492373333');
INSERT INTO Phone (id, version, phone)
VALUES (7, 0, '86445551530');
INSERT INTO Phone (id, version, phone)
VALUES (8, 0, '78492371577');
INSERT INTO Phone (id, version, phone)
VALUES (9, 0, '78444440845');
INSERT INTO Phone (id, version, phone)
VALUES (10, 0, '72776446650');
INSERT INTO Phone (id, version, phone)
VALUES (11, 0, '71296305493');
INSERT INTO Phone (id, version, phone)
VALUES (12, 0, '74153396765');
INSERT INTO Phone (id, version, phone)
VALUES (13, 0, '72153071780');
INSERT INTO Phone (id, version, phone)
VALUES (14, 0, '75307133330');
INSERT INTO Phone (id, version, phone)
VALUES (15, 0, '86663753620');
INSERT INTO Phone (id, version, phone)
VALUES (16, 0, '74994444444');

/* Организация - телефон */
INSERT INTO Organization_Phone (org_id, phone_id)
VALUES (1, 1);
INSERT INTO Organization_Phone (org_id, phone_id)
VALUES (1, 2);
INSERT INTO Organization_Phone (org_id, phone_id)
VALUES (2, 3);

/* Офис - телефон */
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (1, 1);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (2, 4);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (3, 5);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (3, 6);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (4, 7);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (5, 16);
INSERT INTO Office_Phone (office_id, phone_id)
VALUES (6, 16);

/* Пользователь - телефон */
INSERT INTO User_Phone (user_id, phone_id)
VALUES (1, 1);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (1, 2);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (2, 8);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (3, 9);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (4, 10);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (5, 9);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (6, 11);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (8, 12);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (9, 3);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (10, 3);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (10, 5);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (11, 13);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (11, 14);
INSERT INTO User_Phone (user_id, phone_id)
VALUES (12, 15);
