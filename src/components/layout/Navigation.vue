<!-- src/components/layout/Navigation.vue -->
<template>
  <nav class="navigation">
    <button class="mobile-menu-button" @click="isMenuOpen = !isMenuOpen">
      <span class="sr-only">Menu</span>
      <i class="menu-icon"></i>
    </button>

    <ul class="nav-links" :class="{ 'is-open': isMenuOpen }">
      <li v-for="link in navLinks" :key="link.path">
        <router-link :to="link.path" @click="isMenuOpen = false">{{ link.name }}</router-link>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  name: 'Navigation',
  data() {
    return {
      isMenuOpen: false,
      navLinks: [
        { name: 'Home', path: '/' },
        { name: 'About Us', path: '/about' },
        { name: 'Blogs', path: '/blogs' },
        { name: 'Find a Talent', path: '/find-talent' },
        { name: 'Find a Job', path: '/find-job' },
        { name: 'Contact Us', path: '/contact' }
      ]
    }
  }
}
</script>

<style scoped>
.navigation {
  position: relative;
}

.nav-links {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: 1.5rem;
}

.nav-links a {
  color: white;
  text-decoration: none;
  padding: 0.5rem 0;
  transition: color 0.2s ease;
  font-weight: 500;
}

.nav-links a:hover {
  color: var(--color-accent);
}

.nav-links a.router-link-active {
  color: var(--color-accent);
  border-bottom: 2px solid var(--color-accent);
}

.mobile-menu-button {
  display: none;
}

@media (max-width: 768px) {
  .mobile-menu-button {
    display: block;
    background: none;
    border: none;
    color: white;
    font-size: 1.5rem;
    cursor: pointer;
    position: relative;
    z-index: 110;
    padding: 0.5rem;
  }

  .menu-icon {
    display: block;
    width: 25px;
    height: 3px;
    background-color: white;
    position: relative;
  }

  .menu-icon::before,
  .menu-icon::after {
    content: '';
    position: absolute;
    width: 25px;
    height: 3px;
    background-color: white;
    transition: all 0.3s ease;
  }

  .menu-icon::before {
    transform: translateY(-8px);
  }

  .menu-icon::after {
    transform: translateY(8px);
  }

  .nav-links {
    position: fixed;
    top: 0;
    right: -100%;
    width: 80%;
    max-width: 300px;
    height: 100vh;
    background-color: var(--color-primary);
    flex-direction: column;
    padding: 5rem 2rem 2rem;
    transition: right 0.3s ease;
    z-index: 100;
  }

  .nav-links.is-open {
    right: 0;
  }

  .sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border-width: 0;
  }
}
</style>