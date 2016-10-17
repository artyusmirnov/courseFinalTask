﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодготавливаюНачальныеДанные()","ЯПодготавливаюНачальныеДанные","Допустим я подготавливаю начальные данные");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВСпискеДокументовНетЭлементов(Парам01)","ВСпискеДокументовНетЭлементов","Допустим в списке документов ""ПоступлениеТоваров"" нет элементов");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавляюДокументыВСписокДокументов(Парам01)","ЯДобавляюДокументыВСписокДокументов","Когда я добавляю документы в список документов ""ПоступлениеТоваров""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВСпискеДокументовЕстьЭлементы(Парам01)","ВСпискеДокументовЕстьЭлементы","И в списке документов ""ПоступлениеТоваров"" есть элементы");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УдалитьДокументы(Парам01)","УдалитьДокументы","И УдалитьДокументы ""ПоступлениеТоваров""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура утвВСпискеДокументовНетЭлементов(ИмяДокумента, ТекстИсключения = "")
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ИмяДокумента.Ссылка
		|ИЗ
		|	Документ." + ИмяДокумента + " КАК ИмяДокумента";
	
	Результат = Запрос.Выполнить();
	Если Не Результат.Пустой() Тогда 
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура утвВСпискеДокументовЕстьЭлементы(ИмяДокумента, ТекстИсключения = "")
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ИмяДокумента.Ссылка
		|ИЗ
		|	Документ." + ИмяДокумента + " КАК ИмяДокумента";
	
	Результат = Запрос.Выполнить();
	Если Результат.Пустой() Тогда 
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УдалитьДокументыНаСервере(ИмяДокумента)
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ИмяДокумента.Ссылка
		|ИЗ
		|	Документ." + ИмяДокумента + " КАК ИмяДокумента";
	
	Результат = Запрос.Выполнить();
	Если Не Результат.Пустой() Тогда 
		Выборка = Результат.Выбрать();
		Пока Выборка.Следующий() Цикл
			Выборка.Ссылка.ПолучитьОбъект().Удалить();
		КонецЦикла; 
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Функция ПолучитьПутьКФайлуОтносительноКаталогаFeatures(ИмяФайлаСРасширением)
	ПутьКФайлу = "";
	СостояниеVanessaBehavior = Ванесса.ПолучитьСостояниеVanessaBehavior();
	ПутьКТекущемуFeatureФайлу = СостояниеVanessaBehavior.ТекущаяФича.ПолныйПуть;
	ПутьКФайлу = Лев(ПутьКТекущемуFeatureФайлу, СтрНайти(ПутьКТекущемуFeatureФайлу, "features") - 1) + ИмяФайлаСРасширением;
	Возврат ПутьКФайлу;
КонецФункции 

&НаКлиенте
Процедура ЗагрузитьFixtureИзФайла(ИмяFixture)
	Ванесса.ЗапретитьВыполнениеШагов();
	НачальноеИмяФайла = ПолучитьПутьКФайлуОтносительноКаталогаFeatures("tools\Выгрузка и загрузка данных XML.epf");
	ИмяФайлаFixture = ПолучитьПутьКФайлуОтносительноКаталогаFeatures("spec\fixtures\" + ИмяFixture + ".xml");
	Адрес = "";
	НачатьПомещениеФайла(Новый ОписаниеОповещения("ЗагрузитьFixtureИзФайла_Завершение", ЭтотОбъект, ИмяФайлаFixture), Адрес, НачальноеИмяФайла, Ложь);
КонецПроцедуры 

&НаКлиенте
Процедура ЗагрузитьFixtureИзФайла_Завершение(Результат, Адрес, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	ЗагрузитьFixtureИзФайла_ЗавершениеНаСервере(Адрес, ДополнительныеПараметры);
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры 

&НаСервере
Процедура ЗагрузитьFixtureИзФайла_ЗавершениеНаСервере(Адрес, ИмяФайлаFixture)
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(Адрес);
	ДвоичныеДанные.Записать(ИмяВременногоФайла);
	ВнешняяОбработка = ВнешниеОбработки.Создать(ИмяВременногоФайла, Ложь);
	ВнешняяОбработка.ВыполнитьЗагрузку(ИмяФайлаFixture);
КонецПроцедуры 

#КонецОбласти

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим я подготавливаю начальные данные
//@ЯПодготавливаюНачальныеДанные()
Процедура ЯПодготавливаюНачальныеДанные() Экспорт
	ЗагрузитьFixtureИзФайла("Номенклатура");
	ЗагрузитьFixtureИзФайла("Контрагенты");
КонецПроцедуры

&НаКлиенте
//Допустим в списке документов "ПоступлениеТоваров" нет элементов
//@ВСпискеДокументовНетЭлементов(Парам01)
Процедура ВСпискеДокументовНетЭлементов(ИмяДокумента) Экспорт
	утвВСпискеДокументовНетЭлементов(ИмяДокумента, "В списке документов """ + ИмяДокумента + """ есть элементы");
КонецПроцедуры

&НаКлиенте
//И в списке документов "ПоступлениеТоваров" есть элементы
//@ВСпискеДокументовЕстьЭлементы(Парам01)
Процедура ВСпискеДокументовЕстьЭлементы(ИмяДокумента) Экспорт
	утвВСпискеДокументовЕстьЭлементы(ИмяДокумента, "В списке документов """ + ИмяДокумента + """ нет элементов");
КонецПроцедуры

&НаКлиенте
//И УдалитьДокументы "ПоступлениеТоваров"
//@УдалитьДокументы(Парам01)
Процедура УдалитьДокументы(ИмяДокумента) Экспорт
	УдалитьДокументыНаСервере(ИмяДокумента);
КонецПроцедуры

//окончание текста модуля