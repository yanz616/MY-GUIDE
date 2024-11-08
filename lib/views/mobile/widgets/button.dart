import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/auth/sign_in.dart';
import 'package:project_dicoding/views/mobile/auth/sign_up.dart';
import 'package:project_dicoding/views/mobile/pages/home.dart';
// import 'package:project_dicoding/views/pages/home.dart';
import 'package:project_dicoding/views/mobile/widgets/customText.dart';

class HomeButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color? color;
  final BoxBorder? border;
  const HomeButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/Google.png',
            ),
            const Gap(8),
            BlackText(
              text: 'Google',
              styleForText: StyleForText(
                medium,
                14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required TextEditingController userNameController,
    required this.text,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: secondColor,
      ),
      child: TextButton(
        onPressed: () {
          if (text == 'Login') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  name: _userNameController.text,
                ),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          }
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         content:
          //             Text('Hello, ${_userNameController.text}'),
          //       );
          //     });
        },
        child: WhiteText(
          text: text,
          styleForText: StyleForText(
            medium,
            14.0,
          ),
        ),
      ),
    );
  }
}

class RouteValidate extends StatelessWidget {
  const RouteValidate({
    super.key,
    required this.text,
    required this.textValidate,
  });

  final String text;
  final String textValidate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WhiteText(
            styleForText: StyleForText(
              regular,
              12,
            ),
            text: text,
          ),
          const Gap(4),
          InkWell(
            onTap: () {
              validate(context);
            },
            child: GreenText(
              text: textValidate,
              styleForText: StyleForText(
                medium,
                14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //method validasi
  void validate(BuildContext context) {
    if (textValidate == 'Register') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInPage(),
        ),
      );
    }
  }
}
