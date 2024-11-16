import 'package:flutter/material.dart';
import 'package:test_flutter/W6-S1-PRACTICE/EXERCISE-2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/W6-S1/teacher.jpeg',
    colorTheme: const Color(0xff5E9FCD),
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);

ProfileData jinxProfile = ProfileData(
    name: "Jinx",
    position: "ADC",
    avatarUrl: "assets/W6-S1/Jinx.jpg",
    colorTheme: const Color(0xFFB0E0E6),
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 111 1111"),
      TileData(icon: Icons.location_on, title: "Address", value: "Zaun"),
      TileData(icon: Icons.email, title: "Mail", value: "jinx123@gmail.com"),
      TileData(icon: Icons.color_lens, title: "Color", value: "Blue"),
      TileData(icon: Icons.family_restroom, title: "Family", value: "Violet"),
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
    ]);

ProfileData viProfile = ProfileData(
    name: "VI",
    position: "Jungle",
    avatarUrl: "assets/W6-S1/Vi.jpg",
    colorTheme: const Color(0xFFC71585),
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 222 2222"),
      TileData(icon: Icons.location_on, title: "Address", value: "Zaun")
    ]);
