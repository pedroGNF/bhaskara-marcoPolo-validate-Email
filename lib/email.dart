import 'package:flutter/material.dart';

void main() {
  runApp(const TelaEmail());
}

class TelaEmail extends StatelessWidget {
  const TelaEmail({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogInPage(),
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _errorMessage = '';
  final String _validatedMessage = '';

  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var EmailValidator;
  var pinto = "pinto";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 201, 53),
        title: const Text('Validação de email'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), 
            onPressed: (){

          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (val) {
                validateEmail(val);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _validatedMessage;
                  "pão";
                },
                child: const Text('Entrar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _validatedMessage,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isNotEmpty) {
      pinto;
    }
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "O email não pode ser vazio";
      });
    } 
  }
}
