import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trabalho/pages/cadastroPage.dart';
import 'package:trabalho/pages/marcarHorarioPage.dart';

void main() {
  runApp(
    MaterialApp(home: LoginPage()), // use MaterialApp
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final String url =
      'http://seu-endereco-de-api.com/login'; // Substitua pelo seu endpoint de login

  void realizarLogin() async {
    if (_formKey.currentState!.validate()) {
      String matricula = matriculaController.text;
      String senha = senhaController.text;

      Map<String, String> body = {
        'matricula': matricula,
        'senha': senha,
      };

      try {
        var response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarcarHorarioPage()),
          );
          // Login realizado com sucesso, navegar para a tela de Marcar horário
        } else if (response.statusCode == 401) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Senha incorreta'),
                content: const Text('A senha digitada está incorreta.'),
              );
            },
          );
          // Senha incorreta
          // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
        } else if (response.statusCode == 404) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Usuário não cadastrado'),
                content:
                    const Text('A matrícula informada não está cadastrada.'),
              );
            },
          );
          // Usuário não cadastrado
          // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Erro de servidor'),
                content: const Text('Não foi possível realizar o login.'),
              );
            },
          );
          // O servidor retornou um código de erro
          // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro na solicitação HTTP'),
              content: const Text('Não foi possível realizar o login.'),
            );
          },
        );
        // Ocorreu um erro durante a solicitação HTTP
        // Você pode exibir uma mensagem de erro ou tomar alguma ação adequada
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D757F),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const Text(
                'UNILAB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'BEM - VINDO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: matriculaController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'MATRÍCULA',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a matrícula';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: senhaController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'SENHA',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navegar para a tela de recuperação de senha
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: realizarLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0776C8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('ENTRAR'),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar para a página de cadastro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0776C8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('CADASTRE-SE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
