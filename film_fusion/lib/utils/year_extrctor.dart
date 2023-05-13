String extractYearFromDate(String dateStr) {
  // Split the date string into its year, month, and day components
  List<String> components = dateStr.split("-");
  String year = components[0];
  return year;
}