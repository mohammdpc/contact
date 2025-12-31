import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'contact.dart';
import 'utils.dart';

class AddContact extends StatefulWidget {
  final ValueSetter<Contact> onPress;
  const AddContact({super.key, required this.onPress});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  ValueNotifier<String> number = ValueNotifier<String>('');
  ValueNotifier<String> eMail = ValueNotifier<String>('');
  ValueNotifier<String> name = ValueNotifier<String>('');
  ValueNotifier<File?> image = ValueNotifier(null);

  final ImagePicker imageP = ImagePicker();
  void pickImage() async{
    final pickedI = await imageP.pickImage(source: ImageSource.gallery);
    if(pickedI != null){
      image.value = File(pickedI.path);
      setState(() {});
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextStyle infoStyle = TextStyle(color: secColor, fontSize: 16);
  final OutlineInputBorder normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: secColor),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: height(context)*0.017130621,
          children: [
            Row(
              spacing: 8,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    border: BoxBorder.all(width: 1, color: Colors.white),
                    image: image.value != null? DecorationImage(image: FileImage(image.value!),fit: BoxFit.fitWidth):null,
                  ),
                  child: InkWell(
                      onTap: ()=>pickImage(),
                      child: image.value == null
                          ? Lottie.asset(
                        'assets/icons/image_picker.json',
                        width: width(context) * 0.355721393,
                        fit: BoxFit.fitWidth,
                      )
                          : SizedBox(width: width(context) * 0.355721393,height: width(context) * 0.355721393)
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height(context)*0.017709563,
                  children: [
                    ValueListenableBuilder<String>(
                      valueListenable: name,
                      builder: (context, value, child) => Text(
                        value.isNotEmpty ? value : 'User Name',
                        style: infoStyle,
                      ),
                    ),
                    SizedBox(
                      width: width(context) / 2,
                      child: Divider(height: 1, color: secColor),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: eMail,
                      builder: (context, value, child) => Text(
                        value.isNotEmpty ? value : 'E-mail address',
                        style: infoStyle,
                      ),
                    ),
                    SizedBox(
                      width: width(context) / 2,
                      child: Divider(height: 1, color: secColor),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: number,
                      builder: (context, value, child) => Text(
                        value.isNotEmpty ? value : 'Number',
                        style: infoStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextFormField(
              style: infoStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(width(context)*0.044776119),
                hintStyle: infoStyle,
                focusedBorder: normalBorder,
                enabledBorder: normalBorder,
                errorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                hintText: 'Enter User Name',
              ),
              onChanged: (value) {
                name.value = value;
              },
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Please Add Name'
                    : null;
              },
            ),
            TextFormField(
              style: infoStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(width(context)*0.044776119),
                hintStyle: infoStyle,
                focusedBorder: normalBorder,
                enabledBorder: normalBorder,
                errorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                hintText: 'Enter User Email',
              ),
              onChanged: (value) {
                eMail.value = value;
              },
              validator: (value) {
                RegExp reg = RegExp(
                  r"""(?:[a-z0-9!#$%&'*+\x2f=?^_`\x7b-\x7d~\x2d]+(?:\.[a-z0-9!#$%&'*+\x2f=?^_`\x7b-\x7d~\x2d]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9\x2d]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9\x2d]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9\x2d]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""",
                );
                if (value != null && reg.hasMatch(value)) {
                  return null;
                } else {
                  return 'Invalid Email';
                }
              },
            ),
            TextFormField(
              style: infoStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(width(context)*0.044776119),
                hintStyle: infoStyle,
                focusedBorder: normalBorder,
                enabledBorder: normalBorder,
                errorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: normalBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
                hintText: 'Enter User Phone',
              ),
              onChanged: (value) {
                number.value = value;
              },
              validator: (value) {
                return value != null &&
                    value.isNotEmpty &&
                    int.tryParse(value) != null
                    ? null
                    : 'Invalid Phone Number';
              },
            ),
            FilledButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(width(context)*0.044776119)),
                backgroundColor: WidgetStatePropertyAll(secColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onPress(Contact(
                    name: name.value,
                    email: eMail.value,
                    number: int.parse(number.value),
                    image: image.value == null
                        ? File('assets/images/Route.png')
                        : image.value!,
                  ));

                  Navigator.pop(context);
                }
              },
              child: Center(
                child: Text(
                  'Enter User',
                  style: infoStyle.copyWith(color: mainColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}