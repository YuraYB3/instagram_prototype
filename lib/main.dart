import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool favouriteState = false;
  var urlList = [
    'https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg',
    'https://tabimg.pravda.com/images/doc/1/9/1956261-gettyimages-1243769507.jpg',
    'https://kor.ill.in.ua/m/610x385/2212556.jpg',
    'https://static.tildacdn.com/tild6661-3962-4165-b862-393466656435/picasso_muza.jpg',
    'https://d1rs3px2gf3dlr.cloudfront.net/media/blog/featured/PtVBand.jpg'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.textsms_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(),
                    ),
                    Text(
                      "person $index",
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: urlList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Position')
                          ],
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_vert))
                      ],
                    ),
                    Container(
                        width: 400,
                        height: 400,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                        ),
                        child: Image.network(
                          urlList[index],
                          fit: BoxFit.fill,
                        )),
                    Container(height: 5),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              ChangeFavouriteState();
                            },
                            icon: FavouriteIcon()),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.comment_rounded, size: 25)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.send_sharp, size: 25)),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_border,
                              size: 25,
                            )),
                      ],
                    ),
                    Container(height: 5),
                    Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(),
                          ),
                        ),
                        Container(width: 5),
                        const Text("Liked by aaaaaaaa and 116 others"),
                        Container(
                          height: 5,
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.multitrack_audio_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  void ChangeFavouriteState() {
    if (favouriteState) {
      setState(() {
        favouriteState = false;
      });
    } else {
      setState(() {
        favouriteState = true;
      });
    }
  }

  Icon FavouriteIcon() {
    if (favouriteState) {
      return const Icon(
        Icons.favorite,
        size: 25,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite_border,
        size: 25,
      );
    }
  }
}
