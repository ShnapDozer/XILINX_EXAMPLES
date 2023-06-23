# XILINX_EXAMPLES

Проекты, упражнения, примеры для xilinx zc702

# Git flow для Vivado

### По папкам:
1. Создаем директории ```sandbox``` ```src```
2. В ```sandbox``` мы помещаем все изменяющиеся вивадой файлы проекта (т.е. создаем проект в этой директории)
3. В ```src``` помещаем блок диаграммы, файлы ограничений, соурс коды и файлы симуляции. Папки:  
    + ```sources```
    + ```simulation```
    + ```blockDesign```
    + ```constraints```

  **Для создания папок проекта можно воспользоваться скриптом: ```CreateProjectFolders.bat```**
<br>

### По проекту:
1. В самом проекте прописываем все зависимости
2. При необходимости подключения IP библиотек - выводим их в папку ```SDK```
3. Проверяем все ли загружается (симуляция, синтез, имплементация и генерация)
4. Очищаем проект ``` reset_project ```
5. Создаем tcl скрипт с названием ``` restore_project ```
6. Помещаем его в уровень с sandbox
7. В самом скрипте ищем строчку

    ```
    # Create project
    create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xc7z020clg484-1
    ```

    И заменяем ее на ```create_project ${_xil_proj_name_} ./sandbox -part xc7z020clg484-1```
8. В батнкие прописываем команду ``` vivado -mode batch -source restore_project.tcl ``` (если папка с вивадой добавлена в PATH)
