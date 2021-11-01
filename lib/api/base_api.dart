class BaseAPI {
  static String base = "https://explorer.eu.ngrok.io";
  static var api = base;
  var usersPath = api + "/users";
  var authPath = api + "/auth/login";
  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
