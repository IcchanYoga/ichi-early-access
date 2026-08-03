# ichi-early-access — 先行開発版 商品ページ(LP)

商品ページ(LP)を自前ホスティングするためのリポジトリ。

- **公開URL: https://ichi-early-access.pages.dev/**(Cloudflare Pages・2026-08-03公開)
- 商品: 先行開発版「音声だけThreads運用キット」(仮称・4,980円・3名限定)
- 事実の出典・検品台帳: `C:\Users\tyura\HQ_MARKETING_OS\05_products\validating\fact_ledger_lp_20260731.md`
- 応募フォーム設問リスト: `C:\Users\tyura\HQ_MARKETING_OS\05_products\validating\application_form_questions_20260731.md`
- 対応する開発要求: `dev_20260723_769a62115da7`(HQ_MARKETING_OS `08_development/requests/`)

## 構成

```
ichi-early-access/
├─ README.md      このファイル(内部用。公開しない)
├─ .nojekyll      GitHub Pages時代の名残(Cloudflareでは不要)
└─ index.html     商品ページ本体(1ファイル完結。直接編集する)
```

## ホスティング(2026-08-03にGitHub PagesからCloudflare Pagesへ変更)

GitHubの利用規約はPagesを商取引が主目的のサイトの無料ホスティングに使うことを認めていないため、
**Cloudflare Pages(無料枠で商用可)へ移した**。GitHub Pagesは有効化しない。

デプロイは wrangler の直接アップロード方式(Git連携ではないため **push だけでは公開されない**):

```powershell
# index.html だけを一時フォルダへコピーしてからデプロイする(README等を公開しないため)
npx wrangler pages deploy <index.htmlだけを置いたフォルダ> --project-name ichi-early-access --branch master --commit-dirty=true
```

Cloudflareダッシュボードでリポジトリを Git 連携すれば push で自動デプロイにもできる
(その場合は Production branch を `master`、Build output directory を `/` にする)。

## 公開ページに載せてはいけないもの

- **内部コメント**(検品の経緯・担当名・台帳番号・「確認要」等)。2026-08-03に全削除した。
  保守メモはこのREADMEに書き、`index.html` にはコメントを残さない
- **Stripe決済リンク**。CTAは応募フォーム(Googleフォーム)のみへ誘導し、決済は応募条件確認後に
  運営者が個別案内する(`s2_s3_funnel_design.md`接点3/4)
- **README.md 自体**(内部パスを含む。デプロイ対象に入れない)

## 更新するときの決まり

- 掲載する数字は必ず実測値に差し替え、**期間と確認元を併記**する(創作禁止)。出典は上記の検品台帳へ記録する
- 実日数(「今日で◯日目」)は Day 1 = 2026-07-18 起点で数え直す
- 数字入りの訴求を変更したら、editor_in_chief の事実+リーガル二重検品と運営者承認を経てから反映する
- 差し替え後は `hp-mockup-creation` スキルの `scripts/render.ps1` でデスクトップ幅・スマホ幅を再レンダリングし、
  公開前検収(3秒で何の商品か/信頼要素が上にあるか/応募ボタンが探さず見えるか/スマホで読めるか/1ページ1ゴールか)を確認する

## 注意

- ichi-radio(Podcast配信)とは別リポジトリ。目的が異なる公開物を混在させない
