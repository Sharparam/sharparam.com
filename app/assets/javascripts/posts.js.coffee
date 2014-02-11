# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
    ((el) ->
        return unless el? and el.length > 0
        url = el.data('url')
        placeholder = el.data('placeholder')
        saved = el.data('saved')
        el.select2
            width: '100%'
            multiple: true
            minimumInputLength: 1
            placeholder: placeholder
            allowClear: true
            containerCssClass: 'form-group'
            ajax:
                url: url,
                dataType: 'json',
                quietMillis: 500,
                data: (term) ->
                    q: term
                results: (data) ->
                    results: data
            formatResult: (item, page) ->
                item.name
            formatSelection: (item, page) ->
                item.name
            initSelection: (element, callback) ->
                callback saved if saved

    ) $('#post_category_ids')
    $('#debug-select2-button').click (e) ->
        alert($('#post_category_ids').val())
    $('.archive-year').on 'click', (e) ->
        e.preventDefault()
        $(this).toggleClass('open')
