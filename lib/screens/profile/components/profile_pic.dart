import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../screens/profile/components/add_avatar_page.dart';

class ProfilePic extends StatefulWidget {
  final String? initialAvatarSvgData;
  final String? initialName;

  const ProfilePic({Key? key, this.initialAvatarSvgData, this.initialName}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  String? _avatarSvgData;
  String? _name;

  @override
  void initState() {
    super.initState();
    _avatarSvgData = widget.initialAvatarSvgData;
    _name = widget.initialName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: _avatarSvgData != null
                    ? _buildAvatarImage(_avatarSvgData!)
                    : Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.grey.shade800,
                      ),
              ),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                      backgroundColor: const Color(0xFF60C6A2),
                    ),
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        AddAvatarPage.routeName,
                      );
                      if (result != null && result is Map<String, String>) {
                        setState(() {
                          _avatarSvgData = result['svgData'];
                          _name = result['name'];
                          // Debug print to check SVG data
                          print("Received SVG Data: $_avatarSvgData");
                        });
                      }
                    },
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_name != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Hi, $_name!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  Widget _buildAvatarImage(String svgData) {
    // Additional debug prints to validate SVG data
    if (svgData.startsWith('<svg') && svgData.endsWith('</svg>')) {
      try {
        print("Rendering SVG Data: $svgData"); // Log SVG data for debugging
        return SvgPicture.string(
          svgData,
          fit: BoxFit.contain,
          placeholderBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } catch (e) {
        print("Error rendering SVG: $e"); // Log the error for debugging
        return const Icon(
          Icons.error,
          color: Colors.red,
          size: 60,
        );
      }
    } else {
      print("Invalid SVG Data: $svgData"); // Log invalid SVG data
      return const Icon(
        Icons.error,
        color: Colors.red,
        size: 60,
      );
    }
  }
}
