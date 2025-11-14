<template>
  <div class="terms-page">
    <Banner title="Terms of Service" subtitle="Last Updated: June 15, 2023" />

    <section class="section">
      <div class="container">
        <div class="policy-content">
          <h2>1. Introduction</h2>
          <p>Welcome to SmoothTech. These Terms of Service ("Terms") govern your use of our website, products, and services ("Services"). By accessing or using our Services, you agree to be bound by these Terms. If you disagree with any part of the terms, you may not access our Services.</p>

          <h2>2. Use of Our Services</h2>
          <p>You agree to use our Services only for purposes that are permitted by these Terms and any applicable law, regulation, or generally accepted practices in the relevant jurisdictions.</p>
          <p>You may not:</p>
          <ul>
            <li>Use our Services in any manner that could disable, overburden, damage, or impair our site or interfere with any other party's use of the Services</li>
            <li>Attempt to gain unauthorized access to any portions of our Services or any related systems or networks</li>
            <li>Collect or track personal information of other users of our Services</li>
            <li>Impersonate or attempt to impersonate SmoothTech, a SmoothTech employee, another user, or any other person or entity</li>
            <li>Engage in any other conduct that restricts or inhibits anyone's use or enjoyment of our Services</li>
          </ul>

          <h2>3. Intellectual Property</h2>
          <p>The Services and all of their contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio, and the design, selection, and arrangement thereof) are owned by SmoothTech, its licensors, or other providers of such material and are protected by copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.</p>
          <p>These Terms permit you to use our Services for your personal, non-commercial use only. You must not reproduce, distribute, modify, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any of the material on our Services.</p>

          <h2>4. User Accounts</h2>
          <p>When you create an account with us, you must provide us with information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Services.</p>
          <p>You are responsible for safeguarding the password that you use to access our Services and for any activities or actions under your password.</p>
          <p>You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>

          <h2>5. Content You Provide</h2>
          <p>You retain ownership of any content that you submit, post to, or display on our Services ("User Content"). By providing User Content to our Services, you grant us a worldwide, royalty-free, non-exclusive, perpetual, irrevocable license to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such User Content.</p>
          <p>You represent and warrant that:</p>
          <ul>
            <li>You own or control all rights in and to the User Content you provide</li>
            <li>All User Content is accurate and complies with these Terms</li>
            <li>User Content does not violate the rights of any third party, including but not limited to intellectual property rights and privacy rights</li>
          </ul>

          <h2>6. Links to Third-Party Websites</h2>
          <p>Our Services may contain links to third-party websites or services that are not owned or controlled by SmoothTech. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services.</p>
          <p>You acknowledge and agree that SmoothTech shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods, or services available on or through any such websites or services.</p>

          <h2>7. Termination</h2>
          <p>We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>
          <p>Upon termination, your right to use our Services will immediately cease. If you wish to terminate your account, you may simply discontinue using our Services.</p>

          <h2>8. Limitation of Liability</h2>
          <p>In no event shall SmoothTech, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from:</p>
          <ul>
            <li>Your access to or use of or inability to access or use our Services</li>
            <li>Any conduct or content of any third party on our Services</li>
            <li>Any content obtained from our Services</li>
            <li>Unauthorized access, use, or alteration of your transmissions or content</li>
          </ul>

          <h2>9. Disclaimer</h2>
          <p>Your use of our Services is at your sole risk. Our Services are provided on an "AS IS" and "AS AVAILABLE" basis. We expressly disclaim all warranties of any kind, whether express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement.</p>

          <h2>10. Governing Law</h2>
          <p>These Terms shall be governed and construed in accordance with the laws of the State of California, United States, without regard to its conflict of law provisions.</p>
          <p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect.</p>

          <h2>11. Changes to Terms</h2>
          <p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.</p>
          <p>By continuing to access or use our Services after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using our Services.</p>

          <h2>12. Contact Us</h2>
          <p>If you have any questions about these Terms, please contact us at:</p>
          <p>
            Email: <a href="mailto:legal@smoothtech.com">legal@smoothtech.com</a><br>
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
  name: 'TermsOfServicePage',
  components: {
    Banner
  }
}
</script>

<style>
.terms-page {
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
  color: var(--color-gray-80);
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