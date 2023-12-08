# 查字符串中子串的位置

在 PostgreSQL 中，position/strpos 函数用于查找子串在字符串中的位置，并返回子串的起始位置（从 1 开始计数）。

## position 的语法

position(substring in string)
其中，substring 是要查找的子串，string 是要在其中查找子串的字符串。如果未找到子串，则返回 0。

## strpos 的语法

select strpos('string', 'substring') as position;
strpos 函数与 position 函数类似，用于查找子串在字符串中的位置，如果未找到子串，则返回 0。

## position 和 strpos 区分大小写

无论您使用 position 函数还是 strpos 函数，它们都提供了一种查找子串的位置的方式。
需要注意的是，position 函数和 strpos 函数都是区分大小写的。如果您希望进行大小写不敏感的子串查找，
可以使用 lower 函数或 ilike 操作符与 position 函数或 strpos 函数结合使用。例如：

select position(lower('substr') in lower('string')) as position;
select strpos('string', 'substr') as position;
这样可以在进行子串查找时忽略大小写。

## position/strpos 的用法示例

```pgsql
--Oracle
select instr('helloworld','l') from dual;
--返回结果：3    默认第一次出现“l”的位置
select instr('helloworld','lo') from dual;
--返回结果：4    即“lo”同时出现，第一个字母“l”出现的位置
select instr('helloworld','wo') from dual;
--返回结果：6    即“wo”同时出现，第一个字母“w”出现的位置


--PostgreSQL
select position('l' in 'helloworld'); select strpos('helloworld','l');
--返回结果：3    默认第一次出现“l”的位置
select position('lo' in 'helloworld'); select strpos('helloworld','lo');
--返回结果：4    即“lo”同时出现，第一个字母“l”出现的位置
select position('wo' in 'helloworld'); select strpos('helloworld','wo');
--返回结果：6    即“wo”同时出现，第一个字母“w”出现的位置
```
