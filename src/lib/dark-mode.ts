import { browser } from '$app/environment';
import { writable } from 'svelte/store';

export const themeStore = writable(
  (browser && document.documentElement.getAttribute('data-theme')) || ''
);

export const toggleTheme = async () => {
  let theme = document.documentElement.getAttribute('data-theme');
  if (theme === 'dark') {
    document.documentElement.removeAttribute('data-theme');
    theme = '';
    themeStore.set(theme);
  } else {
    document.documentElement.setAttribute('data-theme', 'dark');
    theme = 'dark';
    themeStore.set(theme);
  }
  await fetch('/api/set-theme', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ theme })
  });
};
