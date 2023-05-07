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
  var nobleGases2 = {54: 'xenon'};
  assert(nobleGases2[54] == 'xenon');
  assert(nobleGases2.containsKey(54));
  // Remove a key and its value.
  nobleGases2.remove(54);
  assert(!nobleGases2.containsKey(54));

  //可以从一个 map 中检索出所有的 key 或所有的 value：

// Get all the keys as an unordered collection
// (an Iterable).
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

//使用 containsKey() 方法检查一个 map 中是否包含某个key 。因为 map 中的 value 可能会是 null ，
//所有通过 key 获取 value，并通过判断 value 是否为 null 来判断 key 是否存在是不可靠的。
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

//如果当且仅当该 key 不存在于 map 中，且要为这个 key 赋值，
//可使用 putIfAbsent() 方法。该方法需要一个方法返回这个 value。
  /*var teamAssignments = <String, String>{};
 teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
 assert(teamAssignments['Catcher'] != null);*/

  //公共集合方法
// List, Set, 和 Map 共享许多集合中的常用功能。其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现。
//使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

//使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
//var teas1 = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));

//当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

//Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数。
  var loudTeas1 = teas.map((tea) => tea.toUpperCase()).toList();

//使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。
//使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件。
//var teas = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));

  //#URIs
  //编码和解码完整合法的URI
  //使用 encodeFull() 和 decodeFull() 方法，
  //对 URI 中除了特殊字符（例如 /， :， &， #）以外的字符进行编解码，
  //这些方法非常适合编解码完整合法的 URI，并保留 URI 中的特殊字符。
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  //编码和解码 URI 组件
  //使用 encodeComponent() 和 decodeComponent() 方法，
  //对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :。
  var uri1 = 'https://example.org/api?foo=some message';

  var encoded1 = Uri.encodeComponent(uri1);
  assert(encoded1 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded1 = Uri.decodeComponent(encoded1);
  assert(uri1 == decoded1);

  //解析 URI
  //使用 Uri 对象的字段（例如 path），来获取一个 Uri 对象或者 URI 字符串的一部分。
  //使用 parse() 静态方法，可以使用字符串创建 Uri 对象。
  var uri3 = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri3.scheme == 'https');
  assert(uri3.host == 'example.org');
  assert(uri3.path == '/foo/bar');
  assert(uri3.fragment == 'frag');
  assert(uri3.origin == 'https://example.org:8080');

//构建 URI
//使用 Uri() 构造函数，可以将各组件部分构建成 URI 。
  var uri4 = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri4.toString() == 'https://example.org/foo/bar?lang=dart#frag');

//If you don’t need to specify a fragment,
//to create a URI with a http or https scheme, you can instead use the Uri.http or Uri.https factory constructors:
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});

  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');

  //#日期和时间
  //DateTime 对象代表某个时刻，时区可以是 UTC 或者本地时区。
  //DateTime 对象可以通过若干构造函数和方法创建：
  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date in the UTC time zone.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

// Create a new DateTime from an existing one, adjusting just some properties:
  var sameTimeLastYear = now.copyWith(year: now.year - 1);

  // 日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来的毫秒数：

  // 1/1/2000, UTC
  var y3k = DateTime.utc(2000);
  assert(y3k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  //Use the Duration class to calculate the difference between two dates and to shift a date forward or backward:
  var y1k = DateTime.utc(2000);

// Add one year.
var y2001 = y1k.add(const Duration(days: 366));
assert(y2001.year == 2001);

// Subtract 30 days.
var december2000 = y2001.subtract(const Duration(days: 30));
assert(december2000.year == 2000);
assert(december2000.month == 12);

// Calculate the difference between two dates.
// Returns a Duration object.
var duration = y2001.difference(y1k);
assert(duration.inDays == 366); // y2k was a leap year.


}
