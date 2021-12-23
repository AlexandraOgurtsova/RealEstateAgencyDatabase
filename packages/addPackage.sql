
create or replace package addPackage as
     procedure add_client(full_nameP in varchar, mobileP in varchar, addressP in varchar, passportP in varchar);
     procedure add_employee(surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in date, date_of_hiringP in date, addressP in varchar, mobileP in varchar, salaryP in number);
     procedure add_apartment(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number);
     procedure add_house(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number);
     procedure add_land_plot(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, areaP in number);
     procedure add_deal(id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number);
end addPackage;


drop package body addPackage;
drop package addPackage;


create or replace package body addPackage as

 procedure add_client(full_nameP in varchar, mobileP in varchar, addressP in varchar, passportP in varchar)
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
  end add_client;
  
  

 procedure add_employee(surnameP in varchar, nameP in varchar, second_nameP in varchar, postP in varchar, date_of_birthP in date, date_of_hiringP in date, addressP in varchar, mobileP in varchar, salaryP in number)
 is
 begin
  insert into employee(surname, name, second_name, post,  date_of_birth, date_of_hiring, address, mobile, salary)
            values(surnameP, nameP, second_nameP, postP, date_of_birthP, date_of_hiringP, addressP, mobileP, salaryP);
exception
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end add_employee;
  
  
  
 procedure add_apartment(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, squareP in number, building_materialP in varchar, year_of_constructionP in number, floorP in number)
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
  end add_apartment;
  
  
  
 procedure add_house(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, number_of_roomsP in number, number_of_floorsP in number, land_areaP in number, house_areaP in number, building_materialP in varchar, year_of_constructionP in number)
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
  end add_house;
  
  
  

procedure add_land_plot(owner in varchar, mobileP in varchar, type_of_transactionP in varchar, districtP in varchar, addressP in varchar, priceP in number, areaP in number)
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
  end add_land_plot;
  
  
procedure add_deal(id_realtyP in number, employeeP in varchar, employeeNameP in varchar, buyerP in varchar, buyerMobileP in varchar, date_of_dealP in date, sum_of_dealP in number)
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
  end add_deal;
  
  end addPackage;
  

  
  begin
   C##admin_db.addPackage.add_client( 'Хорошева Алина Михайловна', '+375298776549', 'Куйбышева 39', 'KP567767');
  end;
  
  begin
   information_about_client('Стибо Алина Михайловна');
  end;