-- �������� ���.���� �� ������� ���
update [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]
set DateEnd1 = '20181231'
where KSG1 not like '%[A-Za-z]%' 
and DateEnd1 is null

update [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]
set DateEnd2 = '20181231'
where KSG2 not like '%[A-Za-z]%' 
and DateEnd2 is null

-- ���������� ���.���� � ������� "��� �� � ��������� � ��"
insert into [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]([DrugTherapySchemeID], [Code], [Mnn], [Descr], [KSG1], [KSG2])
select newid(), res.code, res.mnn, '', res.ksg1, res.ksg2
from
(
	select code, mnn, max(ksg1) as ksg1, max(ksg2) as ksg2
	from
	(
		select ds.leksch as code, ds.mnn as mnn, '' as ksg1, isnull(nullif(ds.ksg1, ''), '') + isnull(';' + nullif(ds.ksg2, ''), '') + isnull(';' + nullif(ds.ksg3, ''), '') as ksg2
		from
		(
			select	'mt001' as leksch,'������������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt002' as leksch,'�����������' as mnn,'ds19.011' as ksg1,'ds19.012' as ksg2,'ds19.013' as ksg3	union all
			select	'mt003' as leksch,'�����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt004' as leksch,'��������� + �����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt005' as leksch,'��������� + ����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt006' as leksch,'����������� + �����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt007' as leksch,'�����������' as mnn,'ds19.015' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt008' as leksch,'�����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt009' as leksch,'����������� + ����������' as mnn,'ds19.014' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt010' as leksch,'����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt011' as leksch,'����������' as mnn,'ds19.015' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt012' as leksch,'������������� + ������������ + ���������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt013' as leksch,'���������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt014' as leksch,'��������� + ����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt015' as leksch,'��������� + �����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt016' as leksch,'��������� + ����������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt017' as leksch,'�������� + ���������' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3
		) ds
		union all
		select ks.leksch as code, ks.mnn as mnn
		, isnull(nullif(ks.ksg1, ''), '') + isnull(';' + nullif(ks.ksg2, ''), '') + isnull(';' + nullif(ks.ksg3, ''), '') + isnull(';' + nullif(ks.ksg4, ''), '') + isnull(';' + nullif(ks.ksg5, ''), '') as ksg1, '' as ksg2
		from 
		(
			select	'mt001' as leksch,'������������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt002' as leksch,'�����������' as mnn,'st19.049' as ksg1,'st19.050' as ksg2,'st19.051' as ksg3,'st19.052' as ksg4,'st19.053' as ksg5	union all
			select	'mt003' as leksch,'�����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt004' as leksch,'��������� + �����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt005' as leksch,'��������� + ����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt006' as leksch,'����������� + �����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt007' as leksch,'�����������' as mnn,'st19.055' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt008' as leksch,'�����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt009' as leksch,'����������� + ����������' as mnn,'st19.054' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt010' as leksch,'����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt011' as leksch,'����������' as mnn,'st19.055' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt012' as leksch,'������������� + ������������ + ���������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt013' as leksch,'���������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt014' as leksch,'��������� + ����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt015' as leksch,'��������� + �����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt016' as leksch,'��������� + ����������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt017' as leksch,'�������� + ���������' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5
		) ks
	) t
	group by code, mnn
) res
where not exists(select* from [AKUZ].[T_MES_DRUG_THERAPY_SCHEME] m where m.Code = res.code)

-- ���������� ���.���� ��� ���.��������
insert into [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]([DrugTherapySchemeID], [Code], [Mnn], [Descr])
select newid(), t.code, '', t.descr
from 
(
	select 'it1' as code, 'SOFA �� ����� 5 � ����������� ���������� ������������� ���������� ������ � ������� 72 ����� � �����, pSOFA �� ����� 4 � ����������� ���������� ������������� ���������� ������ � ������� 72 ����� � �����' as descr
	union all
	select 'it2', '����������� ���������� ������������� ���������� ������ � ������� 480 ����� � �����' union all
	select 'rb2', '2 ����� �� ����� ���������������� ������������� (���)' union all
	select 'rb3', '3 ����� �� ����� ���������������� ������������� (���)' union all
	select 'rb4', '4 ����� �� ����� ���������������� ������������� (���)' union all
	select 'rb5', '5 ������ �� ����� ���������������� ������������� (���)' union all
	select 'rb6', '6 ������ �� ����� ���������������� ������������� (���)' union all
	select 'rbs', '������������ ��������� 2-� ����������� �����: B05.069.005 ����������� �������������� ��������� ����������������� ������������, B05.069.006 ����������� �������������� ��������� �������������� ������������'
) t
where not exists(select* from [AKUZ].[T_MES_DRUG_THERAPY_SCHEME] m where m.Code = t.code)