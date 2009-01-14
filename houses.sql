CREATE TABLE "houses" (
  "id" integer NOT NULL primary key autoincrement,
  "mls" varchar(50) default NULL,
  "address" varchar(255) default NULL,
  "city" varchar(50) default NULL,
  "zip" varchar(50) default NULL,
  "bedrooms" integer default NULL,
  "baths" integer default NULL,
  "sqft" integer default NULL,
  "price" varchar(10) default NULL,
  "subdivision" varchar(255) default NULL,
  "year_built" varchar(4) default NULL,
  "acres" varchar(10) default NULL
  );
