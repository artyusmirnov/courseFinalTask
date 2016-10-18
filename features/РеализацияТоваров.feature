﻿# encoding: utf-8
# language: ru

@tree

Функционал: РеализацияТоваров
	Как продавец 
	Хочу продавать товары
	Чтобы учитывать остатки и стоимость товаров
	
Контекст
	Допустим я подготавливаю начальные данные
	И УдалитьДокументы "РеализацияТоваров"
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Пауза 3

Сценарий: Оприходование товаров с пустым списком документов поступления одним документом
	Когда я создаю новый документ "РеализацияТоваров"
	Тогда документ сформировал движения корректно
	
Сценарий: Оприходование товаров с пустым списком документов поступления двумя документами
	Когда я создаю документы "РеализацияТоваров"
	Тогда документы сформировали движения корректно