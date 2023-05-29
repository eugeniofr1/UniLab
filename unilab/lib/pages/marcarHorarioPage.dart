import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trabalho/pages/cadastroPage.dart';

class MarcarHorarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcar Horário'),
      ),
      body: Center(
        child: Text(
          'Tela de Marcar Horário',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
