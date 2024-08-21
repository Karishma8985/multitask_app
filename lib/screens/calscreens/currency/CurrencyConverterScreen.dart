import 'package:flutter/material.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  Currency _selectedFromCurrency = Currency.usd;
  Currency _selectedToCurrency = Currency.inr;
  String? _conversionResult;
  final TextEditingController _amountController = TextEditingController();

  final List<Currency> _currencies = [
    Currency.usd,
    Currency.eur,
    Currency.gbp,
    Currency.jpy,
    Currency.inr,
  ];

  @override
  void initState() {
    super.initState();
    _convert();
  }

  void _convert() async {
    double amount;
    try {
      amount = double.parse(_amountController.text);
    } catch (e) {
      amount = 1; // Default to 1 if the input is invalid
    }

    final result = await CurrencyConverter.convert(
      from: _selectedFromCurrency,
      to: _selectedToCurrency,
      amount: amount,
      withoutRounding: true,
    );
    setState(() {
      _conversionResult = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.orange[600],
      ),
      backgroundColor: Colors.orange[300],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color:Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButton<Currency>(
                      value: _selectedFromCurrency,
                      isExpanded: true,
                      underline: SizedBox(), // Hide the underline
                      onChanged: (Currency? newValue) {
                        setState(() {
                          _selectedFromCurrency = newValue!;
                          _convert();
                        });
                      },
                      items: _currencies.map((Currency currency) {
                        return DropdownMenuItem<Currency>(
                          value: currency,
                          child: Text(
                            currency.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButton<Currency>(
                      value: _selectedToCurrency,
                      isExpanded: true,
                      underline: SizedBox(), // Hide the underline
                      onChanged: (Currency? newValue) {
                        setState(() {
                          _selectedToCurrency = newValue!;
                          _convert();
                        });
                      },
                      items: _currencies.map((Currency currency) {
                        return DropdownMenuItem<Currency>(
                          value: currency,
                          child: Text(
                            currency.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove default border
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
               
                  labelText: 'Amount in ${_selectedFromCurrency.name.toUpperCase()}',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.refresh, color: Colors.orange[900]),
                    onPressed: _convert,
                  ),
                ),
                onChanged: (value) {
                  _convert();
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${_amountController.text.isEmpty ? '0' : _amountController.text} ${_selectedFromCurrency.name.toUpperCase()} = ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${_conversionResult ?? 'Loading...'} ${_selectedToCurrency.name.toUpperCase()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
