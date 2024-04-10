const { exec } = require('child_process');

// Specify the path to your AHK script
const ahkScriptPath = './tst.ahk';

// Execute the AHK script
exec(`AutoHotkey.exe "${ahkScriptPath}"`, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing AHK script: ${error}`);
    return;
  }
  console.log('AHK script executed successfully!');
});