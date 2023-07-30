import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:tuto_printing/printable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PdfPreview(
          build: (format) => Printable.generatePdf(format, widget.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Printable.print(Printable.generatePdf(null, widget.title));
        },
        child: const Text('Print'),
      ),
    );
  }
}
