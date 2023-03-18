// 基本要素（仮にブロックは60個実装する）
final int MAX_BLOCKS = 60;  // ブロックの総数
final int BLOCK_ROWS = 10;   // 横に並ぶブロックの数
final int BLOCK_GAP = 2;     // ブロック間の距離

float[] blockX = new float[MAX_BLOCKS];  // ブロックの左上のx座標
float[] blockY = new float[MAX_BLOCKS];  // ブロックの左上のy座標
float[] blockWidth = new float[MAX_BLOCKS];  // ブロックの幅
float[] blockHeight = new float[MAX_BLOCKS];  // ブロックの高さ
boolean[] hitFlag = new boolean[MAX_BLOCKS];  // ボールが当たったかの状態を示すフラグ
//255,0,0
//0,255,0
//0,0,255
//255,255,0

// ブロックを描画する関数(forで実装)
void drawBlocks() {
  for (int i=0; i<MAX_BLOCKS; i++) {
    //fill((i/5)*15, 100, 100);
    /*BlockcolorNumber++;
     if (BlockcolorNumber > 4)
     {
     BlockcolorNumber = 0;
     }
     BlockcolorRandom();//一個ごとに色を変える*/
    if (i < 15 && i >=0) {
      fill(255, 255, 0);
    } else if (i < 30 && i > 15) {
      fill(255, 0, 0);
    } else if (i == 15) {
      fill(0, 0, 0);
    } else if (i < 36 && i >= 30) {
      fill(0, 255, 0);
    } else if (i == 37) {
      fill(0, 0, 0);
    } else if (i < 45 && i >= 37) {
      fill(0, 255, 0);
    } else if (i < 52 && i >= 45) {
      fill(0, 0, 255);
    } else if (i == 52) {
      fill(0, 0, 0);
    } else if (i < 60 && i >= 53) {
      fill(0, 0, 255);
    }

    if (hitFlag[i]==false) {  // まだボールに当たっていないなら描画する
      rect(blockX[i], blockY[i], blockWidth[i], blockHeight[i]);
    }

    if (hitFlag[i]==false) {  // まだボールに当たっていない場合は衝突判定を行う

      if (ballX>blockX[i] && ballX<blockX[i]+blockWidth[i]) {
        if (ballY>blockY[i] && ballY<blockY[i]+blockHeight[i]) {
          // ボールが側面に当たった時の処理を追加
          if (prevBallX>blockX[i] && prevBallX<blockX[i]+blockWidth[i]) {
            ballVY =- ballVY;
          }
          if (prevBallY>blockY[i] && prevBallY<blockY[i]+blockHeight[i]) {
            ballVX =- ballVX;
          }

          if (BallcolorNumber == 0 && i < 15 && i >=0) {
            hitFlag[i] = true;
          }
          if (BallcolorNumber == 1 && i < 30 && i >= 15) {
            hitFlag[i] = true;
          }
          if (BallcolorNumber == 2 && i < 45 && i >= 30) {
            hitFlag[i] = true;
          }
          if (BallcolorNumber == 3 && i < 52 && i >=45) {
            hitFlag[i] = true;
          }
          if (i == 15 ||i == 37 || i == 52) {
            hitFlag[i] = true;
            hitFlag[i-1] = true;
            hitFlag[i+1] = true;
            hitFlag[i-11] = true;
            hitFlag[i-9] = true;
          }
          if (BallcolorNumber == 3 && i < 60 && i >= 53) {
            hitFlag[i] = true;
          }
        }
      }
    }
  }
}

// ブロックを並べる関数(forで実装)
void arrangeBlocks() {
  for (int i=0; i<MAX_BLOCKS; i++) {
    blockWidth[i] = 100.0f;
    blockHeight[i] = 20.0f;
    hitFlag[i] = false;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP);
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP);
  }
}
