// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:flutter_1/util/hexcollor.dart';

import '../model/movie.dart';
import '../model/question.dart';

class ScaffholdEx extends StatelessWidget {
  _tappButton() {
    debugPrint("Tapped Button");
  }

  const ScaffholdEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffhold example "),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: <Widget>[
          IconButton(
              onPressed: () => debugPrint("Email tappedaaa"),
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () => _tappButton(),
              icon: const Icon(Icons.access_alarm)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint("Hey Raoul CVX"),
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.call_outlined)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "First",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Second",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: "third",
          ),
        ],
        onTap: (int index) => debugPrint("Tapped item : $index"),
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CustomButton(),
              InkWell(
                  child: const Text(
                    "Tapp me pls",
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () => debugPrint("tapped"))
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          backgroundColor: Colors.green.shade300,
          content: const Text("Hey Raul!"),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          "Hello Flutter!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 28.4,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  const BizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BizzCard"),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getCard(), _getAvatar()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(14.5)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Raul CVX",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing",
              style: TextStyle(fontSize: 14)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_2_rounded),
              Text("Twitter"),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: const DecorationImage(
            image: NetworkImage("https://picsum.photos/300/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({super.key});

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Quote 1",
    "Quote 2",
    "Quote 3",
    "Quote 4",
    "Quote 5",
    "Quote 6",
    "Quote 7",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                  width: 300,
                  height: 250,
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      quotes[_index % quotes.length],
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  )),
            ),
          ),
          const Divider(
            thickness: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextButton.icon(
              onPressed: _showQuote,
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(204, 53, 207, 166)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(162, 0, 0, 0))),
              icon: const Icon(Icons.wb_sunny),
              label: const Text(
                'Ispire Me',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  final Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // TOTAL FOR PERSON

      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20.5),
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: _purple.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total for person",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: _purple),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BILL AMOUNT

          Container(
            width: 200,
            height: 300,
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade300,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                      color: _purple.withOpacity(1),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                      prefixText: "Bill amount   ",
                      prefixStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(Icons.attach_money)),
                  onChanged: (String value) {
                    try {
                      _billAmount = double.parse(value);
                    } catch (exception) {
                      _billAmount = 0.0;
                    }
                  },
                ),

                // SPLIT BILL - $ +

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Split Bill ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                _personCounter--;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _purple.withOpacity(0.4)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$_personCounter",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter < 8) {
                                _personCounter++;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _purple.withOpacity(0.4)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // TIP

                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Tip",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "\$ ${calculateTotalTip(
                              _tipPercentage.toDouble(),
                              _billAmount,
                              _personCounter,
                            )}",
                            style: TextStyle(
                                fontSize: 19,
                                color: _purple.withOpacity(1),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // SLIDER

                Column(
                  children: <Widget>[
                    Text(
                      "$_tipPercentage%",
                      style: TextStyle(
                          color: _purple,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      min: 0,
                      max: 100,
                      divisions: 20,
                      activeColor: _purple,
                      inactiveColor: Colors.grey,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value.round();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(tipPercentage.toDouble(), billAmount, splitBy) +
                billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double tipPercentage, double billAmount, int splitBy) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _index = 0;

  List<Question> questionBank = [
    Question("Romania is located in Eastern Europe. ", true),
    Question("Bucharest is the capital city of Romania. ", true),
    Question("The official language of Romania is Romanian. ", true),
    Question(
        "Romania is known for its beautiful castles, including Bran Castle. ",
        false),
    Question("The Carpathian Mountains run through Romania. ", false),
    Question(
        "Dracula, the fictional vampire, is associated with Romania. ", true),
    Question(
        "The traditional Romanian dish sarmale consists of cabbage rolls stuffed with meat and rice.",
        true),
    Question(
        "The Palace of the Parliament in Bucharest is the heaviest building in the world. ",
        false),
    Question("Pele, a famous gymnast, is from Romania. ", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,

      //APP BAR

      appBar: AppBar(
        title: const Text("True Citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        // FLAG IMAGE

        children: <Widget>[
          Center(
            child: Image.asset(
              "images/flag.png",
              width: 250,
              height: 250,
            ),
          ),

          // QUESTIONS

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(14.4),
                border: Border.all(
                  color: Colors.blueGrey.shade400,
                  style: BorderStyle.solid,
                ),
              ),
              height: 120.0,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Text(
                  questionBank[_index].questionText,
                  //style: const TextStyle(fontSize: 17, color: Colors.white)
                )),
              )),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _checkAnswear(true, context),
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade800),
                child: const Text('TRUE'),
              ),
              ElevatedButton(
                onPressed: () => _checkAnswear(false, context),
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade800),
                child: const Text(
                  'FALSE',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () => _nextAnswear(),
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade800),
                child: const Icon(Icons.arrow_forward),
              )
            ],
          ),

          // SPACER

          const Spacer(),
        ],
      ),
      //
    );
  }

  _checkAnswear(bool useChoice, BuildContext context) {
    if (useChoice == questionBank[_index].answer) {
      final snackbar = SnackBar(
        content: Text("Correct"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint(" Yes, Correct !");
    } else {
      final snackbar = SnackBar(
        content: Text("Incorrect"),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint(" No, False!");
    }
    setState(() {
      _index = (_index + 1) % questionBank.length;
    });
  }

  _nextAnswear() {
    setState(() {
      _index = (_index + 1) % questionBank.length;
    });
  }
}

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> movieList = Movie.getMovies();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade600,

      // ListVew.builder

      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                child: movieImage(movieList[index].Images[0]),
                top: 10,
                left: 5,
              ),
            ]);
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 54),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            movie.Title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          "Rating: ${movie.imdbRating} / 10",
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Released ${movie.Released}",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey)),
                        Text(movie.Runtime,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey)),
                        Text(movie.Rated,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.Title,
                      movie: movie,
                    ))));
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}

// New Route

class MovieListViewDetails extends StatelessWidget {
  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});
  final String movieName;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Description of ${this.movie.Title}"),
          backgroundColor: Colors.blueGrey.shade700,
        ),
        body: ListView(
          children: <Widget>[
            MovieDetailsThumbnail(thumbnail: movie.Images[0]),
            MovieDetailsHeaderWithPoster(movie: movie),
            HorizontalLine(),
            MovieDetailsCast(movie: movie),
            HorizontalLine(),
            MovieExtraPosters(posters: movie.Images),
            HorizontalLine(),
          ],
        ));
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  const MovieDetailsThumbnail({super.key, required this.thumbnail});
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(thumbnail)),
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.white),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  const MovieDetailsHeaderWithPoster({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.Images[2].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          ),
        ],
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${movie.Year} . ${movie.Genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.indigoAccent),
        ),
        Text(movie.Title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(text: movie.Plot),
              TextSpan(
                  text: "More...",
                  style: TextStyle(color: Colors.indigoAccent)),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            MovieField(field: "Cast", value: movie.Actors),
            MovieField(field: "Directors", value: movie.Director),
            MovieField(field: "Awards", value: movie.Awards),
          ],
        ));
  }
}

class MovieField extends StatelessWidget {
  const MovieField({super.key, required this.field, required this.value});
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$field : ",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.poster});
  final String poster;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  const MovieExtraPosters({super.key, required this.posters});
  final List<String> posters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "More movie posters".toUpperCase(),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Container(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: posters.length,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 8,
                      ),
                  itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(posters[index]),
                              fit: BoxFit.cover),
                        ),
                      )))),
        )
      ],
    );
  }
}
