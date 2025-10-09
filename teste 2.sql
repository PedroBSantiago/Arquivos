SELECT * FROM joi.vv_d_assinante;

start transaction;
insert into cidade values (8,'banana');
insert into cidade values (9,'manga');
insert into cidade values (10,'sorocaba');
select * from cidade;
savepoint pt1;
insert into cidade values (11,'josabiu');
insert into cidade values (12,'gu');
insert into cidade values (13,'morango');
select * from cidade;
rollback to pt1;









