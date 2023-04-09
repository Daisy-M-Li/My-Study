# 排序

* 尽量避免
* 排序的数据量尽量少，并保证在内存里完成排序。
  ```txt
  (至于具体什么数据量能在内存中完成排序，不同数据库有不同的配置：
    oracle是sort_area_size；
    postgresql是work_mem (integer)，单位是KB，默认值是4MB。
    mysql是sort_buffer_size
    注意：该参数对应的分配内存是每连接独占！
  )
  ```

# 索引

1. 什么时候会走索引

```

过滤的数据量比较少，一般来说<20%,应该走索引。

20%-40% 可能走索引也可能不走索引。

> 40% ，基本不走索引(会全表扫描)
```

2. 保证值的数据类型和字段数据类型要一致。（避免不必要的型别转换）

```sql
--错误范例(col1为字符串类型)
select col1,col2 from tab1 where col1 > 10
 --改善写法
select col1,col2 from tab1 where col1 > '10'
```

3. 对索引的字段进行计算时，必须在运算符右侧进行计算。也就是 to_char(oc.create_date,'yyyyMMdd')是没用的

```sql
--错误范例
select * from record where substrb(CardNo,1,4)='5378'
select * from dept where sal*12> 2500
--改善写法
select * from record where CardNo like '5378%'
select * from dept where sal>2500/12;
```

4. 表字段之间关联，尽量给相关字段上添加索引。
5. 复合索引，遵从最左前缀的原则,即最左优先。（单独右侧字段查询没有索引的）

# 避免使用 NOT IN

尽量避免使用"IN"或"NOT IN"。此操作需要全表扫描，查询引擎需要对比每一行数据以检查是否满足条件。

对策：

尝试使用"EXCEPT"或"NOT EXISTS"，这些对查询计划的影响远小于"NOT IN"

使用exists的时候子查询可以直接去掉distinct

| #        | 改善              |
| -------- | ----------------- |
| IN       | exists            |
| NOT IN   | except,not exists |
| Distinct | exists            |

# 通配符和模糊查询
