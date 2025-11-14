<!-- src/components/common/Banner.vue -->
<template>
  <div class="banner" :class="type">
    <div class="banner-content">
      <div v-if="$slots.icon" class="banner-icon">
        <slot name="icon"></slot>
      </div>
      <div class="banner-text">
        <slot></slot>
      </div>
    </div>
    <button v-if="dismissible" class="banner-close" @click="$emit('dismiss')">
      &times;
    </button>
  </div>
</template>

<script>
export default {
  name: 'Banner',
  props: {
    type: {
      type: String,
      default: 'info',
      validator: value => ['info', 'success', 'warning', 'error'].includes(value)
    },
    dismissible: {
      type: Boolean,
      default: false
    }
  },
  emits: ['dismiss']
}
</script>

<style scoped>
.banner {
  padding: 1rem;
  border-radius: var(--border-radius);
  margin-bottom: 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.banner-content {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.banner.info {
  background-color: #e0f2fe;
  border-left: 4px solid #0ea5e9;
}

.banner.success {
  background-color: #dcfce7;
  border-left: 4px solid #10b981;
}

.banner.warning {
  background-color: #fef3c7;
  border-left: 4px solid #f59e0b;
}

.banner.error {
  background-color: #fee2e2;
  border-left: 4px solid #ef4444;
}

.banner-close {
  background: none;
  border: none;
  cursor: pointer;
  font-size: 1.25rem;
  line-height: 1;
  color: var(--color-gray);
  padding: 0.25rem;
}
</style>