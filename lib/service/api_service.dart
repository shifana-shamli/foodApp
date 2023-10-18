import 'dart:convert';
import 'dart:developer';

import 'package:loginpage/utils/app_url.dart';
import 'package:http/http.dart' as http;
import '../data/api/login_us_response.dart';
import '../data/api/product_response.dart';

class APIService{
//login
  Future<LoginUsResponse>getLogin(
      String mobileNo,
      String password,
      ) async {
    try {
      var response = await http.Client()
          .post(Uri.parse(AppUrls.baseUrl+AppUrls.loginUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({
            "MobileNo": mobileNo,
            "Password": password,
          }));
      log("API>>>URL>>${AppUrls.baseUrl+AppUrls.loginUrl}<<<RES>>>${response
          .body}<<<REQ>>>${jsonEncode({
        "MobileNo ": mobileNo,
        "Password": password,
      })}");
      if (response.statusCode == 200) {
        return LoginUsResponse.fromJson(json.decode(response.body));
      }
      else if (response.statusCode == 201) {
        return LoginUsResponse.fromJson(json.decode(response.body));
      }
      else if (response.statusCode == 401) {
        return LoginUsResponse(code: 401);
      } else {
        return LoginUsResponse(code: 500);
      }
    } catch (e) {
      log("Error in API$e");
      if (e.toString().startsWith("SocketException") ||
          e.toString().startsWith("Failed host lookup")) {
        //no inter net case
        return LoginUsResponse(code: 503);
      } else {
        return LoginUsResponse(code: 500);
      }
    }
  }

  //product list

  Future<ProductResponse>getProducts(
      ) async {
    try {
      var response = await http.Client()
          .post(Uri.parse(AppUrls.baseUrl+AppUrls.productsUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          });
      log("API>>>URL>>${AppUrls.baseUrl+AppUrls.productsUrl}<<<REQ>>>${response.body}");
          if (response.statusCode == 200) {
          return ProductResponse.fromJson(json.decode(response.body));
          }
          else if (response.statusCode == 201) {
          return ProductResponse.fromJson(json.decode(response.body));
          }
          else if (response.statusCode == 401) {
          return ProductResponse(code: 401);
          } else {
          return ProductResponse(code: 500);
          }
          } catch (e)
      {
        log("Error in API$e");
        if (e.toString().startsWith("ClientException with SocketException") ||
        e.toString().startsWith("SocketException") ||
            e.toString().startsWith("Failed host lookup")) {
          //no inter net case
          return ProductResponse(code: 503);
        } else {
          return ProductResponse(code: 500);
        }
      }
    }
  }