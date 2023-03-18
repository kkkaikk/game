/*ボールがブロックに当たったときに，上下面だけでなく側面での反射もするようにした実装*/
/*追記/変更箇所*/
// Ballタブ：変数宣言(prevBallX,prevBallY)，moveBall()関数内
// Blockタブ：drawBlocks()関数内
import processing.serial.*;
Serial serial;
int gseq;  //ゲームの流れの管理
int BallcolorNumber = 0;
PImage img;
//test
void setup() {
  size(1023, 720);  // 画面サイズ
  arrangeBlocks();
  smooth();
  img = loadImage("UNO.jpg");
  serial = new Serial(this, "COM3", 9600);
  //gameInit();  //ゲームの初期化
}

void draw() {
  background(0, 255, 255);  // 背景色 #FFFFFF
  image(img, 0, 0, 1023, 720);
  int timer = millis();
  textSize(80);
  fill(0);
  text("time:"+timer/1000+"s", 10, 450);
  //if( gseq == 0 ){
  //  gameTitle();
  //}else if( gseq == 1 ){
  //  gamePlay();
  //}else if( gseq == 2 ){
  //  gameOver();
  //}
  char a = serial.readChar();
  if (a == 'c') {


    BallcolorNumber++;
    if (BallcolorNumber > 3)
    {
      BallcolorNumber = 0;
    }
  }
  /*バーの動き*/
  moveBar();

  /*ボールの動き*/
  moveBall();
  checkBallCollision();

  // ミスした回数を記録する処理
  //if (ballY>height) {
  //  missCounter++;
  //  println("Pass:"+missCounter);
  //}
  // ゲームオーバーとリセット
  /*if (missCounter>=5) {
   println("Game Over!!");
   missCounter=0;  // ゲームをリセット
   }*/

  /*図形の描画*/
  //fill(255, 0, 255);
  BallcolorRandom();//一回あたるごとに色を変える（本当は一回前のバーの色にボールの色が変わるようにしたかった）
  rect(barX, barY, barWidth, barHeight);  // バーの描画
  //fill(255, 255, 0, 140);

  ellipse(ballX, ballY, ballRadius*2, ballRadius*2);  // ボールの描画
  //fill(0, 155, 0, 140);
  drawBlocks();  //ブロックの描写

  /*if(gseq == 0){
   gameTitle();  //タイトル表示
   }else if(gseq == 1){
   gamePlay();  //プレイ画面
   }else{
   gameOver();  //ゲームオーバー画面
   }*/
}
//char c = serial.readChar();
void BallcolorRandom() {
  if (BallcolorNumber == 0) {
    fill(255, 255, 0);
    serial.write('y');
  } else if (BallcolorNumber == 1) {
    fill(255, 0, 0);
    serial.write('r');
  } else if (BallcolorNumber == 2) {
    fill(0, 255, 0);
    serial.write('g');
  } else if (BallcolorNumber == 3) {
    fill(0, 0, 255);
    serial.write('b');
  }
}




//void gameInit() {
//  gseq = 0;
//}
//void gameTitle() {
//  gseq = 1;
//}

//void gamePlay() {
//}
//void gameOver() {
//  gseq = 2;
//  textSize(100);
//  fill(0);
//  //text("Cleartime:"+timer/1000,30,450);
//}
