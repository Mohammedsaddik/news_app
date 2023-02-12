// ignore_for_file: prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/layout/cubit/cubit.dart';
import 'package:news_app_udemy/layout/cubit/state.dart';
import 'package:news_app_udemy/shared/componnen/commponnents.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        List list = NewsCubit.get(context).business;
        return articalBuilder(list);
      },
    );
  }
}
