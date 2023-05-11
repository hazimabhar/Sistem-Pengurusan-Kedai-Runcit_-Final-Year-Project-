/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      boxShadow:
      {
        'login': "10px 15px 2px 0px rgba(0,0,0,0.25)",
        'input': "5px 5px 5px 0px rgba(0,0,0,0.1)",
        'container': "0px 10px 50px 4px rgba(0,0,0,0.07)",
        'category': "13px 11px 7px 0px rgba(0,0,0,0.1)",
        'product': "0px 0px 13px rgba(0,0,0,0.07);"
      },
      content:
      {
        'arrow': 'url("/src/assets/left-arrow.png")'
      }
    },
    fontFamily: {
      'sans': ['Poppins', 'sans-serif']
    },
    
  },
  plugins: [],
}