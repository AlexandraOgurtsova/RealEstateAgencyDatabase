

------найти клиента по фио

create or replace procedure information_about_client(surnameP in varchar)
  is
   cl client%rowtype;
   no_client_error exception;
   cursor cur is select * from client where full_name=surnameP;
   pragma exception_init(no_client_error, -2555);
  begin
   open cur;
   fetch cur into cl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(cl.id_client || ', ФИО: ' || cl.full_name|| ', Телефон: '  || cl.mobile || ', Адрес: ' || cl.address || ', Пасспорт: ' ||cl.passport);
         fetch cur into cl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('Такого клиента нет, проверьте правильность написания фамилии');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure information_about_client;
  
  select * from client where full_name='client4546';
  
  SET TIMING on
  
begin
   system.information_about_client('client4546');
end;

create index client_surname_index on client(full_name);

drop index client_surname

------найти клиента по коду

create or replace procedure client_number(numberP in number)
  is
   cl client%rowtype;
   no_client_error exception;
   cursor cur is select * from client where id_client=numberP;
   pragma exception_init(no_client_error, -2555);
  begin
   open cur;
   fetch cur into cl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(cl.id_client || ', ФИО: ' || cl.full_name|| ', Телефон: '  || cl.mobile || ', Адрес: ' || cl.address || ', Пасспорт: ' ||cl.passport);
         fetch cur into cl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('Такого клиента нет');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure client_number;
  
  select * from client;
  
begin
  client_number(981);
end;

------------------найти сотрудника по фамилии

create or replace procedure information_about_employee(employeeP in varchar)
  is
   emp employee%rowtype;
   no_employee_error exception;
   cursor cur is select * from employee where surname=employeeP;
   pragma exception_init(no_employee_error, -2555);
  begin
   open cur;
   fetch cur into emp;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(emp.id_employee || ', Фамилия: ' || emp.surname || ', Имя: ' || emp.name || ', Отчество: ' || emp.second_name || ', Должность: ' || emp.post || ', Дата рождения: ' || emp.date_of_birth || ', Дата приема на работу: ' || emp.date_of_hiring || ', Адрес: ' || emp.address || ', Мобильный: ' || emp.mobile || ', Зарплата ' || emp.salary);
         fetch cur into emp;
       end loop;
    else
     raise no_employee_error;
     return;
    end if;
  exception
    when no_employee_error then
      dbms_output.put_line('Такого сотрудника нет, проверьте правильность написания фамилии');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure information_about_employee;
  
  select * from employee;
  
begin
  information_about_employee('Огурцова');
end;



------------------найти сотрудника по коду

create or replace procedure employee_number(numberP in number)
  is
   emp employee%rowtype;
   no_employee_error exception;
   cursor cur is select * from employee where id_employee=numberP;
   pragma exception_init(no_employee_error, -2555);
  begin
   open cur;
   fetch cur into emp;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(emp.id_employee || ', Фамилия: ' || emp.surname || ', Имя: ' || emp.name || ', Отчество: ' || emp.second_name || ', Должность: ' || emp.post || ', Дата рождения: ' || emp.date_of_birth || ', Дата приема на работу: ' || emp.date_of_hiring || ', Адрес: ' || emp.address || ', Мобильный: ' || emp.mobile || ', Зарплата ' || emp.salary);
         fetch cur into emp;
       end loop;
    else
     raise no_employee_error;
     return;
    end if;
  exception
    when no_employee_error then
      dbms_output.put_line('Такого сотрудника нет');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure employee_number;
  
  select * from employee;
  
begin
  employee_number(2);
end;



