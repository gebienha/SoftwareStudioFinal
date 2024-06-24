import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'firestore.dart';

class AddAvatarPage extends StatefulWidget {
  const AddAvatarPage({super.key});
  static String routeName = "/addAvatar";

  @override
  State<AddAvatarPage> createState() => _AddAvatarPageState();
}

class _AddAvatarPageState extends State<AddAvatarPage> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  bool _isSavingAvatar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Avatar')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FluttermojiCircleAvatar(
                    radius: 80,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  const SizedBox(height: 16),
                  FluttermojiCustomizer(
                    scaffoldHeight: 300,
                    autosave: true,
                    theme: FluttermojiThemeData(
                      // labelTextStyle: Theme.of(context).textTheme.headlineSmall,
                      labelTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      primaryBgColor: Theme.of(context).colorScheme.surfaceVariant,
                      selectedTileDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4,
                        ),
                      ),
                      selectedIconColor: Theme.of(context).colorScheme.primary,
                      unselectedIconColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                    onSaved: (value) => _enteredName = value!,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isSavingAvatar ? null : () => _submit(),
                    child: _isSavingAvatar
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : Text('Save Avatar', style: TextStyle(color: Theme.of(context).colorScheme.background)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSavingAvatar = true;
    });

    _formKey.currentState!.save();

    try {
      final fmoji = FluttermojiFunctions();
      String svgData = fmoji.decodeFluttermojifromString(
        await fmoji.encodeMySVGtoString(),
      );
      print("Encoded SVG Data: $svgData"); // Print SVG data for debugging
      if (svgData.isNotEmpty) {
        // Save to Firestore using UserProfileService
        final userProfileService = UserProfileService();
        await userProfileService.saveUserProfile(_enteredName, svgData);

        setState(() {
          _isSavingAvatar = false;
        });

        // Pop the screen with data
        Navigator.pop(context, {'svgData': svgData, 'name': _enteredName});
      } else {
        throw Exception("SVG data is empty");
      }
    } catch (e) {
      setState(() {
        _isSavingAvatar = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save avatar: $e")),
      );
    }
  }
}
