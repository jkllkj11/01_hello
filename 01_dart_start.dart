// Define a function.


// This is where the app starts executing.

//void 一种特殊的类型，表示一个值永远不会被使用。类似于 main() 和 printInteger() 的函数，以 void 声明的函数返回类型，并不会返回值。
//int  另一种数据类型，表示一个整型数字。 Dart 中一些其他的内置类型包括 String、List 和 bool。
//42  表示一个数字字面量。数字字面量是一种编译时常量。
//print() 一种便利的将信息输出显示的方式
//'...' (或 "...")表示字符串字面量
//$variableName (或 ${expression})  表示字符串插值：字符串字面量中包含的变量或表达式。
//main()  一个特殊且 必须的 顶级函数，Dart 应用程序总是会从该函数开始执行
//var 用于定义变量，通过这种方式定义变量不需要指定变量类型。这类变量的类型 (int) 由它的初始值决定 (42)。


//当你在学习 Dart 语言时, 应该牢记以下几点：
//1. 所有变量引用的都是 对象，每个对象都是一个 类 的实例。数字、函数以及 null 都是对象。除去 null 以外（如果你开启了 空安全）, 所有的类都继承于 Object 类。
//2. 尽管 Dart 是强类型语言，但是在声明变量时指定类型是可选的，因为 Dart 可以进行类型推断。在上述代码中，变量 number 的类型被推断为 int 类型。
//3. 如果你开启了空安全，变量在为声明可空类型时不能为null.你可以通过在类型后加上问号 (?) 将类型声明为可空。
//如果你 明确知道 一个表达式不会为空，但 Dart 不这么认为时，你可以在表达式后添加 ! 来断言表达式不为空（为空时将抛出异常）。例如：int x = nullableButNotNullInt!
//4. 如果你想要显式地声明允许任意类型，使用 Object?（如果你 开启了空安全）、 Object 或者 特殊类型 dynamic 将检查延迟到运行时进行。
//5. Dart 支持泛型，比如 List<int>（表示一组由 int 对象组成的列表）或 List<Object>（表示一组由任何类型对象组成的列表）。
//6. Dart 支持顶级函数（例如 main 方法），同时还支持定义属于类或对象的函数（即 静态 和 实例方法）。你还可以在函数中定义函数（嵌套 或 局部函数）。
//7. Dart 支持顶级 变量，以及定义属于类或对象的变量（静态和实例变量）。实例变量有时称之为域或属性。
//8. Dart 没有类似于 Java 那样的 public、protected 和 private 成员访问限定符。如果一个标识符以下划线 (_) 开头则表示该标识符在库内是私有的。可以查阅 库和可见性 获取更多相关信息。
//9. 标识符 可以以字母或者下划线 (_) 开头，其后可跟字符和数字的组合。
//10. Dart 中 表达式 和 语句 是有区别的，表达式有值而语句没有。比如条件表达式 expression condition ? expr1 : expr2 中含有值 expr1 或 expr2。
//与 if-else 分支语句相比，if-else 分支语句则没有值。一个语句通常包含一个或多个表达式，但是一个表达式不能只包含一个语句。
//11. Dart 工具可以显示 警告 和 错误 两种类型的问题。警告表明代码可能有问题但不会阻止其运行。错误分为编译时错误和运行时错误；编译时错误代码无法运行；运行时错误会在代码运行时导致 异常。

// 变量
//下面的示例代码将创建一个变量并将其初始化：
//var name='yyds';  变量仅存储对象的引用。这里名为 name 的变量存储了一个 String 类型对象的引用，“Bob” 则是该对象的值。name 变量的类型被推断为 String，但是你可以为其指定类型。
//如果一个对象的引用不局限于单一的类型，可以将其指定为 Object（或 dynamic）类型。如下代码：
//Object name = 'Bob';
//除此之外你也可以指定类型：
//String name = 'Bob';
import 'dart:async';
import 'dart:io';
import 'dart:math';

// 变量 （https://dart.cn/samples#variables）
void variables() {
  print('\n');
  print('#' * 40);
  print('变量');
  print('#' * 40);

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

// 控制流程 (https://dart.cn/samples#control-flow-statements)
void control_flow_statements() {
  print('\n');
  print('#' * 40);
  print('控制流程');
  print('#' * 40);

  var year = DateTime.now().year;

  if (year >= 2001) {
    print('21s centry');
  } else if (year >= 1901) {
    print('20th centry');
  }

  var flybyObjects = ['a', 'b', 'c'];
  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  year = 2009;
  while (year < 2016) {
    year += 1;
    print(year);
  }
}

// 函数 （https://dart.cn/samples#functions）
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool is_hit(String line, String target) {
  return line.contains(target);
}

void functions() {
  print('\n');
  print('#' * 40);
  print('函数');
  print('#' * 40);

  var fib = fibonacci(9);
  print('fib 9 is $fib');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, 'o'));
  for (var one in hit_lines) {
    print('one is $one');
  }
}

// 注释 (https://dart.cn/samples#comments)
void comments() {
  print('\n');
  print('#' * 40);
  print('注释');
  print('#' * 40);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
  /* 也可以像这样使用单斜杠和星号的注释方式 */
  print('comments prints nothing.');
}

// 导入 （https://dart.cn/samples#imports）
void imports() {
  print('\n');
  print('#' * 40);
  print('导入');
  print('#' * 40);

  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y');
}

// 类 （https://dart.cn/samples#classes）
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // TODO: init.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Methods.
  void describe() {
    print('Spacecraft: $name');

    // Type promotion dos not work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('\n');
  print('#' * 40);
  print('类');
  print('#' * 40);

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');

  voyager.describe();
  voyager3.describe();
}

// 扩展类（继承） （https://dart.cn/samples#inheritance）
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  @override
  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

void inheritance() {
  print('\n');
  print('#' * 40);
  print('扩展类（继承）');
  print('#' * 40);

  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();
}

// Mixins (https://dart.cn/samples#mixins)
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixins() {
  print('\n');
  print('#' * 40);
  print('Mixins');
  print('#' * 40);

  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();
}

// 接口和抽象类 （https://dart.cn/samples#interfaces-and-abstract-classes）
class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }

  @override
  int? get launchYear => launchDate?.year;
}

void interface_and_abstract_classes() {
  print('\n');
  print('#' * 40);
  print('接口和抽象类');
  print('#' * 40);

  var mock = MockSpaceship('测试飞行器', null);
  mock.describe();
}

// 异步 （https://dart.cn/samples#async）
Future<void> the_async() async {
  print('\n');
  print('#' * 40);
  print('异步');
  print('#' * 40);

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['飞机', '火箭', '铲土车'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

// Stream （https://www.jianshu.com/p/f9af079782af）
Future<void> the_stream() async {
  print('\n');
  print('#' * 40);
  print('Stream');
  print('#' * 40);

  const oneSecond = Duration(seconds: 1);

  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;

  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  addWithDelay(11.1);
  addWithDelay(22.2);
  addWithDelay(33.3);

  await Future.delayed(Duration(seconds: 5));
}

// 异常 （https://dart.cn/samples#exceptions）
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void exceptions() {
  print('\n');
  print('#' * 40);
  print('异常');
  print('#' * 40);

  var flybyObjects = ['飞机', '火箭', '铲土车', '手机'];
  show_descriptions(flybyObjects);
}

Future<void> main(List<String> args) async {
  // 变量
  variables();

  // 控制流程
  control_flow_statements();

  // 函数
  functions();

  // 注释
  comments();

  // 导入
  imports();

  // 类
  classes();

  // 扩展类（继承）
  inheritance();

  // Mixins
  mixins();

  // 接口和抽象类
  interface_and_abstract_classes();

  // 异步
  await the_async();

  // Steam
  await the_stream();

  // 异常
  exceptions();
}

