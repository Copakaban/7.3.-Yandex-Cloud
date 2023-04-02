# 7.3.-Yandex-Cloud  

Задание 1.  
Создаем виртуальную машину в облаке (в моем случае, я создал две с прицелом на второе задание) - файл main.tf приложен:  
terraform plan - проверяем правильность и полноту созданного main.tf;  
terraform apply - создаем машины.  
Ставим nginx
![изображение](https://user-images.githubusercontent.com/118304300/229359669-ccf644c4-4ce0-40a3-b7ea-99666a6f6a6a.png)
Проверяем доступность  
![изображение](https://user-images.githubusercontent.com/118304300/229359716-c2516f0f-0638-4b7d-ba9d-c474b84db884.png)  
В случае, когда необходимо перестроить инфраструктуру, добавив в нее дополнительную виртмашину, лучше всего удалить старую и развернуть все заново с новым main.tf. Удалить старую инраструктуру - terraform destroy.

Задание 2*.
![изображение](https://user-images.githubusercontent.com/118304300/229360506-3b47a9b2-a0dd-44b8-ad3d-0041fc6bbcbd.png)
Для проверки состояния postgeSQL добавил строки в playDB.yaml:
![изображение](https://user-images.githubusercontent.com/118304300/229361534-76c70b96-a0dc-43c1-9c57-f774183e9edb.png)
После выполнения уничтожаем инфраструктуру:
![изображение](https://user-images.githubusercontent.com/118304300/229361938-6e094e1b-4280-46ed-8263-3544c359b8d3.png)
