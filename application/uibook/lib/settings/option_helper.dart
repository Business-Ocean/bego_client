extension EnumsToOptions<T extends Enum> on List<T> {
  List<Option<T>> toOptions() =>
      map((e) => Option(label: e.name, option: e)).toList();
}

class Option<T> {
  Option({required this.label, required this.option});
  final String label;
  final T? option;
}
