// See https://kit.svelte.dev/docs/types#app

import type { Session, SupabaseClient } from '@supabase/supabase-js';
// generate with supabase gen types typescript --local > src/database.types.ts
import type { Database } from './database.types';

// for information about these interfaces
declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      supabase: SupabaseClient<Database>;
      getSession: () => Promise<Session | null>;
    }
    // interface PageData {}
    // interface Platform {}
  }
}

export {};
