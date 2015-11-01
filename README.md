# `factbook.sql` World Factbook Country Profiles in SQL (Incl. factbook.db - Single-File SQLite Distro)

What's the World Factbook?

The World Factbook [1][2] published by the Central Intelligence Agency (CIA)
offers free country profiles in the public domain (that is, no copyright(s), no rights reserved).

- [1] [The World Factbook](https://www.cia.gov/library/publications/the-world-factbook/)
- [2] [Wikipedia Article: The World Factbook](http://en.wikipedia.org/wiki/The_World_Factbook)


## Database Schema / Tables / Columns


```sql
CREATE TABLE "facts"(
  "id"   INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "code" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  
  -----------------------
  -- Geography

  "area"       integer,
  "area_land"  integer,
  "area_water" integer,
  
  ------------------------
  -- People and Society

  "population" integer,
  "population_growth" float,
  "birth_rate" float,
  "death_rate" float,
  "migration_rate" float,
  
  ... )
```

(Source: [factbook.sql](factbook.sql))


## Usage

Find the ten largest country by area:

```sql
SELECT name, area FROM facts ORDER BY area LIMIT 10;
```

Resulting in:

```
```

Find the ten largest countries by population:

```sql
SELECT name, population FROM facts ORDER BY population LIMIT 10;
```

Resulting in:

```
```

And so on.


## `factbook.db` - Single-File SQLite Distribution

Download a copy of a pre-build single-file SQLite database, that is, `factbook.db`.
See the release page.


## Build Your Own Up-to-Date SQL Database

Use the [`factbook`](https://github.com/worlddb/factbook)
command line tool and scripts for building your own up-to-date copy. Example:

```ruby
require 'factbook'

DB_CONFIG = {
  adapter:  'sqlite3',
  database: './factbook.db'
}

ActiveRecord::Base.logger = Logger.new( STDOUT )
ActiveRecord::Base.establish_connection( DB_CONFIG )

Factbook::CreateDb.new.up    ## create tables

importer = Factbook::Importer.new

Factbook.codes.each do |code|
  puts "Fetching #{code.code}- #{code.name}..."
  page = Factbook::Page.new( code.code )

  puts "Adding #{code.code}- #{code.name}..."
  importer.import( page )
end

puts "Done."
```

## Questions? Comments?

Send them along to the [Open World Database (world.db) and Friends Forum/Mailing List](http://groups.google.com/group/openmundi). 
Thanks!

