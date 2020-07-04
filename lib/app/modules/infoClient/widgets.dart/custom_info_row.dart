import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomInfoRow extends StatefulWidget {
  CustomInfoRow(
      {Key key,
      this.field,
      this.value,
      this.onChanged,
      this.errorText,
      this.readOnly})
      : super(key: key);
  final String field, value;
  final onChanged;
  final String Function() errorText;
  final bool readOnly;

  @override
  _CustomInfoRowState createState() => _CustomInfoRowState();
}

class _CustomInfoRowState extends State<CustomInfoRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Flexible(
                flex: 0,
                child: Text(
                  '${widget.field.toString()} : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Expanded(
              flex: 3,
              child: TextFormField(
                readOnly: widget.readOnly,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  //errorText: widget.errorText() ?? patternError,
                  border: InputBorder.none,
                ),
                initialValue: widget.field == 'Última compra' ||
                        widget.field == 'Último contato'
                    ? formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          widget.value,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString()
                    : widget.value.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
