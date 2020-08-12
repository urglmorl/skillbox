class Hero {
  final String name;
  final int age;
  
  Hero(this.name, this.age);
  
  String toString(){
    return '{name: $name, age: $age}';
  }
}

Hero findUser(List<Map<String, dynamic>> data, String name){
  for(var item in data){
    if(item['name'] == name){
      return Hero(item['name'], item['age']);
    }
  }
  return Hero('Anonimus', 0);
}

void main(){
  const data = [
    {"name": "Batman", "age": 30},
    {"name": "Spiderman", "age": 18},
    {"name": "Kung fury", "age": 23},
    {"name": "Tor", "age": 550},
    {"name": "Halk", "age": 44},
    {"name": "Iron man", "age": 35},
  ];
  
  var hero = findUser(data, 'Batman');
  print(hero.toString());
}