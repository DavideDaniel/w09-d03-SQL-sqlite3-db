CREATE TABLE dwarves (ID INTEGER PRIMARY KEY, name TEXT, color TEXT, time DEFAULT CURRENT_TIME);
---
.schema dwarves (stuff above)
---
INSERT INTO dwarves (name, color) VALUES ("Happy", "Yellow");
---
SELECT * FROM dwarves;

CREATE TABLE dwarves (
id INTEGER PRIMARY KEY,
name TEXT, color TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)

CREATE TRIGGER dwarfs BEFORE UPDATE ON dwarves BEGIN
    UPDATE dwarves SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
    END;

INSERT INTO 'dwarves' ('name', 'color') VALUES
  ('Happy', 'yellow'),
  ('Dopey', 'purple'),
  ('Sneezy', 'yellow'),
  ('Grumpy', 'brown'),
  ('Doc', 'brown'),
  ('Sleepy', 'blue'),
  ('Bashful', 'blue');

SELECT * FROM where color = brown;

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


mv dwarfs.db seeds.sql
rm dwarfs.db
sqlite3 dwarfs.db < seeds.sql --