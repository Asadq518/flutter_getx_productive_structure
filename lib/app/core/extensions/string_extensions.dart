extension StringExtensions on String {
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isPhone => RegExp(r'^\+?[0-9]{7,15}$').hasMatch(this);

  String capitalize() => isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
}
