<template>
  <div class="blog-detail-page">
    <section class="blog-header">
      <div class="container">
        <div class="blog-meta">
          <div class="blog-category">{{ blog.category }}</div>
          <div class="blog-date">{{ formatDate(blog.date) }}</div>
        </div>
        <h1>{{ blog.title }}</h1>
        <div class="blog-author">
          <div class="author-avatar" v-if="blog.authorAvatar">
            <img :src="blog.authorAvatar" :alt="blog.author">
          </div>
          <div class="author-avatar default-avatar" v-else>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
              <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
            </svg>
          </div>
          <div class="author-info">
            <div class="author-name">{{ blog.author }}</div>
            <div class="author-title">{{ blog.authorTitle || 'Contributor' }}</div>
          </div>
        </div>
      </div>
    </section>

    <section class="blog-content section">
      <div class="container">
        <div class="featured-image">
          <img :src="blog.image" :alt="blog.title">
        </div>

        <div class="content" v-html="blog.content"></div>

        <div class="blog-tags" v-if="blog.tags && blog.tags.length">
          <div class="tag-label">Tags:</div>
          <div class="tags">
            <span v-for="tag in blog.tags" :key="tag" class="tag">{{ tag }}</span>
          </div>
        </div>
      </div>
    </section>

    <section class="section related-posts" v-if="relatedBlogs.length">
      <div class="container">
        <h2>Related Articles</h2>
        <div class="grid grid-3">
          <div v-for="relatedBlog in relatedBlogs" :key="relatedBlog.id" class="blog-card">
            <div class="blog-image">
              <img :src="relatedBlog.image" :alt="relatedBlog.title">
              <span class="blog-category">{{ relatedBlog.category }}</span>
            </div>
            <div class="blog-content">
              <h3 class="blog-title">{{ relatedBlog.title }}</h3>
              <div class="blog-meta">
                <span class="blog-date">{{ formatDate(relatedBlog.date) }}</span>
                <span class="blog-author">By {{ relatedBlog.author }}</span>
              </div>
              <p class="blog-excerpt">{{ relatedBlog.excerpt }}</p>
              <router-link :to="`/blog/${relatedBlog.id}`" class="btn btn-outline">Read More</router-link>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import '@/assets/styles/pages/BlogDetailPage.css';
import { blogData } from '@/data/blog';

export default {
  name: 'BlogDetailPage',
  data() {
    return {
      blog: {},
      relatedBlogs: []
    };
  },
  methods: {
    formatDate(dateStr) {
      const date = new Date(dateStr);
      return date.toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
      });
    },
    fetchBlog() {
      const blogId = parseInt(this.$route.params.id);
      this.blog = blogData.find(blog => blog.id === blogId) || {};

      if (this.blog.id) {
        // Find related blogs (same category, excluding current)
        this.relatedBlogs = blogData
        .filter(blog => blog.category === this.blog.category && blog.id !== this.blog.id)
        .slice(0, 3);
      } else {
        this.$router.push('/blogs');
      }
    }
  },
  created() {
    this.fetchBlog();
  },
  watch: {
    '$route.params.id'() {
      this.fetchBlog();
      window.scrollTo(0, 0);
    }
  }
};
</script>