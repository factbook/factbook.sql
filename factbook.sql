
CREATE TABLE "facts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "code" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  
  ---------------------------------------
  -- Geography
  "area"       integer,
  "area_land"  integer,
  "area_water" integer,
  
  ----------------------------------------
  -- People and Society
  "population"        integer,
  "population_growth" float,
  "birth_rate"        float,
  "death_rate"        float,
  "migration_rate"    float,
  
  --------------------------------
  -- Timestamp
  "created_at" datetime,
  "updated_at" datetime
)

