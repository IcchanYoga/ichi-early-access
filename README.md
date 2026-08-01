# ichi-early-access — 先行開発版 商品ページ(LP)

GitHub Pages で商品ページ(LP)を自前ホスティングするためのリポジトリ。

- 公開URL: https://icchanyoga.github.io/ichi-early-access/ (未公開・検品中)
- 商品: 先行開発版「音声だけThreads運用キット」(仮称・4,980円・3名限定)
- 事実の出典・検品台帳: `C:\Users\tyura\HQ_MARKETING_OS\05_products\validating\fact_ledger_lp_20260731.md`
- 応募フォーム設問リスト: `C:\Users\tyura\HQ_MARKETING_OS\05_products\validating\application_form_questions_20260731.md`
- 対応する開発要求: `dev_20260723_769a62115da7`(HQ_MARKETING_OS `08_development/requests/`)

## 構成

```
ichi-early-access/
├─ README.md      このファイル
├─ .nojekyll       Jekyll無効化(GitHub Pages標準の措置)
└─ index.html      商品ページ本体(1ファイル完結。直接編集する)
```

## 公開前に必ずやること

`index.html` 冒頭のHTMLコメント「差し替え一覧」にあるプレースホルダ
(`〔商品名〕` `〔実績数字〕` `〔応募フォームURL〕` `〔支払方法の確定文言〕`)を、
`fact_ledger_lp_20260731.md` の該当行を出典にすべて埋めること。

差し替え後は必ず `hp-mockup-creation` スキルの `scripts/render.ps1` で
デスクトップ幅・スマホ幅の両方を再レンダリングし、公開前検収チェック
(3秒で何の商品か/信頼要素が上にあるか/応募ボタンが探さず見えるか/
スマホで読めるか/1ページ1ゴールか)を確認してから push すること。

editor_in_chief の事実+リーガル二重検品を通過し、運営者の最終承認を得るまでは
`<meta name="robots" content="noindex">` を外さない。

## 注意

- ichi-radio(Podcast配信)とは別リポジトリ。目的が異なる公開物を混在させない
- Stripe決済リンクはこのページには置かない。CTAは応募フォーム(Googleフォーム)のみへ
  誘導し、決済は応募条件確認後に運営者が個別案内する(`s2_s3_funnel_design.md`接点3/4)
