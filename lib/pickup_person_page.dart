import 'package:demoflutterapp/utils/validators.dart';
import 'package:demoflutterapp/widgets/appbottombar_layout_widget.dart';
import 'package:demoflutterapp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class PickupPersonPage extends StatefulWidget {
  const PickupPersonPage({super.key, this.name, this.email, this.number});
  final String? name;
  final String? email;
  final String? number;

  @override
  State<PickupPersonPage> createState() => _PickupPersonPageState();
}

class _PickupPersonPageState extends State<PickupPersonPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name ?? '';
    emailController.text = widget.email ?? '';
    numberController.text = widget.number ?? '';

    super.initState();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.pop(context, {
        'name': nameController.text,
        'email': emailController.text,
        'number': numberController.text,
      });
      //return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarLayoutWidget(
      title: 'Pickup person',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All fields are required unless marked oprional"),
                SizedBox(height: 20),
                TextFieldWidget(
                  controller: nameController,
                  title: 'Full name',
                  subTitle: 'The person who will pick up this order',
                  validator: (value) => Validators.validateName(value),
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  title: 'Email adress',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validators.validateEmail(value),
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  title: 'Phone number',
                  controller: numberController,
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 30),
                Text("CVS will email your order status."),
              ],
            ),
          ),
        ),
      ),
      fixedButton: ElevatedButton(
        onPressed:
            nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    numberController.text.isEmpty
                ? null
                : () {
                  _submit();
                },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(18),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
