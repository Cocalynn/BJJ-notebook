// tailwind.config.js
module.exports = {
  content: [
    "./content/**/*.{md,njk,html}",
    "./_includes/**/*.{njk,html}",
    "./_layouts/**/*.{njk,html}"
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#2D3748', // deep charcoal
          light: '#4A5568',
          dark: '#1A202C'
        },
        accent: '#D69E2E', // gold
        muted: '#F7FAFC'   // light gray for background
      },
      fontFamily: {
        serif: ['Playfair Display', 'serif'],
        sans: ['Inter', 'sans-serif']
      },
      boxShadow: {
        luxe: '0 10px 30px rgba(0,0,0,0.2)'
      }
    }
  },
  plugins: []
};
