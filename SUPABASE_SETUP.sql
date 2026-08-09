-- セルナビ 複数端末同期用テーブル
-- Supabase Dashboard > SQL Editor で1回だけ実行してください。

create table if not exists public.sellnavi_sync (
  store_code text primary key,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.sellnavi_sync enable row level security;

-- セルナビPWAはPublishable Keyからアクセスします。
-- 店舗コードを知る端末同士で共有するシンプル構成です。
drop policy if exists "sellnavi select" on public.sellnavi_sync;
create policy "sellnavi select"
  on public.sellnavi_sync for select
  to anon
  using (true);

drop policy if exists "sellnavi insert" on public.sellnavi_sync;
create policy "sellnavi insert"
  on public.sellnavi_sync for insert
  to anon
  with check (true);

drop policy if exists "sellnavi update" on public.sellnavi_sync;
create policy "sellnavi update"
  on public.sellnavi_sync for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sellnavi_sync to anon;
