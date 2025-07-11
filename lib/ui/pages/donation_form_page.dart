import 'package:flutter/material.dart';
import 'qris_page.dart';

class DonationFormPage extends StatefulWidget {
  final Map<String, dynamic> campaign;
  
  const DonationFormPage({super.key, required this.campaign});

  @override
  State<DonationFormPage> createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  // Form key untuk validasi
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk input nominal
  final TextEditingController _amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Donasi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul campaign
              Text(
                widget.campaign['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Input nominal donasi
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Nominal Donasi',
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nominal tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              // Tombol nominal cepat
              Text('Pilih Nominal Cepat:'),
              const SizedBox(height: 10),
              
              // Row dengan Wrap untuk nominal cepat
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _quickAmount('10000'),
                  _quickAmount('20000'),
                  _quickAmount('50000'),
                  _quickAmount('100000'),
                ],
              ),
              
              const Spacer(),
              
              // Tombol donasi
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigasi ke halaman QRIS
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrisPage(
                            campaign: widget.campaign,
                            amount: int.parse(_amountController.text),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Lanjutkan Donasi', 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Widget untuk tombol nominal cepat
  Widget _quickAmount(String amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _amountController.text = amount;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      ),
      child: Text('Rp $amount'),
    );
  }
  
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
