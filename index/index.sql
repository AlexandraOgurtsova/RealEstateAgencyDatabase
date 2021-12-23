

  SET TIMING on
  

create index client_full_name_index on client(full_name);

create index employee_surname_index on employee(surname);

create index type_realty_index on realty(type_of_transaction, type_of_realty);

create index number_of_rooms_ap_index on apartment(number_of_rooms);

create index number_of_rooms_h_index on house(number_of_rooms);

create index number_of_floors_h_index on house(number_of_floors);






