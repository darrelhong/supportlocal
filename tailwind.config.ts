import type { Config } from 'tailwindcss';
import colors from 'tailwindcss/colors';

export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: [require('@tailwindcss/forms'), require('@tailwindcss/typography'), require('daisyui')],
  daisyui: {
    themes: [
      {
        pop: {
          'color-scheme': 'light',
          primary: '#fbbf24',
          secondary: '#7b5ea7',
          accent: '#f38ba3',
          neutral: '#12b4e5',
          'base-100': '#ffffff',
          '--rounded-btn': '1.9rem',
          '--btn-text-case': 'none'
        },
        dark: {
          'color-scheme': 'dark',
          primary: '#fcb928',
          secondary: '#7b5ea7',
          accent: '#f38ba3',
          neutral: '#12b4e5',
          'base-100': colors.neutral[800],
          '--rounded-btn': '1.9rem',
          '--btn-text-case': 'none'
        }
      }
    ]
  },
  darkMode: ['class', '[data-theme="dark"]']
} satisfies Config;
