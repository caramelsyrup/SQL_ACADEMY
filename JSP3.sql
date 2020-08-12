insert into jstlmember values('11','pw11','name11');
insert into jstlmember values('12','pw12','name12');
insert into jstlmember values('13','pw13','name13');
insert into jstlmember values('14','pw14','name14');
insert into jstlmember values('15','pw15','name15');
commit;
select * from jstlmember;

select * from address;

select * from member;
commit;
delete from member where userid = 'abc';