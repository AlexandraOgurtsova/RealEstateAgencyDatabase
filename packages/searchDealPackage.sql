
create or replace package searchDealPackage as
   procedure deal_less_sum(sumP in number);
   procedure deal_more_sum(sumP in number);
   procedure deal_date(dateP in date);
   procedure deal_between_date(date1 in date, date2 in date);
   procedure deal_employee(employeeP in varchar);
  procedure deal_number(numberP in number );
end searchDealPackage;



create or replace package body searchDealPackage as

 procedure deal_less_sum(sumP in number)
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end deal_less_sum;
   
---------------����� ������ ������ �����

procedure deal_more_sum(sumP in number)
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end deal_more_sum;
   
---------------����� ������ �����-�� �����
 procedure deal_date(dateP in date)
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end deal_date;
   


---------------����� ������ ����� ����� ������

 procedure deal_between_date(date1 in date, date2 in date)
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end  deal_between_date;
   



--------������ ����������� �����������


 procedure deal_employee(employeeP in varchar)
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end deal_employee;
   
   

 procedure deal_number(numberP in number )
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
         dbms_output.put_line('����� ������: ' ||id_dealC||' ��� ������������: '|| id_realtyC||' �������: '|| employeeC||' ��������: '|| sellerC||' ����������: '|| buyerC|| ' ���� ������: '||date_of_dealC||' ����� ������: '|| sum_of_dealC);
         fetch cur into id_dealC, id_realtyC, employeeC, sellerC, buyerC, date_of_dealC, sum_of_dealC;
       end loop;
    else
     raise no_deal_error;
     return;
    end if;
  exception
    when no_deal_error then
      dbms_output.put_line('������ �� �������');
    when no_data_found then
      dbms_output.put_line('������ �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end  deal_number;
   
end searchDealPackage;
