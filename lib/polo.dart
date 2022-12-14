import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// You can also test with your own ad unit IDs by registering your device as a
// test device. Check the logs for your device's ID value.
const String testDevice = 'ca-app-pub-2413745674362916~7325689311';

class TelaPolo extends StatefulWidget {
  const TelaPolo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TelaPolo> {
  @override
  void dispose() {
    super.dispose();
  }

  final TextEditingController _controllerMinimo = TextEditingController();
  final TextEditingController _controllerMaximo = TextEditingController();
  int valorMinimo = 0;
  int valorMaximo = 0;
  int quantidade = 0;
  bool _configurar = false;
  var _espacoDoSorteio = [];
  String _validacao = "Normal";

  void _inserirValores() {
    setState(() {
      valorMinimo = int.tryParse(_controllerMinimo.text) as int;
      valorMaximo = int.tryParse(_controllerMaximo.text) as int;
      quantidade = 1;
    });
    _validador();
  }

  void _validador() {
    if (valorMinimo < valorMaximo) {
      _calcularNumeros();
      setState(() {
        _validacao = "Normal";
      });
    } else {
      setState(() {
        _validacao =
            "O valor mínimo não pode ser o maior ou ambos serem iguais";
      });
    }
  }

  void _calcularNumeros() {
    if (_espacoDoSorteio.isEmpty) {
      for (int i = valorMinimo; i <= valorMaximo; i++) {
        setState(() {
          _espacoDoSorteio.add(i);
        });
      }
      _chamarTela();
    } else {
      while (_espacoDoSorteio.isNotEmpty) {
        _espacoDoSorteio = [];
      }
      _calcularNumeros();
    }
  }

  void _chamarTela() {
    if (_configurar == false) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Resultado(
                  _espacoDoSorteio, valorMinimo, valorMaximo, quantidade)));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Config(_espacoDoSorteio, valorMinimo, valorMaximo)));
    }
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Marco Polo'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                quantidade;
              })
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                child: Text(
                  "Insira os números para o sorteio:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                )),
            TextField(
              keyboardType: TextInputType.number,
              controller: _controllerMinimo,
              decoration: const InputDecoration(labelText: "Menor número"),
              maxLength: 3,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controllerMaximo,
                decoration: const InputDecoration(labelText: "Maior número"),
                maxLength: 3,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: SwitchListTile(
                  title: const Text(
                    "Desejo sortear mais de um número",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                  value: _configurar,
                  onChanged: (bool valor) {
                    setState(() {
                      _configurar = valor;
                    });
                  }),
            ),
            ElevatedButton(
                // color: Colors.blue,
                // padding: EdgeInsets.fromLTRB(32, 10, 32, 10),
                onPressed: _inserirValores,
                // color: Colors.blue,
                // padding: EdgeInsets.fromLTRB(32, 10, 32, 10),
                child: const Text(
                  "Sortear",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Status:  $_validacao.',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Config(List espacoDoSorteio, int valorMinimo, int valorMaximo) {}

// ignore: non_constant_identifier_names
Resultado(
    List espacoDoSorteio, int valorMinimo, int valorMaximo, int quantidade) {}
