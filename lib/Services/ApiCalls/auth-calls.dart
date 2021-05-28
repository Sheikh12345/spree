import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Models/cart_model.dart';
import 'package:spree/Models/products_model.dart';
import 'package:spree/Models/profile_model.dart';
import 'package:spree/providers/profile_provider.dart';

class CallApi {
  String token;
  CallApi() {
    SharedPreferences.getInstance().then((value) {
      token = value.getString("token");
    });
  }

  Future postSignUpData(
      {String fName,
      String lName,
      String email,
      String password,
      String confirmPass}) async {
    String _url =
        'https://www.spreere.com/api/v1/register?first_name=$fName&last_name'
        '=$lName&email=$email&password=$password&password_confirmation=$confirmPass&tas=1';

    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future postSignInData({String email, String password}) async {
    String _url =
        'https://www.spreere.com/api/v1/login?email=$email&password=$password';
    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future postResetPassword({String email}) async {
    String _url = 'https://www.spreere.com/api/v1/reset-password?email=$email';
    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future getCard() async {
    await SharedPreferences.getInstance().then((value) async {
      token = value.getString('token');
      print("Token => $token");
      String _url = 'https://www.spreere.com/api/v1/profile/card';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeadersForProfile());
      print(response.body);
    });
  }

  Future<ProfileModel> getProfile({BuildContext context}) async {
    try {
      String _url = 'https://www.spreere.com/api/v1/profile';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  getAllOder({BuildContext context}) async {
    try {
      String _url = 'https://www.spreere.com/api/v1/profile/order';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  getOrders({BuildContext context}) async {
    try {
      String _url =
          'https://www.spreere.com/api/v1/profile/order/3000001/products';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  Future getProducts({BuildContext context}) async {
    try {
      String _url = 'https://www.spreere.com/api/v1/product/2000001';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return ProductsModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("Products error => ${e.toString()}");
    }
  }

  Future postItemsToCart({var id,var quantity,BuildContext context}) async {
   try{
     String _url = 'https://www.spreere.com/api/v1/cart/store?id=$id&quantity=$quantity';
     http.Response response = await http.post(Uri.parse(_url), headers: _setHeadersForProfile(context: context));
     print("${response.body}");
   }catch(e){
     print("Item to cart error ${e.toString()}");
   }
  }

  Future getItemsToCart({BuildContext context}) async {
   try{
     String _url = 'https://www.spreere.com/api/v1/cart';
     http.Response response = await http.get(Uri.parse(_url), headers: _setHeadersForProfile(context: context));
     print("${response.body}");
     if(response.statusCode==200){
       return CartModel.fromJson(jsonDecode(response.body));
     }
   }catch(e){
     print("Item to cart error ${e.toString()}");
   }
  }

  Future getFeaturedCategories() async {
    await SharedPreferences.getInstance().then((value) async {
      token = value.getString('token');
      print("Token => $token");
      String _url = 'https://www.spreere.com/api/v1/featured-categories';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      print(response.body);
    });
  }

  Future getFeaturedCategoriesProducts() async {
    await SharedPreferences.getInstance().then((value) async {
      token = value.getString('token');
      print("Token => $token");
      String _url =
          'https://www.spreere.com/api/v1/featured-categories/products?f_category=Featured One';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      print(response.body);
    });
  }

  Future<http.Response> postPersonalInfo(
      {BuildContext context,
      String fName,
      String lName,
      String address,
      String apartmentAddress,
      String zipCode,
      String city,
      String region,
      String country}) async {
    try {
      String url =
          "https://www.spreere.com/api/v1/profile/address/store?first_name=$fName&last_name=$lName&address=$address&app_address=$apartmentAddress&city=$city&region=$region&country=$country&zipcode=$zipCode";

      http.Response response = await http.post(Uri.parse(url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");
      return response;
    } catch (e) {
      print("error on updating info => ${e.toString()}");
    }
  }

  Future<http.Response> GetPersonalInfo({BuildContext context}) async {
    try {
      String url = "https://www.spreere.com/api/v1/profile/address";

      http.Response response = await http.get(Uri.parse(url),
          headers: _setHeadersForProfile(context: context));

      print("${response.body}");
    } catch (e) {
      print("error on updating info => ${e.toString()}");
    }
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};

  _setHeadersForProfile({BuildContext context}) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${Provider.of<ProfileProvider>(context, listen: false).tokenGet()}'
      };
}
