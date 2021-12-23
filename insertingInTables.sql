------------вставка клиентов
 declare
  i number :=10;
  begin
    while(i<100000)
     loop
     insert into client(id_client,full_name,  mobile, address, passport)
         values(i,'client'||i, '+37533'||i, 'Minsk '||i, 'BM'||i);
      i:=i+1;
     end loop;
  end;
  
  select * from client 
  
  declare
  i number :=100000;
  begin
    while(i<200000)
     loop
     insert into client(id_client,full_name,  mobile, address, passport)
         values(i,'client'||i, '+37533'||i, 'Minsk '||i, 'BM'||i);
      i:=i+1;
     end loop;
  end;
  
  
  -------------------добавить квартиры
  
   declare
  i number :=12;
  begin
    while(i<40000)
     loop
     insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i,i, 'квартира', 'продажа', 'Московский', 'Minsk'||i, i);
   insert into apartment(id_apartment, number_of_rooms, square, building_material, year_of_construction, floor)
               values(i, i, i, 'кирпич', i, i);
      i:=i+1;
     end loop;
  end; 
  
  select * from realty
  
  select * from apartment
  
  
  
  declare
  i number :=43000;
  begin
    while(i<90000)
     loop
     insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i,i, 'квартира', 'аренда', 'Октябрьский', 'Minsk'||i, i);
   insert into apartment(id_apartment, number_of_rooms, square, building_material, year_of_construction, floor)
               values(i, i, i, 'кирпич', i, i);
      i:=i+1;
     end loop;
  end; 
  

--------------------добавить дома

   declare
  i number :=100001;
  y number := 99999;
  begin
    while(i<140001)
     loop
     insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i, y, 'дом', 'продажа', 'Московский', 'Minsk'||y, y);
  insert into house(id_house, number_of_rooms, number_of_floors, land_area, house_area, building_material, year_of_construction)
               values(i, y, y, y, y, 'дерево', y);
      y:=y-1;
      i:=i+1;
     end loop;
  end; 
  
  
   declare
  i number :=140003;
  y number := 50000;
  begin
    while(i<185000)
     loop
     insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i, y, 'дом', 'продажа', 'Московский', 'Minsk'||y, y);
  insert into house(id_house, number_of_rooms, number_of_floors, land_area, house_area, building_material, year_of_construction)
               values(i, y, y, y, y, 'дерево', y);
      y:=y-1;
      i:=i+1;
     end loop;
  end; 
  
  select * from house
  
  
-------------добавить земельные участки

   declare
  i number :=200000;
  y number := 70000;
  begin
    while(i<250000)
     loop
       insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i, y, 'земельный участок', 'продажа' , 'Фрунзеньский', 'Minsk'||i, y);
       insert into land_plot(id_land_plot, area)
               values(i, y);
      y:=y-1;
      i:=i+1;
     end loop;
  end; 
  
  
  select * from land_plot
  

   declare
  i number :=260000;
  y number := 99999;
  begin
    while(i<300000)
     loop
       insert into realty(id_realty, id_owner, type_of_realty, type_of_transaction, district, address, price)
               values(i, y, 'земельный участок', 'аренда' , 'Фрунзеньский', 'Minsk'||i, y);
       insert into land_plot(id_land_plot, area)
               values(i, y);
      y:=y-1;
      i:=i+1;
     end loop;
  end; 
  
  
  select * from land_plot


----------добавить сделки


   declare
  i number := 10000;
  y number := 39999;
  z number := 1;
  x number := 89999;
  begin
    while(i<39999)
     loop
       insert into deal(id_realty, id_employee, seller, buyer, date_of_deal, sum_of_deal)
               values(i, z, i, x, '24/03/2021', 100);
      x:=x-1;
      z:=z+1;
      y:=y-1;
      i:=i+1;
     end loop;
  end; 
  
  
  select * from deal



-----------------добавить сотрудников

 declare
  i number :=1;
  begin
    while(i<50000)
     loop    
     insert into employee(id_employee,surname, name, second_name, post,  date_of_birth, date_of_hiring, address, mobile, salary)
            values(i, 'Surname'||i, 'Name'||i, 'Second nme', 'риэлтор', '20/02/2001', '10/02/2020', 'Minsk'||i, '+37529'||i, 900);
      i:=i+1;
     end loop;
  end;
  
  
  declare
  i number :=50002;
  begin
    while(i<100000)
     loop    
     insert into employee(id_employee,surname, name, second_name, post,  date_of_birth, date_of_hiring, address, mobile, salary)
            values(i, 'Surname'||i, 'Name'||i, 'Second nme', 'агент', '20/02/2001', '10/02/2020', 'Minsk'||i, '+37529'||i, 900);
      i:=i+1;
     end loop;
  end;
  
  select * from employee
