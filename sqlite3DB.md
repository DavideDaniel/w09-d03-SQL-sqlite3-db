CREATE TABLE dwarfs (ID INTEGER PRIMARY KEY, name TEXT, color TEXT, time DEFAULT_);
---
.schema dwarfs (stuff above)
---
INSERT INTO dwarfs (name, color) VALUES ("Happy", "Yellow");
---
SELECT * FROM dwarfs;

INSERT INTO 'dwarfs' ('name', 'color') VALUES
  ('Happy', 'yellow'),
  ('Dopey', 'purple'),
  ('Sneezy', 'yellow'),
  ('Grumpy', 'brown'),
  ('Doc', 'brown'),
  ('Sleepy', 'blue'),
  ('Bashful', 'blue');

  FROM where color = Brown

  You have two options. First, you could simply add a new column with the following:

ALTER TABLE {tableName} ADD COLUMN COLNew {type};
Second, and more complicatedly, but would actually put the column where you want it, would be to rename the table:

ALTER TABLE {tableName} RENAME TO TempOldTable;
Then create the new table with the missing column:

CREATE TABLE {tableName} (name TEXT, COLNew {type} DEFAULT {defaultValue}, qty INTEGER, rate REAL);
And populate it with the old data:

INSERT INTO {tableName} (name, qty, rate) SELECT name, qty, rate FROM TempOldTable;
Then delete the old table:

DROP TABLE TempOldTable;