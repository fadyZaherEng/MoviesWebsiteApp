import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_website_apps/src/domain/usecase/get_language_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/set_language_use_case.dart';

class MainCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  MainCubit(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(Locale(window.locale.languageCode)) {
    getLanguage();
  }

  void getLanguage() async {
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(Locale(language));
  }
}
