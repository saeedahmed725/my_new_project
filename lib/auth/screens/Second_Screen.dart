import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final item = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItem() {
    item.insert(0, "Item ${item.length + 1}");
    key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    key.currentState!.removeItem(
        index,
            (_, animation) => SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text("Deleted", style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 300));
    item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter App"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: addItem,
            icon: const Icon(Icons.add),
          ),
          Expanded(
            child: AnimatedList(
              key: key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    color: Colors.purpleAccent,
                    child: ListTile(
                      title: Text(item[index]),
                      trailing: IconButton(onPressed: () {
                        removeItem(index);
                      },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
