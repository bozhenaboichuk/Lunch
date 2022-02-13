module.exports = {
  content: ["./app/**/*.{html,js,erb,haml}"],
  theme: {
    extend: {
      fontFamily: {
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
  plugins: [],
}
