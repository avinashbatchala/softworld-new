<template>
  <div class="privacy-policy-page">
    <Banner title="Privacy Policy" subtitle="Last Updated: June 15, 2023" />

    <section class="section">
      <div class="container">
        <div class="policy-content">
          <h2>Introduction</h2>
          <p>At Softworld ("we", "our", or "us"), we respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you visit our website and tell you about your privacy rights and how the law protects you.</p>

          <h2>Information We Collect</h2>
          <p>We may collect, use, store and transfer different kinds of personal data about you which we have grouped together as follows:</p>
          <ul>
            <li><strong>Identity Data</strong> includes first name, last name, username or similar identifier, title.</li>
            <li><strong>Contact Data</strong> includes email address, telephone numbers, and physical address.</li>
            <li><strong>Technical Data</strong> includes internet protocol (IP) address, browser type and version, time zone setting, browser plug-in types and versions, operating system and platform.</li>
            <li><strong>Usage Data</strong> includes information about how you use our website, products and services.</li>
            <li><strong>Marketing Data</strong> includes your preferences in receiving marketing from us and our third parties and your communication preferences.</li>
          </ul>

          <h2>How We Use Your Information</h2>
          <p>We will only use your personal data when the law allows us to. Most commonly, we will use your personal data in the following circumstances:</p>
          <ul>
            <li>To register you as a client</li>
            <li>To deliver services to you</li>
            <li>To manage our relationship with you</li>
            <li>To improve our website, products/services, and customer relationships</li>
            <li>To send you marketing communications if you have opted in to receive them</li>
          </ul>

          <h2>Data Security</h2>
          <p>We have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way, altered or disclosed. We limit access to your personal data to those employees, agents, contractors and other third parties who have a business need to know.</p>

          <h2>Data Retention</h2>
          <p>We will only retain your personal data for as long as necessary to fulfill the purposes we collected it for, including for the purposes of satisfying any legal, accounting, or reporting requirements.</p>

          <h2>Your Legal Rights</h2>
          <p>Under certain circumstances, you have rights under data protection laws in relation to your personal data, including the right to:</p>
          <ul>
            <li>Request access to your personal data</li>
            <li>Request correction of your personal data</li>
            <li>Request erasure of your personal data</li>
            <li>Object to processing of your personal data</li>
            <li>Request restriction of processing your personal data</li>
            <li>Request transfer of your personal data</li>
            <li>Right to withdraw consent</li>
          </ul>

          <h2>Cookies</h2>
          <p>Our website uses cookies to distinguish you from other users of our website. This helps us to provide you with a good experience when you browse our website and also allows us to improve our site.</p>

          <h2>Third-Party Links</h2>
          <p>Our website may include links to third-party websites, plug-ins, and applications. Clicking on those links or enabling those connections may allow third parties to collect or share data about you. We do not control these third-party websites and are not responsible for their privacy statements.</p>

          <h2>Changes to This Privacy Policy</h2>
          <p>We may update our privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page and updating the "Last Updated" date at the top of this policy.</p>

          <h2>Contact Us</h2>
          <p>If you have any questions about this privacy policy or our privacy practices, please contact us at:</p>
          <p>
            Email: <a href="mailto:privacy@Softworld.com">privacy@Softworld.com</a><br>
            Phone: (123) 456-7890<br>
            Address: 123 Tech Street, Silicon Valley, CA 94043
          </p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import Banner from '@/components/common/Banner.vue';

export default {
  name: 'PrivacyPolicyPage',
  components: {
    Banner
  }
}
</script>

<style>

:root {
  /* If these don't exist yet, add them */
  --color-gray-60: #666666;
  --color-gray-80: #333333;
}

.privacy-policy-page {
  padding-bottom: calc(var(--space-unit) * 12);
}

.policy-content {
  max-width: 800px;
  margin: 0 auto;
}

.policy-content h2 {
  font-size: 1.8rem;
  margin-top: calc(var(--space-unit) * 6);
  margin-bottom: calc(var(--space-unit) * 3);
  color: var(--color-dark);
  font-weight: 700;
}

.policy-content h2:first-child {
  margin-top: 0;
}

.policy-content p,
.policy-content ul {
  margin-bottom: calc(var(--space-unit) * 3);
  color: var(--color-gray-60);
  line-height: 1.6;
}

.policy-content ul {
  padding-left: calc(var(--space-unit) * 4);
}

.policy-content li {
  margin-bottom: calc(var(--space-unit) * 1.5);
}

.policy-content a {
  color: var(--color-accent);
  text-decoration: none;
  transition: all var(--transition-standard);
}

.policy-content a:hover {
  color: var(--color-primary);
  text-decoration: underline;
}
</style>