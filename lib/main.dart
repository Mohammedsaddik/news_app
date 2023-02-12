
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/layout/cubit/cubit.dart';
import 'package:news_app_udemy/layout/home-layout.dart';
import 'package:news_app_udemy/network/remote/dio_helper.dart';
import 'package:news_app_udemy/shared/componnen/cubit/cubit.dart';
import 'package:news_app_udemy/shared/componnen/cubit/states.dart';
import 'package:news_app_udemy/style/themes.dart';
import 'shared/bloc_observe/bloc_obsevable.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp(true));
}
class MyApp extends StatelessWidget
{
  late final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getsSience()),
        BlocProvider(create: (context)=>AppCubit(),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            theme: darkTheme,
            themeMode: AppCubit.get(context).isDark ?ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:  NewsLayout(),
          );
        },
      ),
    );
  }
}
