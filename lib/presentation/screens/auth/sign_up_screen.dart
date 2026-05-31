import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:varadvani/core/common/screen_arguments/sign_up_data.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/presentation/widgets/snackbar_helper.dart';
import 'package:varadvani/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:varadvani/presentation/widgets/text_fields/mobile_text_field.dart';
import 'package:varadvani/theme/color_code.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  CountryCode _selectedCountryCode = CountryCode(dialCode: '+91', code: 'IN');

  bool validateFields() {
    final mobileNumber = _mobileController.text.trim();
    final password = _passwordController.text.trim();

    if (mobileNumber.isEmpty) {
      SnackbarHelper.show(
        context: context,
        message: 'Please enter mobile number',
      );
      return false;
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      SnackbarHelper.show(
        context: context,
        message: 'Please enter a valid mobile number',
      );
      return false;
    }

    if (password.isEmpty) {
      SnackbarHelper.show(context: context, message: 'Please enter a password');
      return false;
    }

    if (password.length < 6) {
      SnackbarHelper.show(
        context: context,
        message: 'Password must be at least 6 characters long',
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Color(ColorCode.white),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 15,
              top: 10,
            ),
            child: Column(
              spacing: 15,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (!validateFields()) return;

                    Navigator.pushNamed(
                      context,
                      AppRoutes.profileInfoScreen,
                      arguments: SignUpData(
                        countryCode: _selectedCountryCode.code ?? '+91',
                        mobileNumber: _mobileController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                  },
                  title: AppLocalizations.of(context)!.proceed,
                ),
                CustomButton(
                  onPressed: () {},
                  title: AppLocalizations.of(context)!.existing_sign_in,
                  color: ColorCode.white,
                  borderColor: Color(ColorCode.orange),
                  borderWidth: 1.5,
                  titleColor: Color(ColorCode.orange),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/background.svg',
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 70),
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/image/narayan.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // App title
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.title,
                            style: TextStyle(
                              fontSize: 36,
                              fontFamily: 'Gotu',
                              color: Color(ColorCode.orange),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 25),
                            Text(
                              AppLocalizations.of(context)!.registration,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.bold,
                                color: Color(ColorCode.black),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.of(context)!.sign_up_message,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.normal,
                                color: Color(ColorCode.black),
                              ),
                            ),
                            SizedBox(height: 20),
                            MobileTextField(
                              context: context,
                              keyboardType: TextInputType.phone,
                              labelText: AppLocalizations.of(
                                context,
                              )!.mobile_number,
                              hintText: AppLocalizations.of(
                                context,
                              )!.mobile_number_hint,
                              controller: _mobileController,
                              onCountryChanged: (code) =>
                                  setState(() => _selectedCountryCode = code),
                              initialCountry: 'IN',
                            ),
                            SizedBox(height: 15),
                            Consumer(
                              builder: (context, ref, child) {
                                final passwordVisible = ref.watch(
                                  passwordVisibilityProvider,
                                );

                                return CustomTextField(
                                  controller: _passwordController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.password,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.password,
                                  obscureText: !passwordVisible,
                                  suffixIcon: Theme(
                                    data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      onTap: () =>
                                          ref
                                                  .read(
                                                    passwordVisibilityProvider
                                                        .notifier,
                                                  )
                                                  .state =
                                              !passwordVisible,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 10,
                                        ),
                                        child: SvgPicture.asset(
                                          colorFilter: ColorFilter.mode(
                                            Color(ColorCode.black),
                                            BlendMode.srcIn,
                                          ),
                                          passwordVisible
                                              ? 'assets/svg/eye_open.svg'
                                              : 'assets/svg/eyes_closed.svg',
                                          width: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
