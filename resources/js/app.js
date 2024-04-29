/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

//importando e configurando o vuex
import { createStore } from 'vuex';

import './bootstrap';
import { createApp } from 'vue';
import App from './App.vue';
import ExampleComponent from './Components/ExampleComponent.vue';
import Login from './Components/Login.vue';
import Home from './Components/Home.vue';
import Marcas from './Components/Marcas.vue';
import InputContainer from './Components/InputContainer.vue';
import TableComponent from './Components/TableComponent.vue';
import CardComponent from './Components/CardComponent.vue';
import ModalComponent from './Components/ModalComponent.vue';
import AlertComponent from './Components/AlertComponent.vue';
import PaginateComponent from './Components/PaginateComponent.vue';



/**
 * Next, we will create a fresh Vue application instance. You may then begin
 * registering components with the application instance so they are ready
 * to use in your application's views. An example is included for you.
 */
const app = createApp(App);
app.config.globalProperties.$filters = {
    formataDataTempo(d) {
      if (!d) return '';
  
      const [data, tempo] = d.split('T');
      const dataFormatada = data.split('-').reverse().join('/');
      const horaFormatada = tempo.split('.')[0];
  
      return `${dataFormatada} às ${horaFormatada}`;
    }
  };

const app = createApp({});
const store = createStore({ // Crie a store Vuex
    state() {
        return {
            item: {},
            transacao: {status: '', mensagem: '', dados: ''},

        };
    }
});


app.component('example-component', ExampleComponent);
app.component('login', Login);
app.component('home', Home);
app.component('marcas', Marcas);
app.component('input-container', InputContainer);
app.component('table-component', TableComponent);
app.component('card-component', CardComponent);
app.component('modal-component', ModalComponent);
app.component('alert-component', AlertComponent);
app.component('paginate-component', PaginateComponent);


/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// Object.entries(import.meta.glob('./**/*.vue', { eager: true })).forEach(([path, definition]) => {
//     app.component(path.split('/').pop().replace(/\.\w+$/, ''), definition.default);
// });

/**
 * Finally, we will attach the application instance to a HTML element with
 * an "id" attribute of "app". This element is included with the "auth"
 * scaffolding. Otherwise, you will need to add an element yourself.
 */



// Use o store na instância da aplicação
app.use(store);
app.mount('#app');