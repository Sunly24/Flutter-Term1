import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  Currency _currency = Currency.euro;
  double _convertedValue = 0.0;

  final Map<Currency, double> _conversionRates = {
    Currency.euro: 0.95,
    Currency.riels: 4020.46,
    Currency.bath: 34.29,
    Currency.yuan: 7.24,
    Currency.pound: 0.79,
  };

  void _updateConversion() {
    setState(() {
      final double dollarValue = double.tryParse(_dollarController.text) ?? 0.0;
      _convertedValue = dollarValue * _conversionRates[_currency]!;
    });
  }

  @override
  void initState() {
    super.initState();
    _dollarController.addListener(_updateConversion);
  }

  @override
  void dispose() {
    _dollarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:",
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          TextField(
            controller: _dollarController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              prefix: const Text('\$ '),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter an amount in dollars',
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          const Text("Device:", style: TextStyle(color: Colors.white)),
          DropdownButton<Currency>(
            value: _currency,
            items: Currency.values.map((Currency currency) {
              return DropdownMenuItem<Currency>(
                value: currency,
                child: Text(
                  currency.name.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (Currency? newValue) {
              setState(() {
                _currency = newValue!;
                _updateConversion();
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:",
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: textDecoration,
            child: Text(
              _convertedValue.toStringAsFixed(2),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      )),
    );
  }
}

enum Currency { euro, riels, bath, yuan, pound }
