# 商品ページ(LP)をCloudflare Pagesへ公開する。
# 使い方: PowerShellでこのフォルダを開いて  .\deploy.ps1
#
# index.html だけを一時フォルダへコピーしてから送る(README.md や .git を公開しないため)。
# 公開URL: https://ichi-early-access.pages.dev/

$ErrorActionPreference = "Stop"
$repo  = $PSScriptRoot
$stage = Join-Path $env:TEMP "ichi-early-access-deploy"

if (-not (Test-Path (Join-Path $repo "index.html"))) {
    Write-Error "index.html が見つかりません: $repo"
}

# 公開してはいけないものが混ざっていないか、送る前に止める
$html = Get-Content (Join-Path $repo "index.html") -Raw
if ($html -match "buy\.stripe\.com") { Write-Error "中止: 決済リンクがページに書かれています(応募者へ個別送付する決まり)" }
if ($html -match "〔")               { Write-Error "中止: 未記入のプレースホルダ〔〕が残っています" }
if ($html -match "<!--")             { Write-Error "中止: HTMLコメントが残っています(内部メモは公開しない。保守メモはREADMEへ)" }

if (Test-Path $stage) { Remove-Item $stage -Recurse -Force }
New-Item -ItemType Directory -Path $stage | Out-Null
Copy-Item (Join-Path $repo "index.html") -Destination $stage

Write-Output "公開します(送るのは index.html の1ファイルだけ)..."
npx --yes wrangler@latest pages deploy $stage --project-name ichi-early-access --branch master --commit-dirty=true

Write-Output ""
Write-Output "確認: https://ichi-early-access.pages.dev/"
