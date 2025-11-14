<!-- src/App.vue -->
<template>
  <div class="app">
    <app-header />
    <main>
      <router-view v-slot="{ Component }">
        <transition name="fade" mode="out-in">
          <component :is="Component" />
        </transition>
      </router-view>
    </main>
    <app-footer />
  </div>
</template>

<script>
import AppHeader from './components/layout/AppHeader.vue'
import AppFooter from './components/layout/AppFooter.vue'
import './assets/styles/variables.css';
import './assets/main.css';
import '@fortawesome/fontawesome-free/css/all.css'

export default {
  name: 'App',
  components: {
    AppHeader,
    AppFooter
  }
}
</script>
