enum SortEnum {
  none(value: 'none'),
  name(value: 'Name'),
  number(value: 'Number');

  const SortEnum({required this.value});

  final String value;
}
