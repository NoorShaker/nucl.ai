$ ->
  $('logo-wrap').addClass("rotated");
  $('content').removeClass("opacity0");

  if $("#splash-composed-background").length == 0 then return;

  $("#splash-composed-background").children().height $("#splash-composed-background").parent().height();
  $(window).resize ->
    $("#splash-composed-background").children().height $("#splash-composed-background").parent().height();

  children = $("#splash-composed-background").find(".img").toArray()
  rotator_size = $("#splash-composed-background").find("div.enaled").length
  rotator = ->

      setTimeout ->
        enabled = rotator_size
        for child in children
          if $(child).hasClass("enabled")
            enabled--
            $(child).removeClass("enabled")
            $(child).addClass("disabled")
          else if enabled < rotator_size
            $(child).addClass("enabled")
            $(child).removeClass("disabled")
            enabled++
        if enabled != rotator_size
          for child in children
            if enabled != rotator_size
              if $(child).hasClass("disabled")
                $(child).addClass("enabled")
                $(child).removeClass("disabled")
                enabled++

        rotator()
      , 7500

  rotator()