import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_prototype/Model/PostModel.dart';
import 'package:instagram_prototype/Model/StoryModel.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Instagram'),
  ));
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
  List<StoryModel> storyList = [
    StoryModel(
        storyImage:
            "https://lh3.googleusercontent.com/pw/AMWts8CCjUmpWTnT99RN9KdaIvujsHu7owftX-OUKucb6c3MX6IU5cAxGm9ZLBRNU5wj8lJJ-tGtpAgyqC3TKGbW-1pvWZeB-f2Fi6on8HlXcCuTFsgUPYV9q4sDZjY8A8SLx_M84cMeC2SNHxbJmOoQJsrC8CCbxjNZpR06oKZHxMeLaCyPxrmkhwRA-WdGVT3tXN-De-ZmQ2TJLm3zLMk9s1OMi2I6yeAFsw5j0p_6HCOSmwWZtqR49o8QlWDmMfTeWwrm0CK8Flcd_vUHXNAepxvWGuV8bZhywLjXWx2vwI7nH1Klxwt1jjmCyisX40HlaWbJYU32uZvMWkqpQ1yOig3JrOg5DiQBnFJow0qHfyrmCK9NSqM9XN3MAO_F2UYRm3U7FLIuxIhv0f417GtdxGCZthkLQtK6O8MJydOadWvc9SM1ngfuTrkF4cK7l1sZJkacH5a0NBISeoGrMzIufkRM_J1IzjButYiKxjxi2qM-SXEHL7ns7hgPqOfeQVaGnmoxV8Zxl5W9KrjGFjYCMl0hwHlS-GmoGfJpkpCVVVo-MqC3YKpBPRWTc6FlPeB4qkxUmHi4EpSUy8AHlLZzmgCIzC0aTYBbOMfGnpHF9-8nyaPWebD07L8nbkVOWdvMD-mU9Vn7L5S6f8gyipQlbXfTx8Eu7RDS3-zDJVE4rV81kv4QTO6N7qsEliDlilMw3aiJqpaRUKpLOhKfP35IiVwXa_MxXFQ3WhnPzqhx5iaOvERyVqcLEAa6Fc4bY0I1c6iTTX6rnuLuGUyf62Wt7wxBfx15e_van7C9fnCGuEFtveoOPM2N9Y7MZ5F2ZYRlejBx1JVwtXBHHeHkFM2Tx8a7cToZnN2IDF1_D4pK0tntM4mpenHrmvmWkm83bmoOIaO0KmRblIKufW_sIS5IJSe9RFH2HJRKriEgFRr9hQBIOJKpGfX8_7tHKcL8l7k=w1250-h937-no?authuser=0",
        userName: "b.y.y.2"),
    StoryModel(
        storyImage:
            'https://lh3.googleusercontent.com/pw/AMWts8CKBD9CVk3f3rQJDG0gQ3LM7D5r26kQ_nt_O0M7vXHAvEolW2RByEYpJuGmi222-D0Acrwxw2JzaGy_acWe3tlGakeywmaI2eGcFdIzsOPg6gB6VWxjRYfohtK0q66MMPgeIRw8IzLg-CVMhQqOQc27bXWSPAIPuIb1hb7griV_XCYYYM732Fe_nx1yVHNnAV2KLFU2GWsQqPE6H72efn_h6dRUc7FRAaVDg7-ipt2H62SsR61AX-lJWPkEUV0sjA0Qf-40T6GnrjNyjxPpOtNuzqX9VY1ClpnOlM_Psq-kgZeiGyO9fqh1JxlxafZNvYGNV_AsE3FVyptzwo7LaV80ALE-ymQSKy58UjPWbeiGFAsoCMRqW7jibsbaNef5HPQ56-OpUQgvj0zK7_xaN3KBcOeIm0yYyZg0fpMRxkCcgEkwzn7TTThePUVImM-yaKrePn-LBPux3XTH5aFDeVTU9rokWzFcF9vpLnmbDBr4Z3pv_nwOaMEmV1jyOFA0xwBL6JKY47p35ZYxxpBzmO5khOc0eAsKcPfJxhYNgHeW77c6OcWJTMMBV98OHG6SCkL-eAEyzsWA9ymWW4Aia6-L6iJzcoO-sZHb_zK136msdkx7bdiGXO5xpFydzESEUQKBtaf3uHzbKpvnrVpeiICDj9LmEfrJKwk-HsI_Mx0NFJkwvc3KRFXCvNHYpT-1_steSZMhCjUrxsZqDRE0PqHH0he9bAlx6Bm4aIQ_JSKdoggIK9eSS45AMhMoRq5Mic8NJomqO5yeoY6E6JHm3GGIDrz8_HNZvhwlr4Tqsq9tab4bSosPl8qO1wmwBjOV4ZIDw9fytfJpG2YlXgAjUIYwy5sxtVD3AQCtNRJRtH5tBamYoFc2oASe5oD-IpY9zoKOOis8kxNtc3xjVpTBfkmkdMHJID7dfncVy_4N7OXluCGqEQq9WZfrIMSi2nw=w528-h937-no?authuser=0',
        userName: 'yuraNovak')
  ];

  List<PostModel> postList = [
    PostModel(
        userName: 'b.y.y.2',
        userImage:
            'https://lh3.googleusercontent.com/pw/AMWts8CCjUmpWTnT99RN9KdaIvujsHu7owftX-OUKucb6c3MX6IU5cAxGm9ZLBRNU5wj8lJJ-tGtpAgyqC3TKGbW-1pvWZeB-f2Fi6on8HlXcCuTFsgUPYV9q4sDZjY8A8SLx_M84cMeC2SNHxbJmOoQJsrC8CCbxjNZpR06oKZHxMeLaCyPxrmkhwRA-WdGVT3tXN-De-ZmQ2TJLm3zLMk9s1OMi2I6yeAFsw5j0p_6HCOSmwWZtqR49o8QlWDmMfTeWwrm0CK8Flcd_vUHXNAepxvWGuV8bZhywLjXWx2vwI7nH1Klxwt1jjmCyisX40HlaWbJYU32uZvMWkqpQ1yOig3JrOg5DiQBnFJow0qHfyrmCK9NSqM9XN3MAO_F2UYRm3U7FLIuxIhv0f417GtdxGCZthkLQtK6O8MJydOadWvc9SM1ngfuTrkF4cK7l1sZJkacH5a0NBISeoGrMzIufkRM_J1IzjButYiKxjxi2qM-SXEHL7ns7hgPqOfeQVaGnmoxV8Zxl5W9KrjGFjYCMl0hwHlS-GmoGfJpkpCVVVo-MqC3YKpBPRWTc6FlPeB4qkxUmHi4EpSUy8AHlLZzmgCIzC0aTYBbOMfGnpHF9-8nyaPWebD07L8nbkVOWdvMD-mU9Vn7L5S6f8gyipQlbXfTx8Eu7RDS3-zDJVE4rV81kv4QTO6N7qsEliDlilMw3aiJqpaRUKpLOhKfP35IiVwXa_MxXFQ3WhnPzqhx5iaOvERyVqcLEAa6Fc4bY0I1c6iTTX6rnuLuGUyf62Wt7wxBfx15e_van7C9fnCGuEFtveoOPM2N9Y7MZ5F2ZYRlejBx1JVwtXBHHeHkFM2Tx8a7cToZnN2IDF1_D4pK0tntM4mpenHrmvmWkm83bmoOIaO0KmRblIKufW_sIS5IJSe9RFH2HJRKriEgFRr9hQBIOJKpGfX8_7tHKcL8l7k=w1250-h937-no?authuser=0',
        location: "Ukraine",
        postImage:
            'https://lh3.googleusercontent.com/pw/AMWts8Bo5xZTQEtGLLbWLlQYuATzW58_cq7rVlo708EKC6e0Vselgd6iyUEPpKGv34RYUO-4MEkaYYZH31wc6D7eLgvj_VgWn-m2qnv8c6wFbEKchKs1DoC_26QXvtXTM92FxB7qiYe5-UwIlSjkSW-eA89K5E1hKtm5Wt_urBXNidvGKh5O-UmYc0spEJzhDckYJoa8gVjY-Fql75dk5bmOJ7unmiX7VLPXUpqroQUzW30MNCSroq54UAKEJO_UcTRrldT91yOPVYhw8Lg7sLkegCSFX-EUehm297MHuIJua4kEzJpz5OrbpnrX9W3EWKz43VOqF_ObEeq3X-T1BIJHO74PeI9r-_A_7m4f-x-tazfRNk4hMn5C0DJRam3kTI1VGszcuKoRjvwXtyFYEKUK8S3my9nRJsKyjZVZqH0OSVvJeQl1BI1SXUdUgYUZGZq_jS7loOeOhP4fJxALG3W_iEUWxDMz1YVyvFUzJy4bYgCgzejq_TQiEPf34XO4knXfIUjrcbUgzKKvLA07nlhEUvnzo5DT79AabfceLuYYfo82wzLzF3W2QQWG0BofU7M90WVEb4rZK4ZcZKGMRPsqqV8QUoA4_YzupmDdD-JnIFi-ywhZJfjxL6i8iHa9V9wb0GG7o_QeL95-t8lHO4NDKnSvNVUCcGM3Np1QnmfMR-eh3fIVhrdCmHv--LhslwN6xsZ7D4o7VFt_DHxMRMDfQqH6CdKsoouMMbepgKQJQQ0Wi16rE-AoErfuWAYmNzkGnTUJ8UIrsI-OW7-k6Q0u8VCqmILI0P-8pp9Iw0QGgqlU-eT4D-b6a1809sh5fhKd_IQPZSVuB_L2nZKCiEKtgkMmt6MWP12iTfTI3w0s9iSra3kwe_N8EghLQWzRViC-gpAa3Xro-ygmR5gyuABaaFjjMJ762KI1jtaR7xyoEas1DZvYmEykDWSnUT2gfDo=w703-h937-no?authuser=0',
        description: 'Краса смерекова')
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
              itemCount: storyList.length,
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            storyList[index].storyImage,
                            fit: BoxFit.cover,
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
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: postList.length,
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
                                postList[index].userImage,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postList[index].userName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(postList[index].location)
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
                          postList[index].postImage,
                          fit: BoxFit.cover,
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
                    postList[index].description != null
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(postList[index].description!),
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
