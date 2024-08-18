import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class RequestAccountScreen extends StatefulWidget {
  const RequestAccountScreen({super.key});

  @override
  _RequestAccountScreenState createState() => _RequestAccountScreenState();
}

class _RequestAccountScreenState extends State<RequestAccountScreen> {
  String _escolha = 'comprar';
  String _documentoLabel = 'CPF';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _regiaoController = TextEditingController();
  final TextEditingController _produtoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _filiacaoController = TextEditingController();

  Future<void> _enviarEmail() async {
    String corpoEmail = '''
    Email: ${_emailController.text}
    Nome: ${_nomeController.text}
    $_documentoLabel: ${_documentoController.text}
    Região: ${_regiaoController.text}
    ''';

    if (_escolha == 'vender') {
      corpoEmail += '''
      Produto Vendido: ${_produtoController.text}
      Endereço do Comércio: ${_enderecoController.text}
      ''';
    } else if (_escolha == 'comprar') {
      corpoEmail += '''
      Filiação: ${_filiacaoController.text}
      ''';
    }

    final Email email = Email(
      body: corpoEmail,
      subject: 'Solicitação de Cadastro - PromoClub',
      recipients: ['email@example'], // Substitua pelo seu endereço de e-mail
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail enviado com sucesso!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar e-mail: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2A3),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/PromoClub1.png',
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email:',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome:',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _documentoController,
                  decoration: InputDecoration(
                    labelText: _documentoLabel,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _regiaoController,
                  decoration: InputDecoration(
                    labelText: 'Região:',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Eu quero:'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Comprar'),
                        value: 'comprar',
                        groupValue: _escolha,
                        onChanged: (value) {
                          setState(() {
                            _escolha = value!;
                            _documentoLabel = 'CPF';  // Volta para CPF
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Vender'),
                        value: 'vender',
                        groupValue: _escolha,
                        onChanged: (value) {
                          setState(() {
                            _escolha = value!;
                            _documentoLabel = 'CNPJ';  // Muda para CNPJ
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (_escolha == 'vender') ...[
                  TextField(
                    controller: _produtoController,
                    decoration: InputDecoration(
                      labelText: 'Produto Vendido:',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _enderecoController,
                    decoration: InputDecoration(
                      labelText: 'Endereço do comércio:',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ] else if (_escolha == 'comprar') ...[
                  TextField(
                    controller: _filiacaoController,
                    decoration: InputDecoration(
                      labelText: 'Filiação:',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _enviarEmail,  // Enviar o e-mail ao clicar
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF014C63),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text(
                      'SOLICITAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
