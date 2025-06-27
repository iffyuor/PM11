SELECT ID_����_���������
FROM ����_���������
WHERE �������_�� < 5;


SELECT *
FROM �������
WHERE Email LIKE '%@mail.ru' AND ����������_���� LIKE '�%';

SELECT SUM(����������_��_������) AS �����_����������_�����
FROM �����;

SELECT *
FROM ���������
WHERE ������������ LIKE '����%' AND �������_��������� LIKE '�2%';

SELECT ����_����������
FROM �������_������������
WHERE ���_����������� = '��������� ����������';

SELECT ������������, ����_�������, ���������
FROM ������������
ORDER BY ����_������� ASC, ��������� ASC;


SELECT
    ���_�������,
    ����������,
    CASE
        WHEN ���������� > 1300 THEN '����� ��������'
        ELSE '����� � �����'
    END AS ������
FROM
    �����������������;


	WITH ������_�� AS (
    SELECT
        SUM(CASE WHEN p.���� = '1' THEN p.����_��_������� * d.���������� ELSE 0 END) AS ��_1_����,
        SUM(CASE WHEN p.���� = '2' THEN p.����_��_������� * d.���������� ELSE 0 END) AS ��_2_����
    FROM ��������� p
    JOIN ������� d ON p.ID_��������� = d.ID_���������
    WHERE p.������������ = '������ ��'
),
������_��� AS (
    SELECT
        SUM(CASE WHEN p.���� = '1' THEN p.����_��_������� * d.���������� ELSE 0 END) AS ���_1_����
    FROM ��������� p
    JOIN ������� d ON p.ID_��������� = d.ID_���������
    WHERE p.������������ = '������ ���'
)
SELECT
    (SELECT ��_1_���� FROM ������_��) AS ��_1_����,
    (SELECT ��_2_���� FROM ������_��) AS ��_2_����,
    (SELECT ���_1_���� FROM ������_���) AS ���_1_����,
    ((SELECT ��_1_���� FROM ������_��) + (SELECT ��_2_���� FROM ������_��)) - (SELECT ���_1_���� FROM ������_���) AS �������
FROM ������_��, ������_���
