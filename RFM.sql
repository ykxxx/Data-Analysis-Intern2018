
--RFM模型
create table rfm_table as
select a.uid, brand, model, recent_date, rscore, frequency, fscore, monetary, mscore from (
select distinct uid, brand, province, apcode, ip from ossp_useroperation
where proc_date >= '20180627' and proc_date <= '20180703'
  and osid = 'android' and bizid = '100ime')a
left join (
select uid, max(proc_date) as recent_date,
case when max(proc_date) >= '20180627' and max(proc_date) <= '20180724' then 0
when max(proc_date) >= '20180725' then 1 end as rscore
from ossp_useroperation
where proc_date >= '20180627'
group by uid)b
on a.uid = b.uid
left join (
select uid, count(uid) as frequency,
case when count(uid) < 50 then 0 when count(uid) >= 50 then 1 end as fscore
from ossp_useroperation
where proc_date >= '20180627' and proc_date <= '20180726'
group by uid)c
on a.uid = c.uid
left join (
select uid, count(uid) as monetary,
case when count(uid) < 200 then 0 when count(uid) >= 200 then 1 end as mscore
from ossp_useroperation
where proc_date >= '20180101'
group by uid)d
on a.uid = d.uid

--城市分布
select province, count(distinct(uid)) as total_user, count(uid) as total_time
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1
group by province

--平均时长
select time_level, count(b.uid) as total_time, count(distinct(b.uid)) as total_user from (
select a.uid, case when time_length is null then 'null' when time_length == 0 then '00'
when time_length > 0 and time_length < 5 then '00~05'
when time_length >= 5 and time_length < 10 then '05~10'
when time_length >= 10 and time_length < 30 then '10~30'
when time_length >= 30 and time_length < 60 then '30~60'
when time_length >= 60 and time_length < 600 then '60~600'
when time_length >= 600  then '600以上' end as time_level from (
select uid,  (cast(substring(end_time, 13) as int) - cast(substring(start_time, 13) as int))
 + (cast(substring(end_time, 11, 2) as int) - cast(substring(start_time, 11, 2) as int)) * 60 as time_length
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1)a)b
group by time_level

--使用时间分布
select start_hour, count(a.uid) as total_time, count(distinct(a.uid)) as total_user from (
select uid, substring(start_time, 9, 2) as start_hour
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1)a
group by start_hour

--渠道分布
select fchan, count(uid) as total_time, count(distinct(uid)) as total_user from (
select distinct uid, df
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1)a
left join (
select fdf, fchan from dfdata)b
on a.df = b.fdf
group by fchan

--TOP100品牌分布
select brand, count(uid) as total_time, count(distinct(uid)) as total_user
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1
group by brand
order by total_user desc limit 100;

--apcode
select apcode, count(uid) as total_time, count(distinct(uid)) as total_user
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1
group by apcode

--ip地址数量分布
select ip_num, count(distinct(uid)) as total_user from (
select uid, count(distinct(ip)) as ip_num
from rfm_table
where rscore = 1 and fscore = 1 and mscore = 1
group by uid)a
group by ip_num
