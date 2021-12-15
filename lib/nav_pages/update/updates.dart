import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sap_wiki/nav_pages/update/cubit/update_cubit.dart';
import 'package:sap_wiki/nav_pages/update/update_model.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);
  @override
  _UpdatePage createState() => _UpdatePage();
}

class _UpdatePage extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Updates'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
          foregroundColor: Colors.blue,
        ),
        body: BlocProvider(
          create: (context) => UpdateCubit()..init(),
          child: BlocBuilder<UpdateCubit, UpdateState>(
            builder: (context, state) {
              if (state is UpdateSuccess) {
                return UpdateJson(list: state.list);
              } else if (state is UpdateError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}

class UpdateJson extends StatelessWidget {
  const UpdateJson({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<UpdateModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((e) => Update1(model: e)).toList(),
    );
  }
}

class Update1 extends StatelessWidget {
  const Update1({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UpdateModel model;
  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        iconColor: Theme.of(context).iconTheme.color,
        useInkWell: true,
      ),
      child: Expanded(
        child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment:
                            ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: true,
                        tapHeaderToExpand: true,
                      ),
                      header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          model.version,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      collapsed: Text(
                        model.title,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.title + '\n',
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                                Text(
                                  model.content,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme:
                                const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
