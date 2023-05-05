import { browser } from '$app/environment';
import { writable } from 'svelte/store';

export const themeStore = writable(
  (browser && document.documentElement.getAttribute('data-theme')) || ''
);

export const toggleTheme = async () => {
  let theme = document.documentElement.getAttribute('data-theme');
  if (theme === 'dark') {
    theme = 'light';
  } else {
    theme = 'dark';
  }
  themeStore.set(theme);
  document.documentElement.setAttribute('data-theme', theme);

  await fetch('/api/set-theme', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ theme })
  });
};
