import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tab_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context, listen: true);

    return DefaultTabController(
      length: tabProvider.tabs.length,
      child: Builder(
        builder: (context) {
          final TabController controller = DefaultTabController.of(context);
          controller.addListener(() {
            tabProvider.setCurrentTabIndex(controller.index);
          });
          return Scaffold(
            appBar: AppBar(
              backgroundColor: tabProvider.getCurrentTab().appBarColor,
              title: tabProvider.getCurrentTab().appBarWidget,
              bottom: TabBar(
                controller: controller,
                tabs: tabProvider.tabs.map((tab) {
                  return Tab(
                    text: tab.title,
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              controller: controller,
              children: tabProvider.tabs.map((tab) => tab.body).toList(),
            ),
          );
        },
      ),
    );
  }
}
