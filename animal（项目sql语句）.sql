create tablespace animal datafile 'C:/Users/admin/Desktop/xiaodongwu/animal.dbf'size 10m 
alter user system default tablespace animal
--------------------------------------------------------------------------------------------
/*
动物品种(animal_variety)：
  品种编号(varietyId)
  品种名((varietyName)
*/
create sequence animal_variety_seq start with 1 increment by 1;
create table animal_variety
(
       varietyId int,
       varietyName varchar2(20),
       constraint pk_animal_variety primary key(varietyId)
)
/*
动物信息(animal)：
  编号(animalId)
  姓名（name）
  类别名（typeName）
  品种编号(varietyId)
  性别(sex)
  年龄（age）
  收留时间(adopt_time)
  动物介绍（introduction）
  是否被领养(flag)：0被领养 1未被领养
  动物图片（picture）
*/
create sequence animal_seq start with 1 increment by 1;
create table animal
(
       animalId int,
       name varchar2(20),
       typeName varchar2(20),
       varietyId int,
       sex varchar2(20),
       age int,
       adopt_time date,
       introduction clob,
       flag int,
       picture varchar2(20),
       constraint pk_animal primary key(animalId)
)
drop table animal
/*
领养申请表（apply）
  申请编号(applyId)
  申请人姓名(applyName)
  申请动物编号(animalId)
  申请人家庭地址（address）
  申请人电话（applyPhone）
  申请理由（applyReason）
  申请状态（applyFlag）:0正在处理 1通过 2不通过 
*/
create sequence applyl_seq start with 1 increment by 1;
create table apply
(
       applyId int,
       applyName varchar2(20),
       animalId int,
       address varchar2(20),
       applyPhone varchar2(20),
       applyReason clob,
       applyFlag int,
       constraint pk_apply primary key(applyId),
       constraint fk_apply foreign key(animalId) references animal(animalId)
)
drop table apply
/*
志愿者表（volunteer）
  志愿者编号(volunteerId)  
  姓名（volunteerName）
  地址（address）
  手机（phone）
  邮箱（email）
  性别（sex）
  生日（birthday）
  学历（education）
  希望从事工作（exceptWork）
  审核状态（flag）：0正在处理 1通过 2不通过 
*/
create sequence volunteer_seq start with 1 increment by 1;
create table volunteer
(
       volunteerId int,
       volunteerName varchar2(20),
       address varchar2(20),
       phone varchar2(20),
       email varchar2(20),
       sex varchar2(20),
       birthday date,
       education varchar2(20),
       exceptWork clob,
       flag int,
       constraint pk_volunteer primary key(volunteerId)
)
alter table volunteer modify address varchar2(200)
/*
新闻表(news)
  新闻编号（newsId）
  新闻标题（newsTitle）
  发布时间（newsTime）
  内容（content） 
*/
create sequence news_seq start with 1 increment by 1;
create table news
(
       newsId int,
       newsTitle varchar2(20),
       newsTime date,
       content clob,
       constraint pk_news primary key(newsId)
       
)
drop table news
/*
协会动态表(association)
  协会动态编号（a_Id）
  协会动态标题（a_Title）
  发布时间（a_Time）
  活动图片（a_Image）
  内容（a_content）
*/
create sequence association_seq start with 1 increment by 1;
create table association
(
     a_Id int,
     a_Title varchar2(20),
     a_Time date,
     a_Image varchar2(20),
     a_content clob,
     constraint pk_association primary key(a_Id)

)
/*
捐赠表（donate）
  捐赠编号（donateId）
  捐赠金额（donatemoney）
  姓名(donatename)
  头像（donateImage）
  邮箱（email）
  手机（phone）
  留言（message）   
  捐赠时间（donateDate）
*/
create sequence donate_seq start with 1 increment by 1;
create table donate
(
     donateId int,
     donatemoney float,
     donatename varchar2(20),
     donateImage varchar2(20),
     email varchar2(20),
     phone varchar2(20),
     message clob,
     donateDate date,
     constraint pk_donate primary key(donateId)
)
/*
赞助商表（partner）
  赞助商编号（p_Id）
  赞助商图片（p_logo）
  赞助商名称（p_Name）
*/
create sequence partner_seq start with 1 increment by 1;
create table partner
(
     p_Id int,
     p_logo varchar2(20),
     p_Name varchar2(20),
     constraint pk_partner primary key(p_Id)
)

/*
志愿者活动表（activity）
  活动编号（activityId）
  活动名（activityName）
  活动时间（activityTime）
  活动内容（content）
*/
create sequence activity_seq start with 1 increment by 1;
create table activity
(
     activityId int,
     activityName varchar2(20),
     activityTime date,
     content varchar2(20),
     constraint pk_activity primary key(activityId)
)
drop table activity
/*
用户表(user)：
  用户编号(userId)
  用户名(userName)
  密码(pwd)
  地址（address）
  真实姓名（realname）
  手机（phone）
  生日（birthday）
  邮箱（email）
  是否为员工（flag）
*/
create sequence user_seq start with 1 increment by 1;
create table user_
(
     userId int,
     userName varchar2(20),
     pwd varchar2(20),
     address varchar2(20),
     realname varchar2(20),
     phone varchar2(20),
     birthday date,
     email varchar2(20),
     flag int,
     constraint pk_user primary key(userId)
)
/*员工表(emp)：
  员工编号（empId）
  员工姓名（empName）
  性别（sex）
  入职时间（hireTime）
*/
create sequence emp_seq start with 1 increment by 1;
create table emp
(
     empId int,
     empName varchar2(20),
     sex varchar2(20),
     pwd varchar2(20),
     hireTime date,
     constraint pk_emp primary key(empId)
)

create sequence message_seq start with 1 increment by 1;
create table message
(
       messageId int,
       name varchar2(20),
       phone varchar2(20),
       content clob,
       messageTime date,
       flag int,
       constraint pk_message primary key( messageId)
)
delete from message+
drop table message
----------------------------------------------------------------------------------------------
select * from animal_variety;
select * from animal;
select * from apply;
select * from volunteer;
select * from news;
select * from association;
select * from donate;         
select * from partner;
select * from activity;
select * from user_;
select * from emp;
commit 
delete from volunteer where volunteerid=44
delete from animal where animalid=101
delete from activity where activityid=21
update volunteer set flag=2 where volunteerid=3
select count(*) from activity where activitytime <= sysdate

create sequence unhappen_seq start with 1 increment by 1;
create table unhappen
(
       unhappenId int,
       title varchar2(100),
       happentime date,
       content clob,
       constraint pk_unhappen primary key(unhappenId)
)
create sequence attendactivity_seq start with 1 increment by 1;
create table attendactivity
(
       attendactivityId int,
       name varchar2(20),
       phone varchar2(20),
       unhappenId int,
       constraint pk_attendactivity primary key(attendactivityId),
       constraint fk_attendactivity foreign key(unhappenId) references unhappen(unhappenId)
)
drop table attendactivity

insert into unhappen values(unhappen_seq.nextval,'志愿者联盟活动（101期）',to_date('2017-11-15','yyyy-mm-dd'),'清理基地外区狗屋卫生');

insert into unhappen values(unhappen_seq.nextval,'志愿者联盟活动（102期）',to_date('2017-12-15','yyyy-mm-dd'),'清理基地内区狗屋卫生');

insert into unhappen values(unhappen_seq.nextval,'基地新年活动',to_date('2018-01-01','yyyy-mm-dd'),'基地参观，志愿者之间相互交流');
select * from attendactivity
select * from unhappen
delete from attendactivity
delete from news where newsid=22

delete from 


select count(*) from animal
select count(*) from animal where flag=0

select * from(
select * from association order by a_time desc)where rownum=1

select * from(
select * from news order by newstime desc)where rownum between 1 and 6

select varietyname from animal_variety where varietyid=1

insert into apply(applyid,applyname,animalid,address,applyphone,applyreason,applyflag) 
values(applyl_seq.nextval,'丽丽','3','我问问','17706248839','我爱我家',0)

delete from apply where applyid=41

select count(*) from donate
select sum(donatemoney) from donate

delete from association where a_id>10
insert into donate values(donate_seq.nextval,5000,'lili','4.gif','418825364@qq.com','17706248839','dsfdsvxczvxcvcxs',sysdate)
delete from donate where donateid=11
commit




