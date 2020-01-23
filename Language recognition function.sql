create table userstate(uid string, total int, success int, cancel int, fail int)
row format delimited fields terminated by '~' ;
load data inpath '/project/ydhl_uba_input/kxyang/userstateinfo/part-r-00000' into table userstate;

create table userstate0 as
select uid, success, cancel, fail, total, total_level, success_rate,
case when success_rate <= 0.2 then '成功率0%-20%'
when success_rate > 0.2 and rate <= 0.4 then '成功率20%-40%'
when success_rate > 0.4 and rate <= 0.6 then '成功率40%-60%'
when success_rate > 0.6 and rate <= 0.8 then '成功率60%-80%'
when success_rate > 0.8 and rate <= 1 then '成功率80%-100%' end as success_level
from (
select uid, success, cancel, fail, success + cancel + fail as total,  cast(success as double) / cast(success + cancel + fail as double) as success_rate,
case when success + cancel + fail == 1 then '01' when success + cancel + fail > 1 and success + cancel + fail <= 5 then '01~05次'
when success + cancel + fail > 5 and success + cancel + fail <= 10 then '05~10次'
when success + cancel + fail > 10 and success + cancel + fail <= 20 then '10~20次'
when success + cancel + fail > 20 and success + cancel + fail <= 30 then '20~30次'
when success + cancel + fail > 30 and success + cancel + fail <= 40 then '30~40次'
when success + cancel + fail > 40 and success + cancel + fail <= 50 then '40~50次'
when success + cancel + fail > 50 then '50次以上' end as total_level,
from userstate)a
where success_rate is not null;

--不同语音使用总次数的人使用语音成功率人数分布
select total_level, succuess_rate, count(distinct(uid)) as num_user
from userstate0
group by total_level, success_rate

--不同语音使用总次数的人使用语音失败率人数分布
select total_level, fail_level, count(distinct(a.uid)) as num_user from (
select uid, total_level, total, rate, fail, failure / total as fail_rate,
case when failure / total == 0 then '0%' when failure / total == 1 then '失败率100%'
when failure / total > 0 and failure / total <= 0.2 then '失败率0-20%'
when failure / total > 0.2 and failure / total <= 0.4 then '失败率20-40%'
when failure / total > 0.4 and failure / total <= 0.6 then '失败率40-60%'
when failure / total > 0.6 and failure / total <= 0.8 then '失败率60-80%'
when failure / total > 0.8 and failure / total < 1 then '失败率80-100%' end as fail_level
from userstate0)a
group by total_level, fail_level;

--不同语音使用总次数的人使用语音取消率人数分布
select total_level, cancel_level, count(distinct(a.uid)) as num_user from
select uid, total_level, total, rate, cancel, cancel/total as cancel_rate,
case when cancel / total == 0 then '取消率0%' when cancel / total == 1 then '取消率100%'
when cancel / total > 0 and cancel / total <= 0.2 then '取消率0-20%'
when cancel / total > 0.2 and cancel / total <= 0.4 then '取消率20-40%'
when cancel / total > 0.4 and cancel / total <= 0.6 then '取消率40-60%'
when cancel / total > 0.6 and cancel / total <= 0.8 then '取消率60-80%'
when cancel / total > 0.8 and cancel / total < 1 then '取消率80-100%' end as cancel_level
from userstate0)a
group by total_level, cancel_level
