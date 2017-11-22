/* Iot geeks database model */

create database iotgeeks_inventory;

/* iot geeks user admin table */
create table iotgeeks_admin(
	id bigint not null auto_increment,
	first_name varchar(50) not null,
	last_name varchar(50) null,
	user_name varchar(50) not null,
	email_id varchar(100) not null,
	mobile_number varchar(12) not null,
	password varchar(200) not null,
	create_date timestamp not null,
	active bigint not null,
	primary key (id),
	constraint iotgeeks_admin_user_name unique (user_name),
	constraint iotgeeks_admin_email_id unique (email_id),
	constraint iotgeeks_admin_mobile_number unique (mobile_number) 
);

/* insert sample records */
insert into iotgeeks_admin (first_name, last_name, user_name, email_id, mobile_number, password, create_date, active) values ('murugadoss', 'balasubramaniyam', 'murugadossb', 'murugadossb@gmail.com', '9840212346', '21232f297a57a5a743894a0e4a801fc3', now(), true);
insert into iotgeeks_admin (first_name, last_name, user_name, email_id, mobile_number, password, create_date, active) values ('sathiyaraj', 'ramamurthy', 'sathiyarajr', 'sathiyaraj45@gmail.com', '9244414449', '21232f297a57a5a743894a0e4a801fc3', now(), true);

/* view the admin records */
select * from iotgeeks_admin;

/* iot geeks unit master table */
create table iotgeeks_unit(
	unit_id bigint not null auto_increment,
	unit_code varchar(10) not null,
	unit_name varchar(100) not null,
	unit_description varchar(500) null,
	created_date timestamp not null,
	created_by bigint not null,
	primary key (unit_id),
	constraint iotgeeks_unit_code unique (unit_code),
	constraint iotgeeks_unit_name unique (unit_name),
	constraint iotgeeks_unit_created_by foreign key (created_by) references iotgeeks_admin(id)
);

/* insert sample units */
insert into iotgeeks_unit (unit_code, unit_name, unit_description, created_date, created_by) values ('U001', 'mm', 'mesure the milli meter values', now(), 2);
insert into iotgeeks_unit (unit_code, unit_name, unit_description, created_date, created_by) values ('U002', 'cm', 'mesure the centimeter values', now(), 2);
/* view the unit records */
select * from iotgeeks_unit;

/* iot geeks category table */
create table iotgeeks_category(
	category_id bigint not null auto_increment,
	category_code varchar(10) not null,
	category_name varchar(100) not null,
	category_description varchar(500) null,
	created_date timestamp not null,
	created_by bigint not null,
	primary key (category_id),
	constraint iotgeeks_category_code unique (category_code),
	constraint iotgeeks_category_name unique (category_name),
	constraint iotgeeks_category_created_by foreign key (created_by) references iotgeeks_admin(id)
);

/* insert sample categories */
insert into iotgeeks_category (category_code, category_name, category_description, created_date, created_by) values ('C100', 'Sensor', 'Sense the real data', now(), 2);
insert into iotgeeks_category (category_code, category_name, category_description, created_date, created_by) values ('C101', 'Resister', 'current follow stopper', now(), 2);

/* view all categories */
select * from iotgeeks_category;

/* iot geeks product table */
create table iotgeeks_product(
	product_id bigint not null auto_increment,
	product_code varchar(10) not null,
	product_name varchar(200) not null,
	product_description varchar(500) null,
	product_category_id bigint not null,
	product_unit_id bigint not null,
	product_price decimal(10, 3) not null,
	product_quantity bigint not null,
	created_date timestamp not null,
	created_by bigint not null,
	primary key (product_id),
	constraint iotgeeks_product_code unique (product_code),
	constraint iotgeeks_product_name unique (product_name),
	constraint iotgeeeks_product_category_id foreign key (product_category_id) references iotgeeks_category(category_id),
	constraint iotgeeks_product_unit_id foreign key (product_unit_id) references iotgeeks_unit(unit_id),
	constraint iotgeeks_product_created_by foreign key (created_by) references iotgeeks_admin(id)
);

/* insert sample products */
insert into iotgeeks_product (product_code, product_name, product_description, product_category_id, product_unit_id, product_price, product_quantity, created_date, created_by)
values ('P00001', 'PIR Sensor', 'Photo resister sensor', 1, 2, 150.40, 10, now(), 2); 

insert into iotgeeks_product (product_code, product_name, product_description, product_category_id, product_unit_id, product_price, product_quantity, created_date, created_by)
values ('P00002', 'Temperature Sensor', 'Temperature and huminity sensor', 1, 2, 150.40, 10, now(), 2);

/* view all products details */
select * from iotgeeks_product;


/* Iot geeks Purchase details */
create table iotgeeks_purchase(
	purchase_id bigint not null auto_increment,
	purchase_code varchar(10) not null,
	invoice_number varchar(100) null,
	invoice_company_name varchar(500) null,
	invoice_date timestamp null,
	invoice_amount decimal(10,3) not null,
	invoice_buyer varchar(200) not null,
	created_date timestamp not null,
	created_by bigint not null,
	primary key (purchase_id),
	constraint iotgeeks_purchase_code unique (purchase_code),
	constraint iotgeeks_purchase_created_by foreign key (created_by) references iotgeeks_admin(id)	 
);

/* purchase related images */
create table iotgeeks_purchase_images(
	id bigint not null auto_increment,
	purchase_id bigint not null,
	image_type varchar(10) not null,
	imageData longblob,
	primary key (id),
	constraint iotgeeks_purchase_images_id foreign key (purchase_id) references iotgeeks_purchase(purchase_id)
);

/* purchase related order details */
create table iotgeeks_purchase_orderdetail(
	id bigint not null auto_increment,
	product_id bigint not null,
	product_name varchar(200) not null,
	product_quantity bigint(20) not null,
	product_price decimal(10,3) not null,
	purchase_id bigint not null,
	primary key (id),
	constraint iotgeeks_purchase_orderdetail_product_id foreign key (product_id) references iotgeeks_product(product_id),
	constraint iotgeeks_purchase_orderdetail_purchase_id foreign key (purchase_id) references iotgeeks_purchase(purchase_id)
);

/* product rental */
create table iotgeeks_product_rental(
	id bigint not null auto_increment,
	rental_code varchar(10) not null,
	borrower varchar(200) not null,
	initial_deposit decimal(10, 3) not null,
	return_date datetime not null,
	product_total_price decimal(10,3) not null,
	description varchar(2000) null,
	created_date datetime not null,
	created_by bigint not null,
	primary key (id),
	constraint iotgeeks_product_rental_code unique (rental_code),
	constraint iotgeeks_product_rental_created_by foreign key (id) references iotgeeks_admin(id)
);
drop table iotgeeks_product_rental;
alter table iotgeeks_product_rental add mobile_number varchar(13) not null after borrower;

/* Rental product details */
create table iotgeeks_product_rental_orderdetail(
	id bigint not null auto_increment,
	product_id bigint not null,
	product_name varchar(200) not null,
	product_quantity bigint(20) not null,
	product_rental_id bigint not null,
	primary key (id),
	constraint iotgeeks_product_rental_orderdetail_product_id foreign key (product_id) references iotgeeks_product(product_id),
	constraint iotgeeks_product_rental_orderdetail_product_rental_id foreign key (product_rental_id) references iotgeeks_product_rental(id)	
);

drop table iotgeeks_product_rental_orderdetail;
