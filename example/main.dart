import 'dart:io';
import 'dart:typed_data';

import 'package:docx_template/docx_template.dart';

void main() async {
  final f = File("template.docx");
  final docx = await DocxTemplate.fromBytes(await f.readAsBytes());
  final img = await File("test.png").readAsBytes();

  Content content = Content();

  content
    ..add(TextContent("header", "HEADER", cellColor: "00FF00"))
    ..add(ImageContent("logo", img, heightPx: 50, widthPx: 200))
    ..add(TextContent("Cella_1", "MODIFICATO", cellColor: "FFFF00"))
    ..add(TextContent("Cella_1_bis", "FORSE", cellColor: "00FF00"))
    ..add(TextContent("Cella_2", "CORRETTAMENTE", cellColor: "FF0000"))
    ..add(TextContent("footer", "FOOTER"));

  final docGenerated = await docx.generate(content);

  final fileGenerated = File('generated.docx');

  if (docGenerated != null) await fileGenerated.writeAsBytes(docGenerated);
}
