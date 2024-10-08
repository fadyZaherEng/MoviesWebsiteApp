import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '© 2024 MovieTMDBWeb. All rights reserved',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.facebook),
                color: Colors.white,
                tooltip: 'Facebook',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.link),
                color: Colors.white,
                tooltip: 'Twitter',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.image),
                color: Colors.white,
                tooltip: 'Instagram',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.video_library),
                color: Colors.white,
                tooltip: 'Youtube',
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Wrap(
            spacing: 16,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'About Us',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Terms of Service',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
