#Использовать "../../core"

Процедура ОписаниеКоманды(КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("remote r", Ложь, "Вывести список доступных к установке версий").Флаговый();
	
КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	ВыводитьСписокВерсийНаСайте = КомандаПриложения.ЗначениеОпции("--remote");
	
	Если ВыводитьСписокВерсийНаСайте Тогда
		ВывестиСписокДоступныхКУстановкеВерсий();
	Иначе
		ВывестиСписокУстановленныхВерсий();
	КонецЕсли;

КонецПроцедуры

Процедура ВывестиСписокУстановленныхВерсий()
	СписокУстановленныхВерсий = ВерсииOneScript.ПолучитьСписокУстановленныхВерсий();
	Для Каждого УстановленнаяВерсия Из СписокУстановленныхВерсий Цикл
		Сообщение = СтрШаблон("%1 -> %2 (%3)", УстановленнаяВерсия.Алиас, УстановленнаяВерсия.Версия, УстановленнаяВерсия.Путь);
		УстанавливаемыйСтатусСообщения = ?(УстановленнаяВерсия.Алиас = "current", СтатусСообщения.Информация, СтатусСообщения.БезСтатуса);
		Сообщить(Сообщение, УстанавливаемыйСтатусСообщения);
	КонецЦикла;
КонецПроцедуры

Процедура ВывестиСписокДоступныхКУстановкеВерсий()
	
	СписокДоступныВерсий = ВерсииOneScript.ПолучитьСписокДоступныхКУстановкеВерсий();
	Для Каждого ДоступнаяВерсия Из СписокДоступныВерсий Цикл
		Сообщение = СтрШаблон("%1 (%2)", ДоступнаяВерсия.Алиас, ДоступнаяВерсия.Путь);
		Сообщить(Сообщение);
	КонецЦикла;

КонецПроцедуры
