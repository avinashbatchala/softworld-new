<template>
  <div class="contact-page">
    <!-- Replace the current page-header in ContactPage.vue -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">Get In Touch</div>
        <h1>Contact <span class="accent-text">Our Team</span></h1>
        <p>Have a question or ready to discuss your project? We're here to help you succeed.</p>
        <div class="button-group">
          <a href="#contact-form" class="btn btn-primary">Send Message</a>
          <a href="#contact-info" class="btn btn-secondary">Our Details</a>
        </div>
      </div>
    </section>
    <section class="section contact-section">
      <div class="container">
        <div class="contact-grid">
          <div class="contact-form-container">
            <div class="form-header">
              <div class="form-label">01</div>
              <h2>Send Us a Message</h2>
            </div>
            <form class="contact-form" @submit.prevent="submitForm">
              <div class="form-group">
                <label for="name">Full Name</label>
                <input
                    type="text"
                    id="name"
                    v-model="form.name"
                    class="form-control"
                    :class="{ 'is-invalid': errors.name }"
                    required
                >
                <div v-if="errors.name" class="invalid-feedback">{{ errors.name }}</div>
              </div>

              <div class="form-group">
                <label for="email">Email Address</label>
                <input
                    type="email"
                    id="email"
                    v-model="form.email"
                    class="form-control"
                    :class="{ 'is-invalid': errors.email }"
                    required
                >
                <div v-if="errors.email" class="invalid-feedback">{{ errors.email }}</div>
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="phone">Phone (optional)</label>
                  <input
                      type="tel"
                      id="phone"
                      v-model="form.phone"
                      class="form-control"
                  >
                </div>

                <div class="form-group">
                  <label for="subject">Subject</label>
                  <select
                      id="subject"
                      v-model="form.subject"
                      class="form-control"
                      :class="{ 'is-invalid': errors.subject }"
                      required
                  >
                    <option value="">Select a subject</option>
                    <option value="General Inquiry">General Inquiry</option>
                    <option value="Talent Request">Talent Request</option>
                    <option value="Job Application">Job Application</option>
                    <option value="Partnership">Partnership Opportunity</option>
                    <option value="Other">Other</option>
                  </select>
                  <div v-if="errors.subject" class="invalid-feedback">{{ errors.subject }}</div>
                </div>
              </div>

              <div class="form-group">
                <label for="message">Message</label>
                <textarea
                    id="message"
                    v-model="form.message"
                    class="form-control"
                    :class="{ 'is-invalid': errors.message }"
                    rows="5"
                    required
                ></textarea>
                <div v-if="errors.message" class="invalid-feedback">{{ errors.message }}</div>
              </div>

              <div class="form-group form-check">
                <input
                    type="checkbox"
                    id="privacy"
                    v-model="form.privacy"
                    class="form-check-input"
                    :class="{ 'is-invalid': errors.privacy }"
                    required
                >
                <label class="form-check-label" for="privacy">
                  I agree to the <router-link to="/privacy">Privacy Policy</router-link>
                </label>
                <div v-if="errors.privacy" class="invalid-feedback">{{ errors.privacy }}</div>
              </div>

              <button type="submit" class="btn btn-primary" :disabled="isSubmitting">
                {{ isSubmitting ? 'Sending...' : 'Send Message' }}
              </button>
            </form>

            <div v-if="formSuccess" class="success-message">
              <div class="success-icon">✓</div>
              <p>Your message has been sent successfully! We'll get back to you soon.</p>
            </div>
          </div>

          <div class="contact-info">
            <div class="info-header">
              <div class="info-label">02</div>
              <h2>Connect With Us</h2>
            </div>

            <div class="info-card">
              <div class="info-icon">
                <i class="icon-location"></i>
              </div>
              <div class="info-content">
                <h3>Our Office</h3>
                <p>60 Swackhammer Way<br>Budd Lake, NJ 07828</p>
              </div>
            </div>

            <div class="info-card">
              <div class="info-icon">
                <i class="icon-phone"></i>
              </div>
              <div class="info-content">
                <h3>Phone</h3>
                <p><a href="tel:+14155550123">(415) 555-0123</a><br>
                  <span class="info-detail">Monday-Friday, 8am-6pm ET</span></p>
              </div>
            </div>

            <div class="info-card">
              <div class="info-icon">
                <i class="icon-email"></i>
              </div>
              <div class="info-content">
                <h3>Email</h3>
                <p><a href="mailto:info@SmoothTech.com">info@SmoothTech.com</a><br>
                  <span class="info-detail">We'll respond within 24 hours</span></p>
              </div>
            </div>

            <div class="social-media">
              <h3>Follow Us</h3>
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
          </div>
        </div>
      </div>
    </section>

    <section class="map-section">
      <div class="container">
        <div class="map-header">
          <div class="map-label">03</div>
          <h2>Visit Our Office</h2>
        </div>
      </div>
      <div class="map-container">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3017.8742856789456!2d-74.60982!3d40.8656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c39a8b77c8f4d3%3A0x7a8b77c8f4d39c!2s60%20Swackhammer%20Way%2C%20Budd%20Lake%2C%20NJ%2007828!5e0!3m2!1sen!2sus!4v1746025217654!5m2!1sen!2sus"
            width="100%"
            height="100%"
            style="border:0;"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
            title="Office Location Map"
            class="google-map">
        </iframe>
        <div class="map-overlay">
          <div class="map-info">
            <div class="map-info-icon">
              <i class="icon-location"></i>
            </div>
            <div class="map-info-content">
              <h3>SmoothTech HQ</h3>
              <p>60 Swackhammer Way<br>Budd Lake, NJ 07828</p>
              <a href="https://maps.google.com/?q=60+Swackhammer+Way,+Budd+Lake,+NJ+07828" target="_blank" class="map-directions">Get Directions →</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section faq-section">
      <div class="container">
        <div class="section-header">
          <div class="te-label">FAQ</div>
          <h2>Common <span class="accent-text">Questions</span></h2>
        </div>
        <div class="faqs">
          <div class="faq-item">
            <h3>How quickly can you provide talent for our project?</h3>
            <p>Typically, we can match you with qualified candidates within 48-72 hours, depending on the specificity of your requirements.</p>
          </div>
          <div class="faq-item">
            <h3>What industries do you specialize in?</h3>
            <p>While we work across various sectors, we have deep expertise in fintech, healthcare, e-commerce, and SaaS companies.</p>
          </div>
          <div class="faq-item">
            <h3>Do you offer remote talent?</h3>
            <p>Yes, we have a global network of remote professionals and can match you with talent that fits your timezone and collaboration needs.</p>
          </div>
        </div>
      </div>
    </section>

    <section class="section section-light">
      <div class="container">
        <div class="te-cta">
          <h2>Ready to Get Started?</h2>
          <p>Let's discuss how we can help you achieve your technology goals.</p>
          <div class="button-group">
            <router-link to="/find-talent" class="btn btn-primary">Find Talent</router-link>
            <router-link to="/services" class="btn btn-secondary">Explore Services</router-link>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import '@/assets/styles/pages/ContactPage.css'

export default {
  name: 'ContactPage',
  data() {
    return {
      form: {
        name: '',
        email: '',
        phone: '',
        subject: '',
        message: '',
        privacy: false
      },
      errors: {},
      isSubmitting: false,
      formSuccess: false
    };
  },
  methods: {
    validateForm() {
      this.errors = {};

      if (!this.form.name.trim()) {
        this.errors.name = 'Full name is required';
      }

      if (!this.form.email.trim()) {
        this.errors.email = 'Email address is required';
      } else if (!this.isValidEmail(this.form.email)) {
        this.errors.email = 'Please enter a valid email address';
      }

      if (!this.form.subject) {
        this.errors.subject = 'Please select a subject';
      }

      if (!this.form.message.trim()) {
        this.errors.message = 'Message is required';
      }

      if (!this.form.privacy) {
        this.errors.privacy = 'You must agree to the Privacy Policy';
      }

      return Object.keys(this.errors).length === 0;
    },

    isValidEmail(email) {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(email).toLowerCase());
    },

    async submitForm() {
      if (!this.validateForm()) {
        return;
      }

      this.isSubmitting = true;

      try {
        // Simulate API call with a timeout
        await new Promise(resolve => setTimeout(resolve, 1000));

        console.log('Form submitted:', this.form);

        // Reset form
        this.form = {
          name: '',
          email: '',
          phone: '',
          subject: '',
          message: '',
          privacy: false
        };

        this.formSuccess = true;

        // Hide success message after 5 seconds
        setTimeout(() => {
          this.formSuccess = false;
        }, 5000);

      } catch (error) {
        console.error('Error submitting form:', error);
      } finally {
        this.isSubmitting = false;
      }
    }
  }
};
</script>