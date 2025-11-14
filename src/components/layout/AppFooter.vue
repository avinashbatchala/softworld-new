<template>
  <footer class="footer">
    <div class="footer-top">
      <div class="container">
        <div class="newsletter-section">
          <h3>Stay updated with our latest news</h3>
          <p>Join our newsletter to receive the latest updates and insights</p>
          <div class="newsletter-form">
            <input type="email" placeholder="Enter your email" aria-label="Email for newsletter">
            <button class="btn btn-accent">Subscribe</button>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="footer-grid">
        <div class="footer-section brand-section">
          <div class="footer-logo">
            <div class="logo-mark">ST</div>
            <span class="logo-text">Softworld</span>
          </div>
          <p class="tagline">Your partner in innovative technology solutions that inspire and transform businesses.</p>
          <div class="social-icons">
            <a href="#" aria-label="LinkedIn" class="social-icon">
              <span class="icon">in</span>
            </a>
            <a href="#" aria-label="Twitter" class="social-icon">
              <span class="icon">𝕏</span>
            </a>
            <a href="#" aria-label="GitHub" class="social-icon">
              <span class="icon">gh</span>
            </a>
            <a href="#" aria-label="Instagram" class="social-icon">
              <span class="icon">ig</span>
            </a>
          </div>
        </div>

        <div class="footer-section">
          <h4>Company</h4>
          <ul class="footer-links">
            <li><router-link to="/about">About Us</router-link></li>
            <li><router-link to="/team">Our Team</router-link></li>
            <li><router-link to="/careers">Careers</router-link></li>
            <li><router-link to="/contact">Contact</router-link></li>
          </ul>
        </div>

        <div class="footer-section">
          <h4>Services</h4>
          <ul class="footer-links">
            <li><router-link to="/services/consulting">Tech Consulting</router-link></li>
            <li><router-link to="/services/talent">Talent Sourcing</router-link></li>
            <li><router-link to="/services/development">Custom Development</router-link></li>
            <li><router-link to="/services/digital">Digital Transformation</router-link></li>
          </ul>
        </div>

        <div class="footer-section">
          <h4>Resources</h4>
          <ul class="footer-links">
            <li><router-link to="/blog">Blog</router-link></li>
            <li><router-link to="/case-studies">Case Studies</router-link></li>
            <li><router-link to="/resources/guides">Guides & Ebooks</router-link></li>
            <li><router-link to="/events">Events</router-link></li>
          </ul>
        </div>

        <div class="footer-section">
          <h4>Contact Us</h4>
          <address>
            <p class="contact-line">
              <span class="contact-icon">📍</span>
              60 Swackhammer Way<br>Budd Lake, NJ 07828
            </p>
            <p class="contact-line">
              <span class="contact-icon">✉️</span>
              <a href="mailto:info@Softworld.com">info@Softworld.com</a>
            </p>
            <p class="contact-line">
              <span class="contact-icon">📞</span>
              <a href="tel:+14155550123">(415) 555-0123</a>
            </p>
          </address>
        </div>
      </div>

      <div class="footer-bottom">
        <p class="copyright">&copy; {{ new Date().getFullYear() }} Softworld. All rights reserved.</p>
        <div class="meta-links">
          <router-link to="/privacy">Privacy Policy</router-link>
          <router-link to="/terms">Terms of Service</router-link>
          <router-link to="/cookies">Cookie Policy</router-link>
          <router-link to="/sitemap">Sitemap</router-link>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'AppFooter'
}
</script>

<style>
@import '../../assets/styles/components/AppFooter.css';
</style>