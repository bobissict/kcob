profiles = new Vue(
  el: '#profiles'
  data: profiles: []
  ready: ->
    that = undefined
    that = this
    $.ajax
      url: '/profiles.json'
      success: (res) ->
        that.profiles = res
        return
    return
)

Vue.component 'profile-row',
  template: '#profile-row'
  props:
    profile: Object
