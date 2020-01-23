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
