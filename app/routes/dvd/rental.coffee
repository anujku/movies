`import Ember from 'ember';`
`import Ajax from '../../mixins/ajax';`

RentalRoute = Ember.Route.extend(Ajax,
  model: ->
    Ember.RSVP.all([
      @_ajax
        type: 'GET'
        url: 'http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/current_releases.json?apikey='
        dataType: 'jsonp'
        done: (data) ->
          data
        fail: (data) ->
          console.log "It does not do well to dwell on failure"
    ]).then (results) ->
      movies: results[0]['movies']
)

`export default RentalRoute;`



