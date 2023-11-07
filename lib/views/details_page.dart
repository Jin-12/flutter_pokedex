import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/poke_details.dart';
import 'package:flutter_pokedex/services/color_service.dart';
import 'package:flutter_pokedex/services/remote_service.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.pokeId});

  final int pokeId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PokeDetails? pokeDetails;
  String? pokeText;
  String? pokeHeight;
  String? pokeweight;
  List<String?>? types = [];
  List<String?>? abilities = [];
  List stats = [];
  Color backgroundColor = Colors.white;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    ///fetch data from API
    getData();
  }

  getData() async {
    pokeDetails = await RemoteService().getPokeDetails(widget.pokeId);
    pokeText = await RemoteService().getPokeText(widget.pokeId);
    types = await RemoteService().getTypes(pokeDetails);
    abilities = await RemoteService().getAbilities(pokeDetails);
    stats = await RemoteService().getStats(pokeDetails);
    if (pokeDetails != null) {
      setState(() {
        isLoaded = true;
        pokeHeight = (pokeDetails!.height * 0.1).toStringAsFixed(1);
        pokeweight = (pokeDetails!.weight * 0.1).toStringAsFixed(1);
        types = types;
        abilities = abilities;
      });
    }
    backgroundColor = ColorService().getTypeColor(types?[0]);
  }

  String? capitalize(String? s) {
    if (s == null || s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 25,
                left: 5,
                child: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${capitalize(pokeDetails?.name)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '#${widget.pokeId}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    child: Text(
                      types!.map(capitalize).toList().join('/'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.10,
                right: -30,
                child: Image.asset('assets/images/pokeball.png',
                    height: 200, fit: BoxFit.fitHeight),
              ),
              Positioned(
                bottom: 0,
                top: 300,
                child: Container(
                  width: width,
                  height: height * 0.58,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '"$pokeText"',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                  child: const Text(
                                    'Height',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${pokeHeight.toString()} m',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                  child: const Text(
                                    'Weight',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${pokeweight.toString()} kg',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                  child: const Text(
                                    'Abilities',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${abilities?.join('/')}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.only(bottom: 8, top: 0),
                            itemCount: stats.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 8),
                                child: SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.4,
                                        child: Text(
                                          '${capitalize(stats[index][0].stat.name)}',
                                          style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        '${stats[index][0].baseStat}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.18,
                left: (width / 2) - 100,
                child: Image(
                    image: NetworkImage(
                        '${pokeDetails?.sprites?.other?.officialArtwork?.frontDefault}'),
                    height: 200,
                    fit: BoxFit.fitHeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
