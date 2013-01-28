class Ohgiri.Collections.Youtube extends Backbone.Collection
  search: (query) ->
    @fetch
      async: false
      url: "/youtube/search/#{query}.json"
      error: (e) ->
        alert 'error'
    @