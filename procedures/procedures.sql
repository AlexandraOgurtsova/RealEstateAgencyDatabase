
create or replace procedure add_apartment(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number)
 is 
  id_o number;
  id_r number;
 begin
  select id_client into id_o from client where full_name like '%'||owner||'%' and mobile=mobileP; 
  insert into realty(id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(id_o, 'квартира', type_of_transactionP , districtP, addressP, priceP);
  select id_realty into id_r from realty where id_owner=id_o and address=addressP;
  insert into apartment(id_apartment, number_of_rooms, square, building_material, year_of_construction, floor)
               values(id_r, number_of_roomsP, squareP, building_materialP, year_of_constructionP, floorP);
 exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



create or replace procedure add_house(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number)
 is 
  id_o number;
  id_r number;
 begin
  select id_client into id_o from client where full_name like '%'||owner||'%' and mobile=mobileP; 
  insert into realty(id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(id_o, 'дом', type_of_transactionP , districtP, addressP, priceP);
  select id_realty into id_r from realty where id_owner=id_o and address=addressP;
  insert into house(id_house, number_of_rooms, number_of_floors, land_area, house_area, building_material, year_of_construction)
               values(id_r, number_of_roomsP, number_of_floorsP, land_areaP, house_areaP, building_materialP, year_of_constructionP);
 exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end; 
 



create or replace procedure add_land_plot(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, areaP in number)
 is 
  id_o number;
  id_r number;
 begin
  select id_client into id_o from client where full_name like '%'||owner||'%' and mobile=mobileP; 
  insert into realty(id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(id_o, 'земельный участок', type_of_transactionP , districtP, addressP, priceP);
  select id_realty into id_r from realty where id_owner=id_o and address=addressP;
  insert into land_plot(id_land_plot, area)
               values(id_r, areaP);
 exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end; 
 


create or replace procedure add_client(full_nameP in varchar, mobileP in varchar, addressP in varchar, passportP in varchar)
  is
  dubl_passport exception;
  pragma exception_init(dubl_passport, -1);
  begin
   insert into client(full_name, mobile, address, passport)
                values(full_nameP, mobileP, addressP, passportP);
exception
    when dubl_passport then
      dbms_output.put_line('Паспорт уже зарегистрирован');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure add_client;




create or replace procedure add_employee(surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in date, date_of_hiringP in date, addressP in varchar, mobileP in varchar, salaryP in number)
 is
 begin
  insert into employee(surname, name, second_name, post,  date_of_birth, date_of_hiring, address, mobile, salary)
            values(surnameP, nameP, second_nameP, postP, date_of_birthP, date_of_hiringP, addressP, mobileP, salaryP);
exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;




create or replace procedure add_deal(id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number)
 is
  id_e number;
  id_s number;
  id_b number;
  dubl_realty exception;
  pragma exception_init(dubl_realty, -1);
 begin
  select id_employee into id_e from employee where surname=employeeP and name=employeeNameP;
  select id_owner into id_s from realty where id_realty = id_realtyP;
  select id_client into id_b from client where full_name like '%'||buyerP||'%' and mobile=buyerMobileP;
  insert into deal(id_realty, id_employee, seller, buyer, date_of_deal, sum_of_deal)
               values(id_realtyP, id_e, id_s, id_b, date_of_dealP, sum_of_dealP);
 exception
    when dubl_realty then
      dbms_output.put_line('Эта недвижимость уже продана');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;





----------------изменить клиента

create or replace procedure alter_client(numberP in number, full_nameP in varchar,  mobileP in varchar, addressP in varchar, passportP in varchar)
  is
  dubl_passport exception;
  pragma exception_init(dubl_passport, -1);
  begin
   update client set full_name=full_nameP, mobile=mobileP, address=addressP, passport=passportP where id_client=numberP;
  exception
    when dubl_passport then
      dbms_output.put_line('Паспорт уже зарегистрирован');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;

  
  
----------зменить сотрудника по номеру

create or replace procedure alter_employee(numberP in number, surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in varchar, date_of_hiringP in varchar, addressP in varchar, mobileP in varchar, salaryP in number)
  is
  begin
   update employee set surname=surnameP, name=nameP, second_name=second_nameP, post=postP, date_of_birth=date_of_birthP, date_of_hiring=date_of_hiringP, address=addressP, mobile=mobileP, salary=salaryP where id_employee=numberP;
    exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;

  
  
  
  -----------изменить квартиру по номеру(роверить работу)
  
  create or replace procedure alter_apartment(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update apartment set number_of_rooms=number_of_roomsP, square=squareP, building_material=building_materialP, year_of_construction=year_of_constructionP, floor=floorP where id_apartment=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  

  
  
  ---------изменить дом но коду(проверить)
  
    create or replace procedure alter_house(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in varchar, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update house set number_of_rooms=number_of_roomsP, number_of_floors=number_of_floorsP, land_area=land_areaP, house_area=house_areaP, building_material=building_materialP, year_of_construction=year_of_constructionP where id_house=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  

  
  
  ------------------------изменить земельный участок по коду
  
  
    create or replace procedure alter_land_plot(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, areaP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update land_plot set area=areaP where id_land_plot=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  

  
----------изменить сделку по коду
  
  create or replace procedure alter_deal(id_dealP in varchar, id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number)
 is
  id_e number;
  id_s number;
  id_b number;
  dubl_realty exception;
  pragma exception_init(dubl_realty, -1);
 begin
  select id_employee into id_e from employee where surname=employeeP and name=employeeNameP;
  select id_owner into id_s from realty where id_realty = id_realtyP;
  select id_client into id_b from client where full_name like '%'||buyerP||'%' and mobile=buyerMobileP;
  update deal set id_realty=id_realtyP, id_employee=id_e, seller=id_s, buyer=id_b, date_of_deal=date_of_dealP, sum_of_deal=sum_of_dealP where id_deal=id_dealP;
 exception
    when dubl_realty then
      dbms_output.put_line('Эта недвижимость уже продана');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  

  