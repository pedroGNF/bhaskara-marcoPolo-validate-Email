import 'package:flutter/material.dart';
import 'dart:math';

class TelaBhaskara extends StatefulWidget {
  const TelaBhaskara({super.key});
  @override
  TempState createState() => TempState();
}

class TempState extends State<TelaBhaskara> {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String result="Informe os coeficientes!";

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();


  void resetFields(){
    aController.text="";
    bController.text="";
    cController.text="";
    setState(() {
      result="Informe os valores";
      formKey = GlobalKey<FormState>();
    });
  }

  //..rules of your app
  void calculate(){
    setState(() {
      double a = double.parse(aController.text);
      double b = double.parse(bController.text);
      double c = double.parse(cController.text);
      double del, bhasP, bhasN;
      
      del = (pow(b, 2) - (4*a*c));

      //..does comparisons
      if(del < 0){
        result = "Delta = ${del.toString()}\nMenor que '0' não há 'x'!";
      }else if(del == 0){
        bhasP=(((-(b))+(sqrt(del)))/(2*a));
        result="Delta = 0\nx= ${bhasP.toString()}";
      }else{
        bhasP=(((-(b))+(sqrt(del)))/(2*a));
        bhasN=(((-(b))-(sqrt(del)))/(2*a));
        result="x'= ${bhasP.toString()} || x\"= ${bhasN.toString()}";
      }
    });
  }
  late double input;
  late double output;
  late bool fOrC;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //..configuration from top bar
      appBar: AppBar(
        title: const Text("Calculadora Bhaskara", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), 
            onPressed: (){
              resetFields();
          })
        ],
      ),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        //"SingleChildScrollView" USADO PARA NÃO ATRAPALHAR O TECLADO E ROLAR A TELA
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.format_list_numbered, size: 80.0, color: Colors.blue),

              //..first input
              TextFormField(keyboardType: const TextInputType.numberWithOptions(signed: true,), //..select keyboard type
                decoration: InputDecoration(
                    labelText: "Valor '1'",
                    labelStyle: TextStyle(color: Colors.blue[900])
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
                controller: aController,
                // ignore: missing_return
                validator: (value) {
                  if (value!.isEmpty){
                    return "Insira o Valor '1'!";
                  }}
              ),

              //..second input
              TextFormField(keyboardType: const TextInputType.numberWithOptions(signed: true), //..select keyboard type
                decoration: InputDecoration(
                    labelText: "Valor '2'",
                    labelStyle: TextStyle(color: Colors.blue[900])
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
                controller: bController,
                // ignore: missing_return
                validator: (value) {
                  if (value!.isEmpty){
                    return "Insira o Valor '2'!";
                  }}
              ),

              //..third input
              TextFormField(keyboardType: const TextInputType.numberWithOptions(signed: true), //..select keyboard type
                decoration: InputDecoration(
                    labelText: "Valor '3'",
                    labelStyle: TextStyle(color: Colors.blue[900])
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
                controller: cController,
                // ignore: missing_return
                validator: (value) {
                  if (value!.isEmpty){
                    return "Insira o Valor '3'!";
                  }}
              ),

              //..button
              Padding(
                padding: const EdgeInsets.only(top:10.0, bottom:10.0),
                child: SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    //..with this, you can use your function
                    onPressed: (){
                      if (formKey.currentState!.validate()){
                        calculate();
                      }
                    },
                    child: const Text("Bhaskara",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),

              //..the text or result
              Text(result,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

// ignore: non_constant_identifier_names
RaisedButton({required Null Function() onPressed, required Text child, required MaterialColor color}) {
}