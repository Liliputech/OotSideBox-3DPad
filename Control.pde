/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

import processing.serial.*;
import controlP5.*;
ControlP5 cp5;
DropdownList dSerial;

void setupControl() {
  cp5 = new ControlP5(this);
  dSerial = cp5.addDropdownList("Serial-List").setPosition(10, 20);
  dSerial.captionLabel().set("Serial Port");
  for (int i=0; i<Serial.list ().length; i++) {
    dSerial.addItem(Serial.list()[i], i);
  }
  dSerial.setColorBackground(color(60));
  dSerial.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}
