import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'add_contact.dart';
import 'contact.dart';
import 'contact_card.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addContactF(Contact c){
    contactsL.add(c);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29384D),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Route.png',
          fit: BoxFit.fitHeight,
          width: width(context)*0.291044776,
        ),
        backgroundColor: mainColor,
      ),
      body: ContactList(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: height(context)*0.022883295,
        children: [
          Visibility(
            visible: contactsL.isNotEmpty,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                contactsL.removeLast();
                setState(() {});
              },
              child: Icon(Icons.delete_rounded,size: 30,color: Colors.white,),
            ),
          ),
          Visibility(
            visible: contactsL.length < 6,
            child: FloatingActionButton(
              backgroundColor: secColor,
              onPressed: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(minHeight: height(context)*0.534324943,maxWidth: width(context)),
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AddContact(onPress: addContactF,),
                    );
                  },
                );
                setState(() {});
              },
              tooltip: 'Add Contact',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
void deleteContact(int index){
  contactsL.removeAt(index);
  setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return contactsL.isEmpty
        ? Column(
      children: [
        Expanded(
          flex: 3,
          child: Lottie.asset(
            'assets/icons/empty_list.json',
            repeat: true,
            animate: true,
          ),
        ),
        Expanded(flex:2,child: Text('There is No Contacts Added Here',style: TextStyle(color: secColor, fontSize: 16),))
      ],
    )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width(context)*0.039800995,
                mainAxisSpacing: height(context)*0.018306636,
                childAspectRatio: 0.6,
              ),
              itemCount: contactsL.length,
              itemBuilder: (context, index) {
                return ContactCard(index: index,delete: deleteContact,);
              },
            ),
          );
  }
}
