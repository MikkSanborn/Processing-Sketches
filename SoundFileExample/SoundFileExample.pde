import processing.sound.*;
SoundFile file;

boolean isPlaying = false;
boolean hasLoaded = false;

void setup() {
  size(640, 360);
  background(255);
  fill(0);
  rect(0, 0, 10, 10);
  textSize(24);
  text("Loading...", width/2, height/2);
  text("WORD", 100, 100);

  thread("prepareAudio");

  // Load a soundfile from the /data folder of the sketch and play it back
  // file.play();
}      

void draw() {
  background(0);
  fill(255);
  text((hasLoaded ? "Click to start.":"Preparing audio..."), width/2, height/2);
}

void mouseClicked() {
  if (!isPlaying) {
    file.play();
    isPlaying = true;
  }
}

void prepareAudio() {
  file = new SoundFile(this, "file.mp3");
  hasLoaded = true;
}
