CREATE TABLE "houses" (
  "mls" varchar(50) default NULL primary key,
  "address" varchar(255) default NULL,
  "city" varchar(50) default NULL,
  "zip" varchar(50) default NULL,
  "bedrooms" integer default NULL,
  "total_full_baths" integer default NULL,
  "total_half_baths" integer default NULL,
  "square_feet" integer default NULL,
  "listing_price" varchar(10) default NULL,
  "subdivision" varchar(255) default NULL,
  "year_built" varchar(4) default NULL,
  "acres" varchar(10) default NULL,
  "notes" text default NULL,
  "our_status" varchar(10) default NULL,
  "photo" varchar(15) default NULL,
  "rank" integer default NULL
  );
