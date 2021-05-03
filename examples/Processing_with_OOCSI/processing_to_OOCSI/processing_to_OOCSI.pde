/**************************************************************************************************
* Author:       I-Tang(Eden) Chiang <i.chiang@tue.nl>
* Date:         Oct. 30, 2020
* Description:  Draft version of the sample code for AAI lecture of Industrial Design Department, 
                TU/e to demostrate sending interaction  data to Data Foundry by Processing app via 
                OOCSI service
**************************************************************************************************/
import nl.tue.id.oocsi.*;
import nl.tue.id.oocsi.client.services.OOCSICall;
import controlP5.*;

OOCSI oocsi;

// set channel name the same as what is set on the IoT dataset page 
String oocsiChannel = "IoT_Dataset_Upload_Channel_Name";
String uname = "";

ControlP5 cp5;
controlP5.Button col1, col2, col3, stop;
controlP5.Textfield username;

long startTime, lastClickTime;
color rColor, bgColor;
int clicks, cycle;
StringList colorList;
boolean isStart;

void setup() {
  // initiate canvas in mobile resolution
  size(375, 812);
  background(0);
  frameRate(20);
  noStroke();
  
  rColor = color(random(40, 220), random(40, 220), random(40, 220));
  bgColor = 0;
  clicks = 0;
  cycle = 0;
  colorList = new StringList();
  startTime = 0;
  lastClickTime = 0;
  isStart = false;

  // set text style
  PFont pfont = createFont("Arial", 24);
  ControlFont font = new ControlFont(pfont, 24);

  // init ControlerP5
  cp5 = new ControlP5(this);

  // init components
  username = cp5.addTextfield("username")
    .setPosition(37, 75)
    .setSize(300, 40)
    .setFont(font)
    .setId(1);

  col1 = cp5.addButton("red")
    .setPosition(37, 540)
    .setSize(100, 46)
    .setId(2);

  col2 = cp5.addButton("green")
    .setPosition(137, 540)
    .setSize(100, 46)
    .setId(3);

  col3 = cp5.addButton("blue")
    .setPosition(237, 540)
    .setSize(100, 46)
    .setId(4);

  stop = cp5.addButton("stop")
    .setPosition(37, 650)
    .setSize(100, 46)
    .setId(5);

  // set components style to display: textfileds, buttons
  setTextfieldStyle(username, font, "User name");

  setButtonStyle(col1, font, "Red");
  setButtonStyle(col2, font, "Green");
  setButtonStyle(col3, font, "Blue");
  setButtonStyle(stop, font, "Stop");

  // init connection to OOCSI service
  oocsi = new OOCSI(this, "UNIQUE_NAME_HERE", "host.url.here");
  
  submit("start");
}

void draw() {
  background(bgColor);

  // color prompt
  fill(rColor);
  rect(37, 150, 300, 300);

  // explanation
  fill(255);
  text("Which label is closest to the color above?", 37, 520);
  
  // check every 5 seconds
  if (isStart && (millis() / 5000 > cycle)) {
    cycle = millis() / 5000;
    print("\ncycle: " + cycle);
    fetchData();
  } else if (!isStart && millis() > 5000) {
    isStart = true;
    fetchData();
  }
}

// button handlers

public void red() {
  submit("red");
  clicks++;
  colorList.append("red");
}

public void green() {
  submit("green");
  clicks++;
  colorList.append("green");
}

public void blue() {
  submit("blue");
  clicks++;
  colorList.append("blue");
}

public void stop() {
  submit("stop");
  colorList.clear();
  //exit();
}

// log and submit

public void submit(String act) {
  color tempColor = rColor;
  isStart = true;
  
  setUname();

  // current runtime value (millis after program was started)
  long ctime = millis();
  if (startTime == 0) {
    startTime = ctime;
  }

  // set color to black during submission
  rColor = color(0);
  
  // open the comment below for checking the inputs
  print("\nsubmit! \tuser name:" + uname + "\tactivity: " + act
    + "\tmeasure time: " + (ctime - lastClickTime) 
    + "\tcolor choice: " + act + "\tcolor code: " + hex(tempColor));
      
  if (!act.equals("stop")) {
    logIoTData(act, (ctime - lastClickTime), tempColor);
  
    // new random color
    rColor = color(random(40, 220), random(40, 220), random(40, 220));
    lastClickTime = ctime;
  } else {
    logEntityData(ctime);
    
    // reset
    rColor = color(random(40, 220), random(40, 220), random(40, 220));
    lastClickTime = ctime;
    startTime = ctime;
  }
}

// log data /////////////////////////////////////////////////////////////

// to IoT dataset
void logIoTData(String act, long ctime, color tempColor) {
  oocsi
    // required fields
    .channel(oocsiChannel)
    .data("device_id", uname)
    .data("activity", "color classification")
    // optional fields, provide actual data to be stored in the dataset
    .data("time", ctime)
    .data("choice", act)
    .data("color", hex(tempColor))
    // don't forget to send
    .send();
}

// to Entity dataset
void logEntityData(long ctime) {
  float avgTime = (ctime - startTime) / clicks;
  print("\naverage time: " + avgTime);
  String freqColor = countColor();
  print("\npreference color: " + freqColor + "\nDone in " + ctime + "(ms)");

  // 1a: create call
  //     Entity_Dataset_Download_Channel_Name -- the same as what is set for the left "OOCSI STREAM" tab on the Entity 
  //          dataset page
  OOCSICall call1 = oocsi.call("Entity_Dataset_Upoad_Channel_Name", 1500);
  // 1b: add authentication data to call
  //     api-token -- the same as what is get from the "HTTP-POST" tab on Entity dataset page
  //     resoure_id -- user name or anything you want as the identity for this record
  //     token -- password to access this tuple of data
  call1.data("api-token", "API_Token_Here");
  call1.data("resource_id", uname);
  call1.data("token", uname);
  // 1c: add query type: add, get, update, delete
  call1.data("query", "update");
  // 1d: add actual data for entity object
  call1.data("average_time", avgTime);
  call1.data("most_frequent_color", freqColor);
  call1.data("plays", clicks);
  // 2: send out and wait until either there is a response or the timeout has passed
  call1.sendAndWait();
  // 3: check for response
  if (call1.hasResponse()) {
    // 4: get data out of the first response
    String respColor = call1.getFirstResponse().getObject("most_frequent_color").toString();
    print("\nresponse color is " + respColor + " in " + ctime + "\n");
    
    // change background color immediately
    //setBackground(respColor);
  }
}

// get data /////////////////////////////////////////////////////////////

void fetchData() {
  // check user name
  setUname();
  
  // 1a: create call
  //     Entity_Dataset_Download_Channel_Name -- the same as what is set for the right "OOCSI STREAM" tab on the Entity
  //          dataset page. If it's the same as the upload one, then you don't have to set the download channel name on
  //          the page
  OOCSICall call1 = oocsi.call("Entity_Dataset_Download_Channel_Name", 1500);
  // 1b: add authentication data to call
  //     api-token -- the same as what is get from the "HTTP-POST" tab on Entity dataset page
  //     resoure_id -- user name
  //     token -- password to access this tuple of data
  call1.data("api-token", "API_Token_Here");
  call1.data("resource_id", uname);
  call1.data("token", uname);
  // 1c: add query type: add, get, update, delete
  call1.data("query", "get");
  // 2: send out and wait until either there is a response or the timeout has passed
  call1.sendAndWait();
  // 3: check for response
  if (call1.hasResponse()) {
    // 4: get data out of the response
    String respColor = call1.getFirstResponse().has("most_frequent_color")
                       ? call1.getFirstResponse().getString("most_frequent_color")
                       : "";
    
    print("\nbackground color update: " 
        + (respColor.isEmpty() ? "No data now" : respColor + " in " + millis()));
    setBackground(respColor);
    
    // change the color chosen most in the final round
    
  }
}

// process / act data ///////////////////////////////////////////////////

void setBackground(String respColor) {
  switch (respColor) {
      case "GREEN":
        bgColor = color(0,255,0);
        break;
      case "RED":
        bgColor = color(255, 0, 0);
        break;
      case "BLUE":
        bgColor = color(0, 0, 255);
        break;
    }
}

// get the most frequently shown color
String countColor() {
  int reds = 0, blues = 0, greens = 0;
  String prefColor = "";
  
  // counting
  for (String c : colorList) {
    if (c.equals("red")) {
      reds++;
    } else if (c.equals("blue")) {
      blues++;
    } else {
      greens++;
    }
  }
  
  // find max and return
  if (reds >= blues) {
    if (reds >= greens) {
      prefColor = "RED";
    } else {
      prefColor = "GREEN";
    }
  } else if (blues >= greens) {
    prefColor = "BLUE";
  } else {
    prefColor = "GREEN";
  }
  
  print("\nmost frequent color: " + prefColor);
  return prefColor;
}

// set something ///////////////////////////////////////////////////////

// if username is empty, get the user name from the text field -- ONCE.
void setUname() {
  uname = cp5.get(Textfield.class, "username").getText();
  
  // if the text field is empty, random Id!
  if (uname.length() == 0) {
    uname = "rand" + round(random(1000, 20000));
    username.setText(uname);
  }
  
  print("\nusername: " + uname);
}

// set the style for the font
void setTextfieldStyle(controlP5.Textfield tf, ControlFont cf, String txt) {
  tf.getCaptionLabel()
    .setFont(cf)
    .toUpperCase(false)
    .setText(txt);
  tf.getCaptionLabel().getStyle().marginTop = -75;
}

void setButtonStyle(controlP5.Button btn, ControlFont cf, String label) {
  btn.getCaptionLabel()
    .setFont(cf)
    .setSize(24)
    .toUpperCase(false)
    .setText(label);
}
