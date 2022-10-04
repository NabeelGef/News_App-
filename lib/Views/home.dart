import 'package:flutter/material.dart';
import '../Services/service.dart';
import '../model/data.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String keySearching = "HHH";

class _HomeState extends State<Home> {
  late Future<Info> info;
  late String allResult;

  @override
  void initState() {
    //info = api.getEveryThing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    API api = API();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Home Page"),
        leading: const Icon(Icons.new_releases),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Info>(
            future: api.getEveryThing(keySearching),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        elevation: 2,
                        child: Center(
                          child: Text(
                            "All Results : ${snapshot.data?.totalResults}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.articles.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.5,
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Details(
                                        articles:
                                            snapshot.data!.articles[index]);
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Image(
                                          image: NetworkImage(snapshot.data!
                                              .articles[index].urlToImage)),
                                    ),
                                    Container(
                                        child: snapshot.data?.articles[index]
                                                    .author !=
                                                null
                                            ? Text(
                                                "Author : ${snapshot.data?.articles[index].author}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text(
                                                "No Author",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                    const Divider(
                                        thickness: 5, color: Colors.blue),
                                    Center(
                                      child: Text(
                                        "${snapshot.data?.articles[index].title}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.blue[100],
                                      child: Text(
                                          "published at : ${snapshot.data?.articles[index].publishedAt}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    API api = API();
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Info>(
            future: api.getEveryThing(query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        elevation: 2,
                        child: Center(
                          child: Text(
                            "All Results : ${snapshot.data?.totalResults}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.articles.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.5,
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Details(
                                        articles:
                                            snapshot.data!.articles[index]);
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Image(
                                          image: NetworkImage(snapshot.data!
                                              .articles[index].urlToImage)),
                                    ),
                                    Container(
                                        child: snapshot.data?.articles[index]
                                                    .author !=
                                                null
                                            ? Text(
                                                "Author : ${snapshot.data?.articles[index].author}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text(
                                                "No Author",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                    const Divider(
                                        thickness: 5, color: Colors.blue),
                                    Center(
                                      child: Text(
                                        "${snapshot.data?.articles[index].title}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.blue[100],
                                      child: Text(
                                          "published at : ${snapshot.data?.articles[index].publishedAt}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
