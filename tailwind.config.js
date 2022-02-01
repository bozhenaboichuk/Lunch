module.exports = {
  content: ["./app/**/*.{html,js,erb,haml}"],
  theme: {
    extend: {
      boxShadow:{
        '3xl': '0 6px 20px -5px rgba(0,0,0,0.4)',
        '4xl': '0 0 12px -2px rgba(0,0,0,0.5)'
      },
      spacing:{
        '150': '50rem'
      },
      strokeWidth:{
        '3': '3px',
      },
      top: {
       '50': '50%',
    },
      left: {
       '50': '50%',
  },
      translate: {
        '50': '50%',
},
},
variants: {
    backgroundColor: ['responsive', 'hover', 'focus', 'active'],
  },
},
  plugins: [],
}
