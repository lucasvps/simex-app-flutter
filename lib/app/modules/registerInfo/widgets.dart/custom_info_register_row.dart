import 'package:flutter/material.dart';

class CustomInfoRegisterRow extends StatefulWidget {
  CustomInfoRegisterRow({Key key, this.field, this.value, this.readOnly, this.onChanged}) : super(key: key);
  final String field, value;
  final bool readOnly;
  final onChanged;

  @override
  _CustomInfoRegisterRowState createState() => _CustomInfoRegisterRowState();
}

class _CustomInfoRegisterRowState extends State<CustomInfoRegisterRow> {
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
                  //errorText: widget.errorText(),
                  border: InputBorder.none,
                ),
                initialValue: widget.value.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}