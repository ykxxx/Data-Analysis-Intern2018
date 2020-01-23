--+15日功能留存率
set hive.execution.engine=mr;
select COUNT(tb0.uid) as day0,
COUNT(tb1.uid) as day1,
COUNT(tb2.uid) as day2,
COUNT(tb3.uid) as day3,
COUNT(tb4.uid) as day4,
COUNT(tb5.uid) as day5,
COUNT(tb6.uid) as day6,
COUNT(tb7.uid) as day7,
COUNT(tb8.uid) as day8,
COUNT(tb9.uid) as day9,
COUNT(tb10.uid) as day10,
COUNT(tb11.uid) as day11,
COUNT(tb12.uid) as day12,
COUNT(tb13.uid) as day13,
COUNT(tb14.uid) as day14,
COUNT(tb15.uid) as day15
from
(
  select distinct uid from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180614'
) tb0
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180615'
) tb1
on tb0.uid = tb1.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180616'
) tb2
on tb0.uid = tb2.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180617'
) tb3
on tb0.uid = tb3.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180618'
) tb4
on tb0.uid = tb4.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180619'
) tb5
on tb0.uid = tb5.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180620'
) tb6
on tb0.uid = tb6.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180621'
) tb7
on tb0.uid = tb7.uid
left join
(
 select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180622'
) tb8
on tb0.uid = tb8.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180623'
) tb9
on tb0.uid = tb9.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180624'
) tb10
on tb0.uid = tb10.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180625'
) tb11
on tb0.uid = tb11.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180626'
) tb12
on tb0.uid = tb12.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180627'
) tb13
on tb0.uid = tb13.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180630'
) tb14
on tb0.uid = tb14.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate = '20180701'
) tb15
on tb0.uid = tb15.uid

--+4周功能留存率
set hive.execution.engine=mr;
select COUNT(tb0.uid) as week0,
COUNT(tb1.uid) as week1,
COUNT(tb2.uid) as week2,
COUNT(tb3.uid) as week3,
COUNT(tb4.uid) as week4,
from
(
  select distinct uid from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate >= '20180611' and pdate <= '20180617'
) tb0
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate >= '20180618' and pdate <= '20180624'
) tb1
on tb0.uid = tb1.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate >= '20180625' and pdate <= '20180701'
) tb2
on tb0.uid = tb2.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate >= '20180702' and pdate <= '20180708'
) tb3
on tb0.uid = tb3.uid
left join
(
  select distinct uid  from ossp_operationlog_inter
  where opcode = 'FT10503'
  and bizid = '100ime'
  and osid = 'android'
  and pdate >= '20180709' and pdate <= '20180715'
) tb4
on tb0.uid = tb4.uid

--新增用户+15日用户留存率
set hive.execution.engine=mr;
select COUNT(tb0.uid) as day0,
COUNT(tb1.uid) as day1,
COUNT(tb2.uid) as day2,
COUNT(tb3.uid) as day3,
COUNT(tb4.uid) as day4,
COUNT(tb5.uid) as day5,
COUNT(tb6.uid) as day6,
COUNT(tb7.uid) as day7,
COUNT(tb8.uid) as day8,
COUNT(tb9.uid) as day9,
COUNT(tb10.uid) as day10,
COUNT(tb11.uid) as day11,
COUNT(tb12.uid) as day12,
COUNT(tb13.uid) as day13,
COUNT(tb14.uid) as day14,
COUNT(tb15.uid) as day15 from (
select uid from samedayuser2)tb0
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180603')tb1
on tb0.uid = tb1.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180604')tb2
on tb0.uid = tb2.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180605')tb3
on tb0.uid = tb3.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180606')tb4
on tb0.uid = tb4.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180607')tb5
on tb0.uid = tb5.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180608')tb6
on tb0.uid = tb6.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180609')tb7
on tb0.uid = tb7.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180610')tb8
on tb0.uid = tb8.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180611')tb9
on tb0.uid = tb9.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180612')tb10
on tb0.uid = tb10.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180613')tb11
on tb0.uid = tb11.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180614')tb12
on tb0.uid = tb12.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180615')tb13
on tb0.uid = tb13.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180616')tb14
on tb0.uid = tb14.uid
left join (
select uid from ossp_activeuserdetail
where proc_date = '20180617')tb15
on tb0.uid = tb15.uid;

--激活天数分布
--num_days:激活时间据离新增日天天数
select x.num_days, count(distinct(x.uid)) from (
select a.uid, datediff(to_date(from_unixtime(UNIX_TIMESTAMP(firstdate,'yyyyMMdd'))), to_date(from_unixtime(UNIX_TIMESTAMP(proc_date,'yyyyMMdd')))) as num_days
from (
select uid, min(pdate) as firstdate
from ossp_operationlog_inter
where pdate >= '20180614' and pdate <= '20180714'
  and opcode = 'FT10503'
  and version = '8.1.7000'
  and bizid = '100ime'
  and osid = 'android'
  group by uid)a
inner join (
select proc_date, uid from ossp_newuserinfo
where bizid = '100ime' and osid = 'android'
  and proc_date = '20180614' and version = '8.1.7000')b
on a.uid = b.uid
where firstdate is not null)x
group by num_days;

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
