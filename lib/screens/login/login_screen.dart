// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: LoginScreen.routeName),
        builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Image.asset('assets/images/login.png'),
            const SizedBox(
              height: 10,
            ),
           const _buildTextFormField(
              icon: Icons.person,
              lableText: 'Enter UserName',
            ),
            const SizedBox(
              height: 10,
            ),
           const  _buildTextFormField(
              icon: Icons.lock,
              lableText: 'Enter Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Color(0xFF475269),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'Sign In',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dont Have Account ?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10,),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    )));
  }
}

class _buildTextFormField extends StatelessWidget {
  const _buildTextFormField({
    Key? key,
    required this.lableText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);
  final String lableText;
  final IconData icon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(icon),
          hintText: lableText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
