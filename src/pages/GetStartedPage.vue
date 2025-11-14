<template>
  <div class="get-started-page">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">Get Started</div>
        <h1>Join <span class="accent-text">SmoothTech</span></h1>
        <p>Whether you're looking for top talent or your next opportunity, we're here to connect you with the right match.</p>
      </div>
    </section>

    <!-- Form Selection Section -->
    <section class="section form-section">
      <div class="container">
        <div class="form-selector">
          <div class="selector-header">
            <div class="form-label">01</div>
            <h2>Choose Your Path</h2>
            <p>Select whether you're looking to hire talent or find opportunities</p>
          </div>
          
          <div class="selector-buttons">
            <button 
              class="selector-btn" 
              :class="{ 'active': userType === 'employer' }"
              @click="setUserType('employer')"
            >
              <div class="selector-icon">
                <i class="icon-briefcase"></i>
              </div>
              <h3>I'm an Employer</h3>
              <p>Looking to hire skilled professionals</p>
            </button>
            
            <button 
              class="selector-btn" 
              :class="{ 'active': userType === 'employee' }"
              @click="setUserType('employee')"
            >
              <div class="selector-icon">
                <i class="icon-user"></i>
              </div>
              <h3>I'm a Professional</h3>
              <p>Seeking new opportunities</p>
            </button>
          </div>
        </div>

        <!-- Dynamic Form Container -->
        <div v-if="userType" class="form-container">
          <div class="form-header">
            <div class="form-label">02</div>
            <h2>{{ userType === 'employer' ? 'Tell Us About Your Hiring Needs' : 'Tell Us About Your Experience' }}</h2>
          </div>

          <!-- Employer Form -->
          <form v-if="userType === 'employer'" class="get-started-form" @submit.prevent="submitEmployerForm">
            <div class="form-row">
              <div class="form-group">
                <label for="company-name">Company Name *</label>
                <input
                  type="text"
                  id="company-name"
                  v-model="employerForm.companyName"
                  class="form-control"
                  :class="{ 'is-invalid': errors.companyName }"
                  required
                >
                <div v-if="errors.companyName" class="invalid-feedback">{{ errors.companyName }}</div>
              </div>

              <div class="form-group">
                <label for="contact-name">Contact Name *</label>
                <input
                  type="text"
                  id="contact-name"
                  v-model="employerForm.contactName"
                  class="form-control"
                  :class="{ 'is-invalid': errors.contactName }"
                  required
                >
                <div v-if="errors.contactName" class="invalid-feedback">{{ errors.contactName }}</div>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label for="email">Email Address *</label>
                <input
                  type="email"
                  id="email"
                  v-model="employerForm.email"
                  class="form-control"
                  :class="{ 'is-invalid': errors.email }"
                  required
                >
                <div v-if="errors.email" class="invalid-feedback">{{ errors.email }}</div>
              </div>

              <div class="form-group">
                <label for="phone">Phone Number *</label>
                <input
                  type="tel"
                  id="phone"
                  v-model="employerForm.phone"
                  class="form-control"
                  :class="{ 'is-invalid': errors.phone }"
                  required
                >
                <div v-if="errors.phone" class="invalid-feedback">{{ errors.phone }}</div>
              </div>
            </div>

            <div class="form-group">
              <label for="job-title">Job Title/Position *</label>
              <input
                type="text"
                id="job-title"
                v-model="employerForm.jobTitle"
                class="form-control"
                :class="{ 'is-invalid': errors.jobTitle }"
                placeholder="e.g., Senior Full Stack Developer"
                required
              >
              <div v-if="errors.jobTitle" class="invalid-feedback">{{ errors.jobTitle }}</div>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label for="num-resources">Number of Resources Needed *</label>
                <select
                  id="num-resources"
                  v-model="employerForm.numResources"
                  class="form-control"
                  :class="{ 'is-invalid': errors.numResources }"
                  required
                >
                  <option value="">Select quantity</option>
                  <option value="1">1 Resource</option>
                  <option value="2-3">2-3 Resources</option>
                  <option value="4-5">4-5 Resources</option>
                  <option value="6-10">6-10 Resources</option>
                  <option value="10+">10+ Resources</option>
                </select>
                <div v-if="errors.numResources" class="invalid-feedback">{{ errors.numResources }}</div>
              </div>

              <div class="form-group">
                <label for="time-period">Project Duration *</label>
                <select
                  id="time-period"
                  v-model="employerForm.timePeriod"
                  class="form-control"
                  :class="{ 'is-invalid': errors.timePeriod }"
                  required
                >
                  <option value="">Select duration</option>
                  <option value="1-3 months">1-3 months</option>
                  <option value="3-6 months">3-6 months</option>
                  <option value="6-12 months">6-12 months</option>
                  <option value="12+ months">12+ months</option>
                  <option value="permanent">Permanent Position</option>
                </select>
                <div v-if="errors.timePeriod" class="invalid-feedback">{{ errors.timePeriod }}</div>
              </div>
            </div>

            <div class="form-group">
              <label for="job-description">Job Description *</label>
              <textarea
                id="job-description"
                v-model="employerForm.jobDescription"
                class="form-control"
                :class="{ 'is-invalid': errors.jobDescription }"
                rows="6"
                placeholder="Provide a detailed description of the role, required skills, and responsibilities..."
                required
              ></textarea>
              <div v-if="errors.jobDescription" class="invalid-feedback">{{ errors.jobDescription }}</div>
            </div>

            <div class="form-group">
              <label for="job-document">Upload Job Description (Optional)</label>
              <div class="file-upload-area" @click="triggerFileUpload('employer')" @dragover.prevent @drop.prevent="handleFileDrop($event, 'employer')">
                <input
                  type="file"
                  id="job-document"
                  ref="employerFileInput"
                  @change="handleFileUpload($event, 'employer')"
                  accept=".pdf,.doc,.docx,.txt"
                  style="display: none;"
                >
                <div v-if="!employerForm.uploadedFile" class="upload-placeholder">
                  <i class="icon-upload"></i>
                  <p>Click to upload or drag and drop</p>
                  <span>PDF, DOC, DOCX, TXT (Max 5MB)</span>
                </div>
                <div v-else class="uploaded-file">
                  <i class="icon-document"></i>
                  <span>{{ employerForm.uploadedFile.name }}</span>
                  <button type="button" @click.stop="removeFile('employer')" class="remove-file">×</button>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="budget">Budget Range (Optional)</label>
              <select
                id="budget"
                v-model="employerForm.budget"
                class="form-control"
              >
                <option value="">Select budget range</option>
                <option value="Under $50/hr">Under $50/hr</option>
                <option value="$50-75/hr">$50-75/hr</option>
                <option value="$75-100/hr">$75-100/hr</option>
                <option value="$100-150/hr">$100-150/hr</option>
                <option value="$150+/hr">$150+/hr</option>
                <option value="Fixed project budget">Fixed project budget</option>
              </select>
            </div>

            <div class="form-group form-check">
              <input
                type="checkbox"
                id="employer-privacy"
                v-model="employerForm.privacy"
                class="form-check-input"
                :class="{ 'is-invalid': errors.privacy }"
                required
              >
              <label class="form-check-label" for="employer-privacy">
                I agree to the <router-link to="/privacy">Privacy Policy</router-link> and <router-link to="/terms">Terms of Service</router-link>
              </label>
              <div v-if="errors.privacy" class="invalid-feedback">{{ errors.privacy }}</div>
            </div>

            <button type="submit" class="btn btn-primary" :disabled="isSubmitting">
              {{ isSubmitting ? 'Submitting...' : 'Submit Request' }}
            </button>
          </form>

          <!-- Employee Form -->
          <form v-if="userType === 'employee'" class="get-started-form" @submit.prevent="submitEmployeeForm">
            <div class="form-row">
              <div class="form-group">
                <label for="full-name">Full Name *</label>
                <input
                  type="text"
                  id="full-name"
                  v-model="employeeForm.fullName"
                  class="form-control"
                  :class="{ 'is-invalid': errors.fullName }"
                  required
                >
                <div v-if="errors.fullName" class="invalid-feedback">{{ errors.fullName }}</div>
              </div>

              <div class="form-group">
                <label for="employee-email">Email Address *</label>
                <input
                  type="email"
                  id="employee-email"
                  v-model="employeeForm.email"
                  class="form-control"
                  :class="{ 'is-invalid': errors.email }"
                  required
                >
                <div v-if="errors.email" class="invalid-feedback">{{ errors.email }}</div>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label for="employee-phone">Phone Number *</label>
                <input
                  type="tel"
                  id="employee-phone"
                  v-model="employeeForm.phone"
                  class="form-control"
                  :class="{ 'is-invalid': errors.phone }"
                  required
                >
                <div v-if="errors.phone" class="invalid-feedback">{{ errors.phone }}</div>
              </div>

              <div class="form-group">
                <label for="experience-level">Experience Level *</label>
                <select
                  id="experience-level"
                  v-model="employeeForm.experienceLevel"
                  class="form-control"
                  :class="{ 'is-invalid': errors.experienceLevel }"
                  required
                >
                  <option value="">Select experience level</option>
                  <option value="Junior (0-2 years)">Junior (0-2 years)</option>
                  <option value="Mid-level (2-5 years)">Mid-level (2-5 years)</option>
                  <option value="Senior (5-8 years)">Senior (5-8 years)</option>
                  <option value="Lead (8-12 years)">Lead (8-12 years)</option>
                  <option value="Principal (12+ years)">Principal (12+ years)</option>
                </select>
                <div v-if="errors.experienceLevel" class="invalid-feedback">{{ errors.experienceLevel }}</div>
              </div>
            </div>

            <div class="form-group">
              <label for="current-role">Current Role/Title *</label>
              <input
                type="text"
                id="current-role"
                v-model="employeeForm.currentRole"
                class="form-control"
                :class="{ 'is-invalid': errors.currentRole }"
                placeholder="e.g., Senior Software Engineer"
                required
              >
              <div v-if="errors.currentRole" class="invalid-feedback">{{ errors.currentRole }}</div>
            </div>

            <div class="form-group">
              <label for="areas-of-interest">Areas of Interest *</label>
              <div class="checkbox-group">
                <div class="checkbox-item" v-for="area in areasOfInterest" :key="area">
                  <input
                    type="checkbox"
                    :id="area"
                    :value="area"
                    v-model="employeeForm.areasOfInterest"
                    class="form-check-input"
                  >
                  <label :for="area" class="form-check-label">{{ area }}</label>
                </div>
              </div>
              <div v-if="errors.areasOfInterest" class="invalid-feedback">{{ errors.areasOfInterest }}</div>
            </div>

            <div class="form-group">
              <label for="skills">Technical Skills *</label>
              <textarea
                id="skills"
                v-model="employeeForm.skills"
                class="form-control"
                :class="{ 'is-invalid': errors.skills }"
                rows="4"
                placeholder="List your key technical skills, programming languages, frameworks, tools, etc."
                required
              ></textarea>
              <div v-if="errors.skills" class="invalid-feedback">{{ errors.skills }}</div>
            </div>

            <div class="form-group">
              <label for="resume">Upload Resume *</label>
              <div class="file-upload-area" @click="triggerFileUpload('employee')" @dragover.prevent @drop.prevent="handleFileDrop($event, 'employee')">
                <input
                  type="file"
                  id="resume"
                  ref="employeeFileInput"
                  @change="handleFileUpload($event, 'employee')"
                  accept=".pdf,.doc,.docx"
                  style="display: none;"
                  required
                >
                <div v-if="!employeeForm.uploadedResume" class="upload-placeholder">
                  <i class="icon-upload"></i>
                  <p>Click to upload or drag and drop your resume</p>
                  <span>PDF, DOC, DOCX (Max 5MB)</span>
                </div>
                <div v-else class="uploaded-file">
                  <i class="icon-document"></i>
                  <span>{{ employeeForm.uploadedResume.name }}</span>
                  <button type="button" @click.stop="removeFile('employee')" class="remove-file">×</button>
                </div>
              </div>
              <div v-if="errors.resume" class="invalid-feedback">{{ errors.resume }}</div>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label for="availability">Availability *</label>
                <select
                  id="availability"
                  v-model="employeeForm.availability"
                  class="form-control"
                  :class="{ 'is-invalid': errors.availability }"
                  required
                >
                  <option value="">Select availability</option>
                  <option value="Immediately">Immediately</option>
                  <option value="Within 2 weeks">Within 2 weeks</option>
                  <option value="Within 1 month">Within 1 month</option>
                  <option value="Within 2 months">Within 2 months</option>
                  <option value="Just exploring">Just exploring</option>
                </select>
                <div v-if="errors.availability" class="invalid-feedback">{{ errors.availability }}</div>
              </div>

              <div class="form-group">
                <label for="work-preference">Work Preference *</label>
                <select
                  id="work-preference"
                  v-model="employeeForm.workPreference"
                  class="form-control"
                  :class="{ 'is-invalid': errors.workPreference }"
                  required
                >
                  <option value="">Select preference</option>
                  <option value="Remote">Remote</option>
                  <option value="On-site">On-site</option>
                  <option value="Hybrid">Hybrid</option>
                  <option value="Open to all">Open to all</option>
                </select>
                <div v-if="errors.workPreference" class="invalid-feedback">{{ errors.workPreference }}</div>
              </div>
            </div>

            <div class="form-group">
              <label for="expected-salary">Expected Salary Range (Optional)</label>
              <select
                id="expected-salary"
                v-model="employeeForm.expectedSalary"
                class="form-control"
              >
                <option value="">Select salary range</option>
                <option value="Under $60k">Under $60k</option>
                <option value="$60k-80k">$60k-80k</option>
                <option value="$80k-100k">$80k-100k</option>
                <option value="$100k-120k">$100k-120k</option>
                <option value="$120k-150k">$120k-150k</option>
                <option value="$150k-200k">$150k-200k</option>
                <option value="$200k+">$200k+</option>
              </select>
            </div>

            <div class="form-group form-check">
              <input
                type="checkbox"
                id="employee-privacy"
                v-model="employeeForm.privacy"
                class="form-check-input"
                :class="{ 'is-invalid': errors.privacy }"
                required
              >
              <label class="form-check-label" for="employee-privacy">
                I agree to the <router-link to="/privacy">Privacy Policy</router-link> and <router-link to="/terms">Terms of Service</router-link>
              </label>
              <div v-if="errors.privacy" class="invalid-feedback">{{ errors.privacy }}</div>
            </div>

            <button type="submit" class="btn btn-primary" :disabled="isSubmitting">
              {{ isSubmitting ? 'Submitting...' : 'Submit Application' }}
            </button>
          </form>
        </div>

        <!-- Success Message -->
        <div v-if="formSuccess" class="success-message">
          <div class="success-icon">✓</div>
          <h3>{{ userType === 'employer' ? 'Request Submitted Successfully!' : 'Application Submitted Successfully!' }}</h3>
          <p>{{ userType === 'employer' ? 'Our team will review your requirements and get back to you within 24 hours.' : 'Our team will review your profile and contact you about relevant opportunities.' }}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'GetStartedPage',
  data() {
    return {
      userType: '',
      isSubmitting: false,
      formSuccess: false,
      errors: {},
      employerForm: {
        companyName: '',
        contactName: '',
        email: '',
        phone: '',
        jobTitle: '',
        numResources: '',
        timePeriod: '',
        jobDescription: '',
        uploadedFile: null,
        budget: '',
        privacy: false
      },
      employeeForm: {
        fullName: '',
        email: '',
        phone: '',
        experienceLevel: '',
        currentRole: '',
        areasOfInterest: [],
        skills: '',
        uploadedResume: null,
        availability: '',
        workPreference: '',
        expectedSalary: '',
        privacy: false
      },
      areasOfInterest: [
        'Frontend Development',
        'Backend Development',
        'Full Stack Development',
        'Mobile Development',
        'DevOps/Infrastructure',
        'Data Science/Analytics',
        'Machine Learning/AI',
        'Cybersecurity',
        'Cloud Computing',
        'UI/UX Design',
        'Product Management',
        'Quality Assurance',
        'Database Administration',
        'Blockchain Development'
      ]
    }
  },
  methods: {
    setUserType(type) {
      this.userType = type;
      this.clearErrors();
      this.formSuccess = false;
    },
    clearErrors() {
      this.errors = {};
    },
    triggerFileUpload(type) {
      if (type === 'employer') {
        this.$refs.employerFileInput.click();
      } else {
        this.$refs.employeeFileInput.click();
      }
    },
    handleFileUpload(event, type) {
      const file = event.target.files[0];
      if (file) {
        this.validateAndSetFile(file, type);
      }
    },
    handleFileDrop(event, type) {
      const file = event.dataTransfer.files[0];
      if (file) {
        this.validateAndSetFile(file, type);
      }
    },
    validateAndSetFile(file, type) {
      // Validate file size (5MB max)
      if (file.size > 5 * 1024 * 1024) {
        this.errors[type === 'employer' ? 'uploadedFile' : 'resume'] = 'File size must be less than 5MB';
        return;
      }

      // Validate file type
      const allowedTypes = ['pdf', 'doc', 'docx', 'txt'];
      const fileExtension = file.name.split('.').pop().toLowerCase();
      if (!allowedTypes.includes(fileExtension)) {
        this.errors[type === 'employer' ? 'uploadedFile' : 'resume'] = 'Invalid file type. Please upload PDF, DOC, DOCX, or TXT files only.';
        return;
      }

      // Clear errors and set file
      delete this.errors[type === 'employer' ? 'uploadedFile' : 'resume'];
      if (type === 'employer') {
        this.employerForm.uploadedFile = file;
      } else {
        this.employeeForm.uploadedResume = file;
      }
    },
    removeFile(type) {
      if (type === 'employer') {
        this.employerForm.uploadedFile = null;
        this.$refs.employerFileInput.value = '';
      } else {
        this.employeeForm.uploadedResume = null;
        this.$refs.employeeFileInput.value = '';
      }
    },
    validateEmployerForm() {
      this.errors = {};
      const form = this.employerForm;

      if (!form.companyName.trim()) {
        this.errors.companyName = 'Company name is required';
      }
      if (!form.contactName.trim()) {
        this.errors.contactName = 'Contact name is required';
      }
      if (!form.email.trim()) {
        this.errors.email = 'Email is required';
      } else if (!/\S+@\S+\.\S+/.test(form.email)) {
        this.errors.email = 'Please enter a valid email';
      }
      if (!form.phone.trim()) {
        this.errors.phone = 'Phone number is required';
      }
      if (!form.jobTitle.trim()) {
        this.errors.jobTitle = 'Job title is required';
      }
      if (!form.numResources) {
        this.errors.numResources = 'Number of resources is required';
      }
      if (!form.timePeriod) {
        this.errors.timePeriod = 'Time period is required';
      }
      if (!form.jobDescription.trim()) {
        this.errors.jobDescription = 'Job description is required';
      }
      if (!form.privacy) {
        this.errors.privacy = 'You must agree to the privacy policy';
      }

      return Object.keys(this.errors).length === 0;
    },
    validateEmployeeForm() {
      this.errors = {};
      const form = this.employeeForm;

      if (!form.fullName.trim()) {
        this.errors.fullName = 'Full name is required';
      }
      if (!form.email.trim()) {
        this.errors.email = 'Email is required';
      } else if (!/\S+@\S+\.\S+/.test(form.email)) {
        this.errors.email = 'Please enter a valid email';
      }
      if (!form.phone.trim()) {
        this.errors.phone = 'Phone number is required';
      }
      if (!form.experienceLevel) {
        this.errors.experienceLevel = 'Experience level is required';
      }
      if (!form.currentRole.trim()) {
        this.errors.currentRole = 'Current role is required';
      }
      if (form.areasOfInterest.length === 0) {
        this.errors.areasOfInterest = 'Please select at least one area of interest';
      }
      if (!form.skills.trim()) {
        this.errors.skills = 'Technical skills are required';
      }
      if (!form.uploadedResume) {
        this.errors.resume = 'Resume upload is required';
      }
      if (!form.availability) {
        this.errors.availability = 'Availability is required';
      }
      if (!form.workPreference) {
        this.errors.workPreference = 'Work preference is required';
      }
      if (!form.privacy) {
        this.errors.privacy = 'You must agree to the privacy policy';
      }

      return Object.keys(this.errors).length === 0;
    },
    async submitEmployerForm() {
      if (!this.validateEmployerForm()) {
        return;
      }

      this.isSubmitting = true;

      try {
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 2000));
        
        console.log('Employer form submitted:', this.employerForm);
        this.formSuccess = true;
        this.resetForm('employer');
      } catch (error) {
        console.error('Error submitting employer form:', error);
        // Handle error
      } finally {
        this.isSubmitting = false;
      }
    },
    async submitEmployeeForm() {
      if (!this.validateEmployeeForm()) {
        return;
      }

      this.isSubmitting = true;

      try {
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 2000));
        
        console.log('Employee form submitted:', this.employeeForm);
        this.formSuccess = true;
        this.resetForm('employee');
      } catch (error) {
        console.error('Error submitting employee form:', error);
        // Handle error
      } finally {
        this.isSubmitting = false;
      }
    },
    resetForm(type) {
      if (type === 'employer') {
        this.employerForm = {
          companyName: '',
          contactName: '',
          email: '',
          phone: '',
          jobTitle: '',
          numResources: '',
          timePeriod: '',
          jobDescription: '',
          uploadedFile: null,
          budget: '',
          privacy: false
        };
        if (this.$refs.employerFileInput) {
          this.$refs.employerFileInput.value = '';
        }
      } else {
        this.employeeForm = {
          fullName: '',
          email: '',
          phone: '',
          experienceLevel: '',
          currentRole: '',
          areasOfInterest: [],
          skills: '',
          uploadedResume: null,
          availability: '',
          workPreference: '',
          expectedSalary: '',
          privacy: false
        };
        if (this.$refs.employeeFileInput) {
          this.$refs.employeeFileInput.value = '';
        }
      }
    }
  }
}
</script>

<style>
@import '../assets/styles/pages/GetStartedPage.css';
</style>
