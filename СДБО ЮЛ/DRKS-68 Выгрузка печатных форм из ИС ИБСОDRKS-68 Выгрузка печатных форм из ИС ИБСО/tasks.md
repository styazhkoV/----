

DRKS-68 Выгрузка печатных форм из ИС ИБСО

На текущий момент выдача печатных форм с информацией об остатках средств на счетах осуществляется офлайн по письменному обращению клиента. Требуется автоматизация запроса на получение Клиентом следующих справок (на казахском, русском и английских языках):

* **справки о наличии счета с остатками,**
* **о наличии счета,**
* **о закрытии счета** ,
* **о наличии ссудной задолженности** ,
* **об отсутствии просроченной задолженности** ,
* **об оборотах, о наличии счета с остатком**

1. [[DPIS-242] Список документов, требующие перевода (создания справочников) на стороне ИБСО - JIRA (kazincombank.kz)](https://jira.kazincombank.kz/browse/DPIS-242) созданно, но пока не назначено (справочники для перевода справочников)
2. Создать интеграцию с шиной после исполнения DPIS-242 потому, что шиновикам нужен исходящий эндпоинт на ИБСО
3. [[DRKS-155] Доработать текущий функционал получения справок на СДБО (добавить выбор языка в запрос на справку) - JIRA (kazincombank.kz](https://jira.kazincombank.kz/browse/DRKS-155)) в работе Дмитрий
4. Потом в Шину

**Анализ Справки в СДБО:**

В процессе формирования справок в СДБО участвует 3 эндпоинта:

https://customer2dev.kazincombank.kz/api/demandType/categories?sort=id  выводит категории  categories.json там есть поля шаблона справки, куда необходимо подставить перевод из ИБСО, обратите внимание, что в id запроса стоят id шаблона справки.

```json
 "id": 201,
        "isDeleted": false,
        "code": "10",
        "name": "Справки",
        "name_id": 10774,
        "name_en": "Certificates",
        "name_ru": "Справки",
        "name_kk": "Анықтамалар",
        "templates": [
            {
                "actions": null,
                "id": 141,
                "created": null,
                "translationId": 10775,
                "bankResponse": null,
                "en": "Account statement",
                "ru": "Справка о наличии счета",
                "kk": "Шот туралы анықтама",
                "code": null,
                "demandEndpointCode": null,
                "description": null,
                "canAcceptFiles": null,
                "fields": [],
                "name": "Справка о наличии счета",
                "notification": null,
                "relatedOperationId": null,
                "categoryId": 201,
                "categoryName": null,
                "categoryTranslationId": null,
                "number": null,
                "status": null,
                "endpointId": null,
                "published": false,
                "demandFileIds": null,
                "jasperReportFile": null,
                "inquiryResponseFiles": null
            },
            {
                "actions": null,
                "id": 142,
                "created": null,
                "translationId": 10779,
                "bankResponse": null,
                "en": "Account closure confirmation",
                "ru": "Справка о закрытии счета",
                "kk": "Шотты жабу туралы анықтама",
                "code": null,
                "demandEndpointCode": null,
                "description": null,
                "canAcceptFiles": null,
                "fields": [],
                "name": "Справка о закрытии счета",
                "notification": null,
                "relatedOperationId": null,
                "categoryId": 201,
                "categoryName": null,
                "categoryTranslationId": null,
                "number": null,
                "status": null,
                "endpointId": null,
                "published": false,
                "demandFileIds": null,
                "jasperReportFile": null,
                "inquiryResponseFiles": null
            },
            {
                "actions": null,
                "id": 143,
                "created": null,
                "translationId": 10783,
                "bankResponse": null,
                "en": "Absence of overdue debt",
                "ru": "Справка об отсутствии просроченной задолженности",
                "kk": "Мерзімі өткен қарыздың жоқ екені туралы анықтама",
                "code": null,
                "demandEndpointCode": null,
                "description": null,
                "canAcceptFiles": null,
                "fields": [],
                "name": "Справка об отсутствии просроченной задолженности",
                "notification": null,
                "relatedOperationId": null,
                "categoryId": 201,
                "categoryName": null,
                "categoryTranslationId": null,
                "number": null,
                "status": null,
                "endpointId": null,
                "published": false,
                "demandFileIds": null,
                "jasperReportFile": null,
                "inquiryResponseFiles": null
            },
            {
                "actions": null,
                "id": 144,
                "created": null,
                "translationId": 10787,
                "bankResponse": null,
                "en": "Certificate of availability of loan debt",
                "ru": "Справка о наличии ссудной задолженности",
                "kk": "Несиелік берешектің болуы туралы анықтама",
                "code": null,
                "demandEndpointCode": null,
                "description": null,
                "canAcceptFiles": null,
                "fields": [],
                "name": "Справка о наличии ссудной задолженности",
                "notification": null,
                "relatedOperationId": null,
                "categoryId": 201,
                "categoryName": null,
                "categoryTranslationId": null,
                "number": null,
                "status": null,
                "endpointId": null,
                "published": false,
                "demandFileIds": null,
                "jasperReportFile": null,
                "inquiryResponseFiles": null
            },
            {
                "actions": null,
                "id": 145,
                "created": null,
                "translationId": 10791,
                "bankResponse": null,
                "en": "Turnover certificate",
                "ru": "Справка об оборотах",
                "kk": "Айналым туралы анықтама",
                "code": null,
                "demandEndpointCode": null,
                "description": null,
                "canAcceptFiles": null,
                "fields": [],
                "name": "Справка об оборотах",
                "notification": null,
                "relatedOperationId": null,
                "categoryId": 201,
                "categoryName": null,
                "categoryTranslationId": null,
                "number": null,
                "status": null,
                "endpointId": null,
                "published": false,
                "demandFileIds": null,
                "jasperReportFile": null,
                "inquiryResponseFiles": null
            },
```

https://customer2dev.kazincombank.kz/api/demand/userTable/data?id=1 выводит способы получения userTable.json

https://customer2dev.kazincombank.kz/api/dataSource/data?id=31428361&sort=id выводит список всех отделений и филлиалов РБК dataSource.json

**Используя эти справочники СДБО вызвая следующие эндпоинты создаёт запросы на справки в ИБСО**

https://customer2dev.kazincombank.kz/api/demandType?id=141 запрос на создание справки о наличии счёта

https://customer2dev.kazincombank.kz/api/demandType?id=142 запрос на создание справки о закрытии счёта

https://customer2dev.kazincombank.kz/api/demandType?id=144 запрос на создание справки о наличии ссудной задолженности

https://customer2dev.kazincombank.kz/api/demandType?id=143 запрос на создание справки об отсутствии просроченной задолженности

https://customer2dev.kazincombank.kz/api/demandType?id=145 запрос на создание справки об оборотах
