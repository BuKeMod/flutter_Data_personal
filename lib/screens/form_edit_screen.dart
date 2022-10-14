// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_db/providers/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_db/models/transactions.dart';

class FormEditScreen extends StatefulWidget {
  final Transactions data;

  //Controller

  const FormEditScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<FormEditScreen> createState() => _FormEditScreenState();
}

class _FormEditScreenState extends State<FormEditScreen> {
  final formKey = GlobalKey<FormState>();

  final idController = TextEditingController();
  final pidController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailAddController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    idController.text = widget.data.id.toString();
    pidController.text = widget.data.pid.toString();
    nameController.text = widget.data.name.toString();
    genderController.text = widget.data.gender.toString();
    phoneController.text = widget.data.phone.toString();
    emailAddController.text = widget.data.emailAdd.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('แบบฟอร์มแก้ไขข้อมูล'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      enabled: false,
                      style: const TextStyle(color: Colors.black54),
                      decoration: const InputDecoration(labelText: "Item ID"),
                      autofocus: false,
                      controller: idController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "รหัสนิสิต",
                          prefixIcon: Icon(Icons.alternate_email)),
                      autofocus: false,
                      controller: pidController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "กรุณาใส่ข้อมูล";
                        }
                        var x = str.length;
                        if (x > 8 || x < 8 || double.parse(str) <= 0) {
                          return "ข้อมูลไม่ถูกต้อง";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "ชื่อเเละนามสกุล",
                          prefixIcon: Icon(Icons.account_box)),
                      autofocus: false,
                      controller: nameController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "กรุณาใส่ข้อมูล";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "เพศ",
                          prefixIcon: Icon(Icons.transgender)),
                      controller: genderController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "กรุณาใส่ข้อมูล";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "เบอร์โทรศัพท์",
                          prefixIcon: Icon(Icons.add_call)),
                      autofocus: false,
                      controller: phoneController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "กรุณาใส่ข้อมูล";
                        }
                        var x = str.length;
                        if (x > 10 || x < 10 || double.parse(str) <= 0) {
                          return "ข้อมูลไม่ถูกต้อง";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "อีเมล", prefixIcon: Icon(Icons.email)),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      controller: emailAddController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "กรุณาใส่ข้อมูล";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var id = int.parse(idController.text);
                            var pid = pidController.text;
                            var name = nameController.text;
                            var gender = genderController.text;
                            var phone = phoneController.text;
                            var emailAdd = emailAddController.text;

                            // call provider
                            var provider = Provider.of<TransactionProvider>(
                                context,
                                listen: false);
                            Transactions item = Transactions(
                                id: id,
                                pid: pid,
                                name: name,
                                gender: gender,
                                phone: phone,
                                emailAdd: emailAdd,
                                date: widget.data.date);
                            provider.updateTransaction(item);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Save data"))
                  ]),
            )));
  }
}
