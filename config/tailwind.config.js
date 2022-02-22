const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './app/**/*.{html,js,erb,haml}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        'nav': ['Didact Gothic'],
      },
      screens:{
        's1': '450px',
        's2': '640px',
        's2-3': '810px',
        's3': '768px',
        's4': '1024px',
        's5': '1280px',
      },
      minHeight: {
        'full': '774px',
        'users': '710px',
        'card': '200px'
      },
    },
    variants: {

    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
