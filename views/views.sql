
------employee
create view all_realtors as select * from employee where post='риэлтор';

create view all_agents as select * from employee where post='агент';

create view all_employee as select * from employee;


-----client

create view all_clients as select * from client;

    ------все клиенты, у которых есть недвижимость

create view client_with_realty as select client.id_client, client.full_name, client.mobile, client.address, client.passport from realty left join client on client.id_client=realty.id_owner;



--------------realty

create view all_arenda_apartment as select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_realty='квартира' and realty.type_of_transaction='аренда';

create view all_sale_apartment as select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_realty='квартира' and realty.type_of_transaction='продажа';

create view all_arenda_house as select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_realty='дом' and realty.type_of_transaction='аренда';

create view all_sale_house as select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_realty='дом' and realty.type_of_transaction='продажа';

create view all_arenda_land_plot as select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_realty='земельный участок' and realty.type_of_transaction='аренда';

create view all_sale_land_plot as select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_realty='земельный участок' and realty.type_of_transaction='продажа';


-----deal

create view all_deal as select * from deal;


          