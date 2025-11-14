<template>
  <div class="sitemap-page">
    <Banner title="Sitemap" subtitle="Navigate Our Website" />

    <section class="section">
      <div class="container">
        <div class="policy-content">
          <p>Welcome to the sitemap of Softworld. This page provides an overview of all the pages available on our website to help you navigate through our content easily.</p>

          <div class="sitemap-grid">
            <div class="sitemap-section">
              <h2>Main Pages</h2>
              <ul class="sitemap-links">
                <li><router-link to="/">Home</router-link></li>
                <li><router-link to="/about">About Us</router-link></li>
                <li><router-link to="/contact">Contact Us</router-link></li>
              </ul>
            </div>

            <div class="sitemap-section">
              <h2>Services</h2>
              <ul class="sitemap-links">
                <li><router-link to="/services/consulting">Tech Consulting</router-link></li>
                <li><router-link to="/services/talent">Talent Sourcing</router-link></li>
                <li><router-link to="/services/development">Custom Development</router-link></li>
                <li><router-link to="/services/digital">Digital Transformation</router-link></li>
              </ul>
            </div>

            <div class="sitemap-section">
              <h2>Resources</h2>
              <ul class="sitemap-links">
                <li><router-link to="/blogs">Blog</router-link></li>
                <li><router-link to="/case-studies">Case Studies</router-link></li>
                <li><router-link to="/resources/guides">Guides & Ebooks</router-link></li>
                <li><router-link to="/events">Events</router-link></li>
              </ul>
            </div>

            <div class="sitemap-section">
              <h2>Careers</h2>
              <ul class="sitemap-links">
                <li><router-link to="/find-talent">Find Talent</router-link></li>
                <li><router-link to="/find-job">Find Job</router-link></li>
                <li><router-link to="/careers">Careers at Softworld</router-link></li>
                <li><router-link to="/team">Our Team</router-link></li>
              </ul>
            </div>

            <div class="sitemap-section">
              <h2>Legal Information</h2>
              <ul class="sitemap-links">
                <li><router-link to="/privacy">Privacy Policy</router-link></li>
                <li><router-link to="/terms">Terms of Service</router-link></li>
                <li><router-link to="/cookies">Cookie Policy</router-link></li>
              </ul>
            </div>
          </div>

          <p class="sitemap-note">If you can't find what you're looking for, please <router-link to="/contact">contact us</router-link> and we'll be happy to assist you.</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import Banner from '@/components/common/Banner.vue';

export default {
  name: 'SitemapPage',
  components: {
    Banner
  }
}
</script>

<style>
.sitemap-page {
  padding-bottom: calc(var(--space-unit) * 12);
}

.policy-content {
  max-width: 1000px;
  margin: 0 auto;
}

.policy-content > p {
  margin-bottom: calc(var(--space-unit) * 4);
  color: #666666;
  line-height: 1.6;
  text-align: center;
}

.sitemap-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: calc(var(--space-unit) * 6);
  margin: calc(var(--space-unit) * 8) 0;
}

.sitemap-section h2 {
  font-size: 1.6rem;
  margin-bottom: calc(var(--space-unit) * 3);
  color: var(--color-dark);
  font-weight: 700;
  padding-bottom: calc(var(--space-unit) * 1);
  border-bottom: 2px solid var(--color-accent);
}

.sitemap-links {
  list-style: none;
  padding: 0;
}

.sitemap-links li {
  margin-bottom: calc(var(--space-unit) * 2);
}

.sitemap-links a {
  color: var(--color-accent);
  text-decoration: none;
  transition: all var(--transition-standard);
  display: block;
  font-size: 1.1rem;
}

.sitemap-links a:hover {
  color: var(--color-gray-60);
  transform: translateX(calc(var(--space-unit) * 1));
}

.sitemap-note {
  margin-top: calc(var(--space-unit) * 8);
  padding: calc(var(--space-unit) * 3);
  background-color: rgba(var(--color-accent-rgb), 0.05);
  border-radius: 8px;
  text-align: center;
}

.sitemap-note a {
  color: var(--color-accent);
  text-decoration: none;
  font-weight: 600;
}

.sitemap-note a:hover {
  color: var(--color-primary);
  text-decoration: underline;
}

@media (max-width: 768px) {
  .sitemap-grid {
    grid-template-columns: 1fr;
    gap: calc(var(--space-unit) * 4);
  }
}
</style>