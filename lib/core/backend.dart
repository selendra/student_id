import 'dart:convert';

import 'package:http/http.dart' as _http;
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/sign_up_m.dart';
import 'package:student_id/services/storage.dart';

class Backend {

  final String _api = "https://accounts.koompi.com/";
  _http.Response? _res;
  Map<String, dynamic>? _decode; 
  String? _bodyEncode; 
  Map<String, dynamic>? _token;

  /// Http Header
  Map<String, String> _conceteHeader({String? key, String? value}) { /* Concete More Content Of Header */
    return key != null 
    ? { /* if Parameter != Null = Concete Header With  */
      "Content-Type": "application/json; charset=utf-8", 
      key: value!
    }
    : { /* if Parameter Null = Don't integrate */
      "Content-Type": "application/json; charset=utf-8"
    };
  }

  Map<String, String> _multipartHeader(String? _key, String? _value) { /* Concete More Content Of Header */
    return _key != null 
    ? { /* if Parameter != Null = Concete Header With  */
      "Content-Type": "multipart/form-data", 
      _key: _value!
    }
    : { /* if Parameter Null = Don't integrate */
      "Content-Type": "multipart/form-data"
    };
  }

  Future<_http.Response> login(String? email, String? passwords) async {
    print("login ");
    print("signUpModel.emailInputController.text ${email}");
    print("signUpModel.passwordInputController.text ${passwords}");
    // "authorization", "Bearer ${_token!['token']}}"
      // _token = await StorageServices.fetchData(DbKey.token);
    _bodyEncode = json.encode({ /* Convert to Json String */
      "email": email,
      "password": passwords
    });
    _res = await _http.post(Uri.parse(_api+"login"), headers: _conceteHeader(), body: _bodyEncode);
    return _res!;
  }

  Future<_http.Response> register(SignUpModel? signUpModel) async {

    // print("signUpModel!.userNameController ${signUpModel!.userNameController.text}");
    // print("signUpModel.emailInputController.text ${signUpModel.emailInputController.text}");
    // print("signUpModel.passwordInputController.text ${signUpModel.passwordInputController.text}");
    // print("signUpModel.conPasController.text ${signUpModel.conPasController.text}");

    _bodyEncode = json.encode({ /* Convert to Json String */
      "fullname": signUpModel!.userNameController.text,
      "email": signUpModel.emailInputController.text,
      "password": signUpModel.passwordInputController.text,
      "confirmPassword": signUpModel.conPasController.text
    });
    _res = await _http.post(Uri.parse(_api+"register"), headers: _conceteHeader(), body: _bodyEncode);
    return _res!;
  }
}