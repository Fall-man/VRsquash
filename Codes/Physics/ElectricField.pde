class ElectricField{
  PVector field;

  ElectricField( ){
    field = new PVector(0,0);
  }

  void electricField(float e,PVector v) {
    field.add(v);
    field.normalize();
    field.mult(e);
  }
}
