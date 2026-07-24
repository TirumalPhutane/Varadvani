import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/data_sources/local/local_datasource.dart';
import 'package:varadvani/domain/entities/drawer/contact.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class BookAvailabilityScreen extends ConsumerWidget {
  const BookAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsList = ref.watch(localDataSourceProvider).getContacts();

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.book_availability,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 10,
              bottom: 15,
            ),
            child: Column(
              spacing: 10,
              children: [
                WidgetHelper.buildStartText(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: contactsList.length,
                  itemBuilder: (context, index) {
                    final contact = contactsList[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: buildContact(contact),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContact(Contact contact) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(ColorCode.white),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Mukta_light',
                color: Color(ColorCode.black),
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            if (contact.address.isNotEmpty)
              Text(
                '${contact.address}.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            if (contact.landline.isNotEmpty)
              Text(
                'दूरध्वनी: ${contact.landline}.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            if (contact.mobile.isNotEmpty)
              Text(
                'मोबाईल: ${contact.mobile}.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            if (contact.note.isNotEmpty)
              Text(
                'टीप:',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                ),
              ),
            if (contact.contactPerson.isNotEmpty)
              Text(
                'संपर्क व्यक्ती: ${contact.contactPerson}.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            if (contact.contactPersonMobile.isNotEmpty)
              Text(
                'संपर्क मोबाईल: ${contact.contactPersonMobile}.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            if (contact.note.isNotEmpty)
              Text(
                contact.note,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
