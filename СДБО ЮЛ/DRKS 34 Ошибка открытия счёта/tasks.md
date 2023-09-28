При прохождении Регистрации ИП, клиенты часто сталкиваются с тем что сервис возвращающий информацию о ИП "Adata" ,не успевает ответить.

1. [DRIS-1027](https://jira.kazincombank.kz/browse/DRIS-1027) линк к "Задаче ДИТ-а по ошибке удалённой регистрации ИП"

В связи с этим необходимо доработать api работающие с Adata.

1.Увеличить время жизни токена на 4 часа.

2.Увеличить время ожидания об успешном ответе от Adata на 3 мин.

3.В процессе регистрации ИП, после экрана с указанием ИИН и номера телефона, и подтверждения смс, создать в МП экран пре лоадер отображающий информацию "Подождите мы проверяем информацию". После успешного ответа от сервиса adata клиент переходит к видео идентификации.

В случае негативного ответа от сервиса выводить модальное окно "Удалённая регистрация не возможна, попробуйте позже"   .

[https://registration-ul-test.kazincombank.kz/registration-service/swagger-ui.html#/](https://registration-ul-test.kazincombank.kz/registration-service/swagger-ui.html#/ "Пройти по ссылке")

public-registration-controller-v-2

[https://registration-ul-test.kazincombank.kz/registration-service/swagger-ui.html#/registration-controller/getAdataInfoAvailableUsingPOST](https://registration-ul-test.kazincombank.kz/registration-service/swagger-ui.html#/registration-controller/getAdataInfoAvailableUsingPOST "Пройти по ссылке")
