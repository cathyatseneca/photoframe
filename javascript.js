// javascript reference to our sketch
var pjs = undefined;
var bound = false;

// bind JS to the p5 sketch for two way communication
function bindJavaScript() {
  if(Processing) { pjs = Processing.getInstanceById("photoframe"); }
  if (pjs !== undefined && pjs.bindJavaScript !== undefined) {
    pjs.bindJavaScript(this);
    bound = true; }
  if(!bound) setTimeout(bindJavaScript, 250);
}

// schedule binding
bindJavaScript();

function getClientSize() {
  var pjs=Processing.getInstanceById("photoframe");
  pjs.pageWidth=window.innerWidth;
  pjs.pageHeight=window.innerHeight;
}

// THIS IS CUSTOM CODE SO THAT WE CAN LISTEN TO PRELOAD PROGRESS
var preloadCount=1000000,
    preloadsLeft=0,
    percentage = 0;

window.setPreloadsLeft = function(count) {
  if(preloadCount==1000000) { preloadCount = count; }
  preloadsLeft = count;
  percentage = 1000*(1 - (preloadsLeft/preloadCount));
  percentage = (percentage | 0)/10;
  document.getElementById('percentage').innerHTML = percentage;
}

window.imagePreloaded = function(text, remaining) {
  document.getElementById("latest").innerHTML = text + " ("+remaining+" remaining)";
}

window.onPreloadComplete = function() {
  var div = document.getElementById('canvastext');
  div.style.display = "none";
  loadMovie("first");
}
// THIS IS CUSTOM CODE SO THAT WE CAN LISTEN TO PRELOAD PROGRESS
