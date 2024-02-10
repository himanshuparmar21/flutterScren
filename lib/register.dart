import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isRePasswordVisible = true;
  Color _emailBorderColor = Colors.grey.shade300;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleRePasswordVisibility() {
    setState(() {
      _isRePasswordVisible = !_isRePasswordVisible;
    });
  }

  String? _validateEmail(String? value) {
    const pattern =r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return '* Required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context,'/login'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                validator: _validateEmail,
                onChanged: (value) {
                  setState(() {
                    _emailBorderColor =
                    _validateEmail(value) == null ? Color(0xFFE91e63) : Colors.grey.shade300;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "User Email",
                  hintText: "Enter Your Email",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _emailBorderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "User Name",
                  hintText: "Enter Your Name",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: _isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (value.length < 6) {
                    return "Password should be at least 6 characters";
                  } else if (value.length > 15) {
                    return "Password should not be greater than 15 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "User Password",
                  hintText: "Enter Your Password",
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: rePasswordController,
                obscureText: _isRePasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (passwordController.text != value) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Re-enter Password",
                  hintText: "Re-enter Your Password",
                  suffixIcon: GestureDetector(
                    onTap: _toggleRePasswordVisibility,
                    child:
                    Icon(_isRePasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Register Success')),
                    );
                    Navigator.popAndPushNamed(context, '/login');
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}