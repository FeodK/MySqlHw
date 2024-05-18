USE hw;

/* Задача 1
 Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
 */
 
DROP FUNCTION IF EXISTS seconds_to_time;
DELIMITER $$
CREATE FUNCTION seconds_to_time(seconds INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE days INT DEFAULT 0;
  DECLARE hours INT DEFAULT 0;
  DECLARE minutes INT DEFAULT 0;
  DECLARE seconds_remaining INT DEFAULT 0;

  SET days = FLOOR(seconds / 86400);
  SET hours = FLOOR((seconds % 86400) / 3600);
  SET minutes = FLOOR((seconds % 3600) / 60);
  SET seconds_remaining = MOD(seconds, 60);

  RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds_remaining, ' seconds');
END $$
DELIMITER ;

CALL seconds_to_time(123456);

/* Задача 2
Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
 */

DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL even_numbers();
