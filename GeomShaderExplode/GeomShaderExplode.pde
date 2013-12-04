
/*
  Geometry Shader Explode by Amnon Owed (04.12.2013)
  https://github.com/AmnonOwed
  http://vimeo.com/amnon
  
  Triangles are translated along their face normal (strength based on the mouseX position)

  (apparantly triangles are still clipped according to their original visibility,
  let me know if you find a fix for this, disabling culling didn't seem to solve it)

  Built with Processing 2.1
*/

PShader shader;
PShape shape;

void setup() {
  size(600, 600, P3D);
  smooth(8);
  shader = new PShaderCustom(this, "test");
  shader(shader);
  shape = createIcosahedron();
}

void draw() {
  background(255);
  perspective(PI/3.0, (float) width/height, 1, 1000000);
  translate(width/2, height/2, -200);
  rotateY(frameCount*0.01);
  rotateZ(frameCount*0.005);
  scale(150);

  shader.set("strength", float(mouseX));

  shape(shape);
}  

