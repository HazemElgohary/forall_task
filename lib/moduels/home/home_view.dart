import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_task/shared/component/inputs/input_button.dart';
import 'package:forall_task/shared/component/inputs/input_widget.dart';
import 'package:forall_task/shared/component/problem_item.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'ForAll Task',
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<HomeCubit>(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InputWidget(
                      title: 'please Enter a number of problems',
                      controller: cubit.probNumController,
                      isNumber: true,
                      onChange: (value) {
                        cubit.addProblems();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Column(
                          children: List.generate(
                            cubit.problems.length,
                            (index) => ProblemItem(
                              problem: cubit.problems[index],
                              onChanged: cubit.changeSelection,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    DefaultButton(
                      text: 'submit',
                      onTap: () {
                        cubit.submit(
                          context,
                          cubit.getValidProblemCount(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
