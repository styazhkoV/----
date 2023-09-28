В связи с массовыми ошибками вызванными не до получением данных по юр лицу во внешнем сервисе ADATA, при проведении онлайн регистрации ИП и открытии счёта в мобильном приложении, совместно с коллегами из Adata было принято решение создать отдельный API с сокращённым набором полей проверки юр лица ИП, чтобы сократить количество обращений.
Прошу взять задачу в работу, и прокинуть тестовые URL для устранения данной ошибки. Если кроме эндпоинта необходимы ещё данные

Swagger API Mobile SDBO UL https://registration-ul-test.kazincombank.kz/

[Test ИП (Copy) – Figma](https://www.figma.com/file/0g389X5AuitRCASc7vv5LZ/Test-%D0%98%D0%9F-(Copy)?type=design&node-id=327-759&mode=design&t=1Box9t2JVwxg5bv0-0 "Пройти по ссылке")

**Задача:**

* Интегрировать на customer2dev новые ресты для получения данных для открытия счёта в функционале "Открытие счёта ИП / ТОО"

Запрос по БИН/ИНН:

```
https://api.adata.kz/api/company/info/eUsy6Ph5fKv1X9rrpxzaUoe55KRm0Jxt6GgL7rHEEtNNthYDiDHKTgZ2lJ1R?iinBin={IinBin}&configurableResponseCode=required_fields
```

Check запрос:

```
https://api.adata.kz//api/company/info/check/eUsy6Ph5fKv1X9rrpxzaUoe55KRm0Jxt6GgL7rHEEtNNthYDiDHKTgZ2lJ1R?token={token}
```

[[ES-551] Завести новые ресты в шину - JIRA (kazincombank.kz)](https://jira.kazincombank.kz/browse/ES-551)


диаграмма последовательности  https://swimlanes.io/

title: Регистрация в мобильном приложении RBK Business
Клиент -> MobApp: запрос рег ИП
MobApp -> Клиент: запрос BIN \ IIN
Клиент -> MobApp: ввод БИН\ИИН
MobApp -> Клиент: запрос номер телефона
Клиент -> MobApp: ввод номер телефона
MobApp -> Клиент: отправка ОТР
Клиент -> MobApp: ввод ОТР
MobApp -> VISIONLAB: запрос на биометрию
Клиент -> VISIONLAB: прохождение био
VISIONLAB -> SDBO UL: Base64
SDBO UL ->MobApp: результат био
MobApp -> Клиент: отправка ОТР
//Клиент -> MobApp: IIN \ BIN
MobApp -> SDBO UL: BIN \ IIN
SDBO UL -> ADATA: запрос проверки юр лица
ADATA -> SDBO UL: результат проверки юр лица
SDBO UL -> MobApp: отказ\одоб по результатам проверки
MobApp -> Клиент:
