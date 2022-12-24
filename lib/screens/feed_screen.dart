import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:loadanimate/models/posts.dart';
import 'package:loadanimate/screens/detail_page.dart';
import 'package:pie_menu/pie_menu.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Browse",
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationThickness: 2,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(0, -5),
                ),
              ],
            ),
          ),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PieMenu(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(imgUrl: posts[index].imageURL))),
                      actions: [
                        PieAction(
                          tooltip: 'like',
                          onSelect: () => print('liked'),

                          child: const Icon(
                              Icons.favorite), // Not necessarily an icon widget
                        ),
                        PieAction(
                          tooltip: 'Whatsapp',
                          onSelect: () => shoMOdel(context),
                          child: const Icon(
                              Icons.whatsapp), // Not necessarily an icon widget
                        ),
                        PieAction(
                          tooltip: 'Telegram',
                          onSelect: () => shoMOdel(context),
                          child: const Icon(
                              Icons.telegram), // Not necessarily an icon widget
                        ),
                        PieAction(
                          tooltip: 'Facebook',
                          onSelect: () => shoMOdel(context),
                          child: const Icon(
                              Icons.facebook), // Not necessarily an icon widget
                        ),
                      ],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          posts[index].imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // For Below Image text
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          posts[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Share to",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 17,
                                        ),
                                        SizedBox(
                                          height: 100,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: ((context, index) {
                                              return SizedBox(
                                                width: 90,
                                                child: Column(children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    radius: 35,
                                                    backgroundImage:
                                                        NetworkImage(
                                                            sharePosts[index]
                                                                .imageURL),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    sharePosts[index].id,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ]),
                                              );
                                            }),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.0, horizontal: 15),
                                          child: Divider(
                                            color: Colors.grey,
                                            height: 5,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "This Pin was inspired by your recent activity",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Hide",
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  "Report",
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ]),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 26),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.grey.shade300),
                                            child: const Text("Close",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(Icons.more_horiz_rounded),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

void shoMOdel(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              const Text(
                "Share to",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      width: 90,
                      child: Column(children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 35,
                          backgroundImage:
                              NetworkImage(sharePosts[index].imageURL),
                        ),
                        const Spacer(),
                        Text(
                          sharePosts[index].id,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "This Pin was inspired by your recent activity",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hide",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: const Text("Close",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        );
      });
}
