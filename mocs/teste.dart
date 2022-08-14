void main() {
  int limite = 20;
  int atual = 0;
  List lista = [
    'humano',
    'martial apendiz',
    'martial patrociner',
    'martial figther',
    'warrior',
    'veteran warrior',
    'great warrior',
    'master',
    'greate master',
    'noble master',
    'king'
  ];

  int  ky_inc = 4;
  int ky = 0;
  int exp = 0;
  int? aux;
 
  for(int i = 0; i <= 10; i++){
    if(i !=0){
      if(i <= 3){
        limite += 50;
        atual += 20;
        ky = ky_inc * atual;
        exp += ky * 5;
      
    }else if( i <=6){
        limite += 100;
        atual += 50;
        ky_inc = 8;
        ky = ky_inc * atual;
        exp += ky * 15;

    }else if(i <=9){
        limite += 150;
        atual += 100;
        ky_inc = 25;
        ky = ky_inc * atual;
        exp += ky * 15;
    }else{
        limite += 580;
        atual += 490;
        ky_inc = 50;
        ky = ky_inc * atual;
        exp += ky * 15;
    }
    }
    print('nivel ${i}0 atual:$atual limite:$limite  Rank: ${lista[i]} ky total: $ky Exp necessaria: $exp');
    
  }


   
}
