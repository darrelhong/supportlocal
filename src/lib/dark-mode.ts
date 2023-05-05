export const toggleTheme = async () => {
  let theme = document.documentElement.getAttribute('data-theme');
  if (theme === 'dark') {
    document.documentElement.removeAttribute('data-theme');
    theme = '';
  } else {
    document.documentElement.setAttribute('data-theme', 'dark');
    theme = 'dark';
  }
  await fetch('/api/set-theme', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ theme })
  });
};
