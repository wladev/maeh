/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
    './public/index.html'
  ],
  theme: {
    extend: {
      animation: {
        'marquee-left-to-right': 'leftToRight 8s linear infinite',
      },
      keyframes: {
        leftToRight: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(350%)' },
        },
      }
    },
  },
  plugins: [],
}
