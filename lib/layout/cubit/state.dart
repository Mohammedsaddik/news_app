abstract class NewsStates {}

class NewslInitial extends NewsStates {}
///////////////////علشان اتوجل ما بين زراير الهوم///////
class NewsChangeBottomNavState extends NewsStates {}
//////////////////////business state/////////////////
class NewsGitBusinessLoadingState extends NewsStates {}

class NewsGitBusinessSucessState extends NewsStates {}

class NewsGitBusinessErrorState extends NewsStates
{
  final String error;
  NewsGitBusinessErrorState(this.error);
}
//////////////////////sports state/////////////////
class NewsGitSportsLoadingState extends NewsStates {}

class NewsGitSportsSucessState extends NewsStates {}

class NewsGitSportsErrorState extends NewsStates
{
  final String error;
  NewsGitSportsErrorState(this.error);
}
//////////////////////science state/////////////////
class NewsGitscienceLoadingState extends NewsStates {}

class NewsGitscienceSucessState extends NewsStates {}

class NewsGitscienceErrorState extends NewsStates
{
  final String error;
  NewsGitscienceErrorState(this.error);
}

//////////////////////search state/////////////////
class NewsGitSearchLoadingState extends NewsStates {}

class NewsGitSearchSucessState extends NewsStates {}

class NewsGitSearchErrorState extends NewsStates
{
  final String error;
  NewsGitSearchErrorState(this.error);
}