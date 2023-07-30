import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Printable {
  static print(Future<Uint8List> pdf)async{
    await Printing.layoutPdf(onLayout: (PdfPageFormat format)async =>pdf);
  }
  static Future<Uint8List> generatePdf(
      PdfPageFormat? format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.courierPrimeRegular();

    pdf.addPage(
      pw.Page(
          pageFormat: format,
          build: (context) {
            return pw.Column(children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(
                    title,
                   // style: pw.TextStyle(font: font),
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.FittedBox(child: pw.FlutterLogo()),
            ]);
          }),
    );

    return pdf.save();
  }
}
