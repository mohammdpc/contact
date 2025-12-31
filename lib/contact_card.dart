import 'package:flutter/material.dart';

import 'contact.dart';
import 'utils.dart';

class ContactCard extends StatefulWidget {
  final int index;
  final ValueSetter<int> delete;
  const ContactCard({super.key, required this.index, required this.delete});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xffFFF1D4),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              constraints: BoxConstraints(minHeight: width(context)),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  image: FileImage(contactsL[widget.index].image),
                ),
              ),
              child: Align(
                alignment: AlignmentGeometry.bottomLeft,
                child: Container(
                  padding: EdgeInsetsGeometry.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffFFF1D4),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(contactsL[widget.index].name),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactCardInfo(name: contactsL[widget.index].email,numb: false,),
                ContactCardInfo(name: contactsL[widget.index].number.toString(),numb: true,),
                FilledButton(
                  onPressed:()=>widget.delete(widget.index),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xffF93E3E)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.delete_rounded), Text('Delete')],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCardInfo extends StatelessWidget {
  final String name;
  final bool numb;
  const ContactCardInfo({super.key,required this.name,required this.numb});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(numb?'assets/icons/Phone_call.png':'assets/icons/E_Mail.png', width: 30),
          Text(name),
        ],
      ),
    );
  }
}