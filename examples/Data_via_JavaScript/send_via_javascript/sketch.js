var input1, button;

function setup() {
  createCanvas(400, 400);
  background(220);

  inputbox = select("#textinput");
  inputbox.position(20, 30);
  inputbox.size(350, 250);

  button = createButton("submit");
  button.position(290, 330);

  // change the "sendOOCSI" in the following line
  // with "sendOOCSI_wws" to send in a different way
  button.mousePressed(sendOOCSI);
}

function sendOOCSI() {
  var data = {text_input: inputbox.value()}
  var jsonBody = {
      activity: 'ACTIVITY',
      source_id: 'DEVICE_ID',
      data: JSON.stringify(data)
  }

  fetch('URL_WITH_TOKEN', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      headers: {
              'Content-Type': 'application/json'
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(jsonBody)
  });
  inputbox.value("");
}

function sendOOCSI_wws() {
  OOCSI.connect('wss://DOMAIN_SERVER/ws');
  OOCSI.send("CHANNEL_NAME_HERE",
            {"device_id": "DEVICE_ID_HERE",
            "text_input": MAYBE_A_VARIABLE}
  );
   inputbox.value("");
}
