
// const baseServ = "http://192.168.1.114/";
const baseServ = "http://127.0.0.1:8000/";
const baseUrl = "${baseServ}api/";
const storageUrl = "http://localhost:8000";
const  auth = "auth/";
const  diagnose = "diagnose/";




class AppUrl {

  /// User
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  // static final getUser = "${baseUrl}";
  static const login = "${baseUrl}${auth}login/";
  static const register = "${baseUrl}${auth}register";
  static const logout = "${baseUrl}${auth}logout/";
  static const getProfile = '${baseUrl}${auth}me/';
  static const updateCurrentUserProfile = '${baseUrl}${auth}me/';

  static const requestResetPasswordWithToken = '${baseUrl}${auth}password-reset-with-token';
  static const verifyOtp = '${baseUrl}${auth}otp-verify';
  static const requestResetPassword = '${baseUrl}${auth}password-reset-otp-request';
  static const verifyEmail = '${baseUrl}${auth}verify-email';


  static const diagnoseUrl = '${baseUrl}${diagnose}';



  ///------------------------------------------------------------------------------>








///*******************************************************************************
///<------------------------------------------------------------------------------
///------------------------------------------------------------------------------>

}
