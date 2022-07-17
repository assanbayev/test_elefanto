import 'package:flutter/material.dart';
import 'package:test_elefanto/consts.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/screens/main_content/main_content.dart';
import 'package:test_elefanto/shared/blue_text_button.dart';
import 'package:test_elefanto/shared/long_button.dart';
import 'package:test_elefanto/shared/my_checkbox.dart';
import 'package:test_elefanto/shared/my_text_field.dart';
import 'package:test_elefanto/shared/option_picker.dart';

import '../../font_consts/app_strings.dart';

class SignInAndRegister extends StatefulWidget {
  const SignInAndRegister({Key? key}) : super(key: key);

  @override
  State<SignInAndRegister> createState() => _SignInAndRegisterState();
}

class _SignInAndRegisterState extends State<SignInAndRegister> {
  bool? isRegistering;
  bool? isSigningIn;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: main(),
    );
  }

  Widget main() {
    //первая страница с выбором регистрации или авторизации
    if (isRegistering == null && isSigningIn == null) {
      return Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.default_horizontal_margin_main_content),
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                welcomeToMegaText,
                style: TextStyle(
                  color: Palette.myRed,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: SizeConfig.screenHeight * 0.5,
                child: Image.asset(
                  welcomeToMegaImage,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              LongButton(
                text: sign_in_button_text,
                backgroundColor: Palette.myBlue,
                voidCallback: goToSignIn,
              ),
              LongButton(
                text: register_button_text,
                backgroundColor: Palette.myRed,
                voidCallback: goToRegister,
              ),
            ],
          ),
        ),
      );
    }
    //авторизация
    else if (isSigningIn!) {
      return Center(
        child: Stack(
          children: [
            //задний фон
            Positioned(
              top: 0,
              right: SizeConfig.screenWidth * 0.5,
              child: Image.asset(blue_shadow, fit: BoxFit.contain),
            ),
            Positioned(
              bottom: 0,
              left: SizeConfig.screenWidth * 0.5,
              child: Image.asset(red_shadow, fit: BoxFit.contain),
            ),
            //

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal:
                      SizeConfig.default_horizontal_margin_main_content),
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            sign_in_text,
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Palette.myRed, fontSize: 34),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            hint: phone_number_text,
                            textEditingController: TextEditingController(),
                            textInputType: TextInputType.number),
                        MyTextField(
                          hint: password_text,
                          textEditingController: TextEditingController(),
                          textInputType: TextInputType.text,
                          isPassword: true,
                        ),
                        LongButton(
                          text: sign_in_button_text,
                          backgroundColor: Palette.myBlue,
                          voidCallback: goToNextPage,
                        ),
                        BlueTextButton(
                          text: forget_password_text,
                          isUnderlined: true,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          sign_in_with_text,
                          style: TextStyle(color: Palette.inputText),
                        ),
                        socialNetworkIcons(),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          dont_have_account,
                          style: TextStyle(color: Palette.inputText),
                        ),
                        BlueTextButton(
                          text: register_button_text,
                          voidCallback: goToRegister,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    //регистрация
    else if (isRegistering!) {
      return SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.default_horizontal_margin_main_content),
            constraints: const BoxConstraints(maxWidth: 300),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      register_text,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Palette.myRed, fontSize: 34),
                    ),
                  ),
                  MyTextField(
                      hint: surname_text,
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.name),
                  MyTextField(
                      hint: name_text,
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.name),
                  MyTextField(
                      hint: phone_number_text,
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.number),
                  OptionPicker(options: {
                    male_gender_text: true,
                    female_gender_text: false,
                    any_gender_text: false
                  }),
                  MyTextField(
                    hint: password_text,
                    textEditingController: TextEditingController(),
                    textInputType: TextInputType.text,
                    isPassword: true,
                  ),
                  MyTextField(
                      hint: promocode_text,
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.text),
                  const MyCheckbox(text: agree_with_private_policy),
                  const MyCheckbox(text: agree_with_affert),
                  LongButton(
                    text: register_button_text,
                    backgroundColor: Palette.myBlue,
                    voidCallback: goToNextPage,
                  ),
                  BlueTextButton(
                    text: already_have_account,
                    voidCallback: goToSignIn,
                    isUnderlined: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    register_with_text,
                    style: TextStyle(color: Palette.inputText),
                  ),
                  socialNetworkIcons(),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget socialNetworkIcons() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: SizeConfig.screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...social_network_images_url.map((e) => Container(
                width: SizeConfig.screenWidth * 0.07,
                height: SizeConfig.screenWidth * 0.07,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
                child: Image.asset(
                  e,
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }

  goToSignIn() {
    isRegistering = false;
    isSigningIn = true;
    setState(() {});
  }

  goToRegister() {
    isRegistering = true;
    isSigningIn = false;
    setState(() {});
  }

  goToNextPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainContent()));
  }
}
