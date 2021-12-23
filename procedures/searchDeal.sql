
---------------найти сделки меньше суммы

create or replace procedure deal_less_sum(sumP in number)
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where deal.sum_of_deal<sumP;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   
   


---------------найти сделки больше суммы

create or replace procedure deal_more_sum(sumP in number)
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where deal.sum_of_deal>sumP;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   
   



---------------найти сделки акого-то числа

create or replace procedure deal_date(dateP in date)
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where deal.date_of_deal=dateP;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   




---------------найти сделки между двумя датами

create or replace procedure deal_between_date(date1 in date, date2 in date)
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where deal.date_of_deal>date1 and deal.date_of_deal<date2;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   
   



--------сделки заключенные сотрудником


create or replace procedure deal_employee(employeeP in varchar)
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where employee.surname=employeeP;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   
   



create or replace procedure deal_number(numberP in number )
  is
   id_dealC number;
   id_realtyC number;
   employeeC varchar(20);
   sellerC varchar(50);
   buyerC varchar(50);
   date_of_dealC date;
   sum_of_dealC number;
   no_deal_error exception;
   cursor cur is select deal.id_deal, deal.id_realty, employee.surname, client.full_name, client.full_name, deal.date_of_deal, deal.sum_of_deal from deal 
                          inner join employee on deal.id_employee = employee.id_employee
                          inner join client on deal.seller=client.id_client
                          inner join client on deal.buyer=client.id_client where deal.id_deal=numberP;
   pragma exception_init(no_deal_error, -2555);
  begin
   open cur;
   fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
   if cur%found then
     while cur%found
       loop 
         dbms_output.put_line('Номер сделки: ' ||id_dealC||' Код недвижимости: '|| id_realtyC||' Риэлтор: '|| employeeC||' Продавец: '|| sellerC||' Покупатель: '|| buyerC|| ' Дата сделки: '||date_of_dealC||' Сумма сделки: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('Сделок не найдено');
    when no_data_found then
      dbms_output.put_line('Сделок не найдено');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
   
   


