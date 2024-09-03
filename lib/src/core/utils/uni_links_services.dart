// import 'package:city_eye/src/config/routes/routes_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:uni_links/uni_links.dart';
//
// class UniLinksService {
//
//   static Future<void> init({
//     checkActualVersion = false,
//     required BuildContext context,
//   }) async {
//     // This is used for cases when: APP is not running and the user clicks on a link.
//     try {
//       final Uri? uri = await getInitialUri();
//       if(uri != null) {
//         _uniLinkHandler(uri: uri, context: context);
//       }
//     } on PlatformException {
//       if (kDebugMode) {
//         print("(PlatformException) Failed to receive initial uri.");
//       }
//     } on FormatException catch (error) {
//       if (kDebugMode) {
//         print("(FormatException) Malformed Initial URI received. Error: $error");
//       }
//     }
//
//     // This is used for cases when: APP is already running and the user clicks on a link.
//     uriLinkStream.listen((Uri? uri) async {
//       if(uri != null) {
//         _uniLinkHandler(uri: uri, context: context);
//       }
//     }, onError: (error) {
//       if (kDebugMode) print('UniLinks onUriLink error: $error');
//     });
//   }
//
//   static Future<void> _uniLinkHandler({
//     required Uri uri,
//     required BuildContext context,
//   }) async {
//     final Uri deepLink = uri;
//
//     if (deepLink.queryParameters.containsKey('invitedUserExistsStatus') &&
//         deepLink.queryParameters['invitedUserExistsStatus'] == "False") {
//       Navigator.pushReplacementNamed(
//         context,
//         Routes.resetPasswordScreen,
//         arguments: {
//           "phoneNumber": deepLink.queryParameters['mobileNumber'] ?? "0",
//           "userId":
//               int.parse(deepLink.queryParameters['familyMemberId'] ?? "0"),
//           "invitationId": int.parse(deepLink.queryParameters['id'] ?? "0"),
//           "isFromDeepLink": true,
//         },
//       );
//     } else if (deepLink.queryParameters
//             .containsKey('invitedUserExistsStatus') &&
//         deepLink.queryParameters['invitedUserExistsStatus'] == "True") {
//       if (deepLink.queryParameters.containsKey('isOtpVerified') &&
//           deepLink.queryParameters['isOtpVerified'] == "True") {
//         Navigator.pushReplacementNamed(
//           context,
//           Routes.signIn,
//           arguments: {
//             "unitId": -1,
//             "isFromDeepLink": true,
//           },
//         );
//       } else {
//         Navigator.pushReplacementNamed(
//           context,
//           Routes.otp,
//           arguments: {
//             "phoneNumber": deepLink.queryParameters['mobileNumber'] ?? "0",
//             "userId":
//                 int.parse(deepLink.queryParameters['familyMemberId'] ?? "0"),
//             "invitationId": int.parse(deepLink.queryParameters['id'] ?? "0"),
//             "isFromDeepLink": true,
//           },
//         );
//       }
//     }
//   }
// }
