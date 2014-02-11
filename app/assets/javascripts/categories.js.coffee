$(document).on 'ready page:load', ->
    preview = $('#category-preview')
    class_input = $('#category_html_class')
    update_preview = ->
        preview.attr 'class', 'label ' + class_input.val()
    $('#label-links > a').click (e) ->
        e.preventDefault()
        console.log('link clicked')
        class_input.val $(this).text()
        update_preview()
    $('#category_name').keyup ->
        preview.text $(this).val() or 'Category'
    class_input.keyup ->
        update_preview()
