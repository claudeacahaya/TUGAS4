import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final VoidCallback onToggleTheme;

  const ProfileScreen({
    super.key,
    required this.email,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
            color: Colors.pink,
          ),
          onPressed: onToggleTheme,
        ),
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWpfReSpjxJ8bcuMhwqh51iJO0joufgDjuEw&s',
                ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 8), // <-- Ubah dari 20 jadi 8 (atau bisa 5-10 sesuai selera)

              // Tambahan nama "Claudea"
              const Text(
                'CLAUDEA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),

              const SizedBox(height: 10), // Pindahkan email ke bawah nama

              // Teks email
              Text(
                email,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen(onToggleTheme: onToggleTheme),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 242, 121, 215),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
