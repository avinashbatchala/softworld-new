<!-- src/components/common/Button.vue -->
<template>
  <button
      :class="['btn', variant, size, { 'full-width': fullWidth }]"
      :type="type"
      :disabled="disabled"
      @click="$emit('click', $event)"
  >
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: 'Button',
  props: {
    variant: {
      type: String,
      default: '',
      validator: value => ['', 'btn-outline', 'btn-accent'].includes(value)
    },
    size: {
      type: String,
      default: '',
      validator: value => ['', 'btn-sm', 'btn-lg'].includes(value)
    },
    type: {
      type: String,
      default: 'button'
    },
    disabled: {
      type: Boolean,
      default: false
    },
    fullWidth: {
      type: Boolean,
      default: false
    }
  },
  emits: ['click']
}
</script>

<style scoped>
.btn-sm {
  padding: 0.5rem 1rem;
  font-size: 0.875rem;
}

.btn-lg {
  padding: 1rem 2rem;
  font-size: 1.125rem;
}

.btn-accent {
  background-color: var(--color-accent);
}

.full-width {
  display: block;
  width: 100%;
}

.btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}
</style>