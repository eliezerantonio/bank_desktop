import 'package:flutter/material.dart'; 

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {


  CustomTextField(
  
 {this.password = false,  
  this.validator, this.keyboardType, this.focusNode, this.nextFocus, 
  this.textInputAction, @required this.onSaved}
  );

  bool password;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  FormFieldSetter onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onSaved: onSaved,
      onFieldSubmitted: (String text){
        if(nextFocus != null){
          FocusScope.of(context).requestFocus(nextFocus);         
        }
          
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)
        ),           
      ),
    );
  }
}