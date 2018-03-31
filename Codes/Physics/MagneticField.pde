class MagneticField{
  PVector field;

  MagneticField( ){
    field = new PVector(0,0);
  }

  void magneticField(float b,PVector v) {
    field.add(v);
    field.normalize();
    field.mult(b);
  }
}
