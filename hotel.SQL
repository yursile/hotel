
insert into tb_customer(id,name,phone,password,IDCard,type,birthday,pic_id) VALUES (001,'旷宇','18580680138','safeandsound','500225199002133817',0,19920913,null);
insert into tb_hotel(id,name,address,phone,href,city,district) VALUES (001,'江北一店','江北嘴','023748594','fdsa','重庆','江北');
insert into tb_hotel(id,name,address,phone,href,city,district) VALUES (002,'江北二店','观音桥','023748804','dag','重庆','江北');
insert into tb_hotel(id,name,address,phone,href,city,district) VALUES (002,'江北三店','大石坝','023748804','dag','重庆','江北');
insert into tb_hotel(id,name,address,phone,href,city,district) VALUES (003,'南坪一店','万达广场','024348804','dag','重庆','南坪');
insert into tb_room(id,type,price,num,pic_id,hotel_id) values (001,'经济房',99,20,null,001);

insert into tb_room(id,type,price,num,pic_id,hotel_id) values (002,'传统大床房',199,20,null,001);
insert into tb_room(id,type,price,num,pic_id,hotel_id) values (003,'商务大床房',299,20,null,001);
insert into tb_room(id,type,price,num,pic_id,hotel_id) values (004,'商务大床房',299,20,null,002);
insert into tb_room(id,type,price,num,pic_id,hotel_id) values (005,'经济房',99,20,null,002);
insert into tb_room(id,type,price,num,pic_id,hotel_id) values (006,'传统大床房',199,20,null,002);
insert into tb_roomremain(id,room_id,day,remain)  values (001,001,20150411,30);
insert into tb_roomremain(id,room_id,day,remain)  values (002,001,20150412,30);
insert into tb_roomremain(id,room_id,day,remain)  values (003,001,20150413,30);
insert into tb_roomremain(id,room_id,day,remain)  values (004,001,20150414,30);

insert into tb_roomremain(id,room_id,day,remain)  values (005,002,20150411,30);
insert into tb_roomremain(id,room_id,day,remain)  values (006,002,20150412,0);
insert into tb_roomremain(id,room_id,day,remain)  values (007,002,20150413,30);
insert into tb_roomremain(id,room_id,day,remain)  values (008,002,20150414,30);

insert into tb_roomremain(id,room_id,day,remain)  values (009,005,20150411,30);
insert into tb_roomremain(id,room_id,day,remain)  values (010,005,20150412,0);
insert into tb_roomremain(id,room_id,day,remain)  values (011,005,20150413,30);
insert into tb_roomremain(id,room_id,day,remain)  values (012,005,20150414,30);