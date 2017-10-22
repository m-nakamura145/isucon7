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
