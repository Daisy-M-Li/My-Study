# Like

## Like 介绍

在 PostgreSQL 中，LIKE 运算符用于模式匹配，用于在字符串中找到与模式匹配的子字符串。

LIKE 运算符支持以下通配符：

* `%`：表示零个或多个字符。
* `_`：表示一个任意字符。
* `[]`：表示一组字符中的任意一个字符。
* `[^]`：表示不在一组字符中的任意一个字符。
* `[a-z]`：表示一个区间内的任意一个小写字母。
* `[!a-z]`：表示不在一个区间内的任意一个小写字母。

## LIKE/ILIKE/SIMILAR TO 运算符的示例

1. 查找以 "abc" 开头的字符串：
   ```sql
   select * from table_name where column_name like/ilike/similar to 'abc%';
   ```
2. 查找以 "abc" 结尾的字符串：
   ```sql
   select * from table_name where column_name like/ilike/similar to '%abc';
   ```
3. 查找包含字母 "a" 的字符串：
   ```sql
   select * from table_name where column_name like/ilike/similar to '%a%';
   ```
4. 查找以 "a" 开头、以 "b" 结尾的字符串：
   ```sql
   select * from table_name where column_name like/ilike/similar to 'a%b';
   ```
5. 查找一个字符、一个数字和一个字符的模式：
   ```sql
   select * from table_name where column_name like/ilike/similar to '_%_';
   ```
6. 查找不以 "a" 开头的字符串：
   ```sql
   select * from table_name where column_name not like/ilike/similar to 'a%';
   ```
7. 查找以 "abc" 开头的字符串，不区分大小写，并排除以 "abcd" 开头的字符串：
  ```sql
  select * from table_name where column_name like/ilike/similar to 'abc%' and column_name not like/ilike/similar to 'abcd%';
  ```

## 数值数据类型不能用模糊查询

```sql
to_char(version,'999999999') like '%'||ltrim(to_char(1,'9'))||'%‘

cast(permission_id as varchar(10)) like '125%'
```

# ILIKE
在 PostgreSQL 中，ILIKE 运算符的用法与 LIKE 运算符类似，具有相同的通配符和模式匹配功能。唯一的区别是 ILIKE 运算符不区分大小写，因此可以更灵活地进行模式匹配。
请注意，ILIKE 运算符的性能可能较 LIKE 运算符稍差，因为它需要进行大小写不敏感的比较。因此，在性能要求较高的情况下，可以使用 LIKE 运算符并确保在模式中正确使用大小写。

# SIMILAR TO
在PostgreSQL中，SIMILAR TO运算符用于在字符串中进行正则表达式模式匹配。它与LIKE和ILIKE运算符不同，是一种更灵活和强大的模式匹配工具。

以下是SIMILAR TO运算符的用法示例：

使用正则表达式匹配邮箱地址：
```sql
SELECT *FROM table_name WHERE column_name SIMILAR TO '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}';
```

SIMILAR TO运算符允许使用正则表达式来定义更复杂的模式匹配。在正则表达式中，可以使用各种元字符（如.、*、+、?、[]等）和转义字符来构建模式匹配规则。
需要注意的是，在使用SIMILAR TO运算符时，默认情况下是区分大小写的。如果想要进行大小写不敏感的匹配，可以在模式中使用"~*"运算符，例如：
```sql
SELECT *FROM table_name WHERE column_name ~* 'pattern';
```
