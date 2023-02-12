
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_udemy/layout/cubit/state.dart';
import 'package:news_app_udemy/modules/business_screen/business_screen.dart';
import 'package:news_app_udemy/modules/science_screen/science_screen.dart';
import 'package:news_app_udemy/modules/sports_screen/sports_screen.dart';
import 'package:news_app_udemy/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewslInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems=
  [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball_outlined),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> bottomScreen =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<String> titles =
  [
    'Business',
    'Sports',
    'Science',
  ];

  void changeBottum(int index) {
    currentIndex = index;
    if(index==1)
      getSports();
    if(index==2)
      getsSience();
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness()
  {
    emit(NewsGitBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',query:
    {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'e1ccf392ae7446d3b2408df09e0b31ef'
    }).then((value)
    {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGitBusinessSucessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGitBusinessErrorState(error.toString()));
    });
  }


  List<dynamic> sports = [];
  void getSports()
  {
    emit(NewsGitSportsLoadingState());
    if(sports.length==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',query:
        {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'e1ccf392ae7446d3b2408df09e0b31ef'
        }).then((value)
        {
          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGitSportsSucessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGitSportsErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGitSportsSucessState());
        }
  }


  List<dynamic> science = [];
  void getsSience()
  {
    emit(NewsGitscienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',query:
        {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'e1ccf392ae7446d3b2408df09e0b31ef'
        }).then((value)
        {
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGitscienceSucessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGitscienceErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGitscienceSucessState());
        }
  }


  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGitSearchLoadingState());
    DioHelper.getData(url: 'v2/everything',query:
    {
      'q': '$value',
      'apiKey': 'e1ccf392ae7446d3b2408df09e0b31ef'
    }).then((value)
    {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGitSearchSucessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGitSearchErrorState(error.toString()));
    });

  }

}