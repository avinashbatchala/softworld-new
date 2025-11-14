<template>
  <div class="about-page">
    <!-- TE-inspired minimalist header -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">About Us</div>
        <h1>Your Technology <span class="accent-text">Partner</span></h1>
        <p>We combine technical expertise with strategic thinking to deliver solutions that drive business growth.</p>
        <div class="button-group">
          <router-link to="/services" class="btn btn-primary">Our Services</router-link>
          <router-link to="/contact" class="btn btn-secondary">Contact Us</router-link>
        </div>
      </div>
    </section>

    <!-- Our Story Section with mechanical precision -->
    <section class="story-section section">
      <div class="container">
        <div class="section-header">
          <div class="te-label">Our Journey</div>
          <h2>The Story <span class="accent-text">Behind Us</span></h2>
        </div>
        <div class="story-grid">
          <div class="story-content">
            <p class="story-text">Founded with a vision to bridge the gap between businesses and technology talent, we've grown from a small team of passionate specialists to an industry-leading consultancy.</p>
            <p class="story-text">Our approach combines technical expertise with deep industry knowledge, allowing us to deliver solutions that drive real business impact.</p>
            <div class="story-highlight">
              <div class="highlight-icon">★</div>
              <p>We believe in building lasting partnerships with our clients, understanding their unique challenges, and delivering solutions that exceed expectations.</p>
            </div>
          </div>
          <div class="story-image">
            <img src="@/assets/media/pages/about/team.png" alt="Our team working together">
          </div>
        </div>
      </div>
    </section>

    <!-- Vision and Goals Section -->
    <section class="vision-section section">
      <div class="container">
        <div class="section-header">
          <div class="te-label">Looking Forward</div>
          <h2>Our Vision & <span class="accent-text">Goals</span></h2>
        </div>
        <div class="vision-grid">
          <div class="vision-content">
            <h3>Our Vision</h3>
            <p>To become the industry standard for technology excellence, empowering businesses to achieve digital transformation with confidence and clarity.</p>
            <div class="vision-highlight">
              <div class="highlight-icon">⟶</div>
              <p>We envision a future where technology is an enabler for all organizations, regardless of size or industry.</p>
            </div>
          </div>
          <div class="goals-content">
            <h3>Strategic Goals</h3>
            <ul class="goals-list">
              <li class="goal-item">
                <span class="goal-marker">01</span>
                <p>Expand our talent network to 2,000+ specialists across emerging technologies</p>
              </li>
              <li class="goal-item">
                <span class="goal-marker">02</span>
                <p>Pioneer innovative staffing models that adapt to evolving business needs</p>
              </li>
              <li class="goal-item">
                <span class="goal-marker">03</span>
                <p>Establish technology partnerships that offer clients exclusive access to cutting-edge solutions</p>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- Values Section with TE-inspired cards -->
    <section class="values-section section section-light">
      <div class="container">
        <div class="section-header">
          <div class="te-label">What Drives Us</div>
          <h2>Our Core <span class="accent-text">Values</span></h2>
        </div>
        <div class="values-grid">
          <div class="te-value-card">
            <div class="value-number">01</div>
            <h3>Excellence</h3>
            <p>We are committed to delivering exceptional quality in everything we do, pushing boundaries and exceeding expectations.</p>
          </div>
          <div class="te-value-card">
            <div class="value-number">02</div>
            <h3>Innovation</h3>
            <p>We embrace new technologies and approaches, constantly seeking better ways to solve complex problems.</p>
          </div>
          <div class="te-value-card">
            <div class="value-number">03</div>
            <h3>Collaboration</h3>
            <p>We believe in the power of teamwork, bringing together diverse perspectives to create comprehensive solutions.</p>
          </div>
          <div class="te-value-card">
            <div class="value-number">04</div>
            <h3>Integrity</h3>
            <p>We operate with transparency and honesty, building trust through our actions and commitments.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Section with TE-inspired cards -->
    <section class="about-stats-section section section-light">
      <div class="container">
        <div class="stats-grid">
          <div class="stat-card">
            <span class="stat-number">500+</span>
            <span class="stat-label">Clients Worldwide</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">92%</span>
            <span class="stat-label">Client Retention</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">1,200+</span>
            <span class="stat-label">Tech Experts</span>
          </div>
          <div class="stat-card">
            <span class="stat-number">10+</span>
            <span class="stat-label">Years of Excellence</span>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section with TE-inspired minimalism -->
    <section class="join-cta-section section">
      <div class="container">
        <div class="cta-module">
          <h2>Join Our Growing Team</h2>
          <p>We're always on the lookout for talented individuals who are passionate about technology and innovation</p>
          <router-link to="/careers" class="btn-highlight">
            <span class="btn-icon">→</span>
            View Open Positions
          </router-link>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import '@/assets/styles/pages/AboutPage.css'

export default {
  name: 'AboutPage'
}
</script>