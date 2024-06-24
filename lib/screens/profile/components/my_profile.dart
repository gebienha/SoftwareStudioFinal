import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';

class MyProfilePage extends StatefulWidget {
  static String routeName = "/myProfile"; 

  const MyProfilePage({super.key});

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists) {
          setState(() {
            firstName = doc['firstName'];
            lastName = doc['lastName'];
            phoneNumber = doc['phoneNumber'];
            address = doc['address'];
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error loading profile: $e')));
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'firstName': firstName,
            'lastName': lastName,
            'phoneNumber': phoneNumber,
            'address': address,
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile saved successfully')));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving profile: $e')));
        }
      }
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'firstName': firstName,
            'lastName': lastName,
            'phoneNumber': phoneNumber,
            'address': address,
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating profile: $e')));
        }
      }
    }
  }

  InputDecoration buildInputDecoration(String label, String hint, String icon) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(svgIcon: icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account', style: TextStyle(color: Color(0xFF60C6A2))),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF60C6A2)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 16),
                              const Text(
                                "My Account",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF60C6A2),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "View and edit your details",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black54),
                              ),
                              const SizedBox(height: 16),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      initialValue: firstName,
                                      onSaved: (newValue) => firstName = newValue,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          removeError(error: kNamelNullError);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          addError(error: kNamelNullError);
                                          return "First name is required";
                                        }
                                        return null;
                                      },
                                      decoration: buildInputDecoration("First Name", "Enter your first name", "assets/icons/User.svg"),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      initialValue: lastName,
                                      onSaved: (newValue) => lastName = newValue,
                                      decoration: buildInputDecoration("Last Name", "Enter your last name", "assets/icons/User.svg"),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      initialValue: phoneNumber,
                                      keyboardType: TextInputType.phone,
                                      onSaved: (newValue) => phoneNumber = newValue,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          removeError(error: kPhoneNumberNullError);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          addError(error: kPhoneNumberNullError);
                                          return "Phone number is required";
                                        }
                                        return null;
                                      },
                                      decoration: buildInputDecoration("Phone Number", "Enter your phone number", "assets/icons/Phone.svg"),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      initialValue: address,
                                      onSaved: (newValue) => address = newValue,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          removeError(error: kAddressNullError);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          addError(error: kAddressNullError);
                                          return "Address is required";
                                        }
                                        return null;
                                      },
                                      decoration: buildInputDecoration("Address", "Enter your address", "assets/icons/Location point.svg"),
                                    ),
                                    FormError(errors: errors),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: _saveProfile,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF60C6A2),
                                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: _updateProfile,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF60C6A2),
                                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: const Text(
                                            "Update",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "By continuing you confirm that you agree with our Terms and Conditions",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
