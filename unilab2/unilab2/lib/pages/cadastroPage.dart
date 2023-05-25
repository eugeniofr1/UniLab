import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final String url = 'http://seu-endereco-de-api.com/cadastro'; // Substitua pelo seu endpoint de cadastro

  void enviarCadastro() async {
    String matricula = matriculaController.text;
    String senha = senhaController.text;
    String confirmarSenha = confirmarSenhaController.text;
    String nome = nomeController.text;
    String email = emailController.text;

    Map<String, String> body = {
      'matricula': matricula,
      'senha': senha,
      'confirmarSenha': confirmarSenha,
      'nome': nome,
      'email': email,
    };

    try {
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        // Cadastro realizado com sucesso
        // Você pode exibir uma mensagem de sucesso ou navegar para outra tela
      } else {
        // O servidor retornou um código de erro
        // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
      }
    } catch (e) {
      // Ocorreu um erro durante a solicitação HTTP
      // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D757F),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/74/74472.png',
              height: 150,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: matriculaController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'MATRÍCULA',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: senhaController,
              style: const TextStyle(color: Colors.white),
              obscureText: true, // Define que o texto deve ser ocultado
              decoration: const InputDecoration(
                labelText: 'SENHA',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: confirmarSenhaController,
              style: const TextStyle(color: Colors.white),
              obscureText: true, // Define que o texto deve ser ocultado
              decoration: const InputDecoration(
                labelText: 'CONFIRMAR SENHA',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nomeController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'NOME',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String senha = senhaController.text;
                String confirmarSenha = confirmarSenhaController.text;

                if (senha == confirmarSenha) {
                  // Enviar dados para o servidor em Spring
                  // Código para envio dos dados
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Senhas Diferentes'),
                        content: const Text('As senhas digitadas são diferentes.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              enviarCadastro();
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0776C8),
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(color: Colors.white),
                minimumSize: const Size(200, 0),
              ),
              child: const Text('CRIAR CONTA'),
            ),
          ],
        ),
      ),
    );
  }
}