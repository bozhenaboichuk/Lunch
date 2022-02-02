module.exports = {
  content: ["./app/**/*.{html,js,erb,haml}"],
  theme: {
    extend: {
      screens:{
        's1': '450px',
        's2': '640px',
        's3': '768px',
        's4': '1024px',
        's5': '1280px',
      },
      boxShadow:{
        '3xl': '0 6px 20px -5px rgba(0,0,0,0.4)',
        '4xl': '0 0 12px -2px rgba(0,0,0,0.5)'
      },
      spacing:{
        '150': '50rem',
        '120': '664px',
        '140': '46rem'
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
