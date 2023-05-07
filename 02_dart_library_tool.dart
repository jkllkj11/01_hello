//工具类
//比较对象
//如果实现了 Comparable 接口，也就是说可以将该对象与另一个对象进行比较，通常用于排序。
//compareTo() 方法在 小于 时返回 < 0，在 相等 时返回 0，在 大于 时返回 > 0。
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

void main() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
}
