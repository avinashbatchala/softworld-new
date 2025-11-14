<template>
  <div class="case-study-modal" v-if="isVisible" @click.self="closeModal">
    <div class="case-study-content">
      <button class="close-btn" @click="closeModal">
        <span>×</span>
      </button>

      <div class="case-study-header">
        <div class="te-label">{{ caseStudy.category }}</div>
        <h2>{{ caseStudy.title }}</h2>
        <p class="case-study-subtitle">{{ caseStudy.subtitle }}</p>
      </div>

      <div class="case-study-body">
        <div class="challenge-section">
          <h3>The Challenge</h3>
          <p>{{ caseStudy.challenge }}</p>
        </div>

        <div class="solution-section">
          <h3>Our Solution</h3>
          <p>{{ caseStudy.solution }}</p>

          <div class="tech-stack" v-if="caseStudy.techStack">
            <h4>Technologies Used</h4>
            <div class="tech-tags">
              <span v-for="tech in caseStudy.techStack" :key="tech" class="tech-tag">
                {{ tech }}
              </span>
            </div>
          </div>
        </div>

        <div class="results-section">
          <h3>Results & Impact</h3>
          <div class="results-grid">
            <div v-for="result in caseStudy.results" :key="result.metric" class="result-item">
              <span class="result-number">{{ result.value }}</span>
              <span class="result-label">{{ result.metric }}</span>
            </div>
          </div>
        </div>

        <div class="timeline-section" v-if="caseStudy.timeline">
          <h3>Project Timeline</h3>
          <p>{{ caseStudy.timeline }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CaseStudy',
  props: {
    caseStudy: {
      type: Object,
      required: true
    },
    isVisible: {
      type: Boolean,
      default: false
    }
  },
  emits: ['close'],
  mounted() {
    document.addEventListener('keydown', this.handleEscape);
  },
  beforeUnmount() {
    document.removeEventListener('keydown', this.handleEscape);
  },
  methods: {
    closeModal() {
      this.$emit('close');
    },
    handleEscape(event) {
      if (event.key === 'Escape' && this.isVisible) {
        this.closeModal();
      }
    }
  }
}
</script>

<style scoped>
.case-study-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(10, 22, 41, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: calc(var(--space-unit) * 3);
}

.case-study-content {
  background: var(--color-primary);
  max-width: 900px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-lg);
  position: relative;
}

.close-btn {
  position: absolute;
  top: calc(var(--space-unit) * 3);
  right: calc(var(--space-unit) * 3);
  background: var(--color-gray-10);
  border: none;
  width: 40px;
  height: 40px;
  border-radius: var(--radius-full);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all var(--transition-fast);
  z-index: 10;
}

.close-btn:hover {
  background: var(--color-gray-20);
  transform: scale(1.05);
}

.close-btn span {
  font-size: 1.5rem;
  color: var(--color-gray-70);
  line-height: 1;
}

.case-study-header {
  padding: calc(var(--space-unit) * 6) calc(var(--space-unit) * 6) calc(var(--space-unit) * 4);
  text-align: center;
  background: linear-gradient(135deg, var(--color-gray-10) 0%, var(--color-primary) 100%);
}

.case-study-subtitle {
  font-size: 1.1rem;
  color: var(--color-gray-70);
  margin-top: calc(var(--space-unit) * 2);
}

.case-study-body {
  padding: 0 calc(var(--space-unit) * 6) calc(var(--space-unit) * 6);
}

.challenge-section,
.solution-section,
.results-section,
.timeline-section {
  margin-bottom: calc(var(--space-unit) * 5);
}

.challenge-section h3,
.solution-section h3,
.results-section h3,
.timeline-section h3 {
  font-family: var(--font-mono);
  font-size: 1rem;
  font-weight: 600;
  color: var(--color-accent);
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: calc(var(--space-unit) * 2);
}

.tech-stack {
  margin-top: calc(var(--space-unit) * 3);
  padding: calc(var(--space-unit) * 3);
  background: var(--color-gray-10);
  border-radius: var(--radius-md);
}

.tech-stack h4 {
  font-family: var(--font-mono);
  font-size: 0.875rem;
  font-weight: 600;
  color: var(--color-gray-70);
  margin-bottom: calc(var(--space-unit) * 2);
}

.tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: calc(var(--space-unit) * 1);
}

.tech-tag {
  background: var(--color-primary);
  color: var(--color-accent);
  padding: calc(var(--space-unit) * 0.5) calc(var(--space-unit) * 1.5);
  border-radius: var(--radius-sm);
  font-family: var(--font-mono);
  font-size: 0.75rem;
  font-weight: 500;
  border: 1px solid var(--color-gray-20);
}

.results-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: calc(var(--space-unit) * 3);
  margin-top: calc(var(--space-unit) * 3);
}

.result-item {
  text-align: center;
  padding: calc(var(--space-unit) * 3);
  background: var(--color-gray-10);
  border-radius: var(--radius-md);
  border: 1px solid var(--color-gray-20);
}

.result-number {
  display: block;
  font-family: var(--font-mono);
  font-size: 2rem;
  font-weight: 700;
  color: var(--color-accent);
  line-height: 1;
  margin-bottom: calc(var(--space-unit) * 1);
}

.result-label {
  font-size: 0.875rem;
  color: var(--color-gray-70);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

@media (max-width: 768px) {
  .case-study-modal {
    padding: calc(var(--space-unit) * 2);
  }

  .case-study-header,
  .case-study-body {
    padding-left: calc(var(--space-unit) * 4);
    padding-right: calc(var(--space-unit) * 4);
  }

  .results-grid {
    grid-template-columns: 1fr;
  }
}
</style>
