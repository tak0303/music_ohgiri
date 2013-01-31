_.templateSettings =
  interpolate: /\{\{(.+?)\}\}/g
  evaluate: /\{%(.+?)%\}/g
  escape: /\{%-(.+?)%\}/g

class Ohgiri.Views.YoutubeSearch extends Backbone.View
  initialize: ->
    @songTemplate = _.template $("#search_tmpl").text()
    @loadMoreTemplate = _.template $("#load_more_tmpl").text()

  events:
    'keydown #music_search'  : 'search'
    'click   #load_more'     : 'loadNextPage'

  search: (e) ->
    if e.keyCode == 13
      query = _.escape($(e.target).val())
      return false if query.length == 0
      youtube = new Ohgiri.Collections.Youtube
      $("#search_result").empty()
      _.map(youtube.search(query).toJSON(), (data) => @render(data))
      # add loader to next page
      $("#search_result").append @loadMoreTemplate 'nextPage': 2

  render: (data,nextPage) =>
    $("#search_result").append @songTemplate "data":data

  loadNextPage: (e) ->
    query = $(e.target).parent().parent().find('#music_search').val()
    nextPage = $(e.target).data('next-page')
    _.map((new Ohgiri.Collections.Youtube).search(query, nextPage).toJSON(), (data) => @render(data))
    $(e.target).remove()
    $("#search_result").append @loadMoreTemplate 'nextPage': nextPage+1
