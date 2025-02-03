import 'dart:convert';
import 'package:akk_task/model/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/api_constants.dart';
import '../../core/managers/dio_client.dart';

class AuthVM extends ChangeNotifier{
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  TextEditingController userTypeController=TextEditingController();
  TextEditingController fNameController=TextEditingController();
  TextEditingController lNameController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController countryController=TextEditingController();

  final formKey = GlobalKey<FormState>();

  ResponseModel?responseModel;

  clearValues(){
    userTypeController.text='';
    fNameController.text='';
    lNameController.text='';
    userNameController.text='';
    emailController.text='';
    passwordController.text='';
    countryController.text='';
  }


 Future<void> signUp(
     BuildContext context,
     {
    String?userType,
    String?fName,
    String?lName,
    String?userName,
    String?email,
    String?password,
    String?country,
}) async {
    dynamic body ={
      "user_type": userType??'',
      "first_name": fName??'',
      "last_name":lName??'',
      "username": userName??'',
      "email": email??'',
      "password": password??'',
      "country": country??''
    };
    print("sending body : $body");
    body = FormData.fromMap(body);
    try {
      setLoading(true);
      dynamic response = await DioClient.instance.post(APIConstants.signup, data: body);
      print("response is : ${response.toString()}");
      response = jsonDecode(response.toString());

      responseModel=ResponseModel.fromJson(response);
      if(response['status']=="successful"){
        Fluttertoast.showToast(
          msg: response['message'],
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 13.0,
        );

        clearValues();
        context.push("/HomeScreen");


      }


    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          fontSize: 13.0,
        );
      }
    } finally {
      setLoading(false);
    }
  }


}