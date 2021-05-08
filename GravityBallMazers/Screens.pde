
public static enum Screen_Types { // a way to reference and remember which screen is which, and which one is being used, for example.
  Title, PlayerControl, Control, Game, Error
}

public void displayScreen() {
  switch (current_screen) {
  case Title:
    displayTitle();
    break;
  case PlayerControl:
    displayPlayerControl();
    break;
  case Control:
    displayControl();
    break;
  case Game:
    displayGame(levels.get(curr_level));
  case Error:
    displayError();
    break;
  default:
    current_screen = Screen_Types.Error;
    next_screen = null;
    screen_fade = screen_fade_max;
    displayError();
    break;
  }
}

public void displayTitle() {
}

public void displayPlayerControl() {
}

public void displayControl() {
}

public void displayGame(Level l) {
}

public void displayError() {
}
