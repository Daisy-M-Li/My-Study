# Trigger

在 PostgreSQL 中，Trigger（触发器）是一种数据库对象，可以在表上定义一个函数，以响应与该表的数据操作相关的事件。当指定的事件发生时，Trigger 会自动触发执行相关的函数。

Trigger 可以用于多种情况，如在插入、更新或删除数据之前或之后执行一些额外的操作，比如数据验证、数据转换、记录审计等。

请注意，Trigger 的使用要谨慎，因为它会在数据库操作时自动触发执行相关的函数，可能会对性能产生影响。确保 Trigger 的逻辑代码在设计和实现时是正确和高效的，并仔细测试以确保符合预期的行为。

## 语法

```pgsql
--创建一个 Trigger
create trigger trigger_name
{before | after} {insert | update | delete} on table_name
[for each row]
execute function trigger_function();
其中，
trigger_name 是 trigger 的名称，
{before | after} 指定 trigger 执行的时机，
{insert | update | delete} 指定 trigger 响应的事件类型，
table_name 是表的名称，
for each row 指定 trigger 每行触发，
trigger_function 是 trigger 执行的函数。

--创建一个 Trigger 函数：
create function trigger_function() returns trigger as
$$
-- trigger 函数的逻辑代码
-- 在这里实现 trigger 的操作
--trigger 函数需要采用 pl/pgsql 语法编写，可以在函数中实现您希望在 trigger 触发时执行的逻辑操作。
--使用 new 和 old 对象：
--可以使用 new 和 old 对象来引用当前正在被插入、更新或删除的行的数据。例如，new.column_name 表示正在被插入或更新的行的列值。
$$
language plpgsql;

--删除触发器
drop trigger trigger_name on table_name;
--这将删除指定表上的 Trigger。
```

## Trigger 示例

```pgsql
--创建触发器函数
create or replace function tri_del_company_fun()
returns trigger as $$
begin
    delete from department where emp_id = old.id;
    return old;
end;
$$ language plpgsql;

--创建事件触发器
create trigger tri_del_company
after delete on company
for each row execute procedure tri_del_company_fun();

--删除触发器
drop trigger tri_del_company on company;
```

## 查看触发器

```pgsql
select * from information_schema.triggers
```

| trigger_catalog | trigger_schema | trigger_name    | event_manipulation | event_object_catalog | event_object_schema | event_object_table | action_order | action_condition | action_statement                       | action_orientation | action_timing | action_reference_old_table | action_reference_new_table | action_reference_old_row | action_reference_new_row | created |
| --------------- | -------------- | --------------- | ------------------ | -------------------- | ------------------- | ------------------ | ------------ | ---------------- | -------------------------------------- | ------------------ | ------------- | -------------------------- | -------------------------- | ------------------------ | ------------------------ | ------- |
| postgres        | aa             | tri_del_company | DELETE             | postgres             | aa                  | company            | 1            |                  | EXECUTE FUNCTION tri_del_company_fun() | ROW                | AFTER         |                            |                            |                          |                          |         |
