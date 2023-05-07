// Implementing map keys
// 在 Dart 中每个对象会默认提供一个整数的哈希值，因此在 map 中可以作为 key 来使用，重写 hashCode 的 getter 方法来生成自定义哈希值。
// 如果重写 hashCode 的 getter 方法，那么可能还需要重写 == 运算符。相等的（通过 == ）对象必须拥有相同的哈希值。
// 哈希值并不要求是唯一的，但是应该具有良好的分布形态。
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

void main() {
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}