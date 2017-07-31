# Spark计算模板

用户定义作为输入的数据文件和计算方法，SPShell将其转换为可以运行的Spark jar包文件，
交由spark-submit执行。

在计算路线定义文件（route.def）示例：
```
[sum]
data: input1.csv
func: (x: Int, y: Int) => x + y

[prod]
data: input2.csv
func: (x: Int, y: Int) => x * y
```

每个小节代表一个计算过程，包括：
* data: 输入数据文件名称；
* func: 计算过程定义文件，支持任何有效的Scala函数。
