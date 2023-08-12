import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constant_texts.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/data/color_box_data.dart';
import 'package:todo_app/features/widgets/color_box_widget.dart';
import 'package:todo_app/features/widgets/expanded_note_widget.dart';
import 'package:todo_app/features/widgets/user_note_widget.dart';
import 'package:todo_app/utils/components/app_bar.dart';
import 'package:todo_app/utils/components/elevated_btn.dart';
import 'package:todo_app/utils/routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(
        context: context,
        iconData: Icons.menu_rounded,
        title: appName,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appTitle,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    appHeading,
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: defaultSize,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 4),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          appSearch,
                          style: textTheme.bodyMedium!
                              .apply(color: Colors.grey.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultSize,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: colorBoxData.length,
                      itemBuilder: (context, index) {
                        return ColorBoxWidget(
                          textTheme: textTheme,
                          boxColor: colorBoxData[index].color,
                          boxTitle: colorBoxData[index].title,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: defaultSize,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandedNoteWidget(
                          textTheme: textTheme,
                          icon: Icons.star_outline_rounded,
                          noteName: favouriteNotes,
                          size: size),
                      const SizedBox(
                        width: 5,
                      ),
                      ExpandedNoteWidget(
                          textTheme: textTheme,
                          icon: Icons.announcement_outlined,
                          noteName: importantNotes,
                          size: size),
                    ],
                  ),
                  const SizedBox(
                    height: defaultSize,
                  ),
                  Text(
                    notesTitle,
                    style: textTheme.headlineMedium!.apply(fontSizeFactor: 1.2),
                  ), //TODO: MAKE SORTING SYSTEM
                  const SizedBox(
                    height: defaultSize,
                  ),
                  Column(
                    children: [
                      //TODO: MAKE BUILDER THAT CREATES PROPER AMOUNT OF NOTES
                      UserNoteWidget(
                        textTheme: textTheme,
                      ),
                      UserNoteWidget(
                        textTheme: textTheme,
                      ),
                      UserNoteWidget(
                        textTheme: textTheme,
                      ),
                      UserNoteWidget(
                        textTheme: textTheme,
                      ),
                      UserNoteWidget(
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: getElevatedBtn(
              onPressed: () {
                Get.toNamed(Routes.getCreateNotePageRoute());
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
