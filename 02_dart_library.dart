void main(List<String> args) {
  //数字
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  assert(int.parse('42', radix: 16) == 66);
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

// Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

// Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

// Use split() with an empty string parameter to get
// a list of all characters (as Strings); good for
// iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

// Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  //首字母大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //修剪和空字符串
  //使用 移除首尾空格。使用 检查一个字符串是否为空（长度为 0）。
  assert('hello'.trim() == 'hello');
  assert(''.isEmpty);
  assert(' '.isNotEmpty);
  //替换部分字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);
  //构建一个字符串
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  var numbers1 = RegExp(r'\d+');
  var someDigits1 = 'llamas live 15 to 20 years';

// Check whether the reg exp has a match in a string.
  assert(numbers1.hasMatch(someDigits1));

// Loop through all matches.
  for (final match in numbers1.allMatches(someDigits1)) {
    print(match.group(0)); // 15, then 20
  }

  //#集合
  //列表
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

//使用 方法查找一个对象在 list 中的下标值。
// Access a list item by index.
  var fruits3 = ['apples', 'oranges'];
  assert(fruits3[0] == 'apples');

// Find an item in a list.
  assert(fruits3.indexOf('apples') == 0);
  var fruits1 = ['bananas', 'apples', 'oranges'];

// Sort a list.
  fruits1.sort((a, b) => a.compareTo(b));
  assert(fruits1[0] == 'apples');
// This list should contain only strings.
  var fruits2 = <String>[];
  fruits2.add('apples');
  var fruit = fruits2[0];
  assert(fruit is String);

//集
//Create an empty set of strings
  var ingredients = <String>{};

  //Add a new item to it
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  //Adding a duplicate item has on effect
  ingredients.add('gold');
  assert(ingredients.length == 3);

  //Remove an item from a set
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  //you can also create sets using
  //ones of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);

  //使用 和 来检查一个或多个元素是否在 set 中：contains()containsAll()
  var ingredients1 = Set<String>();
  ingredients1.addAll(['gold', 'titanium', 'xenon']);

  //Check whether an item is in the set
  assert(ingredients1.contains('gold'));

  //check whether all item is in the set
  assert(ingredients1.containsAll(['gold', 'titanium']));

  //交集是另外两个 set 中的公共元素组成的 set。
  //Create the intersection of two sets
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients1.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  //#地图

  //maps often use strings as keys
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  //Maps can be built from a constructor
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGases1 = Map<int, String>();

 // 通过大括号语法可以为 map 添加，获取，设置元素。使用 方法从 map 中移除键值对。remove()
  var nobleGases2={54:'xenon'};
  
}
