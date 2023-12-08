# substr提取字符串的特定部分

在 PostgreSQL 中，substr 函数用于提取字符串的子串。
substr 函数在提取字符串的特定部分时非常有用。可以根据具体的需求使用 substr 函数来获取所需的子串。
需要注意的是，substr 函数也可以与其他字符串函数（如 lower、upper、trim 等）和操作符（如 ||）一起使用，以实现更复杂的字符串处理操作。

## substr 函数的语法

substr(string, start_position, length)
其中，string 是要提取子串的字符串，start_position 是子串的起始位置（从 1 开始计数），length 是要提取的子串的长度。

## substr 函数的用法示例

### 提取从指定位置开始的子串

```pgsql
select substr('abcdefg', 3) as substring;--cdefg
这会返回字符串 'abcdefg' 从第 3 个位置（即字符 'c'）开始的子串。
```

### 提取指定长度的子串

```pgsql
select substr('abcdefg', 2, 4) as substring;--bcde
这会返回字符串 'abcdefg' 中从第 2 个位置开始的长度为 4 的子串。
```

### 提取到字符串末尾的子串

```pgsql
select substr('abcdefg', 5) as substring;--efg
这会返回字符串 'abcdefg' 从第 5 个位置（即字符 'e'）开始直到末尾的子串。
```

# RIGHT 函数用于从一个字符串的右侧提取指定长度的子串

## right语法

right(string, length)
其中，string 是要提取子串的源字符串，length 是要提取的子串的长度。

## right 用法示例

### 提取字符串右侧指定长度的子串

```pgsql
select right('abcdefg', 3) as substring;--efg
--这会返回字符串 'abcdefg' 的右侧 3 个字符作为子串。
```

### 提取字符串右侧指定长度的子串并进行其他操作

```pgsql
select right(column_name, 5) || '...' as modified_column
from table_name;
--这会从表中的 column_name 列中提取右侧 5 个字符的子串，并在子串后添加 '...'。
```

# LEFT 函数用于从一个字符串的左侧提取指定长度的子串

## left 语法

left(string, length)
其中，string 是要提取子串的源字符串，length 是要提取的子串的长度。

## left的用法示例

### 提取字符串左侧指定长度的子串

```pgsql
select left('abcdefg', 3) as substring;--abc
--这会返回字符串 'abcdefg' 的左侧 3 个字符作为子串。
```

### 提取字符串左侧指定长度的子串并进行其他操作

```pgsql
select left(column_name, 5) || '...' as modified_column from table_name;
--这会从表中的 column_name 列中提取左侧 5 个字符的子串，并在子串后添加 '...'。
```
