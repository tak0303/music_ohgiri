class Ohgiri.Views.YoutubeSearch extends Backbone.View

  initialize: ->

  events:
    'keydown #music_search': 'search'

  search: (e) ->
    if e.keyCode == 13
      query = _.escape($(e.target).val())
      return false if query.length == 0
      result = (new Ohgiri.Collections.Youtube).search query
      console.log result
      # return false if result.length == 0
      for i in result
        console.log i
        console.log result result[i]