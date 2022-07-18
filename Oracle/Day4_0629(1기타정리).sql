-- DDL : create, alter, drop, TRUNCATE
-- (´ë»óÀº user, table, sequence, view, .. ´Ü truncate´Â Å×ÀÌºí¸¸ »ç¿ë)
-- DML : insert, update, delete, 

-- drop ¿À·ù À¯Çü - ¿Ü·¡Å°¿¡ ÀÇÇØ ÂüÁ¶µÇ´Â °íÀ¯/ ±âº» Å°°¡ Å×ÀÌºí¿¡ ÀÖÀ» °æ¿ì

-- update Å×ÀÌºí¸í set ÄÃ·³¸í = ¯“, ÄÃ·³¸í = °ª, ÄÃ·³¸í = °ª,...
-- WHERE Á¶°ÇÄÃ·³ °ü°è½Ä
-- DELETE FROM Å×ÀÌºí¸í WHERE Á¶°ÇÄÃ·³°ü°Ô½Ä
-- ÁÖÀÇ ÇÒ Á¡ : UPDATE ¿Í delete ´Â where ¾øÀÌ »ç¿ëÇÏ´Â °ÍÀº À§ÇèÇÑ µ¿ÀÛ.
--			TRUNCATE ´Â ½ÇÇà Ãë¼Ò(rollback)ÇÒ ¼ö ¾ø±â ‹š¹®¿¡ DDL¿¡ ¼ÓÇÕ´Ï´Ù

UPDATE STUDENTS SET age = 17 WHERE stuno = 2021001;
-- UPDATE, delete, select ¿¡¼­ whereÀÇ ÄÃ·³ÀÌ ±âº»Å° ÄÃ·³ÀÌ¸é
--		½ÇÇàµÇ´Â °á°ú ¹Ý¿µµÇ´Â ÇàÀº ¸î°³ÀÏ±î¿ä? ÃÖ´ë 1°³
--		±âº»Å°ÀÇ ¸ñÀûÀº Å×ÀÌºíÀÇ ¿©·¯ÇàµéÀ» ±¸ºÐ(½Äº°)
SELECT * FROM STUDENTS s ;

-- rollback , commit Å×½ºÆ® (µ¥ÀÌÅÍº£ÀÌ½º ¸Þ´º¿¡¼­ Æ®·£Àè¼Ç ¸ðµå¸¦ manual·Î º¯°æÇÕ´Ï´Ù)
UPDATE STUDENTS SET ADDRESS = '¼ººÏ±¸',age= 16 WHERE STUNO = 2021001;
ROLLBACK; -- À§ÀÇ UPDATE ½ÇÇàÀ» Ãë¼Ò
UPDATE STUDENTS SET ADDRESS = '¼ººÏ±¸',age= 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS s ; -- '¼ººÏ±¸', 16¼¼·Î ¹Ý¿µµÊ
ROLLBACK;
SELECT * FROM STUDENTS s ; -- ÀÌ¹Ì commitÀÌ µÈ ¸í·É¾î´Â ROLLBACK ¸øÇÔ
-----------------------------------------------¿ä±îÀÌ
-- Æ®·£Àè¼Ç °ü¸®¸í·É : rollback, commit

DELETE FROM SCORES;
ROLLBACK;
DELETE FROM SCORES WHERE stuno = 2019019;
ROLLBACK;
SELECT * FROM SCORES;

-- ÀÌ ÆíÁý±â´Â Æ®·£Àè¼Ç ¼öµ¿ ¸ðµåÀÌ°í °°Àº Ã¢¿¡¼­´Â select °á°ú 2019019°¡ ¾ø½À´Ï´Ù
-- ´Ù¸¥ ÆíÁý±â´Â ´Ù¸¥ Å¬¶óÀÌ¾ðÆ®ÀÌ¹Ç·Î ÀÌÀü »óÅÂ(ÃÖÁ¾ Ä¿¹ÔÇÑ »óÅÂ)·Î º¸¿©Áý´Ï´Ù.
ROLLBACK;

TRUNCATE TABLE SCORES ; -- ¸ðµç µ¥ÀÌÅÍ¸¦ Áö¿ó´Ï´Ù ROLLBACK ¿©ºÎ È®ÀÎ?
						-- ´ä : rollback ºÒ°¡
--¸ðµç µ¥ÀÌÅÍ¸¦ Áö¿ï°ÍÀÌ È®½ÇÇÏ¸é ´Ù¸¥°Íµé°ú ¼¯¿©¼­ ·Ñ¹éµÇÁö ¾Ê°Ô È®½ÇÇÏ°Ô TRUNCATE ÇØ¶ó
----------------------------------------------------------
SELECT * FROM STUDENTS s ;
/*
 * 
 * insert
 * delete
 * commit;	
 * update
 * delete;
 * rollback;
 * insert;
 * insert;
 * rollback;
 * insert;
 * update;
 * commit;
 */



