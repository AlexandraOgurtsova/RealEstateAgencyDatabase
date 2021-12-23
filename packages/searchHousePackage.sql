
create or replace package searchHousePackage as
      procedure house_in_district_arenda(districtP in varchar);
      procedure house_in_district_sale(districtP in varchar);
      procedure house_with_rooms_arenda(roomsP in number);
      procedure house_with_rooms_sale(roomsP in number);
      procedure house_square_more_arenda(squareP in number);
      procedure house_square_more_sale(squareP in number);
      procedure house_square_less_arenda(squareP in number);
      procedure house_square_less_sale(squareP in number);
      procedure house_year_more_arenda(yearP in number);
      procedure house_year_more_sale(yearP in number);
      procedure house_rooms_price_arenda(roomsP in number, priceP in number);
      procedure house_rooms_price_sale(roomsP in number, priceP in number);
      procedure house_rooms_price_district_a(roomsP in number, priceP in number, districtP in varchar);
      procedure house_rooms_price_district_s(roomsP in number, priceP in number, districtP in varchar);
      procedure house_material_price_arenda(materialP in varchar, priceP in number );
      procedure house_material_price_sale(materialP in varchar, priceP in number );
      procedure house_land_price_arenda(landP in number, priceP in number );
      procedure house_land_price_sale(landP in number, priceP in number );
      procedure house_number(numberP in number );
end searchHousePackage;



create or replace package body searchHousePackage as
 ------------����� ��� ���� � ������ �� ������ 

 procedure house_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   h house%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='������' and type_of_realty='���';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into h from house where id_house=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ���. ������: ' || h.number_of_rooms || ', ���. ������: ' || h.number_of_floors || ', ������� �������: ' || h.land_area || ', ������� ����: ' || h.house_area || ', �������� ���������: ' || h.building_material || ', ��� ���������: ' || h.year_of_construction );
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ����� �������� ��� ������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� ����� �������� ��� ������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end  house_in_district_arenda;


  ------------����� ��� ���� � ������ �� �������

procedure house_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   h house%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='�������' and type_of_realty='���';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into h from house where id_house=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ���. ������: ' || h.number_of_rooms || ', ���. ������: ' || h.number_of_floors || ', ������� �������: ' || h.land_area || ', ������� ����: ' || h.house_area || ', �������� ���������: ' || h.building_material || ', ��� ���������: ' || h.year_of_construction );
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ����� �������� ��� �������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� ����� �������� ��� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_in_district_sale;
  


------------����� ��� ���� ��� ������ � ������� ����������� ������

 procedure house_with_rooms_arenda(roomsP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('����� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_with_rooms_arenda;
  


------------����� ��� ���� ��� ������ � ������� ����������� ������

procedure house_with_rooms_sale(roomsP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_with_rooms_sale;
  


------------����� ��� ���� ��� ������, ��� �������  ������ ���

procedure house_square_more_arenda(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.house_area>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_square_more_arenda;
  
  
 
------------����� ��� ���� ��� �������, ��� �������  ������ ���

procedure house_square_more_sale(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.house_area>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_square_more_sale;
  


------------����� ��� ���� ��� ������, ��� �������  ������ ���

procedure house_square_less_arenda(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.house_area<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end  house_square_less_arenda;
  
   
    
------------����� ��� ���� ��� �������, ��� �������  ������ ���

procedure house_square_less_sale(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.house_area<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_square_less_sale;
  

  
------------����� ��� ���� ��� ������, ��� ��� ��������� ���

procedure house_year_more_arenda(yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_year_more_arenda;
  
 
   
------------����� ��� ���� ��� �������, ��� ��� ��������� ���

procedure house_year_more_sale(yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_year_more_sale;
  


------------����� ��� ���� ��� ������, ��� ��� ������= �����<

procedure house_rooms_price_arenda(roomsP in number, priceP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');  
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_rooms_price_arenda;
  

  
------------����� ��� ���� ��� �������, ��� ��� ������= �����<

procedure house_rooms_price_sale(roomsP in number, priceP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_rooms_price_sale;
  


------------����� ��� ���� ��� ������, ��� ��� ������= �����< � �����

procedure house_rooms_price_district_a(roomsP in number, priceP in number, districtP in varchar)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP and realty.price<priceP and realty.district=districtP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_rooms_price_district_a;
  



------------����� ��� ���� ��� �������, ��� ��� ������= �����< � �����

procedure house_rooms_price_district_s(roomsP in number, priceP in number, districtP in varchar)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.number_of_rooms=roomsP and realty.price<priceP and realty.district=districtP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_rooms_price_district_s;
  

------------����� ��� ���� ��� ������, ��� ����� = ��������=

procedure house_material_price_arenda(materialP in varchar, priceP in number )
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.building_material like '%'||materialP||'%' and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_material_price_arenda;
  
 
   

------------����� ��� ���� ��� �������, ��� ����� = ��������=

procedure house_material_price_sale(materialP in varchar, priceP in number )
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.building_material like '%'||materialP||'%' and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_material_price_sale;
  
  
   
   

------------����� ��� ���� ��� ������, ��� ����� = ������� �������>

procedure house_land_price_arenda(landP in number, priceP in number )
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='������' and realty.type_of_realty='���' and house.land_area<landP and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_land_price_arenda;
  



------------����� ��� ���� ��� �������, ��� ����� = ������� �������>

procedure house_land_price_sale(landP in number, priceP in number )
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where realty.type_of_transaction='�������' and realty.type_of_realty='���' and house.land_area<landP and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_land_price_sale;
  



------------����� ��� �� ����

procedure house_number(numberP in number )
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_houseC number;
   number_of_roomsC number;
   number_of_floorsC number;
   land_areaC number;
   house_areaC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join house on realty.id_realty=house.id_house where  realty.type_of_realty='���' and house.id_house=numberP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC, number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC|| ' ��� ����: ' || id_houseC || ' ���������� ������: ' ||number_of_roomsC|| ' ���������� ������: ' || number_of_floorsC || ' ������� �������: ' || land_areaC || ' ������� ����: ' || house_areaC || ' �������� ���������: ' ||  building_materialC || ' ��� ���������: ' || year_of_constructionC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_houseC,number_of_roomsC, number_of_floorsC, land_areaC, house_areaC, building_materialC, year_of_constructionC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('����� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end house_number;
  
end searchHousePackage;

   