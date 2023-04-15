class Pair<T1, T2>{
  T1? key;
  T2? value;

  Pair({this.key, this.value});

  fill(Pair<T1, T2> other) {
    key = other.key;
    value = other.value;
  }
}