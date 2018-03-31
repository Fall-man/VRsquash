Mover mover;
PVector l_0;
PVector v_0;
PVector gForce;

void setup( ) {
  size(500, 300);
  //frameRate(30);
  background(238);
  smooth();
  l_0 = new PVector(0, 0);
  v_0 = new PVector(random(10), random(10));
  mover = new Mover(l_0, v_0, 5, 0, 0.9);
  gForce = new PVector(0, 0.5);
}

void draw( ) {
  if (mousePressed){
    PVector vdash = new PVector((random(20)-10), (random(20)-10));
    mover.v.mult(0);
    mover.v.add(vdash);
  }
  fill(255,17);
  rect(0,0,width,height);
  mover.update(gForce);
}
