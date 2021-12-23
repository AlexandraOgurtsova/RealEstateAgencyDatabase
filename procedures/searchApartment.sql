

------------найти все квартиры в районе на аренду

create or replace procedure apartment_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   ap apartment%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='аренда' and type_of_realty='квартира';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into ap from apartment where id_apartment=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адресс: ' || rl.address || ', Сумма: ' || rl.price || ', Кол. комнат ' || ap.number_of_rooms || ', Площадь ' || ap.square || ', Материал постройки ' || ap.building_material || ', Год постройки ' || ap.year_of_construction || ', Этаж ' || ap.floor);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('В этом районе нет квартир агенства для аренды');
    when no_data_found then
      dbms_output.put_line('В этом районе нет квартир агенства для аренды');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  





------------найти все квартиры в районе на аренду 

create or replace procedure apartment_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   ap apartment%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='продажа' and type_of_realty='квартира';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into ap from apartment where id_apartment=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адресс: ' || rl.address || ', Сумма: ' || rl.price || ', Кол. комнат ' || ap.number_of_rooms || ', Площадь ' || ap.square || ', Материал постройки ' || ap.building_material || ', Год постройки ' || ap.year_of_construction || ', Этаж ' || ap.floor);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('В этом районе нет квартир агенства для продажи');
    when no_data_found then
      dbms_output.put_line('В этом районе нет квартир агенства для продажи');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для аренды с определ количеством комнат

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для продажи с определ количеством комнат

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для аренды, где площадь больше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.square>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для аренды, где площадь больше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.square>squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  


------------найти все квартиры для аренды, где площадь меньше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.square<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure apartment_square_less_arenda;
  



------------найти все квартиры для продажи, где площадь меньше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.square<squareP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для аренды, где год постройки больше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для продажи, где год постройки больше чем

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для аренды, где количество комнат= и сумма<

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP and realty.price<sumP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти все квартиры для продажи, где количество комнат= и сумма<

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP and realty.price<sumP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  




------------найти все квартиры для аренды, где количество комнат= и сумма< район= год постройки< 

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='аренда' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP and realty.price<sumP and realty.district=districtP and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');  
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  


------------найти все квартиры для продажи, где количество комнат= и сумма< район= год постройки< 

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where realty.type_of_transaction='продажа' and realty.type_of_realty='квартира' and apartment.number_of_rooms=roomsP and realty.price<sumP and realty.district=districtP and apartment.year_of_construction>yearP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



------------найти квартиру по номеру

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
   cursor cur is select * from realty inner join apartment on realty.id_realty=apartment.id_apartment where  realty.type_of_realty='квартира' and apartment.id_apartment=numberP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' Номер владельца: '|| id_ownerC||' Тип недвижимости: '|| type_of_realtyC||' Тип сделки: '|| type_of_transactionC||' Район: '|| districtC||' Адрес: '|| addressC||' Цена: '|| priceC||' Код квартиры: '|| id_apartmentC||' Количество комнат: '|| number_of_roomsC||' Площадь: '|| squareC||' Материал постройки: '|| building_materialC||' Год постройки: '|| year_of_constructionC||' Этаж:'|| floorC);
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_apartmentC, number_of_roomsC, squareC, building_materialC, year_of_constructionC, floorC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Квартир не найдено');
    when no_data_found then
      dbms_output.put_line('Квартир не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
