class Ohgiri.Routers.Router extends Backbone.Router
  routes:
    "" : "index"

  index: ->
    searchView = new Ohgiri.Views.YoutubeSearch {el: ".container"}