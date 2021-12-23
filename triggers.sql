
create or replace trigger AfterInsertUpdateRowClient
 after insert or update or delete on client
  for each row
   begin
    if inserting then
      dbms_output.put_line('Клиент добавлен, id_client='||(:new.id_client));
   end if;
   if updating then
    dbms_output.put_line('Клиент изменен, id_client='||(:new.id_client));
    end if;
   if deleting then
    dbms_output.put_line('Клиент удален, id_client='||(:old.id_client));
    end if;
end;

drop trigger AfterInsertUpdateRowClient;

create or replace trigger AfterInsertUpdateRowEmployee
 after insert or update or delete on employee
  for each row
   begin
    if inserting then
      dbms_output.put_line('Сотрудник добавлен, id_employee='||(:new.id_employee));
   end if;
   if updating then
    dbms_output.put_line('Сотрудник изменен, id_employee='||(:new.id_employee));
    end if;
   if deleting then
    dbms_output.put_line('Сотрудник удален, id_employee='||(:old.id_employee));
    end if;
end;



create or replace trigger AfterInsertUpdateRowDeal
 after insert or update or delete on deal
  for each row
   begin
    if inserting then
      dbms_output.put_line('Сделка добавлена, id_deal='||(:new.id_deal));
   end if;
   if updating then
    dbms_output.put_line('Сделка изменена, id_deal='||(:new.id_deal));
    end if;
   if deleting then
    dbms_output.put_line('Сделка удалена, id_deal='||(:old.id_deal));
    end if;
end;


create or replace trigger AfterInsertUpdateRowApartment
 after insert or update or delete on apartment
  for each row
   begin
    if inserting then
      dbms_output.put_line('Квартира добавлена, id_apartment='||(:new.id_apartment));
   end if;
   if updating then
    dbms_output.put_line('Квартира изменена, id_apartment='||(:new.id_apartment));
    end if;
   if deleting then
    dbms_output.put_line('Квартира удалена, id_apartment='||(:old.id_apartment));
    end if;
end;


create or replace trigger AfterInsertUpdateRowHouse
 after insert or update or delete on house
  for each row
   begin
    if inserting then
      dbms_output.put_line('Дом добавлен, id_house='||(:new.id_house));
   end if;
   if updating then
    dbms_output.put_line('Дом изменен, id_house='||(:new.id_house));
    end if;
   if deleting then
    dbms_output.put_line('Дом удален, id_house='||(:old.id_house));
    end if;
end;

create or replace trigger AfterInsertUpdateRowLandPlot
 after insert or update or delete on land_plot
  for each row
   begin
    if inserting then
      dbms_output.put_line('Земельный участок добавлен, id_land_plot='||(:new.id_land_plot));
   end if;
   if updating then
    dbms_output.put_line('Земельный участок изменен, id_land_plot='||(:new.id_land_plot));
    end if;
   if deleting then
    dbms_output.put_line('Земельный участок удален, id_land_plot='||(:old.id_land_plot));
    end if;
end;


drop trigger AfterInsertUpdateRowClient