--------------найти недвижимость для аренды в районе
create or replace procedure realty_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='аренда';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адресс: ' || rl.address || ', Сумма: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('В этом районе нет недвижимости агенства для аренды');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



--------------найти недвижимость для аренды в районе
create or replace procedure realty_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='продажа';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адресс: ' || rl.address || ', Сумма: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('В этом районе нет недвижимости агенства для продажи');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  


------------------------найти недвижиимость по номеру

create or replace procedure realty_number(numberP in varchar)
  is
   rl realty%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where id_realty=numberP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адресс: ' || rl.address || ', Сумма: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('Недвижимости с таки номером нет');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  



----------------найти всю недвижимость одного владельца по фамилии и телефону
create or replace procedure owners_property(surnameP in varchar, mobileP varchar)
  is
   id_c client.id_client%type;
   rl realty%rowtype;
   no_client_error exception;
   cursor cur is select * from realty where id_owner=id_c;
   pragma exception_init(no_client_error, -2555);
  begin
   dbms_output.put_line('Владелец: ' || surnameP);
   select id_client into id_c from client where full_name like '%'||surnameP||'%' and mobile=mobileP;
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', Код владельца: ' || rl.id_owner || ', Тип недвижимости: ' || rl.type_of_realty || ', Район: ' || rl.district || ', Адрес: ' || rl.address || ', Сумма: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('Ничего не найдено, проверьте правильность введенной информации');
    when no_data_found then
      dbms_output.put_line('Ничего не найдено, проверьте правильность введенной информации');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  




