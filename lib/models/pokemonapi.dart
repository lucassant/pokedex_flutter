class PokemonApi {
  List<Pokemon> pokemon;

  PokemonApi({this.pokemon});

  PokemonApi.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String name;
  String id;
  String imageurl;
  String xdescription;
  String ydescription;
  String height;
  String category;
  String weight;
  List<String> typeofpokemon;
  List<String> weaknesses;
  List<String> evolutions;
  List<String> abilities;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  int total;
  String malePercentage;
  String femalePercentage;
  int genderless;
  String cycles;
  String eggGroups;
  String evolvedfrom;
  String reason;
  String baseExp;

  Pokemon(
      {this.name,
      this.id,
      this.imageurl,
      this.xdescription,
      this.ydescription,
      this.height,
      this.category,
      this.weight,
      this.typeofpokemon,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.total,
      this.malePercentage,
      this.femalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedfrom,
      this.reason,
      this.baseExp});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    evolutions = json['evolutions'].cast<String>();
    abilities = json['abilities'].cast<String>();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    malePercentage = json['male_percentage'];
    femalePercentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    eggGroups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    baseExp = json['base_exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['xdescription'] = this.xdescription;
    data['ydescription'] = this.ydescription;
    data['height'] = this.height;
    data['category'] = this.category;
    data['weight'] = this.weight;
    data['typeofpokemon'] = this.typeofpokemon;
    data['weaknesses'] = this.weaknesses;
    data['evolutions'] = this.evolutions;
    data['abilities'] = this.abilities;
    data['hp'] = this.hp;
    data['attack'] = this.attack;
    data['defense'] = this.defense;
    data['special_attack'] = this.specialAttack;
    data['special_defense'] = this.specialDefense;
    data['speed'] = this.speed;
    data['total'] = this.total;
    data['male_percentage'] = this.malePercentage;
    data['female_percentage'] = this.femalePercentage;
    data['genderless'] = this.genderless;
    data['cycles'] = this.cycles;
    data['egg_groups'] = this.eggGroups;
    data['evolvedfrom'] = this.evolvedfrom;
    data['reason'] = this.reason;
    data['base_exp'] = this.baseExp;
    return data;
  }
}
