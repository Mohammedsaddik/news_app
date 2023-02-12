
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/network/local_cash/cash_helper.dart';
import 'package:news_app_udemy/shared/componnen/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitAppState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeThemeMode({required bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeModeState());
      });
    }
  }
}