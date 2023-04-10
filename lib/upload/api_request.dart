import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:youtube_studio/upload/upload.dart';
import '../consts/const.dart';
import 'app_exceptions.dart';
import 'error_handler.dart';

class CustomBaseClient with ErrorHandler {
  Future<dynamic> uploadFile({
    required String uploadURL,
    required Map<String, String>? headers,
    required dynamic stream,
  }) async {
    try {
      var response = await http.Client().post(Uri.parse(uploadURL),
          headers: {
            ...headers ?? {},
            "content-type": FORM_CONTENT_TYPE,
            "x-goog-upload-command": "upload, finalize",
            "x-goog-upload-file-name": "file-${DateTime.now()}",
            "x-goog-upload-offset": "0",
            "referrer": YT_STUDIO_URL,
          },
          body: stream);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          "No Internet Connection", null, YT_STUDIO_URL.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "API not responding in Time", null, YT_STUDIO_URL.toString());
    }
  }

  Future<Response> StartinguploadFile({
    required String uploadURL,
    required Map<String, String>? headers,
    // required dynamic stream,
  }) async {
    try {
      Map<String, String>? header = headers ?? {};
      var response = await http.Client().post(Uri.parse(uploadURL),
          headers: {
            ...header,
            "content-type": FORM_CONTENT_TYPE,
            "x-goog-upload-command": "start",
            "x-goog-upload-file-name": "file-${DateTime.now()}",
            "x-goog-upload-protocol": "resumable"
          },
          body: json.encode({frontendUploadId}));
      return response;
    } on SocketException {
      throw FetchDataException(
          "No Internet Connection", null, YT_STUDIO_URL.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "API not responding in Time", null, YT_STUDIO_URL.toString());
    }
  }

  Future<Response> uploadingResponse({
    required String uploadURL,
    required Map<String, String>? headers,
    required dynamic createVideoBody,
  }) async {
    try {
      Map<String, String>? header = headers ?? {};
      var response = await http.Client().post(Uri.parse(uploadURL),
          headers: header, body: json.encode({createVideoBody}));
      return response; //TODO changement
    } on SocketException {
      throw FetchDataException(
          "No Internet Connection", null, YT_STUDIO_URL.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "API not responding in Time", null, YT_STUDIO_URL.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseString = utf8.decode(response.bodyBytes);
        return responseString;
      case 201:
        var responseString = utf8.decode(response.bodyBytes);
        return responseString;
      // break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), null,
            response.request?.url.toString());
      // break;
      case 401:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), null,
            response.request?.url.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), null,
            response.request?.url.toString());
      case 404:
        throw FetchDataException("Not Found :${response.statusCode}", null,
            response.request?.url.toString());

      case 500:
        throw FetchDataException(
            "Internal Server Error :${response.statusCode}",
            null,
            response.request?.url.toString());
      case 504:
        throw FetchDataException(
            "Gateway Timeout It Seems Server is Slow to  Respond :${response.statusCode}",
            null,
            response.request?.url.toString());

      default:
        throw FetchDataException(
            "Error Occured With Code :${response.statusCode}",
            null,
            response.request?.url.toString());
    }
  }
}


// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:shaadi_aggarwal/utils/services/app_exceptions.dart';

// import '../../models/profile_list_model.dart';
// import 'app_exceptions.dart';
// import 'error_handler.dart';

// class CustomBaseClient with ErrorHandler {
//   static const int TIME_OUT_DURATION = 60;

//   ///GET REQUEST with HTTP package
//   Future<List<ProfileListModel>?> get(
//       String baseUrl, String api, Map<String, String>? headers,
//       {String? query}) async {
//     var uri = (query != null && query != "")
//         ? Uri.parse("$baseUrl$api?$query")
//         : Uri.parse(baseUrl + api);

//     try {
//       var response = await http
//           .get(uri, headers: headers)
//           .timeout(const Duration(seconds: TIME_OUT_DURATION));
//       if (response.statusCode == 200) {
//         return postFromJson(response.body);
//       } else {
//         _processResponse(response);
//       }
//     } on SocketException {
//       throw FetchDataException("No Internet Connection", null, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(
//           "API not responding in Time", null, uri.toString());
//     }
//   }

//   ///Post REQUEST with HTTP package
//   Future<dynamic> post(String baseUrl, String api, Map<String, String>? headers,
//       {String? query, Map? payloadObj}) async {
//     var uri = (query != null && query != "")
//         ? Uri.parse("$baseUrl$api?$query")
//         : Uri.parse(baseUrl + api);
//     var payload = json.encode(payloadObj);

//     try {
//       var response = await http.Client()
//           .post(
//             uri,
//             headers: headers,
//             body: payload,
//           ) //encoding: is utf8 by default
//           .timeout(const Duration(seconds: TIME_OUT_DURATION));
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException("No Internet Connection", null, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(
//           "API not responding in Time", null, uri.toString());
//     }
//   }

//   dynamic _processResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseString = utf8.decode(response.bodyBytes);
//         return responseString;
//       case 201:
//         var responseString = utf8.decode(response.bodyBytes);
//         return responseString;
//       // break;
//       case 400:
//         throw BadRequestException(utf8.decode(response.bodyBytes), null,
//             response.request?.url.toString());
//       // break;
//       case 401:
//         throw UnAuthorizedException(utf8.decode(response.bodyBytes), null,
//             response.request?.url.toString());
//       case 403:
//         throw UnAuthorizedException(utf8.decode(response.bodyBytes), null,
//             response.request?.url.toString());
//       case 404:
//         throw FetchDataException("Not Found :${response.statusCode}", null,
//             response.request?.url.toString());

//       case 500:
//         throw FetchDataException(
//             "Internal Server Error :${response.statusCode}",
//             null,
//             response.request?.url.toString());
//       case 504:
//         throw FetchDataException(
//             "Gateway Timeout It Seems Server is Slow to  Respond :${response.statusCode}",
//             null,
//             response.request?.url.toString());

//       default:
//         throw FetchDataException(
//             "Error Occured With Code :${response.statusCode}",
//             null,
//             response.request?.url.toString());
//     }
//   }
// }

