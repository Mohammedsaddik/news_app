
// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/layout/cubit/cubit.dart';
import 'package:news_app_udemy/layout/cubit/state.dart';
import 'package:news_app_udemy/shared/componnen/commponnents.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    List list = NewsCubit.get(context).sports;
    return articalBuilder(list);
  }
}
