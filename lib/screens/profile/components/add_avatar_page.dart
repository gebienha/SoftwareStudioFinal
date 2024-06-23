// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:fluttermoji/fluttermoji.dart';
// import 'profile_pic.dart'; // Import the ProfilePic widget

// class AddAvatarPage extends StatefulWidget {
//   const AddAvatarPage({super.key});
//   static String routeName = "/SeeMoreDetails";

//   @override
//   State<AddAvatarPage> createState() => _AddAvatarPageState();
// }

// class _AddAvatarPageState extends State<AddAvatarPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _enteredName = '';
//   String _selectedAvatarSvgData = '';

//   bool _isSavingAvatar = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Create Avatar')),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   FluttermojiCircleAvatar(
//                     radius: 80,
//                     backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
//                   ),
//                   const SizedBox(height: 16),
//                   FluttermojiCustomizer(
//                     scaffoldHeight: 300,
//                     autosave: true,
//                     theme: FluttermojiThemeData(
//                       labelTextStyle: Theme.of(context).textTheme.labelLarge,
//                       primaryBgColor: Theme.of(context).colorScheme.surfaceVariant,
//                       selectedTileDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         border: Border.all(
//                           color: Theme.of(context).colorScheme.primary,
//                           width: 4,
//                         ),
//                       ),
//                       selectedIconColor: Theme.of(context).colorScheme.primary,
//                       unselectedIconColor: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     validator: (value) =>
//                         value!.isEmpty ? 'Please enter your name' : null,
//                     onSaved: (value) => _enteredName = value!,
//                   ),
//                   const SizedBox(height: 16),
//                   FilledButton(
//                     onPressed: _isSavingAvatar ? null : () => _submit(),
//                     child: _isSavingAvatar
//                         ? const SizedBox(
//                             width: 24,
//                             height: 24,
//                             child: CircularProgressIndicator(color: Colors.white),
//                           )
//                         : const Text('Save Avatar'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     setState(() {
//       _isSavingAvatar = true;
//     });

//     _formKey.currentState!.save();
//     final fmoji = FluttermojiFunctions();
//     try {
//       String svgData = await fmoji.encodeMySVGtoString();
//       if (svgData.isNotEmpty) {
//         setState(() {
//           _selectedAvatarSvgData = svgData;
//           _isSavingAvatar = false;
//         });
//         Navigator.pop(context, {'svgData': _selectedAvatarSvgData, 'name': _enteredName});
//       } else {
//         throw Exception("SVG data is empty");
//       }
//     } catch (e) {
//       setState(() {
//         _isSavingAvatar = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to save avatar: $e")),
//       );
//     }
//   }
// }
