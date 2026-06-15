import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/user_entity.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/providers/profile/get_profile_provider.dart';
import 'package:varadvani/presentation/providers/profile/update_profile_provider.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/presentation/widgets/loader_dialog.dart';
import 'package:varadvani/presentation/widgets/snackbar_helper.dart';
import 'package:varadvani/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:varadvani/theme/color_code.dart';

final textFieldVisibilityProvider = StateProvider<bool>((ref) => false);

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _personalIdController = TextEditingController();
  final TextEditingController _familyIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  bool _controllersInitialized = false;
  bool isLoading = true;
  UserEntity? _latestUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getProfileProvider.notifier).getProfile();
    });
  }

  @override
  void dispose() {
    _personalIdController.dispose();
    _familyIdController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  void _initControllers(UserEntity user) {
    if (_controllersInitialized) return;
    _personalIdController.text = user.personalCustomId;
    _familyIdController.text = user.familyCustomId;
    _phoneController.text = user.phoneNumber;
    _emailController.text = user.email;
    _addressController.text = user.address;
    _cityController.text = user.city;
    _stateController.text = user.state;
    _countryController.text = user.country;
    _pincodeController.text = user.pincode;
    _controllersInitialized = true;
  }

  void _resetControllers(UserEntity user) {
    _phoneController.text = user.phoneNumber;
    _emailController.text = user.email;
    _addressController.text = user.address;
    _cityController.text = user.city;
    _stateController.text = user.state;
    _countryController.text = user.country;
    _pincodeController.text = user.pincode;
  }

  void _onSave() {
    final storageService = ref.read(storageServiceProvider);

    ref
        .read(updateProfileProvider.notifier)
        .updateProfile(
          UpdateProfileParams(
            id: storageService.getUserId() ?? '',
            familyId: _familyIdController.text.trim(),
            phoneNumber: _phoneController.text.trim(),
            email: _emailController.text.trim(),
            address: _addressController.text.trim(),
            city: _cityController.text.trim(),
            state: _stateController.text.trim(),
            country: _countryController.text.trim(),
            pincode: _pincodeController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    //final updateProfileState = ref.watch(updateProfileProvider);
    final isEditing = ref.watch(textFieldVisibilityProvider);

    ref.listen<ProfileState>(getProfileProvider, (previous, next) {
      if (next.isLoading) {
        LoaderDialog.show(context, message: 'प्रोफाईल लोड होत आहे...');
      }
      if (next.data != null) {
        if (previous?.isLoading == true) {
          LoaderDialog.hide(context);
        }
        _latestUser = next.data!.data.user;
        _initControllers(_latestUser!);
      }
      if (next.error != null) {
        if (previous?.isLoading == true) {
          LoaderDialog.hide(context);
        }
        SnackbarHelper.show(context: context, message: next.error!);
      }
    });

    ref.listen<UpdateProfileState>(updateProfileProvider, (previous, next) {
      if (next.isLoading) {
        LoaderDialog.show(context, message: 'अद्ययावत होत आहे...');
      }
      if (next.data != null && previous?.isLoading == true) {
        LoaderDialog.hide(context);
        SnackbarHelper.show(context: context, message: next.data!.message);

        _latestUser = next.data!.data.user;
        _controllersInitialized = false;
        _initControllers(_latestUser!);

        ref.read(textFieldVisibilityProvider.notifier).state = false;
      }
      if (next.error != null) {
        if (previous?.isLoading == true) {
          LoaderDialog.hide(context);
        }
        SnackbarHelper.show(context: context, message: next.error!);
      }
    });

    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 10,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius:
                                40, // Controls the size — increase for bigger
                            backgroundImage: AssetImage(
                              'assets/image/dasganu.jpeg',
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(ColorCode.orange),
                              child: SvgPicture.asset('assets/svg/camera.svg'),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        profileState.data == null
                            ? ''
                            : profileState.data!.data.user.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Mukta_medium',
                          color: Color(ColorCode.black),
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Mukta_medium',
                          fontWeight: FontWeight.normal,
                          color: Color(ColorCode.black),
                          letterSpacing: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final notifier = ref.read(
                            textFieldVisibilityProvider.notifier,
                          );
                          if (isEditing && _latestUser != null) {
                            _resetControllers(_latestUser!);
                          }
                          notifier.state = !isEditing;
                        },
                        child: isEditing
                            ? Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mukta',
                                  color: Color(ColorCode.orange),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : SvgPicture.asset('assets/svg/edit.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    spacing: 15,
                    children: [
                      CustomTextField(
                        controller: _personalIdController,
                        hintText: '',
                        readOnly: true,
                        labelText: 'वैयक्तिक ओळख क्रमांक',
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _familyIdController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: 'कौटुंबिक ओळख क्रमांक',
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _phoneController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.mobile_number,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.email,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _addressController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.address,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _cityController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.city,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _stateController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.state,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _countryController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.country,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                      CustomTextField(
                        controller: _pincodeController,
                        hintText: '',
                        readOnly: !isEditing,
                        labelText: AppLocalizations.of(context)!.pincode,
                        containerColor: Color(ColorCode.scaffoldBackground),
                        borderColor: Color(ColorCode.black),
                        borderWidth: 1,
                        labelColor: Color(ColorCode.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (isEditing)
                    CustomButton(onPressed: _onSave, title: 'Update'),
                  SizedBox(height: 40),
                  Column(
                    spacing: 30,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                            color: Color(ColorCode.orange),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/logout.svg'),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Mukta_medium',
                                fontWeight: FontWeight.w500,
                                color: Color(ColorCode.orange),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/delete.svg'),
                          Text(
                            'Delete Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Mukta_medium',
                              fontWeight: FontWeight.w500,
                              color: Color(ColorCode.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
