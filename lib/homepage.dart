import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sap_wiki/cubit/navigation_cubit.dart';
import 'package:sap_wiki/models/navigation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marco Beier Wiki"),
      ),
      body: BlocProvider(
        create: (context) => NavigationCubit()..init(),
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state is NavigationSuccess) {
              return _NavigationWidget(list: state.list);
            } else if (state is NavigationError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class _NavigationWidget extends StatelessWidget {
  const _NavigationWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<NavigationModel> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list
              .map((e) => NavigationCard(
                    model: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class NavigationCard extends StatelessWidget {
  final NavigationModel model;
  const NavigationCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text(model.title),
              ElevatedButton(
                onPressed: () {},
                child: Text(model.title, textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      ),
    );
  }
}
