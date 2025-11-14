<!-- src/components/common/Card.vue -->
<template>
  <div class="card" :class="{ 'card-hover': hover, 'card-flat': flat }">
    <div v-if="$slots.image" class="card-image">
      <slot name="image"></slot>
    </div>
    <div class="card-body">
      <slot></slot>
    </div>
    <div v-if="$slots.footer" class="card-footer">
      <slot name="footer"></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Card',
  props: {
    hover: {
      type: Boolean,
      default: false
    },
    flat: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<style scoped>
.card {
  background: #fff;
  border-radius: var(--border-radius);
  overflow: hidden;
  box-shadow: var(--shadow-md);
  transition: transform 0.3s, box-shadow 0.3s;
}

.card-flat {
  box-shadow: none;
  border: 1px solid var(--color-gray-light);
}

.card-hover:hover {
  transform: translateY(-5px);
  box-shadow: var(--shadow-lg);
}

.card-image img {
  width: 100%;
  display: block;
}

.card-body {
  padding: 1.5rem;
}

.card-footer {
  padding: 1rem 1.5rem;
  background-color: rgba(0, 0, 0, 0.02);
  border-top: 1px solid var(--color-gray-light);
}
</style>