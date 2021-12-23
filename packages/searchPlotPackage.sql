
create or replace package searchPlotPackage as
       procedure plot_in_district_arenda(districtP in varchar);
       procedure plot_in_district_sale(districtP in varchar);
       procedure plot_area_arenda(area1 in number, area2 in number);
       procedure plot_area_sale(area1 in number, area2 in number);
       procedure plot_search_arenda(districtP in varchar, area1 in number, area2 in number, priceP in number);
       procedure plot_search_sale(districtP in varchar, area1 in number, area2 in number, priceP in number);
       procedure plot_number(numberP in number);
end searchPlotPackage;


create or replace package body searchPlotPackage as
------------------����� ��������� ������� �� ������ �� ������

procedure plot_in_district_arenda(districtP in varchar)
  is
   rl realty%rowtype;
   pl land_plot%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='������' and type_of_realty='��������� �������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into pl from land_plot where id_land_plot=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ������� �������: ' || pl.area);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� �������� �������� ��� ������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� �������� �������� ��� ������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_in_district_arenda;
  



------------------����� ��������� ������� �� ������� �� ������

procedure plot_in_district_sale(districtP in varchar)
  is
   rl realty%rowtype;
   pl land_plot%rowtype;
   no_realty_error exception;
   cursor cur is select * from realty where district like '%'||districtP||'%' and type_of_transaction='�������' and type_of_realty='��������� �������';
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into rl;
    if cur%found then
     while cur%found
       loop
         select * into pl from land_plot where id_land_plot=rl.id_realty; 
         dbms_output.put_line(rl.id_realty || ', ��� ���������: ' || rl.id_owner || ', ��� ������������: ' || rl.type_of_realty || ', �����: ' || rl.district || ', ������: ' || rl.address || ', �����: ' || rl.price || ', ������� �������: ' || pl.area);
         fetch cur into rl;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('� ���� ������ ��� �������� �������� ��� ������');
    when no_data_found then
      dbms_output.put_line('� ���� ������ ��� �������� �������� ��� ������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_in_district_sale;
  


---------------����� ��������� ������� �� ������. ������� ���������� �������

procedure plot_area_arenda(area1 in number, area2 in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_plotC number;
   areaC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_transaction='������' and realty.type_of_realty='��������� �������' and land_plot.area>area1 and land_plot.area<area2;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_plotC, areaC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ������: '|| id_plotC || ' �������: ' || areaC );
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC,  id_plotC, areaC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('�������� �� �������');
    when no_data_found then
      dbms_output.put_line('�������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_area_arenda;
  


---------------����� ��������� ������� �� �������. ������� ���������� �������

procedure plot_area_sale(area1 in number, area2 in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_plotC number;
   areaC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_transaction='�������' and realty.type_of_realty='��������� �������' and land_plot.area>area1 and land_plot.area<area2;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_plotC, areaC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ������: '|| id_plotC || ' �������: ' || areaC );
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC,  id_plotC, areaC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('�������� �� �������');
    when no_data_found then
      dbms_output.put_line('�������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_area_sale;
  


---------------����� ��������� ������� �� ������. ������� �����, ���������� ������� � ����

procedure plot_search_arenda(districtP in varchar, area1 in number, area2 in number, priceP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_plotC number;
   areaC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_transaction='������' and realty.type_of_realty='��������� �������' and land_plot.area>area1 and land_plot.area<area2 and realty.district like '%'||districtP||'%' and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_plotC, areaC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ������: '|| id_plotC || ' �������: ' || areaC );
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC,  id_plotC, areaC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('�������� �� �������');
    when no_data_found then
      dbms_output.put_line('�������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_search_arenda;
  



---------------����� ��������� ������� �� �������. ������� �����, ���������� ������� � ����

procedure plot_search_sale(districtP in varchar, area1 in number, area2 in number, priceP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_plotC number;
   areaC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where realty.type_of_transaction='�������' and realty.type_of_realty='��������� �������' and land_plot.area>area1 and land_plot.area<area2 and realty.district like '%'||districtP||'%' and realty.price<priceP;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_plotC, areaC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ������: '|| id_plotC || ' �������: ' || areaC );
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC,  id_plotC, areaC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('�������� �� �������');
    when no_data_found then
      dbms_output.put_line('�������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_search_sale;
  


---------------����� ��������� ������� �� ������

procedure plot_number(numberP in number)
  is
   id_realtyC number;
   id_ownerC number;
   type_of_realtyC varchar(20);
   type_of_transactionC varchar(20);
   districtC varchar(20);
   addressC varchar(200);
   priceC number;
   id_plotC number;
   areaC number;
   no_realty_error exception;
   cursor cur is select * from realty inner join land_plot on realty.id_realty=land_plot.id_land_plot where  realty.type_of_realty='��������� �������' and land_plot.id_land_plot=numberP ;
   pragma exception_init(no_realty_error, -2555);
  begin
   open cur;
   fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC, id_plotC, areaC;
    if cur%found then
     while cur%found
       loop 
         dbms_output.put_line(id_realtyC||' ����� ���������: '|| id_ownerC||' ��� ������������: '|| type_of_realtyC||' ��� ������: '|| type_of_transactionC||' �����: '|| districtC||' �����: '|| addressC||' ����: '|| priceC||' ��� ������: '|| id_plotC || ' �������: ' || areaC );
         fetch cur into id_realtyC, id_ownerC, type_of_realtyC, type_of_transactionC, districtC, addressC, priceC,  id_plotC, areaC;
       end loop;
    else
     raise no_realty_error;
     return;
    end if;
  exception
    when no_realty_error then
      dbms_output.put_line('�������� �� �������');
    when no_data_found then
      dbms_output.put_line('�������� �� �������');
    when others then
      dbms_output.put_line('Exception: '|| sqlerrm);
  end plot_number;
  
end searchPlotPackage;
