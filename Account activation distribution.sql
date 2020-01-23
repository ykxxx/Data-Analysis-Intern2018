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
