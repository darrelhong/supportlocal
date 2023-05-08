# create-svelte

Everything you need to build a Svelte project, powered by [`create-svelte`](https://github.com/sveltejs/kit/tree/master/packages/create-svelte).

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```bash
# create a new project in the current directory
npm create svelte@latest

# create a new project in my-app
npm create svelte@latest my-app
```

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://kit.svelte.dev/docs/adapters) for your target environment.

# Documentation

## Authentication

Sign up/login with `@supabase/auth-helpers-sveltekit` and magic links

Supabse server client instantiated in `hooks.server.ts` and browser client in `routes/biz/+layout.ts`.

### Auth flow

- ` supabase.auth.signInWithOtp` called on client side, which sends verification email
- link redirects to `biz/logging-in`, which receives session data from `routes/biz/+layout.server.ts`
- cookie is set by browser Supabase client
- user is redirected `/biz/dashboard`

Auth flow is identical for sign up and login, except that signup will create a new user in Supabase.
