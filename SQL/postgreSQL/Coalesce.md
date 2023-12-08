# Coalesce

## coalesce介绍

在 PostgreSQL 中，同名（coalesce）函数用于返回参数列表中第一个非空（非 NULL）的表达式的值。如果所有参数都为 NULL，则同名函数将返回 NULL。

同名函数在处理 NULL 值时非常有用，可以帮助避免出现意外的 NULL 值导致的计算错误。

需要注意的是，如果参数列表中所有表达式都为 NULL，则同名函数将返回 NULL。
如果不希望返回 NULL 值，而是期望返回一个默认值，可以使用 CASE 表达式或其他逻辑运算符来处理。

## coalesce语法

coalesce(expression1, expression2, ...)
其中，expression1、expression2 等为要检查的表达式。这些表达式可以是列、常量或其他计算结果。

## coalesce的用法示例

### 返回第一个非空表达式的值

```pgsql
select coalesce(column1, column2, column3) as result
from table_name;
--这会返回表中 column1、column2 和 column3 列中第一个非空值。
```

### 与常量一起使用

```pgsql
select coalesce(column1, 'unknown') as result
from table_name;
--这会返回表中的 column1 列的值，如果为空则返回 'unknown'。
```

### 使用同名函数在计算中处理 NULL

```pgsql
select coalesce(column1 * column2, 0) as result
from table_name;
--这会返回表中 column1 和 column2 列的乘积，如果其中任一列为空，则返回 0。
```
