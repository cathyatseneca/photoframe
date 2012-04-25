/**
 * A list of known javascript functions that can be called
 */
interface JavaScript {
  void getClientSize();
}

/**
 * the global javascript instance
 */
JavaScript javascript;

/**
 * method to bind JavaScript to this sketch
 */
void bindJavaScript(JavaScript js) {
  //println("bound javascript");
  javascript = js;
}
