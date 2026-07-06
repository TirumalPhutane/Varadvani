import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/providers/auth/forgot_password_provider.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/presentation/widgets/loader_dialog.dart';
import 'package:varadvani/presentation/widgets/snackbar_helper.dart';
import 'package:varadvani/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:varadvani/presentation/widgets/text_fields/mobile_text_field.dart';
import 'package:varadvani/theme/color_code.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
final confirmPasswordVisibilityProvider = StateProvider<bool>((ref) => false);

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  CountryCode _selectedCountryCode = CountryCode(dialCode: '+91', code: 'IN');

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool validateFields() {
    final mobileNumber = _mobileController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (mobileNumber.isEmpty) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.empty_mobile,
      );
      return false;
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.mobile_validation,
      );
      return false;
    }

    if (password.isEmpty) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.empty_password,
      );
      return false;
    }

    if (password.length < 6) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.password_validation,
      );
      return false;
    }

    if (password != confirmPassword) {
      SnackbarHelper.show(
        context: context,
        message:
            'Passwords are not matching.', //AppLocalizations.of(context)!.password_validation,
      );
      return false;
    }

    return true;
  }

  void _onUpdatePassword() {
    FocusScope.of(context).unfocus();
    if (!validateFields()) return;

    ref
        .read(forgotPasswordProvider.notifier)
        .forgotPassword(
          SignInParams(
            phoneNumber: _mobileController.text.trim(),
            password: _passwordController.text.trim(),
            countryCode: _selectedCountryCode.dialCode ?? '+91',
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);

    ref.listen<ForgotPasswordState>(forgotPasswordProvider, (previous, next) {
      if (next.isLoading) {
        LoaderDialog.show(
          context,
          message: AppLocalizations.of(context)!.updating,
        );
      }
      if (next.error != null && previous?.isLoading == true) {
        final message = next.validationErrors.isNotEmpty
            ? next.validationErrors.join('\n')
            : next.error!;
        SnackbarHelper.show(context: context, message: message);
        LoaderDialog.hide(context);
      }
      if (next.data != null && previous?.isLoading == true) {
        SnackbarHelper.show(context: context, message: next.data!.message);
        LoaderDialog.hide(context);
        if (next.data!.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.signInScreen,
            (_) => false,
          );
        }
      }
    });

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Color(ColorCode.white),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 20,
              top: 10,
            ),
            child: CustomButton(
              onPressed: forgotPasswordState.isLoading
                  ? null
                  : _onUpdatePassword,
              title: AppLocalizations.of(context)!.change_password,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      spacing: 15,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                        Text(
                          AppLocalizations.of(context)!.title,
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'Gotu',
                            color: Color(ColorCode.orange),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      //height: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 40,
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(ColorCode.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 25,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                'assets/svg/left_arrow.svg',
                                colorFilter: ColorFilter.mode(
                                  Color(ColorCode.black),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.change_password,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.bold,
                                color: Color(ColorCode.black),
                              ),
                            ),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  onCountryChanged: (code) => setState(
                                    () => _selectedCountryCode = code,
                                  ),
                                  initialCountry: 'IN',
                                ),
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
                                      suffixIcon: InkWell(
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
                                            left: 12,
                                            right: 12,
                                            bottom: 2,
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
                                    );
                                  },
                                ),
                                SizedBox(height: 5),
                                Consumer(
                                  builder: (context, ref, child) {
                                    final confirmPasswordVisible = ref.watch(
                                      confirmPasswordVisibilityProvider,
                                    );

                                    return CustomTextField(
                                      controller: _confirmPasswordController,
                                      hintText: AppLocalizations.of(
                                        context,
                                      )!.confirm_password,
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.confirm_password,
                                      obscureText: !confirmPasswordVisible,
                                      suffixIcon: InkWell(
                                        onTap: () =>
                                            ref
                                                    .read(
                                                      confirmPasswordVisibilityProvider
                                                          .notifier,
                                                    )
                                                    .state =
                                                !confirmPasswordVisible,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            bottom: 2,
                                          ),
                                          child: SvgPicture.asset(
                                            colorFilter: ColorFilter.mode(
                                              Color(ColorCode.black),
                                              BlendMode.srcIn,
                                            ),
                                            confirmPasswordVisible
                                                ? 'assets/svg/eye_open.svg'
                                                : 'assets/svg/eyes_closed.svg',
                                            width: 5,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
