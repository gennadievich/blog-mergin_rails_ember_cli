import Ember from 'ember';

export default Ember.Route.extend({
  controllerName: 'ballot',

  beforeModel: function() {
    return this.csrf.fetchToken();
  },

  model: function() {
    return this.store.find('ballot', 1);
  },
  setupController: function(controller, model){
    controller.set('model', model);
  }
});
