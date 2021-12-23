
create or replace package alterPackage as
     procedure alter_client(numberP in number, full_nameP in varchar,  mobileP in varchar, addressP in varchar, passportP in varchar);
     procedure alter_employee(numberP in number, surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in varchar, date_of_hiringP in varchar, addressP in varchar, mobileP in varchar, salaryP in number);
     procedure alter_apartment(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number);
     procedure alter_house(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in varchar, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number);
     procedure alter_land_plot(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, areaP in number);
     procedure alter_deal(id_dealP in varchar, id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number);
end alterPackage;

drop package body alterPackage;
drop package alterPackage;


create or replace package body alterPackage as

procedure alter_client(numberP in number, full_nameP in varchar,  mobileP in varchar, addressP in varchar, passportP in varchar)
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
  end alter_client;
  
procedure alter_employee(numberP in number, surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in varchar, date_of_hiringP in varchar, addressP in varchar, mobileP in varchar, salaryP in number)
  is
  begin
   update employee set surname=surnameP, name=nameP, second_name=second_nameP, post=postP, date_of_birth=date_of_birthP, date_of_hiring=date_of_hiringP, address=addressP, mobile=mobileP, salary=salaryP where id_employee=numberP;
    exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end alter_employee;


procedure alter_apartment(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update apartment set number_of_rooms=number_of_roomsP, square=squareP, building_material=building_materialP, year_of_construction=year_of_constructionP, floor=floorP where id_apartment=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end alter_apartment;
  
  
procedure alter_house(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, number_of_roomsP in varchar, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update house set number_of_rooms=number_of_roomsP, number_of_floors=number_of_floorsP, land_area=land_areaP, house_area=house_areaP, building_material=building_materialP, year_of_construction=year_of_constructionP where id_house=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end alter_house;
  

 procedure alter_land_plot(numberP in number, ownerP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in varchar, areaP in number)
   is
   id_o number;
    begin
    select id_client into id_o from client where full_name like '%'||ownerP||'%'; 
    update land_plot set area=areaP where id_land_plot=numberP;
    update realty set id_owner=id_o, type_of_transaction=type_of_transactionP, district=districtP, address=addressP, price=priceP where id_realty=numberP;
     exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end alter_land_plot;


procedure alter_deal(id_dealP in varchar, id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number)
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
  end alter_deal;
  
  end alterPackage;