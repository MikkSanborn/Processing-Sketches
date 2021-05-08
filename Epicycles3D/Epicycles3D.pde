void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(0);
  // rotateX,Y,Z(?), translate, etc.
  
}

class EpicycloidEllipse3D {
  float x, y, z;
  float w, h; // 2D object
  float tXY, tYZ, tXZ; // is XZ needed?
  float tiXY, tiYZ, tiXZ; // keep XZ if above is kept.
  
  EpicycloidEllipse3D(/*vars*/) {
    // init
  }
  
  // getFinalX
  // getFinalY
  // getFinalZ
  // increase theta on all
  // draw (somehow), point & ellipse
}
