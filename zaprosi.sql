SELECT ID_вида_продукции
FROM Виды_продукции
WHERE Толщина_мм < 5;


SELECT *
FROM Клиенты
WHERE Email LIKE '%@mail.ru' AND Контактное_лицо LIKE 'Т%';

SELECT SUM(Количество_на_складе) AS Общее_количество_сырья
FROM Сырье;

SELECT *
FROM Продукция
WHERE Наименование LIKE 'Шпон%' AND Единица_измерения LIKE 'м2%';

SELECT Дата_проведения
FROM Техника_безопасности
WHERE Тип_инструктажа = 'Первичный инструктаж';

SELECT Наименование, Дата_покупки, Стоимость
FROM Оборудование
ORDER BY Дата_покупки ASC, Стоимость ASC;


SELECT
    Тип_ресурса,
    Показатель,
    CASE
        WHEN Показатель > 1300 THEN 'Лимит превышен'
        ELSE 'Лимит в норме'
    END AS Статус
FROM
    Энергопотребление;


	WITH Фанера_ФК AS (
    SELECT
        SUM(CASE WHEN p.Сорт = '1' THEN p.Цена_за_единицу * d.Количество ELSE 0 END) AS ФК_1_сорт,
        SUM(CASE WHEN p.Сорт = '2' THEN p.Цена_за_единицу * d.Количество ELSE 0 END) AS ФК_2_сорт
    FROM Продукция p
    JOIN Продажи d ON p.ID_продукции = d.ID_продукции
    WHERE p.Наименование = 'Фанера ФК'
),
Фанера_ФСФ AS (
    SELECT
        SUM(CASE WHEN p.Сорт = '1' THEN p.Цена_за_единицу * d.Количество ELSE 0 END) AS ФСФ_1_сорт
    FROM Продукция p
    JOIN Продажи d ON p.ID_продукции = d.ID_продукции
    WHERE p.Наименование = 'Фанера ФСФ'
)
SELECT
    (SELECT ФК_1_сорт FROM Фанера_ФК) AS ФК_1_сорт,
    (SELECT ФК_2_сорт FROM Фанера_ФК) AS ФК_2_сорт,
    (SELECT ФСФ_1_сорт FROM Фанера_ФСФ) AS ФСФ_1_сорт,
    ((SELECT ФК_1_сорт FROM Фанера_ФК) + (SELECT ФК_2_сорт FROM Фанера_ФК)) - (SELECT ФСФ_1_сорт FROM Фанера_ФСФ) AS Разница
FROM Фанера_ФК, Фанера_ФСФ
