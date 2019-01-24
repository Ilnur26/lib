-- Закрытие лек.схем со старыми КСГ
update [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]
set DateEnd1 = '20181231'
where KSG1 not like '%[A-Za-z]%' 
and DateEnd1 is null

update [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]
set DateEnd2 = '20181231'
where KSG2 not like '%[A-Za-z]%' 
and DateEnd2 is null

-- Добавление лек.схем с вкладки "МНН ЛП в сочетании с ЛТ"
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
			select	'mt001' as leksch,'доксорубицин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt002' as leksch,'капецитабин' as mnn,'ds19.011' as ksg1,'ds19.012' as ksg2,'ds19.013' as ksg3	union all
			select	'mt003' as leksch,'карбоплатин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt004' as leksch,'митомицин + капецитабин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt005' as leksch,'митомицин + фторурацил' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt006' as leksch,'паклитаксел + карбоплатин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt007' as leksch,'темозоломид' as mnn,'ds19.015' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt008' as leksch,'трастузумаб' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt009' as leksch,'трастузумаб + пертузумаб' as mnn,'ds19.014' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt010' as leksch,'фторурацил' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt011' as leksch,'цетуксимаб' as mnn,'ds19.015' as ksg1,'' as ksg2,'' as ksg3	union all
			select	'mt012' as leksch,'циклофосфамид + доксорубицин + цисплатин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt013' as leksch,'цисплатин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt014' as leksch,'цисплатин + доцетаксел' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt015' as leksch,'цисплатин + капецитабин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt016' as leksch,'цисплатин + фторурацил' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3	union all
			select	'mt017' as leksch,'этопозид + цисплатин' as mnn,'ds19.012' as ksg1,'ds19.013' as ksg2,'' as ksg3
		) ds
		union all
		select ks.leksch as code, ks.mnn as mnn
		, isnull(nullif(ks.ksg1, ''), '') + isnull(';' + nullif(ks.ksg2, ''), '') + isnull(';' + nullif(ks.ksg3, ''), '') + isnull(';' + nullif(ks.ksg4, ''), '') + isnull(';' + nullif(ks.ksg5, ''), '') as ksg1, '' as ksg2
		from 
		(
			select	'mt001' as leksch,'доксорубицин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt002' as leksch,'капецитабин' as mnn,'st19.049' as ksg1,'st19.050' as ksg2,'st19.051' as ksg3,'st19.052' as ksg4,'st19.053' as ksg5	union all
			select	'mt003' as leksch,'карбоплатин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt004' as leksch,'митомицин + капецитабин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt005' as leksch,'митомицин + фторурацил' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt006' as leksch,'паклитаксел + карбоплатин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt007' as leksch,'темозоломид' as mnn,'st19.055' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt008' as leksch,'трастузумаб' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt009' as leksch,'трастузумаб + пертузумаб' as mnn,'st19.054' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt010' as leksch,'фторурацил' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt011' as leksch,'цетуксимаб' as mnn,'st19.055' as ksg1,'' as ksg2,'' as ksg3,'' as ksg4,'' as ksg5	union all
			select	'mt012' as leksch,'циклофосфамид + доксорубицин + цисплатин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt013' as leksch,'цисплатин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt014' as leksch,'цисплатин + доцетаксел' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt015' as leksch,'цисплатин + капецитабин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt016' as leksch,'цисплатин + фторурацил' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5	union all
			select	'mt017' as leksch,'этопозид + цисплатин' as mnn,'st19.050' as ksg1,'st19.051' as ksg2,'st19.052' as ksg3,'st19.053' as ksg4,'' as ksg5
		) ks
	) t
	group by code, mnn
) res
where not exists(select* from [AKUZ].[T_MES_DRUG_THERAPY_SCHEME] m where m.Code = res.code)

-- Добавление лек.схем для доп.критерия
insert into [AKUZ].[T_MES_DRUG_THERAPY_SCHEME]([DrugTherapySchemeID], [Code], [Mnn], [Descr])
select newid(), t.code, '', t.descr
from 
(
	select 'it1' as code, 'SOFA не менее 5 и непрерывное проведение искусственной вентиляции легких в течение 72 часов и более, pSOFA не менее 4 и непрерывное проведение искусственной вентиляции легких в течение 72 часов и более' as descr
	union all
	select 'it2', 'Непрерывное проведение искусственной вентиляции легких в течение 480 часов и более' union all
	select 'rb2', '2 балла по шкале реабилитационной маршрутизации (ШРМ)' union all
	select 'rb3', '3 балла по шкале реабилитационной маршрутизации (ШРМ)' union all
	select 'rb4', '4 балла по шкале реабилитационной маршрутизации (ШРМ)' union all
	select 'rb5', '5 баллов по шкале реабилитационной маршрутизации (ШРМ)' union all
	select 'rb6', '6 баллов по шкале реабилитационной маршрутизации (ШРМ)' union all
	select 'rbs', 'Обязательное сочетание 2-х медицинских услуг: B05.069.005 «Разработка индивидуальной программы дефектологической реабилитации», B05.069.006 «Разработка индивидуальной программы логопедической реабилитации»'
) t
where not exists(select* from [AKUZ].[T_MES_DRUG_THERAPY_SCHEME] m where m.Code = t.code)