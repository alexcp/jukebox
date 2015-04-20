$('.collapse').on('shown.bs.collapse', ()->
  $(this).prev().find(".glyphicon-chevron-right").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-down")
).on 'hidden.bs.collapse', () ->
  $(this).prev().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-right")
