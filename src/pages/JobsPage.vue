<template>
  <div class="jobs-page">
    <!-- Page header with TE-inspired aesthetic -->
    <!-- Replace the current page-header in JobsPage.vue -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">Career Opportunities</div>
        <h1>Open <span class="accent-text">Positions</span></h1>
        <p>We're always looking for exceptional talent to join our innovative team</p>
        <div class="button-group">
          <a href="#careers" class="btn btn-primary">View Openings</a>
          <a href="#why-join" class="btn btn-secondary">Why Join Us</a>
        </div>
      </div>
    </section>

    <!-- Careers overview section -->
    <section class="section careers-section">
      <div class="container">
        <h2 class="section-title">We're Always <span class="accent-text">Looking</span></h2>
        <p class="section-description">At Softworld, we're constantly seeking talented professionals across the technology spectrum who are passionate about innovation and excellence.</p>

        <div class="careers-grid">
          <div class="career-card">
            <div class="career-icon">BE</div>
            <div class="career-content">
              <h3>Backend Developers</h3>
              <p>Experts in building scalable server-side applications and APIs with Node.js, Python, Java, and more.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">FE</div>
            <div class="career-content">
              <h3>Frontend Developers</h3>
              <p>Specialists in creating responsive, intuitive UIs using modern frameworks like React, Vue, and Angular.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">FS</div>
            <div class="career-content">
              <h3>Full Stack Developers</h3>
              <p>Versatile developers comfortable working across the entire technology stack.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">SE</div>
            <div class="career-content">
              <h3>Software Engineers</h3>
              <p>Problem solvers who design, develop, and maintain software systems with clean, efficient code.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">AI</div>
            <div class="career-content">
              <h3>AI/ML Engineers</h3>
              <p>Specialists in artificial intelligence and machine learning technologies and applications.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">DO</div>
            <div class="career-content">
              <h3>DevOps Engineers</h3>
              <p>Experts in automation, CI/CD pipelines, and maintaining reliable infrastructure.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">CD</div>
            <div class="career-content">
              <h3>Cloud Developers</h3>
              <p>Specialists in AWS, Azure, GCP, and modern cloud architecture patterns.</p>
            </div>
          </div>

          <div class="career-card">
            <div class="career-icon">PD</div>
            <div class="career-content">
              <h3>Product Designers</h3>
              <p>Creative professionals who craft user-centered digital experiences.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Benefits section with icons -->
    <section class="section why-join-section">
      <div class="container">
        <h2 class="section-title">Why <span class="accent-text">Join Us</span></h2>
        <p class="section-description">We believe in creating an environment where talented individuals can thrive, grow, and do their best work.</p>

        <div class="benefits-grid">
          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-laptop-code"></i>
            </div>
            <h3>Remote-First Culture</h3>
            <p>Work from anywhere with our distributed team spread across the globe.</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-brain"></i>
            </div>
            <h3>Continuous Learning</h3>
            <p>Access to conferences, courses, and learning resources to help you grow.</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-chart-line"></i>
            </div>
            <h3>Career Growth</h3>
            <p>Clear paths for advancement and opportunities to lead impactful projects.</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-heartbeat"></i>
            </div>
            <h3>Health & Wellness</h3>
            <p>Comprehensive benefits including health insurance and wellness programs.</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-hand-holding-usd"></i>
            </div>
            <h3>Competitive Compensation</h3>
            <p>Salary packages that recognize and reward your expertise and contributions.</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-puzzle-piece"></i>
            </div>
            <h3>Innovative Projects</h3>
            <p>Work on cutting-edge solutions that solve real-world problems.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Team culture section -->
    <section class="section team-culture-section">
      <div class="container">
        <div class="culture-grid">
          <div class="culture-image">
            <img src="@/assets/media/pages/about/team.png" alt="Our team culture">
          </div>

          <div class="culture-content">
            <h2>Our <span class="accent-text">Culture</span></h2>
            <p>At Softworld, we foster a culture of innovation, collaboration, and continuous improvement. We believe in empowering our team members to take ownership of their work and make meaningful contributions.</p>
            <p>We value diversity of thought, background, and experience, creating an inclusive environment where everyone feels welcome and can do their best work.</p>
            <a href="/about" class="btn-outline mt-3">Learn About Our Team</a>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA section -->
    <section class="section cta-section">
      <div class="container">
        <div class="te-cta">
          <h2>Ready to Join Our Team?</h2>
          <p>We're always looking for exceptional talent to help us build innovative solutions. Submit your application today and take the next step in your career.</p>
          <div class="button-group">
            <router-link to="/contact" class="btn btn-primary">Apply Now</router-link>
            <router-link to="/contact" class="btn btn-secondary">Contact Us</router-link>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import '@/assets/styles/pages/JobsPage.css'

export default {
  name: 'JobsPage'
}
</script>