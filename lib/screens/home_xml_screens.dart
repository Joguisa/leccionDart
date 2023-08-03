import '../models/comida.dart';
import 'package:flutter/material.dart';
import '../services/xml_services.dart';


class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  late List<Food> _foods;

  @override
  void initState() {
    super.initState();
    _loadXML();
  }

  Future<void> _loadXML() async {
    final XmlService xmlService = XmlService();
    final List<Food> foods = await xmlService.getFoodsFromXML();

    setState(() {
      _foods = foods;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (_foods == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('XML Comida'),
        ),
        body: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (BuildContext context, int index) {
            final Food food = _foods[index];
            return Card(
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      food.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      title: Text(food.name),
                      subtitle: Text(food.description),
                      trailing: Text(food.price),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
