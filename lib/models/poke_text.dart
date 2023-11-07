// To parse this JSON data, do
//
//     final pokeText = pokeTextFromJson(jsonString);

import 'dart:convert';

PokeText pokeTextFromJson(String str) => PokeText.fromJson(json.decode(str));

String pokeTextToJson(PokeText data) => json.encode(data.toJson());

class PokeText {
  int baseHappiness;
  int captureRate;
  EvolutionChain evolutionChain;
  dynamic evolvesFromSpecies;
  List<FlavorTextEntry> flavorTextEntries;
  List<dynamic> formDescriptions;
  bool formsSwitchable;
  int genderRate;
  List<Genus> genera;
  bool hasGenderDifferences;
  int hatchCounter;
  int id;
  bool isBaby;
  bool isLegendary;
  bool isMythical;
  String name;
  List<Name> names;
  int order;
  List<PalParkEncounter> palParkEncounters;
  List<PokedexNumber> pokedexNumbers;
  List<Variety> varieties;

  PokeText({
    required this.baseHappiness,
    required this.captureRate,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.varieties,
  });

  factory PokeText.fromJson(Map<String, dynamic> json) => PokeText(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions:
            List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(
            json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        varieties: List<Variety>.from(
            json["varieties"].map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "evolution_chain": evolutionChain.toJson(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": List<dynamic>.from(genera.map((x) => x.toJson())),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "order": order,
        "pal_park_encounters":
            List<dynamic>.from(palParkEncounters.map((x) => x.toJson())),
        "pokedex_numbers":
            List<dynamic>.from(pokedexNumbers.map((x) => x.toJson())),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toJson())),
      };
}

class EvolutionChain {
  String url;

  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Param {
  String name;
  String url;

  Param({
    required this.name,
    required this.url,
  });

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class FlavorTextEntry {
  String flavorText;
  Param language;
  Param version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Param.fromJson(json["language"]),
        version: Param.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version": version.toJson(),
      };
}

class Genus {
  String genus;

  Genus({
    required this.genus,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
      };
}

class Name {
  String name;

  Name({
    required this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class PalParkEncounter {
  int baseScore;
  int rate;

  PalParkEncounter({
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  int entryNumber;

  PokedexNumber({
    required this.entryNumber,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
      };
}

class Variety {
  bool isDefault;

  Variety({
    required this.isDefault,
  });

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
      };
}
