# DB構成

```
mysql> show tables;
+-------------------+
| Tables_in_isubata |
+-------------------+
| channel           |
| haveread          |
| image             |
| message           |
| user              |
+-------------------+
```

## channel table

```
mysql> show columns from channel;
+-------------+------------+------+-----+---------+----------------+
| Field       | Type       | Null | Key | Default | Extra          |
+-------------+------------+------+-----+---------+----------------+
| id          | bigint(20) | NO   | PRI | NULL    | auto_increment |
| name        | text       | NO   |     | NULL    |                |
| description | mediumtext | YES  |     | NULL    |                |
| updated_at  | datetime   | NO   |     | NULL    |                |
| created_at  | datetime   | NO   |     | NULL    |                |
+-------------+------------+------+-----+---------+----------------+
```

## haveread table

```
mysql> show columns from haveread;
+------------+------------+------+-----+---------+-------+
| Field      | Type       | Null | Key | Default | Extra |
+------------+------------+------+-----+---------+-------+
| user_id    | bigint(20) | NO   | PRI | NULL    |       |
| channel_id | bigint(20) | NO   | PRI | NULL    |       |
| message_id | bigint(20) | YES  |     | NULL    |       |
| updated_at | datetime   | NO   |     | NULL    |       |
| created_at | datetime   | NO   |     | NULL    |       |
+------------+------------+------+-----+---------+-------+
```

## image table

```
mysql> show columns from image;
+-------+---------------------+------+-----+---------+----------------+
| Field | Type                | Null | Key | Default | Extra          |
+-------+---------------------+------+-----+---------+----------------+
| id    | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(191)        | YES  |     | NULL    |                |
| data  | longblob            | YES  |     | NULL    |                |
+-------+---------------------+------+-----+---------+----------------+
```

## message table

```
mysql> show columns from message;
+------------+------------+------+-----+---------+----------------+
| Field      | Type       | Null | Key | Default | Extra          |
+------------+------------+------+-----+---------+----------------+
| id         | bigint(20) | NO   | PRI | NULL    | auto_increment |
| channel_id | bigint(20) | YES  |     | NULL    |                |
| user_id    | bigint(20) | YES  |     | NULL    |                |
| content    | text       | YES  |     | NULL    |                |
| created_at | datetime   | NO   |     | NULL    |                |
+------------+------------+------+-----+---------+----------------+
```

## user table

```
mysql> show columns from user;
+--------------+---------------------+------+-----+---------+----------------+
| Field        | Type                | Null | Key | Default | Extra          |
+--------------+---------------------+------+-----+---------+----------------+
| id           | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| name         | varchar(191)        | YES  | UNI | NULL    |                |
| salt         | varchar(20)         | YES  |     | NULL    |                |
| password     | varchar(40)         | YES  |     | NULL    |                |
| display_name | text                | YES  |     | NULL    |                |
| avatar_icon  | text                | YES  |     | NULL    |                |
| created_at   | datetime            | NO   |     | NULL    |                |
+--------------+---------------------+------+-----+---------+----------------+
```

## index

```
mysql> show index from channel;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| channel |          0 | PRIMARY  |            1 | id          | A         |         100 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0.00 sec)

mysql> mysql> show index from haveread;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| haveread |          0 | PRIMARY  |            1 | user_id     | A         |          46 |     NULL | NULL   |      | BTREE      |         |               |
| haveread |          0 | PRIMARY  |            2 | channel_id  | A         |          51 |     NULL | NULL   |      | BTREE      |         |               |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

mysql> show index from image;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| image |          0 | PRIMARY  |            1 | id          | A         |         922 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0.00 sec)

mysql> show index from message;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| message |          0 | PRIMARY  |            1 | id          | A         |        9785 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0.00 sec)

mysql> show index from user;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| user  |          0 | PRIMARY  |            1 | id          | A         |        1000 |     NULL | NULL   |      | BTREE      |         |               |
| user  |          0 | name     |            1 | name        | A         |        1000 |     NULL | NULL   | YES  | BTREE      |         |               |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)
```
