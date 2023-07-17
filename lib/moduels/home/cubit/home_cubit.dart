import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:forall_task/models/problem.dart';
import 'package:forall_task/services/problem.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final services = GetIt.instance<ProblemService>();

  final probNumController = TextEditingController();
  final problems = <ProblemModel>[];

  void addProblems() {
    problems.clear();
    problems.addAll(
      services.fetchAll(
        int.parse(probNumController.text),
      ),
    );
    emit(HomeAddProblem());
  }

  void changeSelection(ProblemModel problem){
    if(problems.contains(problem)){
      final oldIndex = problems.indexOf(problem);
      problems[oldIndex] = problem;
      emit(HomeChangeProblemValue());
    }
  }


  int getValidProblemCount(){
    return services.countValidProblems(problems);
  }
  Future<void> submit(BuildContext context,int count)async{
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('the number of problems is : $count'),
        );
      },
    );
    probNumController.clear();
    problems.clear();
    emit(HomeInitial());
  }
}
