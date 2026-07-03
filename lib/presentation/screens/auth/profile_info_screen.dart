import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/common/screen_arguments/sign_up_data.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/providers/auth/sign_up_provider.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/presentation/widgets/loader_dialog.dart';
import 'package:varadvani/presentation/widgets/snackbar_helper.dart';
import 'package:varadvani/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:varadvani/theme/color_code.dart';

class ProfileInfoScreen extends ConsumerStatefulWidget {
  const ProfileInfoScreen({super.key, required this.signUpData});

  final SignUpData signUpData;
  @override
  ConsumerState<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends ConsumerState<ProfileInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  void _onRegister() {
    FocusScope.of(context).unfocus();
    //if (!_formKey.currentState!.validate()) return;

    if (!validateFields()) return;

    // Combine address1 + address2
    final address =
        '${_address1Controller.text.trim()} ${_address2Controller.text.trim()}'
            .trim();

    ref
        .read(signUpProvider.notifier)
        .signUp(
          SignUpParams(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            password: widget.signUpData.password,
            phoneNumber: widget.signUpData.mobileNumber,
            address: address,
            city: _cityController.text.trim(),
            country: _countryController.text.trim(),
            state: _stateController.text.trim(),
            pincode: _pincodeController.text.trim(),
            countryCode: widget.signUpData.countryCode,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);

    ref.listen<SignUpState>(signUpProvider, (previous, next) {
      if (next.isLoading) {
        LoaderDialog.show(
          context,
          message: AppLocalizations.of(context)!.registering,
        );
      }
      if (next.error != null && previous?.isLoading == true) {
        // Show API-level validation errors as a list if present
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
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.profile_info,
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
                                _groupTitle(
                                  AppLocalizations.of(context)!.personal,
                                ),
                                CustomTextField(
                                  controller: _nameController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.name_hint,
                                  labelText: AppLocalizations.of(context)!.name,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.email_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.email,
                                ),
                              ],
                            ),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _groupTitle(
                                  AppLocalizations.of(context)!.address,
                                ),
                                CustomTextField(
                                  controller: _address1Controller,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.floor_apartment_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.floor_building,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _address2Controller,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.street_landmark_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.street_landmark,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _cityController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.city_hint,
                                  labelText: AppLocalizations.of(context)!.city,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _stateController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.state_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.state,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _countryController,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.country_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.country,
                                ),
                                SizedBox(height: 5),
                                CustomTextField(
                                  controller: _pincodeController,
                                  keyboardType: TextInputType.number,
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!.pincode_hint,
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.pincode,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CustomButton(
                                onPressed: signUpState.isLoading
                                    ? null
                                    : _onRegister,
                                title: AppLocalizations.of(context)!.register,
                              ),
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

  Widget _groupTitle(String title) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Mukta_medium',
          decoration: TextDecoration.underline,
          decorationColor: Color(ColorCode.orange),
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 4,
          fontWeight: FontWeight.normal,
          color: Color(ColorCode.black),
        ),
      ),
    ],
  );

  bool validateFields() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final address1 = _address1Controller.text.trim();
    final address2 = _address2Controller.text.trim();
    final city = _cityController.text.trim();
    final state = _stateController.text.trim();
    final country = _countryController.text.trim();
    final pincode = _pincodeController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        address1.isEmpty ||
        address2.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        country.isEmpty ||
        pincode.isEmpty) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.all_are_mandatory,
      );
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.email_validation,
      );
      return false;
    }

    if (name.length < 7) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.name_validation,
      );
      return false;
    }

    if (address1.length + address2.length < 5) {
      SnackbarHelper.show(
        context: context,
        message: AppLocalizations.of(context)!.address_validation,
      );
      return false;
    }

    return true;
  }
}
