import 'package:flutter/material.dart';
import 'package:test_flutter/W6-S1-PRACTICE/EXERCISE-2/data/profile_data.dart';
import 'package:test_flutter/W6-S1-PRACTICE/EXERCISE-2/model/profile_tile_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(
      profileData: ronanProfile,
    ),
  ));
}

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileData.colorTheme,
      appBar: AppBar(
        backgroundColor: profileData.colorTheme,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(profileData.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(
                profileData.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                profileData.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: profileData.tiles.length,
                  itemBuilder: (context, index) {
                    final tile = profileData.tiles[index];
                    return ProfileTile(
                      icon: tile.icon,
                      title: tile.title,
                      data: tile.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
