import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'google_bottom_bar.dart';
import 'profile_screen.dart'; 

class NewsFeedPage2 extends StatefulWidget {
  const NewsFeedPage2({Key? key}) : super(key: key);

  @override
  _NewsFeedPage2State createState() => _NewsFeedPage2State();
}

class _NewsFeedPage2State extends State<NewsFeedPage2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _articles[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text("${item.author} · ${item.postedOn}",
                            style: Theme.of(context).textTheme.caption),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icons.bookmark_border_rounded,
                            Icons.share,
                            Icons.more_vert
                          ].map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(e, size: 16),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 3) { // Jika item keempat (indeks 3) diklik
              Navigator.push( // Navigasi ke halaman profil
                context,
                MaterialPageRoute(builder: (context) => ProfilePage1()),
              );
            }
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.library_books),
            title: const Text("News"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final String postedOn;

  Article(
      {required this.title,
      required this.imageUrl,
      required this.author,
      required this.postedOn});
}

final List<Article> _articles = [
  Article(
    title: "Buku Seri Ensiklopedia Lift The Flap: Tubuh Manusia",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/picture_meta/2022/11/29/bgwzalr6aozpm7xrkth26g.jpeg",
    postedOn: "Yesterday",
  ),
  Article(
      title: "Buku Spy x Family 6",
      imageUrl: "https://cdn.gramedia.com/uploads/items/722010231_Spy_x_Family_06_1.jpg",
      author: "admin",
      postedOn: "4 hours ago"),
  Article(
    title: "Buku One Punch Man 7",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/items/9786020403274_one-punch-man-7.jpg",
    postedOn: "2 days ago",
  ),
  Article(
    title:"Buku Tokyo Ghoul: Re 7",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/items/9786024806934_TOKYO-GHOUL-R.jpg",
    postedOn: "22 hours ago",
  ),
  Article(
    title:"Buku One Piece 104",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/picture_meta/2023/12/8/dm8mwx8auhp2tkzjhokzhf.jpg",
    postedOn: "2 hours ago",
  ),
  Article(
    title: "Buku DEMON SLAYER: Kimetsu no Yaiba 08",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/items/9786230029806_Demon_Slayer_8.jpg",
    postedOn: "10 days ago",
  ),
  Article(
    title: "Buku Tokyo Ghoul: re 03",
    author: "admin",
    imageUrl: "https://cdn.gramedia.com/uploads/items/9786024802066_REV1-tokyo-gh.jpg",
    postedOn: "10 hours ago",
  ),
];