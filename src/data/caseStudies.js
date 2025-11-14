// Case studies data for the homepage
export const caseStudies = [
  {
    id: 'ai-chatbot',
    category: 'AI & Automation',
    title: 'AI Knowledge-Based Chatbot Implementation',
    subtitle: 'Reducing customer support resources by 70% through intelligent automation',
    description: 'Implemented an intelligent chatbot system that handles 80% of customer inquiries automatically, significantly reducing support team workload.',
    challenge: 'Our client, a growing SaaS company, was struggling with an overwhelming volume of repetitive customer support tickets. Their support team was spending 60+ hours per week on basic inquiries, preventing them from focusing on complex issues and product improvements. Customer response times were increasing, leading to satisfaction concerns.',
    solution: 'We developed a sophisticated AI-powered knowledge base chatbot using natural language processing and machine learning. The system was trained on historical support tickets, product documentation, and FAQs. We integrated it with their existing CRM and implemented continuous learning capabilities to improve responses over time.',
    techStack: ['Python', 'OpenAI GPT-4', 'LangChain', 'PostgreSQL', 'Redis', 'FastAPI', 'React', 'WebSocket'],
    results: [
      { metric: 'Resource Reduction', value: '70%' },
      { metric: 'Response Time', value: '<30s' },
      { metric: 'Query Resolution', value: '80%' },
      { metric: 'Customer Satisfaction', value: '92%' }
    ],
    timeline: 'Completed in 8 weeks with 2 weeks of training and optimization',
    icon: 'ai-chatbot',
    svgIcon: `
      <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2C13.1046 2 14 2.89543 14 4V6H19C19.5523 6 20 6.44772 20 7V19C20 19.5523 19.5523 20 19 20H13.4142L9.70711 23.7071C9.31658 24.0976 8.68342 24.0976 8.29289 23.7071C7.90237 23.3166 7.90237 22.6834 8.29289 22.2929L11.5858 19H5C4.44772 19 4 18.5523 4 18V7C4 6.44772 4.44772 6 5 6H10V4C10 2.89543 10.8954 2 12 2Z" fill="currentColor"/>
        <circle cx="8.5" cy="12" r="1.5" fill="white"/>
        <circle cx="12" cy="12" r="1.5" fill="white"/>
        <circle cx="15.5" cy="12" r="1.5" fill="white"/>
      </svg>
    `
  },
  {
    id: 'data-modernization',
    category: 'Data Engineering',
    title: 'Unstructured Data Processing with Snowflake',
    subtitle: 'Transforming chaotic data into actionable business insights',
    description: 'Modernized data infrastructure to handle massive volumes of unstructured data, enabling real-time analytics and business intelligence.',
    challenge: 'A logistics company was drowning in unstructured data from IoT sensors, delivery reports, customer feedback, and third-party APIs. Their legacy systems couldn\'t process this data efficiently, leading to missed opportunities for optimization and poor decision-making based on incomplete information.',
    solution: 'We architected a modern data pipeline using Snowflake as the core data warehouse, combined with Apache Kafka for real-time streaming, dbt for data transformation, and Apache Airflow for orchestration. We implemented automated data quality checks and created intuitive dashboards for business users.',
    techStack: ['Snowflake', 'Apache Kafka', 'dbt', 'Apache Airflow', 'Python', 'Terraform', 'Tableau', 'AWS S3'],
    results: [
      { metric: 'Data Processing Speed', value: '10x Faster' },
      { metric: 'Storage Cost Reduction', value: '45%' },
      { metric: 'Data Quality Score', value: '99.2%' },
      { metric: 'Time to Insights', value: 'Real-time' }
    ],
    timeline: 'Delivered in 12 weeks with phased migration approach',
    icon: 'data-analytics',
    svgIcon: `
      <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M3 3V21H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M9 9L12 6L16 10L20 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <rect x="7" y="13" width="3" height="8" fill="currentColor" rx="1"/>
        <rect x="12" y="11" width="3" height="10" fill="currentColor" rx="1"/>
        <rect x="17" y="9" width="3" height="12" fill="currentColor" rx="1"/>
      </svg>
    `
  },
  {
    id: 'microservices-migration',
    category: 'Architecture & DevOps',
    title: 'Monolith to Microservices Migration',
    subtitle: 'Scaling architecture using 12-Factor App principles',
    description: 'Successfully decomposed a monolithic application into scalable microservices, improving deployment frequency and system reliability.',
    challenge: 'An e-commerce platform built as a monolithic application was experiencing scaling issues, slow deployments, and development bottlenecks. The single codebase made it difficult for teams to work independently, and any bug could bring down the entire system.',
    solution: 'We applied the 12-Factor App methodology to break down the monolith into focused microservices. Each service was containerized with Docker, deployed on Kubernetes, and followed strict separation of concerns. We implemented API gateways, service mesh, and comprehensive monitoring.',
    techStack: ['Docker', 'Kubernetes', 'Node.js', 'Go', 'PostgreSQL', 'Redis', 'Istio', 'Prometheus', 'Grafana'],
    results: [
      { metric: 'Deployment Frequency', value: '20x More' },
      { metric: 'System Uptime', value: '99.9%' },
      { metric: 'Development Velocity', value: '3x Faster' },
      { metric: 'Recovery Time', value: '< 5 minutes' }
    ],
    timeline: 'Completed over 16 weeks with zero-downtime migration',
    icon: 'microservices',
    svgIcon: `
      <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="3" y="4" width="6" height="6" rx="2" fill="currentColor"/>
        <rect x="15" y="4" width="6" height="6" rx="2" fill="currentColor"/>
        <rect x="3" y="14" width="6" height="6" rx="2" fill="currentColor"/>
        <rect x="15" y="14" width="6" height="6" rx="2" fill="currentColor"/>
        <path d="M9 7H15" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        <path d="M9 17H15" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        <path d="M6 10V14" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        <path d="M18 10V14" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
      </svg>
    `
  },
  {
    id: 'ai-logistics',
    category: 'AI & Machine Learning',
    title: 'AI-Powered Logistics Optimization Platform',
    subtitle: 'Greenfield application revolutionizing supply chain efficiency',
    description: 'Built from scratch an AI-driven logistics platform that optimizes routes, predicts demand, and automates supply chain decisions.',
    challenge: 'A logistics startup needed a complete digital transformation solution to compete with established players. They required route optimization, demand forecasting, inventory management, and real-time tracking - all integrated into a single, intelligent platform.',
    solution: 'We built a comprehensive logistics platform from the ground up, incorporating machine learning for route optimization, predictive analytics for demand forecasting, and computer vision for package tracking. The system learns from historical data and continuously improves its recommendations.',
    techStack: ['Python', 'TensorFlow', 'React', 'Node.js', 'MongoDB', 'Redis', 'AWS', 'Docker', 'GraphQL'],
    results: [
      { metric: 'Route Efficiency', value: '+35%' },
      { metric: 'Fuel Cost Savings', value: '28%' },
      { metric: 'Delivery Accuracy', value: '98.5%' },
      { metric: 'Customer Satisfaction', value: '96%' }
    ],
    timeline: 'Full platform delivered in 20 weeks with MVP in 8 weeks',
    icon: 'logistics',
    svgIcon: `
      <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M2 12H6L8 7H16L18 12H22" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <circle cx="7" cy="17" r="2" stroke="currentColor" stroke-width="2" fill="none"/>
        <circle cx="17" cy="17" r="2" stroke="currentColor" stroke-width="2" fill="none"/>
        <path d="M6 12V15H9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M18 12V15H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M12 3V7" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        <path d="M16 3L14 7" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        <path d="M8 3L10 7" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
      </svg>
    `
  }
];
