# GetType

`x.GetType()`是一个在C#中获取对象类型的方法。

`GetType()`方法是 `System.Object`类的一个实例方法，可以用于检索对象的运行时类型。它返回一个 `System.Type`对象，该对象包含有关给定对象的类型的信息。

以下是一个示例：

```csharp
using System;

object x = "Hello World!";
Type type = x.GetType();
Console.WriteLine(type);  // 输出：System.String
```

在这个示例中，我们定义了一个对象 `x`，其值为字符串 `"Hello World!"`。通过调用 `x.GetType()`方法，我们获取了 `x`的运行时类型，并将其赋值给 `type`变量。然后，我们通过 `Console.WriteLine()`方法打印出了对象的类型。输出结果为 `System.String`，即 `x`的类型为字符串类型。

请注意，`GetType()`方法是 `System.Object`类上定义的，因此可以在任何对象上调用。

但是，如果对象为null，它将引发一个 `NullReferenceException`异常。因此在使用之前应该进行空值检查。

# GetField

`x.GetType().GetField(variable)` 是一个在C#中获取对象的字段信息的方法。可以使用该方法来获取给定对象x的特定字段的 `FieldInfo`对象。

在这个方法调用中，`x`代表一个对象，`variable`代表要获取的字段的名称。

以下是一个示例：

```csharp
using System;

class MyClass
{
    public int myField;
}

MyClass obj = new MyClass();
obj.myField = 123;

Type type = obj.GetType();
var field = type.GetField("myField");

Console.WriteLine(field.Name);  // 输出：myField
Console.WriteLine(field.GetValue(obj));  // 输出：123
```

在这个示例中，我们定义了一个名为 `MyClass`的类，其中包含了一个公有整数字段 `myField`。我们创建一个类的实例 `obj`，并将其 `myField`字段设置为 `123`。

首先，我们通过使用 `GetType()`方法获取 `obj`的运行时类型，并将其赋值给 `type`变量。然后，我们使用 `GetField()`方法和字段名称 `"myField"`来获取 `myField`字段的 `FieldInfo`对象，并将其赋值给 `field`变量。

最后，我们通过 `field.Name`打印出字段的名称，并通过 `field.GetValue(obj)`获取字段的值，并输出该值。

请注意，`GetField()`方法只能获取公共字段，如果要获取私有字段，可以使用 `GetField()`的重载方法，并在参数中指定 `BindingFlags.NonPublic`标志。

## 忽略字段名称的大小写

在参数中指定 `BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance`标志，以忽略字段名称的大小写，并定位到公共实例字段。

```csharp
class MyClass
{
    public string Var1;
    public string Var2;
}
var objList = new List<MyClass>();
var obj = new MyClass();
obj.Var1 = "11";
obj.Var2 = "First";
objList.Add(obj);
var obj2 = new MyClass();
obj2.Var1 = "22";
obj2.Var2 = "Second";
objList.Add(obj2);
string ff = "var1";
var temp = objList.Select(x => x.GetType().GetField(ff, BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance).GetValue(x));
Console.WriteLine("temp:");
foreach (object s in temp)
{
    Console.WriteLine(s);
}
```

result

```csharp
temp:
11
22
```
