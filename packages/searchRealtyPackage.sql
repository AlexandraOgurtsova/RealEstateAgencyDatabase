
create or replace package searchRealtyPackage as
   procedure realty_in_district_arenda(districtP in varchar);
   procedure realty_in_district_sale(districtP in varchar);
   procedure realty_number(numberP in varchar);
   procedure owners_property(surnameP in varchar, mobileP varchar);
end searchRealtyPackage;

drop package searchRealtyPackage;

drop package body searchRealtyPackage;



create or replace package body searchRealtyPackage as
--------------����� ������������ ��� ������ � ������
procedure realty_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ������������ �������� ��� ������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end realty_in_district_arenda;
  

--------------����� ������������ ��� ������ � ������
procedure realty_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='�������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� ������������ �������� ��� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end realty_in_district_sale;


------------------------����� ������������� �� ������

procedure realty_number(numberP in varchar)
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
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('������������ � ���� ������� ���');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end realty_number;


----------------����� ��� ������������ ������ ��������� �� ������� � ��������
procedure owners_property(surnameP in varchar, mobileP varchar)
  is
   id_c client.id_client%type;
   rl realty%rowtype;
   no_client_error exception;
   cursor cur is select * from realty where id_owner=id_c;
   pragma exception_init(no_client_error, -2555);
  begin
   dbms_output.put_line('��������: ' || surnameP);
   select id_client into id_c from client where full_name like '%'||surnameP||'%' and mobile=mobileP;
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', �����: ' || rl.address || ', �����: ' || rl.price);
         fetch cur into rl;
       end loop;
    else
     raise no_client_error;
     return;
    end if;
  exception
    when no_client_error then
      dbms_output.put_line('������ �� �������, ��������� ������������ ��������� ����������');
    when no_data_found then
      dbms_output.put_line('������ �� �������, ��������� ������������ ��������� ����������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end owners_property;
  
end searchRealtyPackage;

drop package body searchRealtyPackage;


begin
 searchRealtyPackage.realty_number(1);
end;