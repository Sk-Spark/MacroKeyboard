const {SerialPort} = require('serialport');

// Function to send data and check for response
function sendDataAndCheckResponse(port, dataToSend, expectedResponse, callback) {
  const parser = port.pipe(new SerialPort.parsers.Readline({ delimiter: '\r\n' }));
  
  port.write(dataToSend, (err) => {
    if (err) {
      console.error('Error writing data:', err.message);
      callback(err, null);
    }
  });

  parser.on('data', (data) => {
    console.log(`Received data from ${port.path}: ${data}`);
    if (data.includes(expectedResponse)) {
      callback(null, port);
    }
  });
}

// List all available COM ports
SerialPort.list().then((ports) => {
  console.log('Available COM ports:');
  ports.forEach((portInfo) => {
    if(!portInfo.path)
        return;
    console.log(`- ${portInfo.path} (${portInfo.manufacturer || 'Unknown Manufacturer'})`);
  });
  ports.forEach((portInfo) => {
    
    console.log(`- ${portInfo.path} (${portInfo.manufacturer || 'Unknown Manufacturer'})`);

    try {
      // Connect to the COM port and send 'AT'
      const port = new SerialPort(portInfo.path, { baudRate: 9600 });
      port.on('open', () => {
        console.log(port)
        console.log(`Connected to ${port.path}. Sending 'AT' command...`);
        sendDataAndCheckResponse(port, 'AT\r\n', 'mx', (err, connectedPort) => {
          if (err) {
            console.error('Error sending data or checking response:', err.message);
          } else if (connectedPort) {
            console.log(`Connected to ${connectedPort.path} successfully.`);
            // Additional operations can be performed on the connected port here
          } else {
            console.log(`No 'mx' response from ${port.path}. Disconnecting...`);
            port.close((err) => {
              if (err) {
                console.error('Error closing port:', err.message);
              } else {
                console.log(`Disconnected from ${port.path}.`);
              }
            });
          }
        });
      });
    } catch (err) {
      console.error('Error connecting to COM port:', err.message);
    }

    port.on('error', (err) => {
      console.error(`Error on ${port.path}:`, err.message);
    });
  });
}).catch((err) => {
  console.error('Error listing COM ports:', err.message);
});
