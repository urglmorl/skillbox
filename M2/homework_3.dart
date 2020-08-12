abstract class Hero {
  void say();
}

mixin Fly {
  void canFly(int speed){
    print('Я могу летать со скоростью $speedкм/ч');
  }
}

mixin Jump {
  void canJump(){
    print('Я могу прыгать');
  }
}

class Superman extends Hero with Fly, Jump{
  final int speed;
  
  @override
  void say(){
    canFly(speed);
    canJump();
  }
  
  Superman(this.speed);
}

void main(){
  Superman superman = Superman(200);
  superman.say();
}