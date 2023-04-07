import 'package:flutter/material.dart';
import 'package:instagram_prototype/Services/Auth.dart';
import 'package:instagram_prototype/Services/UserPost.dart';

import '../../Model/PostModel.dart';
import '../../Model/StoryModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<PostModel> postList = [];

  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    var userID = authService.getUserID();
    PostService postService = PostService(userID);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              AuthService authService = AuthService();
              authService.signOut();
            },
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
        children: [storiesBuilder(), postsBuilder(context, postService)],
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

  Widget storiesBuilder() {
    List<StoryModel> storyList = [
      StoryModel(
          storyImage:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Official_portrait_of_Petro_Poroshenko.jpg/1200px-Official_portrait_of_Petro_Poroshenko.jpg',
          userName: 'yura')
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 3),
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      storyList[index].storyImage,
                      fit: BoxFit.fitWidth,
                    )),
              ),
              Text(
                storyList[index].userName,
                style: const TextStyle(fontSize: 12),
              )
            ],
          );
        },
      ),
    );
  }

  Widget postsBuilder(BuildContext context, PostService postService) {
    return StreamBuilder<List<PostModel>>(
        stream: postService.readAllUsersPosts(),
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.hasError) {
            return const Text("ERROR!!!");
          }
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
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
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  posts[index].userImage,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                posts[index].userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(posts[index].location!)
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert))
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
                            posts[index].postImage,
                            fit: BoxFit.cover,
                          )),
                      Container(height: 5),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_outline)),
                          IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.comment_rounded, size: 25)),
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
                      posts[index].description != null
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(posts[index].description!),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 10,
                                )
                              ],
                            )
                          : Container(),
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
                          const Text("Liked by b.y.y.2 and 116 others"),
                          Container(
                            height: 5,
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        });
    /**/
  }
}
