import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text('List View Widget'),
          tileColor: Colors.orangeAccent,
          onTap: () {},
          leading: const Icon(Icons.person),
          trailing: Icon(Icons.menu),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.white,
        );
      },
    );
  }
}
