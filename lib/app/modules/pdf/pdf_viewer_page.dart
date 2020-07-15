import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PDFViewerPage extends StatelessWidget {
  const PDFViewerPage({Key key, this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          FlatButton(onPressed: () async{
            final ByteData bytes = await rootBundle.load(path);
            await Share.file('PDF', 'relatorio.pdf', bytes.buffer.asUint8List(), 'image/png', text: 'My optional text.');
          }, child: Icon(Icons.email, color: Colors.white,))
        ],
      ),
      path: path,
    );
  }
}