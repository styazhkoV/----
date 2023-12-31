DRKS-66 Отображение графика по кредитам

Заявка от КИТ график погашения

**Обоснование:** Возможность самостоятельного получения клиентами графика платежей по займам/траншам без необходимости обращения в Банк. Высвобождение ручного труда и перенаправление трудозатрат на другие проекты в связи с увеличением объемов МСБ.

 **Запрос на доработку** :

* Необходимо в СДБО ЮЛ на Главной странице → Кредиты, а также в разделе Продукты → Кредиты/Овердрафты (WEB-версия) в закладке **[График погашения]** отобразить График возврата займа и погашения вознаграждения.
* Добавить кнопку  скачивания, которая будет выгружать график в файл формата .pdf и Excel. При экспорте файла предлагается книжный формат. Формат .pdf с печатью Банка по аналогии со справками.
* Анализ текущего функционала "Кредиты \ Овердрафты"
* Задача на создание операции на БД ИБСО согласно шагам в интерфейсе 	ИБСО
* Задача на Шину, по передачи данных из ИБСО в СДБО
* Задача на СДБО метод получения данных с Шины (ИБСО) в БД СДБО
* Задача на СДБО сделать метод getLoanTable для вывода графика платежей на фронт
* Дизаин на фронте формы вывода графика платежей

**АНАЛИЗ**

| Эндпоинт                                                                                                                                                                | Описание                                                                    | Модель данных                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [https://customer2dev.kazincombank.kz/api/credits/get-credits-by-customer?sort=credit.id](https://customer2dev.kazincombank.kz/api/credits/get-credits-by-customer?sort=credit.id) | вывод всех имеющихся у пользователя кредитов | [get-credits-by-customer.json](https://wiki.kazincombank.kz/download/attachments/43847073/get-credits-by-customer.json?version=1&modificationDate=1695810875424&api=v2) |
| [https://customer2dev.kazincombank.kz/api/credits/23003](https://customer2dev.kazincombank.kz/api/credits/23003)                                                                   | вывод информации по id кредита                              | [23003.json](https://wiki.kazincombank.kz/download/attachments/43847073/23003.json?version=1&modificationDate=1695810875349&api=v2)                                     |
| [https://customer2dev.kazincombank.kz/api/credits/schedule?creditId=23003&amp;sort=id](https://customer2dev.kazincombank.kz/api/credits/schedule?creditId=23003&sort=id)           | вывод графика по кредитам (ошибка SQL запроса)   | [schedule.json](https://wiki.kazincombank.kz/download/attachments/43847073/schedule.json?version=1&modificationDate=1695810875498&api=v2)                               |

**ТЕХНИЧЕСКОЕ ЗАДАНИЕ**

[DRKS-66 ТЗ v 1.0 Вывод данных &#34;📊График возврата займа и погашения вознаграждения&#34; с возможностью выгрузки формы📃 (.pdf и .еxcel) из ИБСО в СДБО ЮЛ](https://wiki.kazincombank.kz/pages/viewpage.action?pageId=43847073 "Пройти по ссылке")

[[DPIS-201] [ИБСО] График платежей по займу для СДБО ЮЛ - JIRA (kazincombank.kz)](https://jira.kazincombank.kz/browse/DPIS-201)

Ошибка 


```
Error loading [https://esb-test.kazincombank.kz:5555/sdboul/soa]: org.apache.xmlbeans.XmlException: org.apache.xmlbeans.XmlException: error: Premature end of file.
```

Просят обратиться в ИБСО

**Владелец процесса:** Айдос Чокушев & Перфильева Елена & Аманжолов Мадияр
