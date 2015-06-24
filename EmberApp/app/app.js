import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver
});

loadInitializers(App, config.modulePrefix);

// Rails CSRF
loadInitializers(App, 'rails-csrf');
import { setCsrfUrl } from 'rails-csrf/config';
setCsrfUrl('api/v1/csrf');


export default App;
