# Sequence介绍

sequence 是 pg 自带的高效的自增id工具（也叫序列）。

sequence 使用了轻量级锁的方式来做到高效自增id的，所以会比 UPDATE 行锁快。

sequence 的返回数据类型默认是64位的整数，pg10 可以自定 smallint, integer 或者是 bigint

# 用法

## 创建

```pgsql
create sequence temp_seq increment by 1 start with 10 no maxvalue no cycle cache 20;
```

## 获取下一个sequence

```pgsql
select nextval('temp_seq');

例如，在 INSERT 语句中使用 Sequence 为表的主键列生成唯一的值：
insert into table_name (id, name) values (nextval('sequence_name'), 'john');
```

## 获取当前sequence

```pgsql
select last_value from temp_seq
```

## 返回当前会话里最近一次'temp_seq'的nextval返回的sequence, 如果没调用过nextval，将会报错

```pgsql
select currval('temp_seq');
```

## 返回当前会话里最近一次nextval返回的sequence, 如果没调用过nextval，将会报错

```pgsql
select lastval();
```

## 设置 sequence 的值

```pgsql
select setval('temp_seq', 1);
```

## 删除序列

```pgsql
drop sequence temp_seq;
```

# 获取 SEQUENCE 列表

```pgsql
SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';
```
