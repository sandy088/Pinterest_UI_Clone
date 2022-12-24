import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loadanimate/models/posts.dart';
import 'package:loadanimate/screens/feed_screen.dart';
import 'package:pie_menu/pie_menu.dart';

class DetailPage extends StatelessWidget {
  final String imgUrl;
  const DetailPage(
      {super.key,
      this.imgUrl =
          "https://images.unsplash.com/photo-1669992755631-3c46eccbeb7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"});

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(imgUrl),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 12),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1669992755631-3c46eccbeb7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Adminstrator blake",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "1.4K Followers",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(162, 213, 213, 213),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Flutter Tutorial: New video is out !!",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Want to do something cool in 2023? Let's do something new with me, Today I a buiding a Pinterest Clone UI",
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.message,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              162, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "Read it",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 196, 41, 29),
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      )),
                  child: SizedBox(
                    height: 680,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
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
                                        builder: (context) => DetailPage(
                                            imgUrl: posts[index].imageURL))),
                                actions: [
                                  PieAction(
                                    tooltip: 'like',
                                    onSelect: () => print('liked'),

                                    child: const Icon(Icons
                                        .favorite), // Not necessarily an icon widget
                                  ),
                                  PieAction(
                                    tooltip: 'Whatsapp',
                                    onSelect: () => shoMOdel(context),
                                    child: const Icon(Icons
                                        .whatsapp), // Not necessarily an icon widget
                                  ),
                                  PieAction(
                                    tooltip: 'Telegram',
                                    onSelect: () => shoMOdel(context),
                                    child: const Icon(Icons
                                        .telegram), // Not necessarily an icon widget
                                  ),
                                  PieAction(
                                    tooltip: 'Facebook',
                                    onSelect: () => shoMOdel(context),
                                    child: const Icon(Icons
                                        .facebook), // Not necessarily an icon widget
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    posts[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 30),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Share to",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 17,
                                                  ),
                                                  SizedBox(
                                                    height: 100,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: 5,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return SizedBox(
                                                          width: 90,
                                                          child:
                                                              Column(children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              radius: 35,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      sharePosts[
                                                                              index]
                                                                          .imageURL),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              sharePosts[index]
                                                                  .id,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.0,
                                                            horizontal: 15),
                                                    child: Divider(
                                                      color: Colors.grey,
                                                      height: 5,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            "This Pin was inspired by your recent activity",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            "Hide",
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          Text(
                                                            "Report",
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ]),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 20,
                                                          horizontal: 26),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: Colors
                                                              .grey.shade300),
                                                      child: const Text("Close",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
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
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
