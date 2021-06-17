import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Frutas {
  String title;
}

class _HomeState extends State<Home> {
  final List<String> list = [
    ('Morango'),
    ('Limão'),
    ('Laranja'),
    ('Kiwi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          redirectToNewPage();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(100),
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var i = index + 1;
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 2,
                  ),
                ),
              ),
              height: 50,
              width: 50,
              child: Text(
                '$i - ${list[index]}',
              ),
            );
          },
        ),
      ),
    );
  }

  void redirectToNewPage() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Salvar(),
      ),
    )
        .then((text) {
      if (text == null) {
        return '';
      }
      print(text);
      setState(() {
        list.add(text);
      });
    });
  }
}

class Salvar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final tarefaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: tarefaController,
                    validator: (title) {
                      if (title.isEmpty) {
                        return 'Esse campo é obrigatório!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop(tarefaController.text);
                      }
                    },
                    child: Text('Salvar'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
