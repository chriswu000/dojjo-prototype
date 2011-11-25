// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $("#entry_entry_date").datepicker({ dateFormat: 'M dd, yy' });
});

$(function() {
  $("#item_tag_list").tokenInput("/items/tag_list.json", {
    prePopulate: $("#item_tag_list").data("pre"),
    theme: "facebook",
    searchDelay: 0
  });
});


$(function() {
  $("#entry_tag_list").tokenInput("/entries/tag_list.json", {
    prePopulate: $("#entry_tag_list").data("pre"),
    theme: "facebook",
    searchDelay: 0
  });
});
