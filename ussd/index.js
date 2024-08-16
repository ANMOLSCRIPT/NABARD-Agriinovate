const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
const port = 3000 

app.post('/ussd', (req, res) => {
    // Read the variables sent via POST from our API
    const {
        sessionId,
        serviceCode,
        phoneNumber,
        text,
    } = req.body;

    let response = '';

    if (text == '') {
        // This is the first request. Note how we start the response with CON
        response = `CON 
        1. English
        2. Hindi`;
    } else if ( text == '1') {
        // Business logic for first level response
        response = `CON Select any One of the following
        1. Weather
        2. Crop Price
        3. Agriculture News
        4. Negotiation Advisory`;
    } else if ( text == '2') {
        // Business logic for first level response
        // This is a terminal request. Note how we start the response with END

        response = `CON निम्नलिखित में से कोई एक विकल्प चुनें:
        1. मौसम
        2. फसल के दाम
        3. कृषि समाचार
        4. परामर्श सलाह`;
    } else if ( text == '1*1') {
        // This is a second level response where the user selected 1 in the first instance
        
        // This is a terminal request. Note how we start the response with END
        response = `END Today whether is`;
    } else if ( text == '1*2') {
        // This is a second level response where the user selected 1 in the first instance
        
        // This is a terminal request. Note how we start the response with END
        response = `CON Select your region
        1. North
        2. South
        3. East
        4. West`;
    } else if(text == '1*2*1'){
        response = `CON Select Your crop
        1. Rice
        2. Wheat
        3. Sugarcane
        4. Potato`;
    } else if(text == '1*2*1*1'){
        response=`END Rice price is ...`
    }

    // Send the response back to the API
    res.set('Content-Type: text/plain');
    res.send(response);
});


app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
  });
