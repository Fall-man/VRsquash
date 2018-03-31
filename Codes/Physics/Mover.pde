/*
Moverクラス(実際に運動する円状の物体のふるまいを記述したもの)を作ってみた.
電荷は用いていないが、これは明日書くForceクラスの方で使うので問題なし.
*/

//運動する物体
class Mover{
  PVector l; //位置
  PVector v; //速度
  PVector a; //加速度
  float m; //質量
  float q; //電荷
  PVector p;//運動量
  float kE;//運動エネルギー
  float pE;//位置エネルギー
  float e;//反発係数

  int s; //描画サイズ
  int b; //描画明度

  // コンストラクタで初期化
  Mover (PVector l_0, PVector v_0, float mass, float quantity, float elastic) {
    l = l_0.get(); //初期位置の設定
    v = v_0.get(); //初速度の設定
    a = new PVector(0,0); //初期加速度は0ベクトルで
    m = mass; // 質量を所与の値にする
    q = quantity; //電荷を所与の値にする
    e = elastic; //反発係数を所与の値にする

    smooth();
    noStroke();
    s = int(m * 10); // 質量が大きいほど大きいサイズで表示
    b = int(255 * q / 100); // 電荷が大きいほど明るい色で表示
  }

  // 力から加速度算出
  void calcNexta(PVector givenForce) {
    PVector f = givenForce.get();
    f.div(m);
    a.add(f);
  }

  // 直後の速度算出
  void calcNextv() {
    v.add(a);
  }

  // 画面の端から出そうになったら反発係数eで跳ね返る
  void checkEdges( ) {
    if ((l.x >= width) || (l.x <= 0)){
      v.x = e * (-1) * v.x;
    }
    if((l.y >= height) || (l.y <= 0)){
      v.y = e * (-1) * v.y;
    }
  }

  // 直後の位置算出
  void calcNextl() {
    l.add(v);
    if(l.x > width){
      l.x = width;
    }
    if(l.x < 0){
      l.x = 0;
    }
    if(l.y > height){
      l.y = height;
    }
    if(l.y < 0){
      l.y = 0;
    }

  }

  // 物体描画
  void display( ) {
    fill(b);
    ellipse(l.x, l.y, s, s);
  }

  // 加速度の算出から物体描画までを一発でやる
  void update(PVector givenforce) {
    checkEdges();
    calcNexta(givenforce);
    calcNextv();
    calcNextl();
    display();
    a.mult(0); //加速度リセット(calcNextaではベクトルの和で加速度を求めるため)
  }

}
