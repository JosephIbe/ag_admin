class APIConstants {

  APIConstants._();

  static const String pushNotificationURL = "https://fcm.googleapis.com/fcm/send";

  // static const String baseURL = "https://agoris-main.onrender.com";
  // static const String baseURL = "http://34.197.252.128";
  // static const String baseURL = "https://stormy-fawn-belt.cyclic.app";
  static const String baseURL = "https://api.agorislisting.com";
  static const String apiVersion = "/api/v1";

  static String login = '/auth/login';

  static String forgotPassword = '/auth/forgot-password';
  static String changePassword = '/auth/change-password';

  static String getAllProducts = '/products/all';
  static String getSingleProduct = '/products/product-details';

  static String deleteProduct = '/products/delete-one';

}