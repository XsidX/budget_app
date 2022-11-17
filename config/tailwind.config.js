const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Proxima Nova', ...defaultTheme.fontFamily.sans]
      },
      height: {
        'icon-h': '4.5rem'
      },
      spacing: {
        '22': '5.6rem',
      },
      colors: {
        'primaryDark': '#434b54',
        'primaryGreen': '#5fb523',
        'primaryBlue': '#3778c2',
      },
      fontFamily: {
        'slant': ['Sarina', 'cursive'],
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
