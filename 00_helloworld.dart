/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。

/* 也可以像这样使用单斜杠和星号的注释方式 */

//导入库
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
//import 'package:test/test.dart';

// Importing files
//import 'path/to/my_other_file.dart';

//定义dart的枚举类型
enum PlanetType { terrestrial, gas, ice }

//一个增强型的枚举类型实列
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

//定义dart函数
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

//定义dart类
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//dart的继承是单继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

//dart的重构
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
/*
class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
PilotedCraft 类中就包含了 astronauts 字段以及 describeCrew() 方法。
*/

//dart中的抽象
/*
Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。

class MockSpaceship implements Spacecraft {
  // ···
}
 */
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
/*
 任意一个扩展了 Describable 的类都拥有 describeWithEmphasis() 方法，这个方法又会去调用实现类中实现的 describe() 方法。
 */


void main(){
  //dart,你好世界
  print('Hello world!');

  //dart变量
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

//dart控制流程语句
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}

for (final object in flybyObjects) {
  print(object);
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
//dart函数测试
var result = fibonacci(20);
print(result);

//dart匿名函数传递参数语法
flybyObjects.where((name) => name.contains('turn')).forEach(print);

//使用dart类
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();

//使用前面定义的枚举类型
final yourPlanet = Planet.uranus;

if (!yourPlanet.isGiant) {
  print('Your planet is not a "giant planet".');
}
/*
//dart中的异步
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
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}*/

//dart中的异常
var astronauts=0;
if (astronauts == 0) {
  throw StateError('No astronauts.');
}
/*
  使用 try 语句配合 on 或 catch（两者也可同时使用）关键字来捕获一个异常:
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
 */
}