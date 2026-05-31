import 'package:flutter/material.dart';
import 'package:varadvani/core/common/screen_arguments/sign_up_data.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:varadvani/theme/color_code.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key, required this.signUpData});

  final SignUpData signUpData;
  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
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
                          'प्रोफाइल माहिती',
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
                            _groupTitle('वैयक्तिक'),
                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Ex. Varad Vani',
                              labelText: 'Name',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Ex. abc@gmail.com',
                              labelText: 'Email',
                            ),
                          ],
                        ),
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _groupTitle('पत्ता'),
                            CustomTextField(
                              controller: _address1Controller,
                              hintText: 'Floor/Building/Apartment',
                              labelText: 'Floor/Building/Apartment',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _address2Controller,
                              hintText: 'Street/Landmark',
                              labelText: 'Street/Landmark',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _cityController,
                              hintText: 'City',
                              labelText: 'City',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _stateController,
                              hintText: 'State',
                              labelText: 'State',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _countryController,
                              hintText: 'Country',
                              labelText: 'Country',
                            ),
                            SizedBox(height: 5),
                            CustomTextField(
                              controller: _pincodeController,
                              keyboardType: TextInputType.number,
                              hintText: 'Pincode',
                              labelText: 'Pincode',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CustomButton(
                            onPressed: () {
                              // FocusScope.of(context).unfocus();
                              // if (!validateFields()) return;

                              // Navigator.pushNamed(
                              //   context,
                              //   AppRoutes.profileInfoScreen,
                              //   arguments: SignUpData(
                              //     countryCode: _selectedCountryCode.code ?? '+91',
                              //     mobileNumber: _mobileController.text.trim(),
                              //     password: _passwordController.text.trim(),
                              //   ),
                              // );
                            },
                            title: 'नोंद करा',
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
}
