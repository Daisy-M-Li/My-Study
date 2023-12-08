# split_part，获取分割的第n位

## split_part 介绍

在 PostgreSQL 中，split_part 函数用于分割字符串并返回指定位置的子串。

如果指定的位置超过了分割后的子串数量，split_part 函数将返回空字符串。

split_part 函数在处理字符串时非常实用，特别是当需要从包含多个值的字符串中提取特定部分时。

请注意，split_part 函数在 PostgreSQL 9.1 版本及以上可用。对于早期版本，您可以使用其他函数或正则表达式来实现类似的功能。

## split_part 语法

```sql
   split_part(string, delimiter, position)
   其中，string 是要分割的字符串，delimiter 是分隔符，position 是要返回的子串的位置（从 1 开始计数）。
```

## split_part 函数的用法示例

```sql
select split_part('aa,bb,cc', ',', 1) as aa,
       split_part('aa,bb,cc', ',', 2) as bb,
       split_part('aa,bb,cc', ',', 3) as cc,
       split_part('aa,bb,cc', ',', 4) as dd;
```

结果将是：

| aa | bb | cc | dd |
| -- | -- | -- | -- |
| aa | bb | cc |    |
