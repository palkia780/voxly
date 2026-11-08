create table if not exists public.messages (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 content text not null check (char_length(content) between 1 and 4000),
 created_at timestamptz not null default now()
);
alter table public.messages enable row level security;
create policy "authenticated can read messages" on public.messages for select to authenticated using (true);
create policy "users insert own messages" on public.messages for insert to authenticated with check (auth.uid()=user_id);
alter publication supabase_realtime add table public.messages;
