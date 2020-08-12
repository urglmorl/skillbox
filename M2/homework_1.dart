void main(){
  String correctName(String name) =>  name[0].toUpperCase() + name.substring(1).toLowerCase();
    
  List<String> users = ['anna', 'viKtor', 'Mike', 'aleX', 'dan'];
  
  print(users.map((String user) => correctName(user)));
}