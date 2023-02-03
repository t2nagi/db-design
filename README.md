# DB-Design

Flyway、SchemaSpy、DB(PostgreSQL)の実行環境を構築します。

* [Flyway](https://flywaydb.org/)
* [SchemaSpy](https://schemaspy.org/)
* [PostgreSQL](https://www.postgresql.org/)

## 使用について
実行環境に以下を事前にインストールします。
* docker
* docker-compose 
```shell
$ # 実行
$ git clone https://github.com/t2nagi/db-design.git
$ cd ./db-design
$ docker-compose up 
```
ディレクトリ構成
```
db-design/
 ├ ...
 ├ sql        ... ER図の生成元となるSQLファイルを配置
 ├ html       ... SchemaSpyの出力先
 └ refresh.sh ... ER図生成シェル
```

ER図の元となるSQLファイルは*sql*ディレクトリに配置します。  
※ SQLファイルの命名パターンはFlywayの[サイト](https://www.red-gate.com/blog/database-devops/flyway-naming-patterns-matter)を確認  
sqlディレクトリ配下にファイルを追加、または変更でER図の自動更新を行います。  
作成されたER図(HTML)は*html*ディレクトリ配下に出力されます。  
ブラウザからは「 http://localhost:10080/ 」でアクセスできます。  
ER図の手動更新は*refresh.sh*でも可能です。


