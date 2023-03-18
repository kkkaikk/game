// 基本要素
float barX=500.0f;  // バーの左上のx座標
float barY=600.0f;  // バーの左上のy座標
float barVX=5.0f;  // バーのx方向の速度
float barVY=5.0f;  // バーのy方向の速度（上下移動追加する場合は使用）
float barWidth=200.0f;  // バーの幅
float barHeight=50.0f;  // バーの高さ

// バーの動きをまとめた関数
void moveBar(){
  // キー入力による動き
  if (keyPressed) {  // キーが押されたか
    if (keyCode==RIGHT) {  // 最後に押されたキーは右(→)か

      barX=barX+barVX;  // バーを右へ移動
    } else if (keyCode==LEFT) {  // 左(←)か

      barX=barX-barVX;  // バーを左へ移動
    }
  }

  // 移動範囲の制限
  if (barX<0) {  // 左端
    barX=0;
  } else if (barX+barWidth>width) {  // 右端
    barX=width-barWidth;
  }
}
