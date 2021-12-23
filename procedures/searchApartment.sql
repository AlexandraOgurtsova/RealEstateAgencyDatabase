

------------����� ��� �������� � ������ �� ������

create or replace procedure apartment_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   ap apartment%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='������' and type_of_realty='��������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into ap from apartment where id_apartment=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ���. ������ ' || ap.number_of_rooms || ', ������� ' || ap.square || ', �������� ��������� ' || ap.building_material || ', ��� ��������� ' || ap.year_of_construction || ', ���� ' || ap.floor);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ������� �������� ��� ������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� ������� �������� ��� ������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  





------------����� ��� �������� � ������ �� ������ 

create or replace procedure apartment_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   ap apartment%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='�������' and type_of_realty='��������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into ap from apartment where id_apartment=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ���. ������ ' || ap.number_of_rooms || ', ������� ' || ap.square || ', �������� ��������� ' || ap.building_material || ', ��� ��������� ' || ap.year_of_construction || ', ���� ' || ap.floor);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ������� �������� ��� �������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� ������� �������� ��� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������ � ������� ����������� ������

create or replace procedure apartment_with_rooms_arenda(roomsP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������� � ������� ����������� ������

create or replace procedure apartment_with_rooms_sale(roomsP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������, ��� ������� ������ ���

create or replace procedure apartment_square_more_arenda(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.square>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������, ��� ������� ������ ���

create or replace procedure apartment_square_more_sale(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.square>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  


------------����� ��� �������� ��� ������, ��� ������� ������ ���

create or replace procedure apartment_square_less_arenda(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.square<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure apartment_square_less_arenda;
  



------------����� ��� �������� ��� �������, ��� ������� ������ ���

create or replace procedure apartment_square_less_sale(squareP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.square<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������, ��� ��� ��������� ������ ���

create or replace procedure apartment_year_more_arenda(yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� �������, ��� ��� ��������� ������ ���

create or replace procedure apartment_year_more_sale(yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� ������, ��� ���������� ������= � �����<

create or replace procedure apartment_rooms_price_arenda(roomsP in number, sumP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP and realty.price<sumP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� ��� �������� ��� �������, ��� ���������� ������= � �����<

create or replace procedure apartment_rooms_price_sale(roomsP in number, sumP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP and realty.price<sumP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  




------------����� ��� �������� ��� ������, ��� ���������� ������= � �����< �����= ��� ���������< 

create or replace procedure apartment_search_arenda(roomsP in number, sumP in number, districtP in varchar, yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP and realty.price<sumP and realty.district=districtP and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');  
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  


------------����� ��� �������� ��� �������, ��� ���������� ������= � �����< �����= ��� ���������< 

create or replace procedure apartment_search_sale(roomsP in number, sumP in number, districtP in varchar, yearP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='�������' and realty.type_of_realty='��������' and apartment.number_of_rooms=roomsP and realty.price<sumP and realty.district=districtP and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------����� �������� �� ������

create or replace procedure apartment_number(numberP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_apartmentC number;
   number_of_roomsC number;
   squareC number;
   building_materialC varchar(20);
   year_of_constructionC number;
   floorC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where  realty.type_of_realty='��������' and apartment.id_apartment=numberP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ��������: '|| id_apartmentC||' ���������� ������: '|| number_of_roomsC||' �������: '|| squareC||' �������� ���������: '|| building_materialC||' ��� ���������: '|| year_of_constructionC||' ����:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������� �� �������');
    when no_data_found then
      dbms_output.put_line('������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
