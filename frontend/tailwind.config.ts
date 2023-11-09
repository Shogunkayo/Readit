import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    colors: {
        'text': 'var(--text)',
        'background': 'var(--background)',
        'primary': 'var(--primary)',
        'secondary': 'var(--secondary)',
        'accent': 'var(--accent)',
    },

    fontSize: {
        sm: '0.750rem',
        base: '1rem',
        xl: '1.333rem',
        '2xl': '1.777rem',
        '3xl': '2.369rem',
        '4xl': '3.158rem',
        '5xl': '4.210rem',
    },
    fontFamily: {
        heading: 'Noto Sans Tifinagh',
        body: 'Noto Sans Tifinagh',
        'accent': ['Agbalumo', 'sans-serif'],
    },
    fontWeight: {
        normal: '400',
        bold: '700',
    },

    extend: {
      backgroundImage: {
      },
    },
  },
  plugins: [],
}
export default config
