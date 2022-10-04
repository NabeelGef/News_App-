class Constant {
  // ignore: non_constant_identifier_names
  static EditUrl(String s) {
    // ignore: prefer_interpolation_to_compose_strings
    return Uri.parse("https://newsapi.org/v2/everything?q=" +
        s +
        "&from=2022-09-06&sortBy=popularity&apiKey=6dd6b991dc104df2896f9d6daeb7df2a");
  }

  static var Url = Uri.parse(
      "https://newsapi.org/v2/everything?q=HHH&from=2022-09-06&sortBy=popularity&apiKey=6dd6b991dc104df2896f9d6daeb7df2a");
}
