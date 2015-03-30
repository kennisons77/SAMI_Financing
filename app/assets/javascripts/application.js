// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require jquery.calculation
//= require responsive-tables
//= require_tree  .


$(function(){ $(document).foundation(); });

  $(document).ready(
    function (){
      // update the plug-in version
      //$("#idPluginVersion").text($.Calculation.version);
      
      
 
      // bind the recalc function to the quantity fields
      $("input[name^=qty_item_]").bind("keyup", recalc);
      // run the calculation function now
      recalc();

      // automatically update the "#totalSum" field every time
      // the values are changes via the keyup event
      var arrayLength = borrowers_ar.length;
      for (var i = 0; i < arrayLength; i++) 
      {
        var n = "agreement["+borrowers_ar[i];
        $("input[name^='"+n+"']").sum("keyup", "#total_"+borrowers_ar[i]);
      }
      $("input[name^='agreement']").sum("keyup", "#totalSum");
      // this calculates the sum for some text nodes
      // $("#idTotalSum").click(
        // function (){
          // // get the sum of the elements
          // var sum = $(".textSum").sum();
// 
          // // update the total
          // $("#totalTextSum").text("$" + numberFormat(sum.toFixed(2),',').toString());
        // }
      // );

      // // this calculates the average for some text nodes
      // $("#idTotalTextAvg").click(
        // function (){
          // // get the average of the elements
          // var avg = $(".textAvg").avg();
// 
          // // update the total
          // $("#totalTextAvg").text(avg.toString());
        // }
      // );
    }
  );
  
  function recalc(){
    $("[id^=total_item]").calc(
      // the equation to use for the calculation
      "qty * price",
      // define the variables used in the equation, these can be a jQuery object
      {
        qty: $("input[name^=qty_item_]"),
        price: $("[id^=price_item_]")
      },
      // define the formatting callback, the results of the calculation are passed to this function
      function (s){
        // return the number as a dollar amount
        return "$" +  numberFormat(s.toFixed(2),',');
      },
      // define the finish callback, this runs after the calculation has been complete
      function ($this){
        // sum the total of the $("[id^=total_item]") selector
        var sum = $this.sum();
        
        $("#totalSum").text(
          // round the results to 2 digits
          "$" + numberFormat(sum.toFixed(2),',')
        );
      }
    );
  }
function numberFormat(_number, _sep) {
    _number = typeof _number != "undefined" && _number > 0 ? _number : "";
    _number = _number.replace(new RegExp("^(\\d{" + (_number.length%3? _number.length%3:0) + "})(\\d{3})", "g"), "$1 $2").replace(/(\d{3})+?/gi, "$1 ").trim();
    if(typeof _sep != "undefined" && _sep != " ") {
        _number = _number.replace(/\s/g, _sep);
    }
    return _number;
}