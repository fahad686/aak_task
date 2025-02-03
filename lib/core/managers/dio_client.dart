// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/api_constants.dart';

class DioClient {
  DioClient._privateConstructor();
  static final DioClient instance = DioClient._privateConstructor();
  final Dio _dio = Dio()
    ..options.baseUrl = APIConstants.apiBaseUrl
    ..options.connectTimeout = Duration(milliseconds: 30000)
    ..options.receiveTimeout = Duration(milliseconds: 30000)
    ..httpClientAdapter
    ..options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',

    };

  String? token;

  void setToken(String token) {
    this.token = token;
    debugPrint('Token has been set to $token');
    _dio.options.headers = {'userToken': token};
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log("call get api : ${APIConstants.apiBaseUrl}$uri");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(null);
      }

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      log("response is $response");
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.statusCode);
      }
      if (e.response?.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized kill token and  navigate to login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      // throw FormatException("Unable to process the data");
      return e.response!;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log("call post api : ${APIConstants.apiBaseUrl}$uri");
      log("body: $data");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(null);
      }
      dynamic response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      log("Response from post Api: $response");
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.statusCode);
      }
      if (e.response?.statusCode == 401) {
        log('signing out');

      }
      return e.response!;
    } on FormatException catch (e) {
      log('Format Exception : $e');
      throw FormatException("Unable to process the data");
    } catch (e) {
      if (kDebugMode) {
        print('Format Exception : $e');
      }
      rethrow;
    }
  }

  Future<Response?> postWithOutToken(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Dio dio = Dio()
        ..options.baseUrl = APIConstants.apiBaseUrl
        ..options.connectTimeout = Duration(milliseconds: 30000)
        ..options.receiveTimeout = Duration(milliseconds: 30000);
      //  var connectivity= await (Connectivity().checkConnectivity());
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(
          Response(requestOptions: RequestOptions(path: ''), statusCode: 100),
        );
      }

      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
