-- Im Supabase SQL Editor als Projekt-Administrator einmal ausführen.
create table if not exists public.tasks (
  id uuid primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null check (char_length(title) between 1 and 100),
  kind text not null default 'Hausübung',
  subject text,
  notes text,
  due date,
  done boolean not null default false,
  created_at timestamptz not null default now()
);

-- Ergänzt die Notizenspalte auch dann, wenn die Tabelle bereits besteht.
alter table public.tasks add column if not exists notes text;

alter table public.tasks enable row level security;
drop policy if exists "Users can read own tasks" on public.tasks;
drop policy if exists "Users can create own tasks" on public.tasks;
drop policy if exists "Users can update own tasks" on public.tasks;
drop policy if exists "Users can delete own tasks" on public.tasks;
create policy "Users can read own tasks" on public.tasks for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users can create own tasks" on public.tasks for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users can update own tasks" on public.tasks for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users can delete own tasks" on public.tasks for delete to authenticated using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.tasks to authenticated;
