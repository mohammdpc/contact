import 'dart:io';

import 'package:flutter/cupertino.dart';

class Contact{
  int number;
  String name;
  String email;
  File image;
  Contact({required this.name,required this.email,required this.number,required this.image});
}

List<Contact> contactsL = [];
