import 'package:flutter/material.dart';
import 'package:unilab/pages/cadastroPage.dart';

void main() {
  runApp(
    MaterialApp(home: LoginPage()), // use MaterialApp
        
  );  
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D757F),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
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
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'MATRÍCULA',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'SENHA',
                labelStyle: TextStyle(color: Colors.black),
              ),
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
                onPressed: () {
                  // Navegar para a página de cadastro
                  
                },
              style: ElevatedButton.styleFrom(
               backgroundColor: const Color(0xFF0776C8),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('CADASTRE-SE'),
            ),
             ),
          ],
        ),
      ),
    );
  }
}