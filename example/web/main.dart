import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:pdfmakr/pdfmakr.dart' as pdf;

String img64;

void main() {
  querySelector('#btPdf').onClick.listen((e) => downloadPdf());
}

Future<String> loadImg64(String url) async {
  HttpRequest response =
      await HttpRequest.request(url, responseType: "arraybuffer");

  String contentType = response.getResponseHeader('Content-Type');

  var list = new Uint8List.view((response.response as ByteBuffer));

  String header = 'data:$contentType;base64,';
  String base64 = BASE64.encode(list);
  String image = "${header}${base64}";

  return image;
}

Future downloadPdf() async {
  final pdfFile = await pdf.createPdf(new pdf.PDFContent(
      content: [
        new pdf.Image(image: await loadImg64("img/rx.png")),
        new pdf.TextBloc(text: "text example", bold: true, color: 'blue'),
        new pdf.TextBloc(text: "text example with style", style: 'header'),
        new pdf.TextBloc(text: " "),
        new pdf.Columns(columns: [
          new pdf.Column(text: 'col 1 80%', width: '80%'),
          new pdf.Column(text: 'col 2'),
        ]),
        new pdf.TextBloc(text: " "),
        new pdf.Table(
            table: new pdf.TableBody(body: [
          [
            new pdf.TextBloc(text: "cell example 1", bold: true, color: 'blue'),
            new pdf.TextBloc(
                text: "cell example - col 2",
                bold: true,
                color: 'green',
                fillColor: 'yellow'),
          ],
          [
            new pdf.TextBloc(text: "bold row 2 - col 1", bold: true),
            new pdf.TextBloc(text: "italic row 2 - col 2", italics: true),
          ]
        ]))
      ],
      styles: new pdf.Styles(
          header: new pdf.Style(color: 'red', fontSize: 24),
          basic: new pdf.Style(color: 'green'))));

  pdfFile.download();
  //pdfFile.print();
  //pdfFile.open();
}
