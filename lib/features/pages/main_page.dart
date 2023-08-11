import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_texts.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:todo_app/features/components/color_box_widget.dart';
import 'package:todo_app/features/components/expanded_note_widget.dart';
import 'package:todo_app/features/components/user_note_widget.dart';

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
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
        title: Text(
          appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        ColorBoxWidget(
                            textTheme: textTheme,
                            boxColor: Colors.yellow,
                            boxTitle: 'Yellow Notes'),
                        ColorBoxWidget(
                            textTheme: textTheme,
                            boxColor: Colors.green,
                            boxTitle: 'Green Notes'),
                        ColorBoxWidget(
                            textTheme: textTheme,
                            boxColor: Colors.blue,
                            boxTitle: 'Blue Notes'),
                        ColorBoxWidget(
                            textTheme: textTheme,
                            boxColor: Colors.red,
                            boxTitle: 'Red Notes'),
                      ],
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
            child: ElevatedButton(
              onPressed: () {
                print('add note');
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: secondaryColor,
                fixedSize: const Size.fromHeight(defaultSize * 2),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
