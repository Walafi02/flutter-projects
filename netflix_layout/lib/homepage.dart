import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final List<String> filmes;

  MenuItem(this.title, this.filmes);
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<MenuItem> list = [];

    list.add(MenuItem("Familia", [
      "https://www.designerd.com.br/wp-content/uploads/2015/08/releituras-cartazes-filmes-famosos-Marko-Manev-2.jpg",
      "https://ingresso-a.akamaihd.net/prd/img/movie/venom-tempo-de-carnificina/b0beee24-579e-4514-8a87-90b3d0108fa9.jpg",
      "https://moviplexcinemas.com.br/wp-content/uploads/2021/08/SONIC_2_CARTAZ_SITE.jpg",
      "https://ingresso-a.akamaihd.net/img/cinema/cartaz/21564-cartaz.jpg"
    ]));

    list.add(MenuItem("Ação", [
      "https://s2.glbimg.com/bdtWv96x1gZchJ7nv2_JewxJDNU=/362x536/https://s2.glbimg.com/QnY4njv_Pm2ngiDQxzD4FJrQ0Ds=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2019/v/z/mPnsTGSeyLZOzx3YZLXA/tropa-de-elite-2-poster-hd.jpg",
      "https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg",
      "https://cinema10.com.br/upload/filmes/filmes_12263_images.jpeg",
      "https://br.web.img3.acsta.net/medias/nmedia/18/94/52/72/20474094.jpg",
      "https://cdn.ome.lt/legacy/images/galerias/Lucy/Lucy-poster-br.jpg",
      "https://br.web.img3.acsta.net/c_310_420/pictures/21/05/10/15/32/2425639.png"
    ]));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.45,
              child: Stack(
                children: [
                  Image.network(
                    "https://www.designerd.com.br/wp-content/uploads/2015/08/releituras-cartazes-filmes-famosos-Marko-Manev-2.jpg",
                    width: size.width,
                    height: size.height * 0.45,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Explosivo",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "Esperto",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "Envolvente",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "Empolgante",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "Ação",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "Drama",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Ação",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.white),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "Assistir",
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    )),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Saiba mais",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              child: Column(
                children: [
                  for (MenuItem item in list)
                    Card(
                      title: item.title,
                      filmes: item.filmes,
                    ),
                  // Card(),
                  // Card(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final List<String> filmes;
  const Card({Key? key, required this.title, required this.filmes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var filmes = [
    //   "https://www.designerd.com.br/wp-content/uploads/2015/08/releituras-cartazes-filmes-famosos-Marko-Manev-2.jpg",
    // ];
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  // physics: ClampingScrollPhysics(),
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: filmes.length,
                  itemBuilder: (BuildContext context, int index) => CardItem(
                        url: filmes[index],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String url;
  const CardItem({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: Image.network(
          url,
          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
