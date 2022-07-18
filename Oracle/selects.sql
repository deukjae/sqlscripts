-- step 1) 회원별 매출 합계
select custno, sum(price) from money_tbl_02 mt
group by custno;

-- step 2) 정렬 기준 확인하기
select custno, sum(price) asum from money_tbl_02 mt
GROUP BY custno
ORDER BY asum desc;

-- step 3) custno 컬럼으로 스텝 2)와 고객테이블 조인하여 고객정보 전체 가져오기
SELECT * FROM MEMBER_TBL_02 mt,
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno;

SELECT * FROM MEMBER_TBL_02 mt JOIN
		(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt
		GROUP BY CUSTNO
		ORDER BY asum desc) sale
ON mt.CUSTNO = sale.custno;