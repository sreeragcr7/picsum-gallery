class HelperFun {
  const HelperFun._();

  static String normalSearch(String value) {
    return value.toLowerCase().trim().replaceAll(RegExp(r'[^a-z0-9\s]'), '');
  }
}
