﻿# encoding: utf-8
# language: ru

@tree

Функционал: ПоступлениеТоваров
	Как оператор 
	Хочу приходовать товары
	Чтобы учитывать поступления товаров по количеству и стоимости
	
Контекст
	Допустим я подготавливаю начальные данные
	И УдалитьДокументы "ПоступлениеТоваров"
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Пауза 3

Сценарий: Оприходование товаров с пустым списком документов поступления одним документом
	Когда я создаю новый документ "ПоступлениеТоваров"
		Когда В панели разделов я выбираю "Закупки"
		И     В панели функций я выбираю "Поступление товаров"
		Тогда открылось окно "Поступление товаров"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Поступление товаров (создание)"
		И     я открываю выпадающий список "Контрагент"
		И     я выбираю значение реквизита "Контрагент" из формы списка
		Тогда открылось окно "Контрагенты"
		И     В форме "Контрагенты" в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Петров С. И. ИП' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Портсигар'    |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "3,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "100,00"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Сумма"
		И     в ТЧ "Товары" в поле "Сумма" я ввожу текст "300,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Куртка замшевая' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "2,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "500,00"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Сумма"
		И     в ТЧ "Товары" в поле "Сумма" я ввожу текст "1 000,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     я нажимаю на кнопку "Провести и закрыть"
	Тогда документ сформировал движения корректно
	
Сценарий: Оприходование товаров с пустым списком документов поступления двумя документами
	Когда я создаю документы "ПоступлениеТоваров"
		Когда В панели разделов я выбираю "Закупки"
		И     В панели функций я выбираю "Поступление товаров"
		Тогда открылось окно "Поступление товаров"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Поступление товаров (создание)"
		И     я открываю выпадающий список "Контрагент"
		И     я выбираю значение реквизита "Контрагент" из формы списка
		Тогда открылось окно "Контрагенты"
		И     В форме "Контрагенты" в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Петров С. И. ИП' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Портсигар'    |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "3,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "100,00"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Сумма"
		И     в ТЧ "Товары" в поле "Сумма" я ввожу текст "300,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Куртка замшевая' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "2,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "500,00"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Сумма"
		И     в ТЧ "Товары" в поле "Сумма" я ввожу текст "1 000,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     я нажимаю на кнопку "Провести и закрыть"
		И Пауза 3
		
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Поступление товаров (создание)"
		И     я открываю выпадающий список "Контрагент"
		И     я выбираю значение реквизита "Контрагент" из формы списка
		Тогда открылось окно "Контрагенты"
		И     В форме "Контрагенты" в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Иванов П. С. ИП' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Портсигар'    |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "2,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "101,00"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Сумма"
		И     в ТЧ "Товары" в поле "Сумма" я ввожу текст "202,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		
		И     я нажимаю на кнопку "Провести и закрыть"
	Тогда документ сформировал движения корректно
