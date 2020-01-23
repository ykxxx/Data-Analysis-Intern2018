--6月1日新增皮肤用户使用皮肤的记录
create table skin_newuser as
select a.uid, pdate, starttime, skin_type, skinid from (
select distinct uid from ossp_newuserinfo
where bizid = '100ime' and osid = 'android'
  and pdate = '20180601')a
inner join (
select uid, pdate, starttime, tags['d_skinid'] as skinid,
case when substring(tags['d_skinid'], 0, 12) == 'user-defined' then 'user-defined'
when (tags['d_skinid'] = 'fb8f9b60-b83c-11e6-9598-0800200c9a66' or tags['d_skinid'] = 'dd0bed70-bd18-11e6-9598-0800200c9a66') then 'default'
else 'download' end as skin_type
from ossp_operationlog_inter
where bizid = '100ime' and osid = 'android' and opcode = 'FT02001'
  and pdate >= '20180601' and pdate <= '20180607')b
on a.uid = b.uid

--每个新增用户使用自定义/下载/分享皮肤的个数及次数
--create table skin_newuser_data as
select a.uid, case when userdefine_num is null then "下载皮肤" when download_num is null then "自定义皮肤" else "自定义+下载皮肤" end as user_type,
if (userdefine_num is null, 0, userdefine_num) as userdefine_num, if (download_num is null, 0, download_num) as download_num,
if (userdefine_time is null, 0, userdefine_time) as userdefine_time, if (download_time is null, 0, download_time) as download_time,
if (default_time is null, 0, default_time) as default_time, if (default_num is null, 0, default_num) as default_num
from (
select distinct uid from skinuser)a
left join (
select uid, count(uid) as userdefine_time, count(distinct(skinid)) as userdefine_num
from skinuser
where skin_type = 'user-defined'
group by uid)b
on a.uid = b.uid
left join (
select uid, count(uid) as download_time, count(distinct(skinid)) as download_num
from skinuser
where skin_type = 'download'
group by uid)c
on a.uid = c.uid
left join (
select uid, count(uid) as default_time, count(distinct(skinid)) as default_num
from skinuser
where skin_type = 'default'
group by uid)d
on a.uid = d.uid

--使用不同皮肤的用户群体人数
select user_type, count(distinct(uid)) as num_user
from skin_newuser_data
group by user_type;

--皮肤新用户功能留存信息
--皮肤功能留存：用户一周内最后一次启用的不是默认皮肤
create table skin_newuser_state as
select x.uid, pdate, starttime, skin_type, skinid user_state, last_use from (
select * from skin_newuser)x
left join (
select a.uid, user_state, last_use from (
select uid, max(starttime) as last_use from skin_newuser
group by uid)a
left join (
select uid, starttime,
case when (skinid = 'fb8f9b60-b83c-11e6-9598-0800200c9a66' or skinid = 'dd0bed70-bd18-11e6-9598-0800200c9a66') then "流失"
else "留存" end as user_state
from skin_newuser)b
on a.uid = b.uid and a.last_use = b.starttime)y
on x.uid = y.uid

--皮肤新增用户+7日功能留存率
select user_state, pdate, count(distinct(uid)) as num_user
from skin_newuser_state
group by user_state, pdate

--单个下载皮肤在一周内被用户最后一次启用次数&启用总次数
insert overwrite directory '/project/ydhl_uba_input/kxyang/last_skinid'
select a.skinid, last_time, total_time from (
select skinid, count(distinct(uid)) as last_time from skin_newuser
where starttime = last_use and substring(skinid, 0, 12) != 'user-defined'
group by skinid)a
inner join (
select skinid, count(distinct(uid)) as total_time from skin_newuser
where substring(skinid, 0, 12) != 'user-defined'
group by skinid)b
on a.skinid = b.skinid
order by last_time desc

--单个下载皮肤浏览/下载/分享的人数和次数
--create table temp_skinuserid as
select a.resid, browse_time, browse_user, download_time, download_user, share_time, share_user from (
select resid, count(uid) as browse_time, count(distinct(uid)) as browse_user
from ossp_reslinkaccess os
where bizid = '100ime' and osid = 'android'
  and genreid = 7 and proc_date >= '20180601' and proc_date <= '20180607'
  and action = 'browse'
  and uid in (select uid from skinuser_data)
group by resid)a
left join (
select resid, count(uid) as download_time, count(distinct(uid)) as download_user
from ossp_reslinkaccess os
where bizid = '100ime' and osid = 'android'
  and genreid = 7 and proc_date >= '20180601' and proc_date <= '20180607'
  and action = 'download'
  and uid in (select uid from skinuser_data)
group by resid)b
on a.resid = b.resid
left join (
select resid, count(uid) as share_time, count(distinct(uid)) as share_user
from ossp_reslinkaccess os
where bizid = '100ime' and osid = 'android'
  and genreid = 7 and proc_date >= '20180601' and proc_date <= '20180607'
  and action = 'share'
  and uid in (select uid from skinuser_data)
group by resid)c
on a.resid = c.resid
