

------����� ������� �� ���

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
         dbms_output.put_line(cl.id_client || ', ���: ' || cl.full_name|| ', �������: '  || cl.mobile || ', �����: ' || cl.address || ', ��������: ' ||cl.passport);
         fetch cur into cl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('������ ������� ���, ��������� ������������ ��������� �������');
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

------����� ������� �� ����

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
         dbms_output.put_line(cl.id_client || ', ���: ' || cl.full_name|| ', �������: '  || cl.mobile || ', �����: ' || cl.address || ', ��������: ' ||cl.passport);
         fetch cur into cl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('������ ������� ���');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure client_number;
  
  select * from client;
  
begin
  client_number(981);
end;

------------------����� ���������� �� �������

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
         dbms_output.put_line(emp.id_employee || ', �������: ' || emp.surname || ', ���: ' || emp.name || ', ��������: ' || emp.second_name || ', ���������: ' || emp.post || ', ���� ��������: ' || emp.date_of_birth || ', ���� ������ �� ������: ' || emp.date_of_hiring || ', �����: ' || emp.address || ', ���������: ' || emp.mobile || ', �������� ' || emp.salary);
         fetch cur into emp;
       end loop;
    else
     raise no_employee_error;
     return;
    end if;
  exception
    when no_employee_error then
      dbms_output.put_line('������ ���������� ���, ��������� ������������ ��������� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure information_about_employee;
  
  select * from employee;
  
begin
  information_about_employee('��������');
end;



------------------����� ���������� �� ����

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
         dbms_output.put_line(emp.id_employee || ', �������: ' || emp.surname || ', ���: ' || emp.name || ', ��������: ' || emp.second_name || ', ���������: ' || emp.post || ', ���� ��������: ' || emp.date_of_birth || ', ���� ������ �� ������: ' || emp.date_of_hiring || ', �����: ' || emp.address || ', ���������: ' || emp.mobile || ', �������� ' || emp.salary);
         fetch cur into emp;
       end loop;
    else
     raise no_employee_error;
     return;
    end if;
  exception
    when no_employee_error then
      dbms_output.put_line('������ ���������� ���');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end;
  
  drop procedure employee_number;
  
  select * from employee;
  
begin
  employee_number(2);
end;



