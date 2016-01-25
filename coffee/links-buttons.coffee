root = exports ? this # global

## fixes floating button positon

$ ->
    setSize = (section) ->
        section.find("item .button-content").each ->
            button_content = $(@)
            parent_size = button_content.parent().height()
            button_content.height parent_size
            button_content.width parent_size

            button_content.parent().hover(() ->
                parent_size_hover = button_content.parent().height()
                button_content.height parent_size_hover
                button_content.width parent_size_hover
            , () ->
                button_content.height parent_size
                button_content.width parent_size
            )


    $(".links-buttons").each ->
        section = $(@)
        new Thumbnails section.attr('id'), false, true, false
        setSize(section)
        $(window).resize ->
            setSize(section)
