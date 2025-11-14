<template>
  <header class="header" :class="{ 'scrolled': isScrolled }">
    <div class="container">
      <div class="logo">
        <router-link to="/">
          <div class="logo-mark">ST</div>
          <span class="logo-text">SmoothTech</span>
        </router-link>
      </div>

      <nav class="nav-menu" :class="{ 'active': isMenuOpen }">
        <router-link to="/about" class="nav-link" @click="closeMenu">About</router-link>
        <router-link to="/blogs" class="nav-link" @click="closeMenu">Blog</router-link>
        <router-link to="/find-talent" class="nav-link" @click="closeMenu">Find Talent</router-link>
        <router-link to="/find-job" class="nav-link" @click="closeMenu">Find Job</router-link>
        <router-link to="/contact" class="nav-link" @click="closeMenu">Contact</router-link>
      </nav>

      <div class="header-actions">
        <router-link to="/get-started" class="btn btn-primary btn-sm">Get Started</router-link>
      </div>

      <button class="mobile-menu-button" @click="toggleMenu">
        <span class="menu-icon" :class="{ 'active': isMenuOpen }"></span>
      </button>
    </div>
  </header>
</template>

<script>
export default {
  name: 'AppHeader',
  data() {
    return {
      isScrolled: false,
      isMenuOpen: false
    }
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      this.isScrolled = window.scrollY > 50;
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
      document.body.classList.toggle('menu-open', this.isMenuOpen);
    },
    closeMenu() {
      if (this.isMenuOpen) {
        this.isMenuOpen = false;
        document.body.classList.remove('menu-open');
      }
    }
  }
}
</script>

<style>
@import '../../assets/styles/components/AppHeader.css';
</style>