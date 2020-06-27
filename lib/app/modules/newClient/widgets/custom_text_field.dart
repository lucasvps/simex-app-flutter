import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key key, this.label, this.onChangedFunction, this.error}) : super(key: key);
  final String label;
  final onChangedFunction;
  final String Function() error;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Observer(
     
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.label,
              errorText: widget.error(),
            ),
            onChanged: widget.onChangedFunction,
          ),
        );
      }
    );
  }
}


class CustomTextFieldOptional extends StatefulWidget {
  CustomTextFieldOptional({Key key, this.label, this.onChangedFunction}) : super(key: key);
  final String label;
  final onChangedFunction;

  @override
  _CustomTextFieldOptionalState createState() => _CustomTextFieldOptionalState();
}

class _CustomTextFieldOptionalState extends State<CustomTextFieldOptional> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        keyboardType: widget.label == "Qtd de Tratores" || widget.label == "Qtd de Colheitadeiras" ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
          
        ),
        onChanged: widget.onChangedFunction,
      ),
    );
  }
}