# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
    ((el) ->
        return unless el? and el.length > 0
        #url = el.data('url')
        placeholder = el.data('placeholder')
        #saved = el.data('saved')
        el.select2
            width: '100%'
            #multiple: true
            #minimumInputLength: 1
            placeholder: placeholder
            allowClear: true
            containerCssClass: 'form-group'
            #ajax:
            #    url: url,
            #    dataType: 'json',
            #    quietMillis: 500,
            #    data: (term) ->
            #        q: term
            #    results: (data) ->
            #        results: data
            #formatResult: (item, page) ->
            #    item.name
            #formatSelection: (item, page) ->
            #    item.name
            #initSelection: (element, callback) ->
            #    callback saved if saved

    ) $('#post_category_ids')
    #$('input[type="submit"]').click (e) ->
    #    regex = /^\[[\d,]*\],([\d,]+)$/
    #    input = $('#post_category_ids')
    #    id = input.id()
    #    val = input.val()
    #    if regex.test val
    #        input.remove()
    #        parsed = val.replace regex, "[$1]" #regex.exec(val)[1].split(',')
    #        data = []
    #        for id in parsed
    #            data.push parseInt(id)
    #        input.val parsed
    #        alert input.val()
    $('.archive-year').on 'click', (e) ->
        e.preventDefault()
        $(this).toggleClass('open')
