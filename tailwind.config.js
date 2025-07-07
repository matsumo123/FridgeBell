/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/javascript/**/*.js',
    './app/helpers/**/*.rb'
  ],
  safelist: [
    'font-exo2'
  ],
  theme: {
    extend: {
      fontFamily: {
        exo2: ['"Exo 2"', 'sans-serif'],
      },
    },
  },
  plugins: [],
}