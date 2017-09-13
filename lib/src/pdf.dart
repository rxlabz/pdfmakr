@JS('pdfMake')
library pdf;

import 'package:js/js.dart';


@JS("createPdf")
external Doc create(PDFContent content);


@JS()
@anonymous
class PDFContent {
  external List<dynamic> get content;
  external Styles get styles;
  external factory PDFContent({List<dynamic> content, Styles styles});
}

@JS()
@anonymous
class Doc {
  external void download();
  external void print();
  external void open();
  external factory Doc();
}

@JS()
@anonymous
class TextBloc {
  external String get text;
  external String get fillColor;
  external String get fontSize;
  external bool get bold;
  external bool get italics;
  external bool get color;
  external String get style;
  external factory TextBloc(
    {String text,
      String style,
      String fillColor = 'white',
      int fontSize = 12,
      bool bold = false,
      bool italics = false,
      String color});
}

@JS()
@anonymous
class Styles {
  external Style get header;
  external Style get basic;
  external factory Styles({Style header, Style basic});
}

@JS()
@anonymous
class Image {
  external String get image;
  external factory Image({String image});
}

@JS()
@anonymous
class Columns {
  external List<Column> get columns;
  external int get columnGap;

  external factory Columns({List<Column> columns, int columnGap = 0});
}

@JS()
@anonymous
class Column {
  external String get width;
  external String get text;
  external String get fillColor;
  external factory Column(
      {String text, String width, String fillColor = 'yellow'});
}

@JS()
@anonymous
class Table {
  external TableBody get table;
  external factory Table({TableBody table});
}

@JS()
@anonymous
class TableBody {
  external List<dynamic> get body;
  external factory TableBody({List<dynamic> body});
}

@JS()
@anonymous
class Style {
  external String get fontSize;
  external bool get bold;
  external bool get italic;
  external bool get color;
  external factory Style({
    String color = 'black',
    int fontSize = 12,
    bool bold = false,
    bool italic = false,
  });
}

