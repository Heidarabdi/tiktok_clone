import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextEditingController _controller = TextEditingController();




class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.square(50),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10),
          child: AppBar(
              backgroundColor: Colors.black,
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Following',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 20,
                            color: Colors.white
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'For you',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 20,
                          color: Colors.white
                      )),
                    ),
                  ],
                ),
              ),
              actions: const [
                Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 25,
                )
              ]),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/500/300'),

            )),
        // color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // icon button and bottom text
            const iconsText(
              icon: FontAwesomeIcons.heart,
              text: '34.5k',
            ),
            iconsText(
              icon: FontAwesomeIcons.comment,
              text: '3k',
              onPressed: () {
                // bottom sheet
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,

                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,

                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '500 comments',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 20,
                                  )),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.xmark,
                                      size: 20,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // scroble comments list
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            'https://picsum.photos/200/300'),
                                      ),
                                      title: Text(
                                        'User $index+1',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 20,
                                        )),
                                      ),
                                      subtitle: Text(
                                        'This is cool',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                        )),
                                      ),
                                      trailing: const Row(
                                        // heart icon and downvote
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.thumbsDown,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            // comment box that is fixed and also when keyboard is open it will not hide
                            Container(
                              width: double.infinity,
                              height: 120,
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),

                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade400,width: 2)
                                  )
                                  ),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "😀 😁 😂 😃 😄 😅",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            'https://picsum.photos/200/300'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        // text field and send button
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          margin: const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            children: [
                                               Expanded(
                                                child: TextField(
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                      hintText: 'Add a comment',
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    FontAwesomeIcons.paperPlane,
                                                    size: 20,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],

                                  ),

                                ],
                              ),
                            )
                          ]));
                    });
              },
            ),
            const iconsText(
              icon: FontAwesomeIcons.bookmark,
              text: '259',
            ),
            const iconsText(icon: FontAwesomeIcons.share, text: '900')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.squarePlus,
              size: 20,
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.inbox,
              size: 20,
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              size: 20,
            ),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}

class iconsText extends StatelessWidget {
  const iconsText({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          IconButton(
              onPressed: onPressed ??
                  () {}, // if onpressed isnot used then use empty function
              icon: Icon(
                icon,
                size: 30,
                color: Colors.white,
              )),
          Text(
            text,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontSize: 20,
                  color: Colors.white
            )),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
