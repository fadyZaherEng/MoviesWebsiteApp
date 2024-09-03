
import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';

class LandingScreen extends BaseStatefulWidget {
  const LandingScreen({super.key});

  @override
  BaseState<LandingScreen> baseCreateState() => _LandingWebScreenState();
}

class _LandingWebScreenState extends BaseState<LandingScreen> {


  @override
  Widget baseBuild(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(

        );
        if (constraints.maxWidth > 850) {
          // if (!_isLandingDataFetched) {
          //   return const SkeletonLandingWebWidget();
          // }
          // return WebLargeLandingScreen(
          //   offers: _getLandingPageDetails.offers,
          //   mainInfo: _getLandingPageDetails.mainInfo,
          //   partners: _getLandingPageDetails.partners,
          //   privacyPolicyLink:
          //   _getLandingPageDetails.configuration.privacyAndPolicyLink,
          //   projects: _getLandingPageDetails.compounds,
          //   socialMedias: _getLandingPageDetails.socialMedia,
          //   countryCode: GetCurrentCountryCodeUseCase(injector())(),
          //   selectedProject: selectedProject,
          //   selectedLanguage: _selectedLanguage,
          //   isCheckSendMeAlerts: _isCheckSendMeAlerts,
          //   nameErrorMessage: _nameErrorMessage,
          //   emailAddressErrorMessage: _emailAddressErrorMessage,
          //   countryErrorMessage: _countryErrorMessage,
          //   messageErrorMessage: _messageErrorMessage,
          //   phoneNumberErrorMessage: _phoneNumberErrorMessage,
          //   fullNameController: fullNameController,
          //   phoneNumberController: phoneNumberController,
          //   emailController: emailController,
          //   selectCountryController: selectCountryController,
          //   messageController: messageController,
          //   isResetPhoneNumber: _isResetPhoneNumber,
          //   phoneKey: _getPhoneKey(),
          //   hostLine: _getLandingPageDetails.mainInfo.hotLine,
          //   configuration: _getLandingPageDetails.configuration,
          //   addresses: _getLandingPageDetails.addresses,
          //   onInit: () {
          //     // if (!_isLandingDataFetched) {
          //     //   _bloc.add(GetLandingSliderImagesEvent(
          //     //       request: OffersRequest(pageCode: "appHome")));
          //     // }
          //   },
          //   onProjectTab: (project) {
          //     context.go(Routes.webUnits);
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const UnitsWebScreen()));
          //   },
          //   onFullNameChanged: (value) {
          //     _bloc.add(ValidateFullNameEvent(value));
          //   },
          //   onPhoneNumberChanged: (phone, regionCode) {
          //     _isResetPhoneNumber = false;
          //     _regionCode = regionCode;
          //     _bloc.add(ValidateMobileNumberEvent(
          //         mobileNo: phone, countryCode: regionCode));
          //   },
          //   onEmailChanged: (value) {
          //     _bloc.add(ValidateEmailEvent(value));
          //   },
          //   onMessageChanged: (value) {
          //     _bloc.add(ValidateMessageEvent(value));
          //   },
          //   onProjectSelected: (Compounds project) {
          //     selectedProject = project;
          //   },
          //   onTabExpressInterest: () {
          //     _bloc.add(ContactUsSendEvent(
          //       addContactUsRequest: AddContactUsRequest(
          //         name: fullNameController.value.text,
          //         email: emailController.value.text,
          //         mobile: phoneNumberController.value.text,
          //         countryId: selectedProject.id,
          //         message: messageController.value.text,
          //       ),
          //       countryName: selectCountryController.value.text,
          //       mobileNumber: phoneNumberController.text,
          //       regionCode: _regionCode,
          //     ));
          //   },
          //   onSelectLanguage: (language) {
          //     _selectedLanguage = language;
          //   },
          // );
        } else {
          // if (!_isLandingDataFetched) {
          //   return const LandingMobileSkeleton();
          // }
          // return LandingMobileScreen(
          //   offers: _getLandingPageDetails.offers,
          //   mainInfo: _getLandingPageDetails.mainInfo,
          //   partners: _getLandingPageDetails.partners,
          //   projects: _getLandingPageDetails.compounds,
          //   socialMedias: _getLandingPageDetails.socialMedia,
          //   countryCode: GetCurrentCountryCodeUseCase(injector())(),
          //   selectedProject: selectedProject,
          //   selectedLanguage: _selectedLanguage,
          //   hostLine: _getLandingPageDetails.mainInfo.hotLine,
          //   configuration: _getLandingPageDetails.configuration,
          //   addresses: _getLandingPageDetails.addresses,
          //   privacyPolicyLink:
          //   _getLandingPageDetails.configuration.privacyAndPolicyLink,
          //   countryErrorMessage: _countryErrorMessage,
          //   nameErrorMessage: _nameErrorMessage,
          //   emailAddressErrorMessage: _emailAddressErrorMessage,
          //   messageErrorMessage: _messageErrorMessage,
          //   phoneNumberErrorMessage: _phoneNumberErrorMessage,
          //   fullNameController: fullNameController,
          //   phoneNumberController: phoneNumberController,
          //   emailController: emailController,
          //   selectCountryController: selectCountryController,
          //   messageController: messageController,
          //   isResetPhoneNumber: _isResetPhoneNumber,
          //   phoneKey: _getPhoneKey(),
          //   onTabExpressInterest: () {
          //     _bloc.add(ContactUsSendEvent(
          //       addContactUsRequest: AddContactUsRequest(
          //         name: fullNameController.value.text,
          //         email: emailController.value.text,
          //         mobile: phoneNumberController.value.text,
          //         countryId: selectedProject.id,
          //         message: messageController.value.text,
          //       ),
          //       countryName: selectCountryController.value.text,
          //       mobileNumber: phoneNumberController.text,
          //       regionCode: _regionCode,
          //     ));
          //   },
          //   onFullNameChanged: (value) {
          //     _bloc.add(ValidateFullNameEvent(value));
          //   },
          //   onPhoneNumberChanged: (phone, regionCode) {
          //     _isResetPhoneNumber = false;
          //     _regionCode = regionCode;
          //     _bloc.add(ValidateMobileNumberEvent(
          //         mobileNo: phone, countryCode: regionCode));
          //   },
          //   onEmailChanged: (value) {
          //     _bloc.add(ValidateEmailEvent(value));
          //   },
          //   onMessageChanged: (value) {
          //     _bloc.add(ValidateMessageEvent(value));
          //   },
          //   onInit: () {
          //     // if (!_isLandingDataFetched) {
          //     //   _bloc.add(GetLandingSliderImagesEvent(
          //     //       request: OffersRequest(pageCode: "appHome")));
          //     // }
          //   },
          //   signIn: () {
          //     Navigator.pushNamed(context, Routes.signIn,
          //         arguments: {"unitId": -1, "isFromDeepLink": false});
          //   },
          //   signUp: () {
          //     Navigator.pushNamed(context, Routes.register);
          //   },
          //   onProjectTab: (project) {
          //     context.go(Routes.webUnits);
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const UnitsWebScreen()));
          //   },
          //   onProjectSelected: (Compounds project) {
          //     selectedProject = project;
          //   },
          //   onSelectLanguage: (language) {
          //     _selectedLanguage = language;
          //   },
          // );
        }
      },
    );
  }

}
