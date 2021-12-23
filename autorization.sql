
create role C##agentRl container=all;

grant create session to c##agentrl;
grant select on client to c##agentrl;
grant select on realty to c##agentrl;
grant select on apartment to c##agentrl;
grant select on house to c##agentrl;
grant select on land_plot to c##agentrl;
grant select on deal to c##agentrl;

grant insert, update on client to c##agentrl;
grant insert, update on realty to c##agentrl;
grant insert, update on apartment to c##agentrl;
grant insert, update on house to c##agentrl;
grant insert, update on land_plot to c##agentrl;

drop role agentRl;

drop role C##realtorr;

create role C##realtorrl;

grant C##agentrl to C##realtorrl;

grant insert, update on deal to C##realtorrl;



create profile C##PRFL_CURS limit
  password_life_time 180
  sessions_per_user 5
  failed_login_attempts 7
  password_lock_time 1
  password_reuse_time 1
  password_grace_time default
  connect_time 180
  idle_time 30;
  
  
  create user C##admin_db identified by 12345
  profile C##PRFL_CURS;
  grant all privileges to C##admin_db container=all;
  grant create user to C##admin_db;
  grant create profile to C##admin_db;
  grant create role to C##admin_db;
   
  create user C##agent identified by 12345
  profile C##PRFL_CURS;
  grant C##agentrl to C##agent;
  
  drop user C##agent
  
  create user C##realtor identified by 12345
  profile C##PRFL_CURS;
  grant C##realtorrl to C##realtor;
  
  drop user C##realtor

drop user C##admin_db

 
grant execute on add_client to C##realtor;
grant execute on add_apartment to C##realtor;
grant execute on add_house to C##realtor;
grant execute on add_land_plot to C##realtor;
grant execute on add_deal to C##realtor;
grant execute on realty_number to C##realtor;

grant execute on alter_client to C##realtor;
grant execute on alter_apartment to C##realtor;
grant execute on alter_house to C##realtor;
grant execute on alter_land_plot to C##realtor;
grant execute on alter_deal to C##realtor;

grant execute on realty_in_district_arenda to C##realtor;
grant execute on realty_in_district_sale to C##realtor;
grant execute on realty_number to C##realtor;
grant execute on owners_property to C##realtor;

grant execute on apartment_in_district_arenda to C##realtor;
grant execute on apartment_in_district_sale to C##realtor;
grant execute on apartment_with_rooms_arenda to C##realtor;
grant execute on apartment_with_rooms_sale to C##realtor;
grant execute on apartment_square_more_arenda to C##realtor;
grant execute on apartment_square_more_sale to C##realtor;
grant execute on apartment_square_less_arenda to C##realtor;
grant execute on apartment_square_less_sale to C##realtor;
grant execute on apartment_year_more_arenda to C##realtor;
grant execute on apartment_year_more_sale to C##realtor;
grant execute on apartment_rooms_price_arenda to C##realtor;
grant execute on apartment_rooms_price_sale to C##realtor;
grant execute on apartment_search_arenda to C##realtor;
grant execute on apartment_search_sale to C##realtor;
grant execute on apartment_number to C##realtor;

grant execute on deal_less_sum to C##realtor;
grant execute on deal_more_sum to C##realtor;
grant execute on deal_date to C##realtor;
grant execute on deal_between_date to C##realtor;
grant execute on deal_employee to C##realtor;
grant execute on deal_number to C##realtor;


grant execute on house_in_district_arenda to C##realtor;
grant execute on house_in_district_sale to C##realtor;
grant execute on house_with_rooms_arenda to C##realtor;
grant execute on house_with_rooms_sale to C##realtor;
grant execute on house_square_more_arenda to C##realtor;
grant execute on house_square_more_sale to C##realtor;
grant execute on house_square_less_arenda to C##realtor;
grant execute on house_square_less_sale to C##realtor;
grant execute on house_year_more_arenda to C##realtor;
grant execute on house_year_more_sale to C##realtor;
grant execute on house_rooms_price_arenda to C##realtor;
grant execute on house_rooms_price_sale to C##realtor;
grant execute on house_rooms_price_district_a to C##realtor;
grant execute on house_rooms_price_district_s to C##realtor;
grant execute on house_material_price_arenda to C##realtor;
grant execute on house_material_price_sale to C##realtor;
grant execute on house_land_price_arenda to C##realtor;
grant execute on house_land_price_sale to C##realtor;
grant execute on house_number to C##realtor;

grant execute on plot_in_district_arenda to C##realtor;
grant execute on plot_in_district_sale to C##realtor;
grant execute on plot_area_arenda to C##realtor;
grant execute on plot_area_sale to C##realtor;
grant execute on plot_search_arenda to C##realtor;
grant execute on plot_search_sale to C##realtor;
grant execute on plot_number to C##realtor;



grant execute on add_client to C##agent;
grant execute on add_apartment to C##agent;
grant execute on add_house to C##agent;
grant execute on add_land_plot to C##agent;
grant execute on realty_number to C##agent;

grant execute on alter_client to C##agent;
grant execute on alter_apartment to C##agent;
grant execute on alter_house to C##agent;
grant execute on alter_land_plot to C##agent;

grant execute on realty_in_district_arenda to C##agent;
grant execute on realty_in_district_sale to C##agent;
grant execute on realty_number to C##agent;
grant execute on owners_property to C##agent;

grant execute on apartment_in_district_arenda to C##agent;
grant execute on apartment_in_district_sale to C##agent;
grant execute on apartment_with_rooms_arenda to C##agent;
grant execute on apartment_with_rooms_sale to C##agent;
grant execute on apartment_square_more_arenda to C##agent;
grant execute on apartment_square_more_sale to C##agent;
grant execute on apartment_square_less_arenda to C##agent;
grant execute on apartment_square_less_sale to C##agent;
grant execute on apartment_year_more_arenda to C##agent;
grant execute on apartment_year_more_sale to C##agent;
grant execute on apartment_rooms_price_arenda to C##agent;
grant execute on apartment_rooms_price_sale to C##agent;
grant execute on apartment_search_arenda to C##agent;
grant execute on apartment_search_sale to C##agent;
grant execute on apartment_number to C##agent;

grant execute on deal_less_sum to C##agent;
grant execute on deal_more_sum to C##agent;
grant execute on deal_date to C##agent;
grant execute on deal_between_date to C##agent;
grant execute on deal_employee to C##agent;
grant execute on deal_number to C##agent;

grant execute on house_in_district_arenda to C##agent;
grant execute on house_in_district_sale to C##agent;
grant execute on house_with_rooms_arenda to C##agent;
grant execute on house_with_rooms_sale to C##agent;
grant execute on house_square_more_arenda to C##agent;
grant execute on house_square_more_sale to C##agent;
grant execute on house_square_less_arenda to C##agent;
grant execute on house_square_less_sale to C##agent;
grant execute on house_year_more_arenda to C##agent;
grant execute on house_year_more_sale to C##agent;
grant execute on house_rooms_price_arenda to C##agent;
grant execute on house_rooms_price_sale to C##agent;
grant execute on house_rooms_price_district_a to C##agent;
grant execute on house_rooms_price_district_s to C##agent;
grant execute on house_material_price_arenda to C##agent;
grant execute on house_material_price_sale to C##agent;
grant execute on house_land_price_arenda to C##agent;
grant execute on house_land_price_sale to C##agent;
grant execute on house_number to C##agent;

grant execute on plot_in_district_arenda to C##agent;
grant execute on plot_in_district_sale to C##agent;
grant execute on plot_area_arenda to C##agent;
grant execute on plot_area_sale to C##agent;
grant execute on plot_search_arenda to C##agent;
grant execute on plot_search_sale to C##agent;
grant execute on plot_number to C##agent;

