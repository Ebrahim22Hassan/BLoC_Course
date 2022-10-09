import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/app_localizations.dart';
import 'package:localization_app/cubit/locale_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting".tr(context)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<LocaleCubit, LocaleState>(
            listener: (context, state) {
              if (state is ChangeLocaleState) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if (state is ChangeLocaleState) {
                return DropdownButton<String>(
                  value: state.locale.languageCode,
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      BlocProvider.of<LocaleCubit>(context)
                          .changeLanguage(newValue);
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
