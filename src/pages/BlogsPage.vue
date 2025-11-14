<!-- src/pages/BlogsPage.vue -->
<template>
  <div class="blogs-page">
    <!-- Replace the existing page-header section in src/pages/BlogsPage.vue -->
    <section class="hero-section">
      <div class="container">
        <div class="te-label">Tech Insights</div>
        <h1>Industry <span class="accent-text">Updates</span></h1>
        <p>Trends, best practices, and thought leadership from our technology experts</p>
        <div class="button-group">
          <a href="#latest" class="btn btn-primary">Latest Articles</a>
          <a href="#categories" class="btn btn-secondary">Browse Categories</a>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="blog-filter">
          <div class="search-box">
            <input
                type="text"
                v-model="searchQuery"
                placeholder="Search articles..."
                class="form-control"
            >
          </div>
          <div class="category-filter">
            <select v-model="selectedCategory" class="form-control">
              <option value="">All Categories</option>
              <option v-for="category in categories" :key="category" :value="category">
                {{ category }}
              </option>
            </select>
          </div>
        </div>

        <div class="grid grid-3">
          <div v-for="blog in filteredBlogs" :key="blog.id" class="blog-card">
            <div class="blog-image">
              <img :src="blog.image" :alt="blog.title">
              <span class="blog-category">{{ blog.category }}</span>
            </div>
            <div class="blog-content">
              <h3 class="blog-title">{{ blog.title }}</h3>
              <div class="blog-meta">
                <span class="blog-date">{{ formatDate(blog.date) }}</span>
                <span class="blog-author">By {{ blog.author }}</span>
              </div>
              <p class="blog-excerpt">{{ blog.excerpt }}</p>
              <router-link :to="`/blog/${blog.id}`" class="btn btn-outline">Read More</router-link>
            </div>
          </div>
        </div>

        <div v-if="!filteredBlogs.length" class="no-results">
          <Banner type="info">
            <h3>No Results Found</h3>
            <p>We couldn't find any articles matching your search criteria.</p>
          </Banner>
        </div>

        <div class="pagination">
          <button
              class="btn btn-sm"
              :disabled="currentPage === 1"
              @click="currentPage--"
          >
            Previous
          </button>
          <span class="current-page">Page {{ currentPage }} of {{ totalPages }}</span>
          <button
              class="btn btn-sm"
              :disabled="currentPage === totalPages"
              @click="currentPage++"
          >
            Next
          </button>
        </div>
      </div>
    </section>

    <section class="cta-section section">
      <div class="container">
        <div class="cta-content">
          <h2>Stay Updated</h2>
          <p>Subscribe to our newsletter to receive the latest industry insights and company news.</p>
          <div class="subscribe-form">
            <input type="email" placeholder="Your email address" class="form-control">
            <button class="btn">Subscribe</button>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import Banner from '@/components/common/Banner.vue';
import '@/assets/styles/pages/BlogsPage.css'
import { blogData } from '@/data/blog.js';

export default {
  name: 'BlogsPage',
  components: {
    Banner
  },
  data() {
    return {
      searchQuery: '',
      selectedCategory: '',
      currentPage: 1,
      itemsPerPage: 9,
      categories: ['Technology', 'Career', 'Industry', 'Leadership'],
      blogs: blogData
    };
  },
  computed: {
    filteredBlogs() {
      let filtered = this.blogs;

      if (this.searchQuery) {
        const query = this.searchQuery.toLowerCase();
        filtered = filtered.filter(blog =>
            blog.title.toLowerCase().includes(query) ||
            blog.excerpt.toLowerCase().includes(query)
        );
      }

      if (this.selectedCategory) {
        filtered = filtered.filter(blog => blog.category === this.selectedCategory);
      }

      // Pagination
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return filtered.slice(start, end);
    },
    totalPages() {
      const filteredCount = this.blogs.filter(blog => {
        if (this.searchQuery) {
          const query = this.searchQuery.toLowerCase();
          if (!blog.title.toLowerCase().includes(query) &&
              !blog.excerpt.toLowerCase().includes(query)) {
            return false;
          }
        }

        if (this.selectedCategory && blog.category !== this.selectedCategory) {
          return false;
        }

        return true;
      }).length;

      return Math.ceil(filteredCount / this.itemsPerPage) || 1;
    }
  },
  methods: {
    formatDate(dateStr) {
      const date = new Date(dateStr);
      return date.toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
      });
    }
  },
  watch: {
    searchQuery() {
      this.currentPage = 1;
    },
    selectedCategory() {
      this.currentPage = 1;
    }
  }
};
</script>

