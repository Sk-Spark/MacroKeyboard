const {SerialPort} = require('serialport')

SerialPort.list()
.then((data) => {
  data.forEach((port) => {
    console.log(port.path);
  });
})
.catch(err => console.log(err));