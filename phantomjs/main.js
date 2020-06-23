var page = require('webpage').create();

var isFinished = false
var frameCounter = 0;

page.viewportSize = {
    width: 1920,
    height: 1080
};

page.onConsoleMessage = function (msg) {
    console.log(msg);
};

page.onAlert = function (msg) {
    console.log('ALERT: ' + msg);
    if (msg == "render") {
        frameCounter++
        page.render('frames/frame' + frameCounter + '.png');
        page.evaluate(function () {
            $(document).ready(function () {
                snakeModule.nextFrame();
            })
        });
    }
    if (msg == "finished") {
        phantom.exit();
    }
};

page.open('index.html', function (status) {
    console.log("Status: " + status);
    if (status === "success") {
        page.evaluate(function () {
            $(document).ready(function () {
                snakeModule.nextFrame();
            })
        });
    }
});