import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agoris_admin/common/db_constants.dart';

import 'package:agoris_admin/data/core/api_constants.dart';

import 'package:agoris_admin/domain/entities/get_all_products_params.dart';
import 'package:agoris_admin/domain/entities/login_params.dart';

import 'package:agoris_admin/utils/header_utils.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class APIClient {

  APIClient();

  Future<dynamic> login({required String pathSegment, required LoginParams params}) async {
    log("Starting api login data");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Login Data Params, ${params.toJson()}');

    try {

      http.Response response = await http.post(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      log('Login data response:\n$response');
      return response;
    } catch(e){
      log('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> forgotPassword({required String pathSegment, required dynamic params}) async {
    log("Starting api forgot password");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Forgot Password Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.post(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      log('forgot password data response:\n$response');

      return response;
    } catch(e){
      log('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> changePassword({required String pathSegment, required dynamic params}) async {
    log("Starting api change password");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    log('Change Password Params Data, ${params.toJson()}');

    try {
      http.Response response = await http.put(
          url,
          headers: HeaderUtils().getNonTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      log('change password data response:\n$response');

      return response;
    } catch(e){
      log('error caught in api client:\t$e}');
      rethrow;
    }

  }

  Future<dynamic> getUserProfile({required String pathSegment, required dynamic params}) async {
    log("Starting api get my profile");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().getTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      log('get my profile data response:\n$response');

      return response;
    } catch(e){
      log('error caught in api client:\t$e}');
      rethrow;
    }
  }

  Future<dynamic> getAllProducts({required String pathSegment, required GetAllProductsParams params}) async {
    log("Starting api get all products");

    final url = Uri.parse('${APIConstants.baseURL}${APIConstants.apiVersion}$pathSegment');
    log('url:\n$url');

    try {
      http.Response response = await http.post(
          url,
          headers: await HeaderUtils().getTokenatedHeaders(),
          body: jsonEncode(params.toJson())
      );
      log('get all products data response:\n$response');

      return response;
    } catch(e){
      log('error caught in api client:\n$e}');
      rethrow;
    }
  }

}