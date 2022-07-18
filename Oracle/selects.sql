-- step 1) ȸ���� ���� �հ�
select custno, sum(price) from money_tbl_02 mt
group by custno;

-- step 2) ���� ���� Ȯ���ϱ�
select custno, sum(price) asum from money_tbl_02 mt
GROUP BY custno
ORDER BY asum desc;

-- step 3) custno �÷����� ���� 2)�� �����̺� �����Ͽ� ������ ��ü ��������
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