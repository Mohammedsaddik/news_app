import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/layout/cubit/cubit.dart';
import 'package:news_app_udemy/layout/cubit/state.dart';
import 'package:news_app_udemy/shared/componnen/commponnents.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CostumTextFormFeild(
                    label: 'search',
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    prefix: Icons.search,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Sorry ! , Search can't be empty, Enter What are you search ";
                      } else {}
                    }),
              ),
              Expanded(
                child: articalBuilder(list,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
