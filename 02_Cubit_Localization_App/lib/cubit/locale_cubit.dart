import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:localization_app/lang_chache_helper.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  Future<void> getSavedLang() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(
      ChangeLocaleState(locale: Locale(cachedLanguageCode)),
    );
  }

  Future<void> changeLanguage(String langCode) async {
    await LanguageCacheHelper().getCachedLanguageCode();
    emit(
      ChangeLocaleState(locale: Locale(langCode)),
    );
  }
}
