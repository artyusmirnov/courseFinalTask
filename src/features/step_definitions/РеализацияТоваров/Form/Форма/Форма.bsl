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

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюДокументыПоступления()","ЯСоздаюДокументыПоступления","И я создаю документы поступления");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДокументПроведен()","ДокументПроведен","Тогда документ проведен");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДокументНеПроведен()","ДокументНеПроведен","Тогда документ не проведен");

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
//И я создаю документы поступления
//@ЯСоздаюДокументыПоступления()
Процедура ЯСоздаюДокументыПоступления() Экспорт
	ЗагрузитьFixtureИзФайла("ПоступлениеТоваров");
КонецПроцедуры

&НаКлиенте
//Тогда документ проведен
//@ДокументПроведен()
Процедура ДокументПроведен() Экспорт
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "Не хватает";
	Сообщение.Сообщить(); 
	//КонтекстСохраняемый
КонецПроцедуры

&НаКлиенте
//Тогда документ не проведен
//@ДокументНеПроведен()
Процедура ДокументНеПроведен() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

//окончание текста модуля