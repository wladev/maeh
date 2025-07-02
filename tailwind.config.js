/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
    './public/index.html'
  ],
  safelist: [
    'hover:underline',
    'hover:scale-110'
  ],
  theme: {
    extend: {
      animation: {
        'marquee-left-to-right': 'leftToRight 15s linear infinite',
      },
      keyframes: {
        leftToRight: {
          '0%': { transform: 'translateX(350%)' },
          '100%': { transform: 'translateX(-100%)'},
        },
        // underlinks: {
        //   '0%': text-decora
        // }
      }


    },
  },
  plugins: [],
}
