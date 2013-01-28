_.templateSettings =
  interpolate: /\{\{(.+?)\}\}/g
  evaluate: /\{%(.+?)%\}/g
  escape: /\{%-(.+?)%\}/g

class Ohgiri.Views.YoutubeSearch extends Backbone.View
  initialize: ->
    @template = _.template $("#search_tmpl").text()

  events:
    'keydown #music_search': 'search'

  search: (e) ->
    if e.keyCode == 13
      query = _.escape($(e.target).val())
      return false if query.length == 0
      youtube = new Ohgiri.Collections.Youtube
      _.map(youtube.search(query).toJSON(), (data) => @render(data))

  render: (data) =>
    $("#search_result").append @template "data":data