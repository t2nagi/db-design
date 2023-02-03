CREATE TABLE users (
    id SERIAL NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
COMMENT ON TABLE users IS 'ユーザテーブル';
COMMENT ON COLUMN users.id IS 'ID';
COMMENT ON COLUMN users.name IS '名前';
COMMENT ON COLUMN users.created_at IS 'レコード作成日時';
COMMENT ON COLUMN users.updated_at IS 'レコード更新日時';
CREATE TABLE todos (
    id SERIAL NOT NULL,
    user_id integer NOT NULL,
    task VARCHAR(255) NOT NULL,
    memo text,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    foreign key (user_id) references users(id)
);
COMMENT ON TABLE todos IS 'TODOテーブル';
COMMENT ON COLUMN todos.id IS 'ID';
COMMENT ON COLUMN todos.user_id IS 'ユーザID';
COMMENT ON COLUMN todos.task IS 'タスク';
COMMENT ON COLUMN todos.memo IS 'メモ';
COMMENT ON COLUMN todos.started_at IS 'タスク着手日';
COMMENT ON COLUMN todos.completed_at IS 'タスク完了日';
COMMENT ON COLUMN todos.created_at IS 'レコード作成日時';
COMMENT ON COLUMN todos.updated_at IS 'レコード更新日時';