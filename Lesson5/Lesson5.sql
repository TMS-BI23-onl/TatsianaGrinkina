
  3) a) 
  --Изучите данные в таблице Production.UnitMeasure. 
SELECT *
FROM Production.UnitMeasure

--Проверьте, есть ли здесь UnitMeasureCode, начинающиеся на букву ‘Т’.
SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

--Сколько всего различных кодов здесь есть? 
SELECT COUNT(UnitMeasureCode) AS COUNTUnitMeasureCode
FROM Production.UnitMeasure

/*Вставьте следующий набор данных в таблицу:
TT1, Test 1, 9 сентября 2020
TT2, Test 2, getdate()*/

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', CAST('2020/09/09' AS DATE)),
       ('TT2', 'Test 2', getdate())

b) --Теперь загрузите вставленный набор в новую, не существующую таблицу Production.UnitMeasureTest. 
 
SELECT UnitMeasureCode, Name, ModifiedDate
INTO [Production].[UnitMeasureTest]
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

--Догрузите сюда информацию из Production.UnitMeasure по UnitMeasureCode = ‘CAN’.

INSERT INTO [Production].[UnitMeasureTest] (UnitMeasureCode, Name, ModifiedDate)
SELECT  *
FROM Production.UnitMeasure
WHERE UnitMeasureCode = 'CAN'

--Посмотрите результат в отсортированном виде по коду. 

SELECT *
FROM [Production].[UnitMeasureTest]
ORDER BY UnitMeasureCode

c) --Измените UnitMeasureCode для всего набора из Production.UnitMeasureTest на ‘TTT’.

UPDATE [Production].[UnitMeasureTest]
SET UnitMeasureCode = 'TTT'

d) --Удалите все строки из Production.UnitMeasureTest.

DELETE
FROM [Production].[UnitMeasureTest]

4. -- Найдите значения count(1), count(name), count(id), count(*) для следующей таблицы:
/*Id(PK)	Name		DepName
  1	        null		A
  2	        null		null
  3	        A  		    C
  4	        B		    C*/

 Id(PK)	    Name		DepName   count(1)     count(name)   count(id)   count(*)
  1	        null		A            1          null           1            1
  2	        null		null         1          null           1            1
  3	        A  		    C            1           1             1            1
  4	        B		    C            1           1             1            1
  