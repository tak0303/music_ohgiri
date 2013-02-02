class Ohgiri.Views.AddSongs extends Backbone.View

  events:
    'click .add_song'   : 'addSong'
    'click .remove_song': 'removeSong'

  addSong: (e) ->
    target =  $(e.target)
    clone    = target.parent().clone()
    video_id = target.parent().data('video-id')
    topic_id = target.parent().data('topic-id')
    clone.find('.add_song')
         .removeClass('add_song')
         .addClass('remove_song')
         .attr('value','remove')
    $("#songs_list").append clone
    @saveToList topic_id, video_id

  removeSong: (e) ->
    target =  $(e.target)
    video_id = target.parent().data('video-id')
    topic_id = target.parent().data('topic-id')
    @removeFromList topic_id, video_id
    target.parent().remove()


  saveToList: (topic_id, video_id) ->
    $.ajax
      url: "/playlist/#{topic_id}/add/#{video_id}.json"
      type: 'get'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert 'error'
      success: (data) ->
        console.log data

  removeFromList: (topic_id, video_id) ->
    $.ajax
      url: "/playlist/#{topic_id}/remove/#{video_id}.json"
      type: 'get'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        alert 'error'
      success: (data) ->
        console.log data