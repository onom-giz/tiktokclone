import 'package:flutter/material.dart';
import 'package:tictok_clone2/constants.dart';
import 'package:tictok_clone2/views/screens/auth/login_screen.dart';
import 'package:tictok_clone2/views/widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _usernameController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TikTok Clone",
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            const Text(
              "Register",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTamBOMm3ru8rl6VE07wbxQYS0bFgtJdYLJpOOfHFzMLPbBkWLwqzBH6HHS7Q&s'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () =>
                        authController.pickImage(),
                    icon: Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: TextInputField(
                  controller: _usernameController,
                  icon: Icons.person,
                  lebelText: 'Username'),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: TextInputField(
                  controller: _emailController,
                  icon: Icons.email,
                  lebelText: 'Email'),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: TextInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  isObscure: true,
                  lebelText: 'Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(5))),
              child: InkWell(
                onTap: () => authController.registerUser(
                    _emailController.text,
                    _usernameController.text,
                    _passwordController.text,
                    authController.profilePhoto),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
