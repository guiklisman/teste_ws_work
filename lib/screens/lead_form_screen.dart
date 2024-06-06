import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car.dart';
import '../models/lead.dart';
import '../providers/lead_provider.dart';

class LeadFormScreen extends StatefulWidget {
  final Car car;

  const LeadFormScreen({super.key, required this.car});

  @override
  _LeadFormScreenState createState() => _LeadFormScreenState();
}

class _LeadFormScreenState extends State<LeadFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _userContact = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final lead = Lead(
        carId: widget.car.id,
        userName: _userName,
        userContact: _userContact,
      );

      Provider.of<LeadProvider>(context, listen: false).addLead(lead);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lead adicionado com sucesso!')),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eu quero ${widget.car.nomeModelo}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contato'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu contato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userContact = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
