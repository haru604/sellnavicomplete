# セルナビ v14 — WORKNOTE連携版

- 既存の実績入力・目標・残数・進捗計算はそのまま。
- 実績保存時に `worknote_sellnavi_bridge_v1` へWORKNOTE用スナップショットを自動保存。
- WORKNOTE側で店舗数字を再入力する必要はありません。
- 日付ごとに最大120件のスナップショットを保持。
- 同じ `haru604.github.io` オリジン内ではlocalStorageを共有して連携。
- Supabaseクラウド同期で受信したデータもWORKNOTE共有データへ反映。
