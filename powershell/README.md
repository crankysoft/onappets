# list_dup.ps1

重複しているファイルをリストする。

オプション:
[-path] <path>
-recurse サブフォルダも対象にする

パラメータセット:
[-list] (default)重複しているファイルのうち、最初の一個を除いたリストを返す
[-moveto <path>] -listで得られた物を指定したパスへ移動する
[-group] 重複しているファイル表示。確認用。

確認
```
>./list_dup.ps1 <path> -recurse -group
```

移動
```
>./list_dup.ps1 <path> -recurse -moveto tmp
```

問答無用で削除
```
>./list_dup.ps1 <path> -recurse | remove-item
```