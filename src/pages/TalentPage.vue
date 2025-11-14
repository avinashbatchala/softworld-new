<template>
  <div class="talent-page">
    <!-- TE-inspired minimalist header -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">Tech Talent Network</div>
        <h1>Find Top <span class="accent-text">Tech Talent</span></h1>
        <p>Access our network of skilled professionals ready to help your business succeed</p>
        <div class="button-group">
          <router-link to="/contact" class="btn btn-primary">Request Talent</router-link>
          <router-link to="/services" class="btn btn-secondary">Explore Services</router-link>
        </div>
      </div>
    </section>

    <!-- Talent overview with TE mechanical aesthetic -->
    <section class="section talent-overview">
      <div class="container">
        <div class="talent-grid">
          <div class="talent-content">
            <h2>Expert Talent On Demand</h2>
            <p>SmoothTech connects businesses with highly-skilled technology professionals across various disciplines. Whether you need a full team for a major project or specialized expertise for a specific challenge, we have the talent network to meet your needs.</p>
            <p>Our rigorous vetting process ensures that you only work with top-tier professionals who bring both technical excellence and business acumen to your projects.</p>
            <div class="talent-stats">
              <div class="stat-item">
                <span class="stat-number">5,000+</span>
                <span class="stat-label">Verified Professionals</span>
              </div>
              <div class="stat-item">
                <span class="stat-number">95%</span>
                <span class="stat-label">Client Satisfaction</span>
              </div>
              <div class="stat-item">
                <span class="stat-number">48hrs</span>
                <span class="stat-label">Average Matching Time</span>
              </div>
            </div>
          </div>
          <div class="talent-image">
            <img src="@/assets/media/pages/talent/tech-pro-collab.png" alt="Tech professionals collaborating">
          </div>
        </div>
      </div>
    </section>

    <!-- Expertise section with TE-inspired cards -->
    <section class="section expertise-section">
      <div class="container">
        <h2 class="section-title">Our Areas of <span class="accent-text">Expertise</span></h2>
        <div class="grid grid-4">
          <div class="expertise-card">
            <div class="expertise-icon">
              <i class="icon-software">01</i>
            </div>
            <h3>Software Development</h3>
            <p>Full-stack developers, mobile specialists, and engineers across all modern languages and frameworks.</p>
          </div>
          <div class="expertise-card">
            <div class="expertise-icon">
              <i class="icon-data">02</i>
            </div>
            <h3>Data & Analytics</h3>
            <p>Data scientists, analysts, engineers, and AI/ML specialists to transform your data into insights.</p>
          </div>
          <div class="expertise-card">
            <div class="expertise-icon">
              <i class="icon-cloud">03</i>
            </div>
            <h3>Cloud & DevOps</h3>
            <p>Architects and engineers specialized in AWS, Azure, GCP, and modern DevOps practices.</p>
          </div>
          <div class="expertise-card">
            <div class="expertise-icon">
              <i class="icon-product">04</i>
            </div>
            <h3>Product & Design</h3>
            <p>Product managers, UX/UI designers, and researchers focused on creating exceptional digital experiences.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Process section with TE-inspired mechanics -->
    <section class="section process-section">
      <div class="container">
        <h2 class="section-title">How It <span class="accent-text">Works</span></h2>
        <div class="process-steps">
          <div class="process-step">
            <div class="step-number">1</div>
            <h3>Define Your Needs</h3>
            <p>Share your requirements, timeline, and budget with our talent specialists.</p>
          </div>
          <div class="process-step">
            <div class="step-number">2</div>
            <h3>Meet Pre-Vetted Talent</h3>
            <p>Review profiles of matched candidates and interview your top choices.</p>
          </div>
          <div class="process-step">
            <div class="step-number">3</div>
            <h3>Start Working</h3>
            <p>Begin collaboration with your selected professionals with our ongoing support.</p>
          </div>
          <div class="process-step">
            <div class="step-number">4</div>
            <h3>Scale As Needed</h3>
            <p>Easily adjust your team size and composition as project needs evolve.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Testimonials section with TE aesthetic -->
    <section class="section testimonials-section">
      <div class="container">
        <h2 class="section-title">Client Success <span class="accent-text">Stories</span></h2>
        <div class="testimonials-slider">
          <div class="testimonial-card">
            <div class="testimonial-content">
              <p>"SmoothTech helped us build our engineering team from scratch. The quality of talent they provided allowed us to accelerate our product roadmap by months."</p>
            </div>
            <div class="testimonial-author">
<!--              <img src="@/assets/media/pages/about/user.png" alt="Client headshot" class="author-image">-->
              <div class="author-info">
                <h4>Robert Miller</h4>
                <p>CTO, FinTech Innovations</p>
              </div>
            </div>
          </div>
          <div class="testimonial-card">
            <div class="testimonial-content">
              <p>"We needed specialized expertise in machine learning for a critical project. SmoothTech matched us with the perfect candidate within days, and the results exceeded our expectations."</p>
            </div>
            <div class="testimonial-author">
<!--              <img src="@/assets/media/pages/about/user.png" alt="Client headshot" class="author-image">-->
              <div class="author-info">
                <h4>Jennifer Chang</h4>
                <p>VP of Product, DataScape</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA section with TE-inspired aesthetic -->
    <section class="section cta-section">
      <div class="container">
        <div class="te-cta">
          <h2>Ready to find your perfect tech match?</h2>
          <p>Let us help you build the team you need to succeed.</p>
          <div class="button-group">
            <router-link to="/contact" class="btn btn-primary">Request Talent</router-link>
            <router-link to="/services" class="btn btn-secondary">Explore Services</router-link>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import '@/assets/styles/pages/TalentPage.css'

export default {
  name: 'TalentPage'
}
</script>