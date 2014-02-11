$(document).on 'ready page:load', ->
    preview = $('#category-preview')
    $('#category-name-input').keyup ->
        preview.text $(this).val() or 'Category'
    $('#category-class-input').keyup ->
        preview.attr 'class', 'label ' + $(this).val()
