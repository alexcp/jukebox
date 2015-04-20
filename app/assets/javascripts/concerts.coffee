$(document).on 'shown.bs.collapse', ".collapse", ()->
  $(this).prev().find(".glyphicon-chevron-right").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-down")
$(document).on 'hidden.bs.collapse', ".collapse", () ->
  $(this).prev().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-right")
